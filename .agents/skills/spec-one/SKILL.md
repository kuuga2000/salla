---
name: spec-one
description: Create, review, update, implement, or verify a feature using one SPEC.md that preserves requirements, decisions, technical design, tasks, and validation evidence. Use for specification-driven feature work in Salla themes or other software repositories; a spec-only request never authorizes implementation.
---

# Spec One

Adapt specification-driven development to one living feature document:
Context/principles → Specify → Clarify → Plan → Tasks → Analyze → Implement → Verify.
Scale detail to feature complexity. Keep simple changes brief without skipping material decisions or required checks. This is an adaptation of GitHub Spec Kit principles, not an installation of Spec Kit or its command/file structure.

## Language

- Write SKILL.md and all generated SPEC.md documents in English.
- Communicate with the user, ask clarification questions, and explain results in Bahasa Indonesia, unless the user requests another language.
- Preserve code identifiers, API fields, paths, commands, and official platform terminology.
- Preserve the original meaning of business rules during translation.
- Record ambiguity explicitly instead of silently inventing an interpretation.
- User prompt examples inside SKILL.md may use Bahasa Indonesia.

## Modes and authorization

Determine the mode from the current request and existing authorization; record the requested scope in metadata. Explicit user instructions for the current task override workflow defaults, subject to higher-priority instructions.

| Request | Mode and permitted work |
| --- | --- |
| Create a spec | SPEC: create or update only the feature SPEC.md. Do not change application source, tests, dependencies, or runtime configuration. Read-only investigation is allowed. |
| Review a spec | REVIEW: read the spec and evidence, then report findings with IDs, conflicts, gaps, impact, and suggested fixes. Do not edit unless fixes or updates are requested. |
| Update a spec | SPEC: apply the requested decisions to the same document and reconcile affected requirements, criteria, design, and tasks. This does not authorize source changes. |
| Implement | IMPLEMENT: read and analyze the current spec, then perform authorized tasks and required dependencies without unnecessary renewed approval. |
| Spec and implementation | SPEC then IMPLEMENT: complete the spec and consistency analysis first; continue where no critical blocker exists. |
| Implement a particular task | IMPLEMENT restricted to that task and necessary dependencies within authorized scope. Do not implement unrelated tasks. |
| Continue implementation | IMPLEMENT: reconcile recorded progress with actual code and evidence, then resume remaining authorized work. |
| Verify implementation | VERIFY: perform applicable checks and update actual results and progress in the same spec. Source fixes require implementation authorization. |

A request for a spec alone never authorizes implementation. Readiness is not authorization. Do not implement work dependent on unresolved critical business rules, security decisions, or public contracts; continue independent authorized work. Silence does not resolve a critical question. Do not commit, push, deploy, publish, or send messages to others without appropriate authorization. Do not install Spec Kit as part of this workflow.

## Locate context and the single feature file

1. Read applicable AGENTS.md and repository instructions before writing. Inspect the repository root, current working directory, dev container, project configuration, established spec locations, existing feature documents, and relevant decisions. Determine the actual project or theme directory rather than assuming the workspace root contains application code.
2. Before creating a spec, search by feature intent, slug, and existing requirements. Reuse the existing feature file for continuation. Use `specs/<feature-slug>/SPEC.md` unless the repository has an agreed spec location. Do not relocate an existing spec or create competing copies. If several files plausibly represent the same feature, resolve ownership before creating another.
3. Keep context, relevant principles, requirements, clarifications, research, design, contracts, tasks, analysis, checklists, and validation records in that same SPEC.md. Do not split these into constitution, research, plan, tasks, contracts, checklist, or validation files.
4. Read existing files before editing. Preserve unrelated changes, still-valid decisions, stable IDs, and valid progress. Allocate new IDs without renumbering existing IDs or reusing canceled IDs. Mark replaced or canceled items `superseded` or `dropped` with a reason; tasks use `dropped` and identify their replacement when applicable.
5. Keep this skill itself in one SKILL.md, including the template and examples. Do not create scripts, references, README, agents metadata, or other supporting skill files.
6. During authorized implementation, application source, tests, and configuration belong in their normal locations. Necessary application/tooling artifacts are allowed: the one-file rule governs feature planning and records, not all application files. Do not change Codex or dev container configuration merely to make this skill discoverable.

## Evidence and decisions

Read relevant code and configuration before choosing a design. Record material claims as **verified fact**, **user decision**, **proposal**, **assumption**, or **open question**. Include repository paths or official documentation URLs, and the version/environment when relevant. For unavailable evidence, label the claim **unverified**, explain its impact, and name the missing check. Do not claim access or verification that did not occur.

Do not assume an API, template variable, dependency, SDK, or platform capability exists. Verify it against code/configuration and relevant official documentation. Research and tradeoffs belong in the same spec. Use technical judgment for routine decisions that do not need clarification; record safe assumptions explicitly. Check existing decisions before asking again. Never change business rules through translation or implementation.

Record significant decision and scope changes briefly, including their authorization and effects on IDs, tasks, and validation. Avoid logs of every small action. If implementation diverges from the spec, fix the implementation within authorization or record an authorized decision change and reconcile the document; never conceal divergence by marking a task done.

## Workflow: actions, outputs, and gates

All planning outputs below belong in the same feature SPEC.md. In REVIEW mode, report findings without modifying it. Revisit affected stages when a decision changes; this is not a mandatory restart of every stage.

| Stage | Actions | Output in SPEC.md | Condition to proceed |
| --- | --- | --- | --- |
| Context/principles | Read project instructions, relevant code/configuration, decisions, and existing constitution or guidelines. Summarize relevant established principles with sources; distinguish proposed principles. Do not copy/move governance documents unnecessarily or invent agreed project policy. | Metadata, context, constraints, relevant principles and evidence. | Enough context to specify the intended change; missing evidence is explicit. |
| Specify | Define the problem, goals, scope, user stories, functional requirements, business rules, relevant nonfunctional needs, measurable acceptance criteria, and edge cases. Establish expected behavior before implementation choices. Use verified information and user decisions. | Requirements and criteria with stable IDs; desired outcomes and scope boundaries. | Requirements are testable; material ambiguity enters Clarify. |
| Clarify | Check existing context/decisions first. Identify ambiguity affecting scope, business rules, security, or public contracts. Ask concise important questions, grouped when helpful. Record answers and their effects; label safe routine assumptions. | Open questions, impacts and affected IDs, assumptions with verification status, user decisions. | Critical ambiguity is resolved for dependent work. Unanswered critical questions remain blockers; independent work can proceed. |
| Plan | Design against actual code, configuration, and relevant official documentation. Identify affected components/files, data flow, API/config/template contracts, state and error handling, and technical concerns proportional to scope. Research alternatives only when useful; justify new technology/dependencies. | Technical design, contracts, research sources, decisions, tradeoffs and validation plan. | The proposed design satisfies requirements and principles; critical unverified capabilities block dependent implementation. |
| Tasks | Break work into concrete, ordered, verifiable tasks sized to complexity. Include dependencies, requirement/AC references, completion criteria and evidence/blockers. Each task needs a requirement or explained technical necessity. | Task table and traceability. | Dependencies and completion criteria are clear and coverage can be analyzed. |
| Analyze | Cross-check requirements, business rules, design, acceptance criteria, and tasks. Find conflicts, missing coverage, unsupported assumptions, unnecessary scope, and drift from principles. | Coverage mapping, findings, readiness and remaining blockers. | Critical conflicts are resolved for the work being implemented. Full readiness does not authorize implementation. |
| Implement | Only when requested: reread the latest spec, inspect actual progress, execute authorized tasks/dependencies, and update progress/evidence in the same spec. Preserve business decisions and scope; record authorized changes. | Task progress, implementation evidence, material changes and remaining work. | Task completion criteria are met with evidence; move completed work to relevant verification. |
| Verify | Run checks appropriate to the changes and repository instructions. Compare actual behavior with acceptance criteria, record commands/procedures, results, evidence and limitations. Distinguish built from verified work. | Actual validation results, task states, feature status, remaining work. | Verified only when all active acceptance criteria and applicable mandatory checks are satisfied with evidence. Otherwise keep accurate incomplete status. |

In SPEC mode, stop after planning and analysis at the depth requested. Do not execute implementation tasks. If the request is an early draft, leave later sections explicitly pending rather than inventing design or results.

## Status and traceability

Feature status is one of:

| Status | Meaning and entry condition |
| --- | --- |
| Draft | The specification is being formed; detail, design, or coverage remains incomplete. |
| Needs clarification | A material unresolved question requires a user decision before dependent planning or implementation. |
| Ready for implementation | Requirements, criteria, design, tasks and consistency analysis are sufficient for the feature; no critical implementation blocker remains. This does not grant permission to implement. |
| In progress | Authorized implementation or verification has begun; completion or required verification remains outstanding. Code may be built while checks are still pending. |
| Blocked | A concrete impediment prevents necessary progress, such as missing access, unresolved critical capability, or unavailable mandatory verification. Record its impact and the work that can continue. |
| Verified | Every active acceptance criterion and applicable mandatory check is satisfied with recorded evidence; no required feature work remains. |

Use `Needs clarification` for missing decisions; use `Blocked` for an execution impediment. Reassess status after changes invalidate earlier readiness or verification; preserve historical evidence and identify the revision it covered. A partial implementation is not full-feature readiness or verification.

Use stable IDs `FR-001`, `BR-001`, `NFR-001`, `AC-001`, and `T-001`. Maintain requirements/business rules → acceptance criteria → tasks mapping, including relevant NFRs. Explain technical tasks without a direct functional requirement. Exclude superseded/dropped items from active coverage while retaining history and replacement links.

Task statuses: `todo`, `in progress`, `blocked`, `done`, `dropped`. `done` means its completion criteria are met with evidence. Implementation task criteria must include relevant validation unless it is explicitly assigned to a separate verification task. With separate validation, code work may be done while verification remains pending; the feature cannot be Verified yet.

Validation statuses: `planned`, `passed`, `failed`, `not run`. Record actual outcomes, not expected outcomes. A limitation is not a substitute for a mandatory check. If a mandatory check cannot run, record why, leave the verification task incomplete, and do not declare the feature Verified. Do not claim completed tasks, passing checks, or verification without evidence.

## Conditional Salla theme guidance

Apply only when the actual project is a Salla theme; otherwise follow the software project's own stack and conventions.

- Inspect actual theme/starter structure, package scripts, templates, components, and merchant settings. Do not bind this skill to a theme name, starter, niche, or framework.
- Verify data, template variables, SDK behavior, components, and platform capabilities through relevant official Salla documentation, starting from https://docs.salla.dev/ and following the applicable pages. Record the specific URLs actually checked.
- Inspect real theme/platform data mechanisms before choosing data access. Do not assume every datum requires a direct API request.
- Consider responsive layout, Arabic RTL/LTR, accessibility, data states, and performance according to feature scope. Specify loading, empty, error, and unavailable behavior when applicable.
- Verify merchant settings are supported; define defaults and fallbacks.
- Do not add a backend or take over checkout without an explicit, justified requirement and authorization.
- If the theme/starter is unavailable, record that limitation and its blockers. Do not invent paths, components, variables, or package scripts. Keep any intended design clearly provisional until verified.

## Ready-to-use SPEC.md template

Fill with evidence and actual decisions; bracketed text is an instruction to replace, not a fact. Use `Not applicable` with a short reason for genuinely irrelevant sections. Use `Pending` or `Unverified` for work/evidence not yet available, never `Not applicable` to hide missing required work. Keep all twelve sections, but scale their contents to complexity. Create rows and IDs only for real items; add stable IDs using the next unused number.

```markdown
# [Feature title]

## 1. Metadata

- Feature title: [Title]
- Slug: [feature-slug]
- Status: Draft
- Created date: [YYYY-MM-DD]
- Last updated date: [YYYY-MM-DD]
- Project: [Verified project and repository/application path]
- Environment: [Verified relevant environment; label unknowns]
- Current mode / requested scope: [SPEC, REVIEW, IMPLEMENT, or VERIFY; authorized scope]

## 2. Context, problem, and goals

- Context: [Relevant background and sources]
- Problem: [Who is affected and why]
- Current behavior: [Verified behavior and evidence, or Unverified with impact]
- Goals: [Intended outcomes]
- Success measures: [Relevant observable outcomes; no invented targets]

## 3. Scope and constraints

- In scope: [Authorized behavior]
- Out of scope: [Explicit boundaries]
- Technical constraints: [Constraints and sources]
- Business constraints: [Constraints and user decisions]
- Dependencies: [Relevant systems, access, decisions, or prerequisites]

## 4. Relevant project principles

| Principle or convention | Classification | Source | Feature implication |
| --- | --- | --- | --- |
| [Relevant principle] | [Established or proposal] | [Path/URL/decision] | [Effect] |

## 5. User stories, requirements, and business rules

- User stories: [Actor, need, and intended benefit]

| ID | Type | Requirement or rule | Classification and source |
| --- | --- | --- | --- |
| FR-001 | Functional requirement | [Testable behavior] | [Fact/decision/proposal/assumption and evidence] |
| BR-001 | Business rule | [Exact intended rule] | [Decision/source] |
| NFR-001 | Nonfunctional requirement | [Relevant measurable constraint, or omit row] | [Source] |

## 6. Acceptance criteria and edge cases

| ID | Requirement/rule references | Acceptance criterion | Verification method |
| --- | --- | --- | --- |
| AC-001 | [FR/BR/NFR IDs] | [Observable expected result; Given/When/Then if helpful] | [Check] |

| Edge case | References | Expected behavior |
| --- | --- | --- |
| [Relevant boundary/state] | [IDs] | [Expected result or unresolved question] |

## 7. Clarifications, assumptions, and decisions

| Item | Classification | Status / verification | Impact and affected IDs | Evidence/source |
| --- | --- | --- | --- | --- |
| [Question, assumption, decision, or proposal] | [Open question/assumption/user decision/proposal/verified fact] | [Pending/answered/verified/unverified as appropriate] | [Impact; critical blocker if applicable] | [Path/official URL/user decision and date] |

Record answers and resulting changes here. Pending proposals are not agreed rules.

## 8. Technical design

- Affected components and files: [Verified paths or explicitly provisional areas]
- Data flow: [Inputs, transformations, outputs and ownership]
- API/config/template contracts: [Fields, types, defaults, permissions and compatibility, if applicable]
- Validation, error handling and state: [Expected behavior]
- Security, performance and compatibility: [Relevant design constraints]
- Migration: [Necessary migration and recovery considerations, or Not applicable with reason]
- Research: [Question, verified finding, official URL/path, impact and unresolved evidence]
- Alternatives/tradeoffs: [Only those useful to a decision]

## 9. Tasks and dependencies

| Task ID | Action | Requirement/AC references | Dependencies | Status | Completion criteria | Evidence/blocker |
| --- | --- | --- | --- | --- | --- | --- |
| T-001 | [Concrete action] | [IDs or justified technical necessity] | [Task IDs/prerequisites or none] | todo | [Observable completion including validation, or explicit separate validation task ID] | [Pending evidence or actual blocker] |

## 10. Consistency and coverage analysis

| Requirement/rule ID | Acceptance criteria | Tasks | Coverage/gap |
| --- | --- | --- | --- |
| [FR/BR/NFR ID] | [AC IDs] | [T IDs] | [Coverage finding] |

- Conflicts or gaps: [Finding and affected IDs]
- Uncovered requirements: [IDs or none with basis]
- Tasks without requirement/technical basis: [IDs or none with basis]
- Unsupported assumptions or unnecessary scope: [Findings]
- Implementation readiness: [Ready or not ready, with reasons]
- Critical blockers and independent work: [Dependencies and what can continue]

## 11. Validation plan and results

| Check and AC/task references | Command or procedure | Status | Actual result | Evidence | Limitations / checks not performed |
| --- | --- | --- | --- | --- | --- |
| [Check; required or optional with basis] | [Verified command or concrete procedure] | planned | Not run | [Pending evidence] | [Known limitation or none] |

Allowed statuses: planned, passed, failed, not run. Identify the revision and environment checked when material. Distinguish implemented behavior from verified behavior.

## 12. Important changes and remaining work

- Important decision/scope changes: [Date, reason, authorization, affected IDs; superseded/dropped items and replacements]
- Remaining work: [Active tasks and outstanding acceptance criteria/checks]
- Risks or blockers: [Impact and dependencies]
- Next step: [Action within authorized scope, or missing decision/access]
```

## Usage examples

Enter these prompts inside Codex CLI launched in the repository. The feature and IDs are illustrative; inspect the actual spec before using them.

1. **New spec without implementation**
   > $spec-one Buat spec fitur pencarian produk. Simpan di specs/product-search/SPEC.md jika belum ada spec fitur yang sama. Kerjakan dalam mode SPEC saja, tanpa implementasi; catat kebutuhan yang belum jelas.

2. **Review and findings only**
   > $spec-one Review specs/product-search/SPEC.md. Laporkan gap, konflik, dan coverage requirements → acceptance criteria → tasks. Jangan mengubah file atau mengimplementasikan fitur.

3. **Update a business rule**
   > $spec-one Perbarui specs/product-search/SPEC.md: pencarian dimulai setelah pengguna memasukkan minimal 3 karakter. Sesuaikan requirements, acceptance criteria, desain, dan tasks yang terdampak; pertahankan ID lama dan catat perubahan keputusan. Jangan ubah source aplikasi.

4. **Implement a particular task**
   > $spec-one Implementasikan T-003 dalam specs/product-search/SPEC.md beserta dependensi yang diperlukan dalam scope tersebut. Baca spec terbaru, jalankan validasi relevan, dan perbarui progres serta bukti di file yang sama.

5. **Continue recorded implementation**
   > $spec-one Lanjutkan implementasi fitur berdasarkan specs/product-search/SPEC.md dan progres yang tercatat. Cocokkan progres dengan kode aktual, kerjakan tasks tersisa yang diotorisasi, dan catat blocker tanpa memperluas scope.

6. **Verify and update results**
   > $spec-one Verifikasi implementasi terhadap specs/product-search/SPEC.md. Jalankan pemeriksaan yang berlaku, lalu perbarui hasil aktual, bukti, tasks, dan status fitur di spec yang sama. Jangan memperbaiki source tanpa instruksi implementasi; jangan tandai Verified jika pemeriksaan wajib belum terpenuhi.

## Workflow provenance and discovery

Principles adapted from official GitHub Spec Kit documentation:
- https://github.com/github/spec-kit/blob/main/docs/guides/existing-projects.md — grounded project principles, bounded changes, planning against existing code, and consistency analysis before implementation.
- https://github.com/github/spec-kit/blob/main/templates/commands/clarify.md — identify meaningful ambiguity and record clarified behavior in the specification.

This skill deliberately consolidates feature artifacts into one SPEC.md and uses the user's authorization modes instead of requiring Spec Kit installation, separate commands, or additional files.

Official Codex skill authoring/discovery documentation: https://learn.chatgpt.com/docs/build-skills . Repository-local `.agents/skills` is supported; SKILL.md requires name and description frontmatter. Codex documents automatic skill-change detection, with restart as a fallback if changes do not appear. This documentation does not establish that discovery has been tested in any particular session.
