abstract class BaseTerm {
  final String categoryName;
  final String definition;

  final List<BaseTermInstances> terms;

  const BaseTerm(this.categoryName, this.definition, this.terms);
}

class BaseTermInstances {
  final String name;
  final String description;

  const BaseTermInstances(this.name, this.description);
}

class PaymentPresets extends BaseTerm {
  const PaymentPresets()
    : super(
        "Payment Tiers",
        "Standardized pricing categories that help determine fair licensing fees based on your project's scale, budget, and commercial reach. This ensures artists receive appropriate compensation while keeping licensing accessible for different types of productions.",
        const [
          BaseTermInstances(
            "Student",
            "Affordable rates for student films, school projects, and educational content with very limited budgets. This tier supports emerging filmmakers and students learning their craft, typically ranging from ₦50,000-₦20,000. Perfect for thesis films, class projects, or portfolio pieces that won't generate commercial revenue.",
          ),
          BaseTermInstances(
            "Independent",
            "Moderate pricing for indie films, small documentaries, and local productions with modest budgets. This tier balances fair artist compensation with accessibility for independent creators, typically ranging from ₦20,000-₦100,000. Ideal for festival films, local commercials, or small-scale web series that may have limited distribution.",
          ),
          BaseTermInstances(
            "Commercial",
            "Standard rates for professional commercials, TV shows, corporate videos, and mainstream productions with substantial budgets. This tier reflects the commercial value and wider reach of these projects, typically ranging from ₦100,000-500,000. Suitable for national advertising campaigns, streaming series, or corporate presentations with significant audience exposure.",
          ),
          BaseTermInstances(
            "Premium",
            "Higher rates for major studio films, international productions, and high-budget projects with global reach. This tier accounts for the substantial commercial value and worldwide distribution potential, typically ranging from ₦500,000-₦2,500,000+. Reserved for blockbuster movies, major streaming platforms, or international advertising campaigns with massive audience reach.",
          ),
        ],
      );
}

/// Geographic territory presets for licensing rights
class TerritoryPresets extends BaseTerm {
  const TerritoryPresets()
    : super(
        "Territory Rights",
        "Geographic boundaries that define where your licensed music can be used, distributed, or broadcast. This protects artists by ensuring they receive appropriate compensation based on the actual reach and market size of their music usage, while giving producers clear guidelines on where they can use the music.",
        const [
          BaseTermInstances(
            "Local",
            "Nigeria-only rights for domestic productions, local TV stations, and Nigerian streaming platforms. This tier is perfect for local commercials, Nigerian films, or content primarily targeting Nigerian audiences. It offers the most affordable licensing while ensuring the music stays within the domestic market, protecting the artist's ability to license elsewhere.",
          ),
          BaseTermInstances(
            "Regional",
            "West Africa region rights covering Nigeria, Ghana, Senegal, and neighboring countries for regional productions. This tier is ideal for pan-African TV shows, regional advertising campaigns, or content distributed across multiple West African markets. It provides broader reach than local rights while maintaining regional focus and reasonable pricing.",
          ),
          BaseTermInstances(
            "Continental",
            "Entire African continent rights for pan-African productions, continental TV networks, and Africa-wide streaming platforms. This tier is perfect for major African films, continental advertising campaigns, or content distributed across multiple African countries. It offers significant reach across diverse African markets while maintaining continental boundaries.",
          ),
          BaseTermInstances(
            "Worldwide",
            "Global rights for international productions, worldwide distribution, and global streaming platforms. This tier is reserved for major studio films, international advertising campaigns, or content with global reach. It provides maximum exposure and commercial potential while ensuring artists receive premium compensation for worldwide usage.",
          ),
        ],
      );
}

/// Exclusivity level presets for licensing agreements
class ExclusivityPresets extends BaseTerm {
  const ExclusivityPresets()
    : super(
        "Exclusivity Rights",
        "Control over whether the same music can be licensed to multiple projects simultaneously. This determines how much creative control and market protection you have over the music, balancing the artist's ability to earn from multiple sources with the producer's desire for unique content.",
        const [
          BaseTermInstances(
            "Non-Exclusive",
            "Artist can license the same music to multiple projects simultaneously without any restrictions. This is the most flexible option, allowing the artist to maximize their earnings while keeping licensing costs lower for producers. Perfect for background music, stock footage, or when uniqueness isn't critical to your project's success.",
          ),
          BaseTermInstances(
            "Semi-Exclusive",
            "Limited exclusivity within specific categories (like only one film per year) or territories (like only one commercial per region). This provides some protection against oversaturation while allowing the artist to license to different types of projects. Ideal when you want some uniqueness but don't need complete exclusivity.",
          ),
          BaseTermInstances(
            "Exclusive",
            "Full exclusivity where only your project can use the music during the entire license period. This ensures complete uniqueness and prevents the music from appearing in competing projects. Perfect for signature themes, brand-specific music, or when the music is central to your project's identity and success.",
          ),
        ],
      );
}

/// Usage rights presets for different media platforms
class UsageRightsPresets extends BaseTerm {
  const UsageRightsPresets()
    : super(
        "Usage Rights",
        "Specific platforms and formats where your licensed music can be used, from basic film rights to comprehensive multi-platform usage. This defines the scope of your license and ensures you have the rights you need for your project's distribution strategy while protecting artists from unauthorized usage.",
        const [
          BaseTermInstances(
            "Basic",
            "Film-only rights limited to the main production without additional distribution rights. This is perfect for single-use projects like short films, student projects, or one-time presentations. The music can only be used in the final film and cannot be used in trailers, promotional materials, or other formats.",
          ),
          BaseTermInstances(
            "Standard",
            "Film rights plus streaming platforms and digital distribution channels. This covers your main production plus online distribution through platforms like Netflix, YouTube, or your own website. Perfect for films that will be distributed digitally but won't need extensive marketing or promotional usage.",
          ),
          BaseTermInstances(
            "Enhanced",
            "Film, streaming, and marketing or promotional materials including trailers, social media clips, and advertising. This comprehensive package covers your main production plus all the promotional content you'll need to market it effectively. Ideal for projects that require extensive marketing and promotional campaigns.",
          ),
          BaseTermInstances(
            "Comprehensive",
            "All media rights including film, streaming, advertisements, sequels, spin-offs, and any future related content. This is the most extensive license, covering every possible use of the music in your project universe. Perfect for major productions, franchises, or when you need maximum flexibility for future content development.",
          ),
        ],
      );
}

/// Performing rights presets for royalty management
class PerformingRightsPresets extends BaseTerm {
  const PerformingRightsPresets()
    : super(
        "Performing Rights",
        "Control over future royalty payments from performing rights organizations (PROs) when your music is played on TV, radio, or streaming platforms. This balances upfront licensing costs with ongoing royalty streams, giving you flexibility in how you structure your payment agreement.",
        const [
          BaseTermInstances(
            "Keep Royalties",
            "Artist retains all future royalties from TV broadcasts, radio play, and streaming performances through performing rights organizations. This option typically results in lower upfront licensing costs since the artist will continue earning from ongoing usage. Perfect when you want to minimize initial costs and the artist is comfortable with delayed compensation.",
          ),
          BaseTermInstances(
            "Waive Royalties",
            "Artist waives all future royalties in exchange for higher upfront compensation, giving you complete control over the music without ongoing royalty obligations. This option typically costs more initially but eliminates future royalty payments. Ideal when you want predictable costs and complete control over the music's financial aspects.",
          ),
        ],
      );
}

/// Approval level presets for content usage control
class ApprovalLevels extends BaseTerm {
  const ApprovalLevels()
    : super(
        "Approval Rights",
        "Control over how and where the artist's music is used in your project, from complete creative freedom to requiring artist approval for all usage decisions. This protects the artist's creative vision while giving you flexibility in your production process.",
        const [
          BaseTermInstances(
            "No Approval",
            "Complete creative freedom - you can use the music however you see fit without any artist oversight or approval requirements. This is the most flexible option, perfect when you need maximum creative control and fast production timelines. The artist trusts your creative judgment completely.",
          ),
          BaseTermInstances(
            "Basic Notification",
            "Artist receives notification of how the music will be used but doesn't need to approve it. This keeps the artist informed about their music's usage while maintaining your creative freedom. Perfect when you want to maintain good relationships with artists while keeping production efficient.",
          ),
          BaseTermInstances(
            "Context Approval",
            "Artist must approve the specific scene context, emotional tone, and usage environment before the music can be used. This ensures the music aligns with the artist's vision and brand. Ideal when the music is central to your project or when working with artists who are particular about their music's context.",
          ),
          BaseTermInstances(
            "Full Approval",
            "Artist must approve every aspect of the music usage, including final edits, placement, and any modifications. This provides maximum protection for the artist's creative vision. Perfect for high-profile collaborations or when the artist's brand and reputation are closely tied to the project.",
          ),
        ],
      );
}

/// Credit presets for artist attribution
class CreditPresets extends BaseTerm {
  const CreditPresets()
    : super(
        "Credit Requirements",
        "Artist attribution and recognition requirements that determine how the artist is credited for their work. This ensures proper recognition and can help build the artist's reputation while giving you flexibility in how you acknowledge their contribution to your project.",
        const [
          BaseTermInstances(
            "No Credit",
            "No attribution required - the music can be used without any credit or mention of the artist. This is the most flexible option, perfect when you want complete creative control over credits or when the music is used as background elements. The artist receives payment but no promotional benefit.",
          ),
          BaseTermInstances(
            "Minimal Credit",
            "Basic artist information in end credits only, typically including artist name and song title. This provides essential attribution while keeping credits simple and unobtrusive. Perfect for projects where credits are minimal or when you want to acknowledge the artist without prominent placement.",
          ),
          BaseTermInstances(
            "Standard Credit",
            "End credits plus social media mentions and promotional rights when sharing content online. This includes tagging the artist in social media posts and including their information in online descriptions. Ideal for projects with strong social media presence or when you want to help promote the artist.",
          ),
          BaseTermInstances(
            "Prominent Credit",
            "Opening credits or larger, more visible text with enhanced placement and formatting. This ensures the artist gets significant visibility and recognition. Perfect for projects where the music is a key element or when you want to give the artist substantial promotional value.",
          ),
          BaseTermInstances(
            "Premium Credit",
            "Opening credits plus logo placement, marketing inclusion, and prominent branding opportunities. This provides maximum visibility and promotional value for the artist. Ideal for high-profile collaborations or when the artist's brand is important to your project's success.",
          ),
          BaseTermInstances(
            "Custom Credit",
            "Build your own custom credit arrangement with specific requirements, placement, and promotional opportunities tailored to your project and the artist's needs. This provides maximum flexibility to create a unique credit structure that works for both parties.",
          ),
        ],
      );
}

/// Modification level presets for music editing rights
class ModificationLevels extends BaseTerm {
  const ModificationLevels()
    : super(
        "Modification Rights",
        "Permission to edit, remix, or modify the original music to fit your project's needs. This determines how much creative freedom you have to adapt the music while protecting the artist's original work and creative vision.",
        const [
          BaseTermInstances(
            "Prohibited",
            "No changes allowed - the music must be used exactly as provided without any modifications, edits, or alterations. This protects the artist's original creative vision completely. Perfect when the music works perfectly as-is or when you want to preserve the artist's exact creative intent.",
          ),
          BaseTermInstances(
            "Basic Only",
            "Only technical adjustments allowed - length trimming, volume changes, fade-ins/outs, and basic audio editing. No creative modifications like remixing, adding instruments, or changing the musical structure. Ideal when you need minor technical adjustments but want to preserve the original creative work.",
          ),
          BaseTermInstances(
            "With Approval",
            "Creative modifications allowed but require artist approval before implementation. This includes remixing, adding elements, or significant changes to the original work. Perfect when you need creative flexibility but want to ensure the artist approves of any changes to their work.",
          ),
          BaseTermInstances(
            "Full Rights",
            "Complete creative freedom to edit, remix, modify, or adapt the music however you need for your project. This includes adding instruments, changing tempo, creating new arrangements, or any other creative modifications. Ideal when you need maximum creative control and the music is just a starting point.",
          ),
        ],
      );
}

/// Renewal option presets for license extensions
class RenewalOptions extends BaseTerm {
  const RenewalOptions()
    : super(
        "Renewal Options",
        "Options for extending or renewing your license agreement after the initial term expires. This determines how you can continue using the music and what happens when your current license period ends, giving you flexibility for long-term projects.",
        const [
          BaseTermInstances(
            "No Renewal",
            "One-time deal only - no option to extend the license beyond the initial term. Once the license expires, you must stop using the music or negotiate a completely new agreement. Perfect for short-term projects or when you're certain you won't need the music beyond the initial period.",
          ),
          BaseTermInstances(
            "Automatic",
            "License automatically renews with the same terms and conditions for additional periods. This provides continuity and convenience, ensuring you can continue using the music without interruption. Ideal for ongoing projects, series, or when you want predictable, long-term access to the music.",
          ),
          BaseTermInstances(
            "Negotiated",
            "Renewal requires renegotiation of new terms, pricing, and conditions for each extension period. This allows both parties to adjust the agreement based on changing circumstances. Perfect when you want flexibility to adapt the license terms as your project evolves or market conditions change.",
          ),
          BaseTermInstances(
            "First Refusal",
            "You get the first opportunity to renew the license before the artist offers it to other projects. This gives you priority access while allowing the artist to explore other opportunities if you decline. Ideal when you want to maintain your relationship with the artist while keeping your options open.",
          ),
        ],
      );
}

/// Termination trigger presets for contract violations
class TerminationTriggers extends BaseTerm {
  const TerminationTriggers()
    : super(
        "Termination Rights",
        "Conditions that allow either party to end the license agreement early, protecting both financial interests and artistic integrity. This ensures both parties have recourse if the agreement isn't working as intended or if serious issues arise.",
        const [
          BaseTermInstances(
            "Standard",
            "Standard contract violations that give either party the right to terminate the agreement, such as repeated non-payment, major breaches of agreed terms (e.g., unauthorized edits or usage beyond scope), or the producer's bankruptcy. This protects the artist's financial interests and ensures fair compensation.",
          ),
          BaseTermInstances(
            "Artist Protections",
            "Artist-specific protections against inappropriate usage, offensive context, or damage to the artist's reputation. This includes using the music in controversial content, associating it with brands that conflict with the artist's values, or any usage that could harm the artist's professional standing. This protects the artist's brand and career.",
          ),
        ],
      );
}
