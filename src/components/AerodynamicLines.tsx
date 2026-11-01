import { useEffect, useRef } from 'react';

type Ripple = { x: number; y: number; start: number };

export function AerodynamicLines() {
  const canvasRef = useRef<HTMLCanvasElement>(null);

  useEffect(() => {
    const canvas = canvasRef.current;
    const context = canvas?.getContext('2d');
    if (!canvas || !context) return;

    const motion = window.matchMedia('(prefers-reduced-motion: reduce)');
    const tokens = getComputedStyle(document.documentElement);
    const blue = tokens.getPropertyValue('--primary').trim();
    const silver = tokens.getPropertyValue('--silver').trim();
    const red = tokens.getPropertyValue('--ripple-line').trim();
    let width = window.innerWidth;
    let height = window.innerHeight;
    let frame = 0;
    let ripples: Ripple[] = [];
    let lastFrame = 0;
    let segments = 0;

    const resize = () => {
      width = window.innerWidth;
      height = window.innerHeight;
      const ratio = Math.min(window.devicePixelRatio || 1, 1.5);
      canvas.width = Math.round(width * ratio);
      canvas.height = Math.round(height * ratio);
      context.setTransform(ratio, 0, 0, ratio, 0, 0);
      segments = Math.max(60, Math.ceil(width / 18));
    };

    const tap = (event: PointerEvent) => {
      if (!event.isPrimary || event.button !== 0 || motion.matches) return;
      ripples = [...ripples.slice(-2), { x: event.clientX, y: event.clientY, start: performance.now() }];
    };

    const draw = (now: number) => {
      if (now - lastFrame < 1000 / 60) {
        frame = window.requestAnimationFrame(draw);
        return;
      }
      lastFrame = now;
      context.clearRect(0, 0, width, height);
      ripples = ripples.filter((ripple) => now - ripple.start < 5200);
      const time = motion.matches ? 0 : now / 1000;

      for (let line = 0; line < 10; line++) {
        context.beginPath();
        let strength = 0;
        for (let step = 0; step <= segments; step++) {
          const x = (step / segments) * (width + 80) - 40;
          const baseY = ((80 + line * 150) / 1500) * height
            + Math.sin((x / width) * Math.PI * 2 - line * 0.18 + time * 0.45) * height * 0.022
            + Math.sin((x / width) * Math.PI * 4 + time * 0.7 + line) * height * 0.004;
          let offset = 0;
          for (const ripple of ripples) {
            const age = (now - ripple.start) / 1000;
            const wave = Math.hypot(x - ripple.x, baseY - ripple.y) - age * 520;
            const envelope = Math.exp(-((wave / 145) ** 2)) * Math.max(0, 1 - age / 5.2);
            offset += Math.sin(wave / 28) * envelope * 38;
            strength = Math.max(strength, envelope);
          }
          const y = baseY + offset;
          if (step === 0) context.moveTo(x, y);
          else context.lineTo(x, y);
        }
        context.strokeStyle = 'rgba(38, 120, 255, 0.28)';
        context.globalAlpha = 1;
        context.lineWidth = 0.9;
        context.stroke();

        const flow = ((time / 5.5 + line * 0.31) % 1 + 1) % 1;
        const movingLight = context.createLinearGradient(0, 0, width, 0);
        movingLight.addColorStop(Math.max(0, flow - 0.18), 'rgba(38, 120, 255, 0)');
        movingLight.addColorStop(Math.max(0, flow - 0.06), 'rgba(70, 155, 255, 0.3)');
        movingLight.addColorStop(flow, 'rgba(170, 220, 255, 0.95)');
        movingLight.addColorStop(Math.min(1, flow + 0.06), 'rgba(70, 155, 255, 0.3)');
        movingLight.addColorStop(Math.min(1, flow + 0.18), 'rgba(38, 120, 255, 0)');
        context.strokeStyle = movingLight;
        context.globalAlpha = 1;
        context.lineWidth = 1.5;
        context.stroke();

        if (strength > 0.025) {
          context.strokeStyle = red;
          context.globalAlpha = Math.min(1, strength * 2);
          context.lineWidth = 1.4;
          context.stroke();
        }
      }
      context.globalAlpha = 1;
      frame = window.requestAnimationFrame(draw);
    };

    resize();
    frame = window.requestAnimationFrame(draw);
    window.addEventListener('resize', resize);
    window.addEventListener('pointerdown', tap, { passive: true });
    return () => {
      window.cancelAnimationFrame(frame);
      window.removeEventListener('resize', resize);
      window.removeEventListener('pointerdown', tap);
    };
  }, []);

  return <canvas ref={canvasRef} className="pointer-events-none fixed inset-0 h-full w-full" aria-hidden="true" />;
}
