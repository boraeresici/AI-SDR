---
name: ux-design-system
description: Enforce consistent UI/UX delivery with design tokens, component reuse, responsive breakpoints, and WCAG 2.1 AA accessibility gates. Use when defining interface constraints, reviewing UI implementation quality, or preparing build-ready design rules.
---

# Purpose
Protect visual consistency and usability across features.  
Prevent ad-hoc UI decisions during fast implementation cycles.

# Trigger Rules
- Use when a new UI flow, screen, or component is requested.
- Use when developers need concrete visual constraints before coding.
- Use when UI quality review is needed for responsiveness or accessibility.

# Required Inputs
Required:
- Product goal and target user flow
- Existing component inventory (if available)
- Design token baseline (color, spacing, radius, typography)
- Interaction states needed (loading, empty, error, success)

Optional:
- Brand references
- Previous usability feedback
- Competitor benchmarks

# Output Contract
- `ui-constraints.md`
  - Required headings: `Design Tokens`, `Component Reuse Plan`, `Responsive Rules`, `Interaction States`, `Accessibility Checklist`, `Do and Don't`, `Next Skill`, `Suggested Command`

# Workflow
1. Identify target flow and UI surfaces.
2. Reuse existing components first; mark only required new components.
3. Apply token constraints for color, spacing, radius, and typography.
4. Define responsive behavior by breakpoint.
5. Define interaction states and accessibility checks.
6. Publish immutable UI constraints for implementation.

# Decision Rules
Default:
- Reuse-first policy for existing components.
- Mobile-first behavior and progressive enhancement.
- Accessibility default target is `WCAG 2.1 AA`.
- Fixed breakpoint set: `375 / 768 / 1024 / 1440`.

No-Go:
- Ship UI without keyboard navigation support.
- Ship forms without labels and clear error states.
- Introduce arbitrary styles outside design tokens.

Exception:
- Intentional visual deviation allowed only with explicit rationale and user approval.

# Quality Gates
- Responsive validation pass on all 4 breakpoints.
- Accessibility checks: contrast, keyboard navigation, form labeling = `100% pass` for critical flows.
- Each new screen must define loading, empty, error, success states.
- Gate fail action: block handoff to implementation until constraints are corrected.

# Handoff Contract
Immutable artifacts passed to Developer:
- Approved `ui-constraints.md`
- Component reuse/new component map
- Accessibility checklist with pass criteria
- Interaction state definitions

# Anti-Patterns
- Build screen from scratch without checking existing components.
- Optimize desktop first and patch mobile later.
- Treat accessibility as post-release polish.
- Use color alone to communicate status.
- Skip explicit states for loading or failure.

# Prompt Snippets
- `Create ui-constraints strict mode with WCAG 2.1 AA and breakpoint checks.`
- `List reusable components first, then propose only necessary new components.`
- `Audit this UI for accessibility and responsive No-Go violations.`

# Spec Compatibility
This skill follows SKILL_SPEC v1.0.

