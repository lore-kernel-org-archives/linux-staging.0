Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9335677
	for <linux-staging@lists.linux.dev>; Sun, 26 Feb 2023 19:37:25 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id b12so2904722ils.8
        for <linux-staging@lists.linux.dev>; Sun, 26 Feb 2023 11:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3V59Duu+LbDPEXLSvxwD8zXDN4WNV1rPfnVcbUHV3c=;
        b=BigVEAxxUoRMd4U6EIUZHKeTKwnvi0Fu3mubiN7YqoWR1YODsv/dz+eapaeJa1aEdk
         OQv9xZ6JFFnQh6eTy9Oi1CrDuXhmhFhpZLgHK85Zz5QFHTYcAI+Ay1/pg3s4Rt91GLH/
         bx3I5roX0n2d+aBvWF47jmMUrMl2howJlKuXYph70KGROW3bdejhiehi8I7cZC28W2JB
         9oaZXtiWQ6hD5E9htk4F54rchF+1HDlh8MmbpPbiKpmftEqukMdutrN7iIxTbupbzXuf
         cIycc7xIhjELasFP7dNF6SBppU8+Rtn2uWw7EQzBjSk/DEKhV8G3oUovLI60GtWq9GI4
         7pww==
X-Gm-Message-State: AO0yUKW0OQGVwx76EUBdyUJnYe1XRHgAioWHTL/Nspd4FVWfQuuVvUO7
	VO4nUlaEBxCylYEw3ZnmHw==
X-Google-Smtp-Source: AK7set+KoXSKhOB26nmgSluPEXmxlGByv3xNe7fWRYkpWFMQ2u8gY2CzrKkoNN1kyeL1Zb+et5t4lQ==
X-Received: by 2002:a05:6e02:1d87:b0:316:b0b2:c2f2 with SMTP id h7-20020a056e021d8700b00316b0b2c2f2mr22248461ila.3.1677440244320;
        Sun, 26 Feb 2023 11:37:24 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
        by smtp.gmail.com with ESMTPSA id f21-20020a056638023500b003eb8ea0da2csm1326227jaq.154.2023.02.26.11.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 11:37:24 -0800 (PST)
Received: (nullmailer pid 190082 invoked by uid 1000);
	Sun, 26 Feb 2023 19:37:20 -0000
Date: Sun, 26 Feb 2023 13:37:20 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 03/10] dt-bindings: sound: nvidia,tegra-audio: add
 RT5631 CODEC
Message-ID: <20230226193720.GA187553-robh@kernel.org>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-4-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-4-clamor95@gmail.com>

On Tue, Feb 21, 2023 at 08:32:04PM +0200, Svyatoslav Ryhel wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add dt-binding for RT5631 CODEC.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Your S-o-b is needed here as well.

> ---
>  .../sound/nvidia,tegra-audio-rt5631.yaml      | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
> new file mode 100644
> index 000000000000..b347f34c47f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5631.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra audio complex with RT5631 CODEC
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +allOf:
> +  - $ref: nvidia,tegra-audio-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - pattern: '^[a-z0-9]+,tegra-audio-rt5631(-[a-z0-9]+)+$'
> +      - const: nvidia,tegra-audio-rt5631
> +
> +  nvidia,audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      A list of the connections between audio components.
> +      Each entry is a pair of strings, the first being the connection's sink,
> +      the second being the connection's source. Valid names for sources and
> +      sinks are the pins (documented in the binding document),
> +      and the jacks on the board.
> +    minItems: 2
> +    items:
> +      enum:
> +        # Board Connectors
> +        - "Int Spk"
> +        - "Headphone Jack"
> +        - "Mic Jack"
> +        - "Int Mic"
> +
> +        # CODEC Pins
> +        - MIC1
> +        - MIC2
> +        - AXIL
> +        - AXIR
> +        - MONOIN_RXN
> +        - MONOIN_RXP
> +        - DMIC
> +        - MIC Bias1
> +        - MIC Bias2
> +        - MONO_IN
> +        - AUXO1
> +        - AUXO2
> +        - SPOL
> +        - SPOR
> +        - HPOL
> +        - HPOR
> +        - MONO
> +
> +required:
> +  - nvidia,i2s-controller
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra30-car.h>
> +    #include <dt-bindings/soc/tegra-pmc.h>
> +    sound {
> +        compatible = "asus,tegra-audio-rt5631-tf700t",
> +                     "nvidia,tegra-audio-rt5631";
> +        nvidia,model = "Asus Transformer Infinity TF700T RT5631";
> +
> +        nvidia,audio-routing =
> +                "Headphone Jack", "HPOL",
> +                "Headphone Jack", "HPOR",
> +                "Int Spk", "SPOL",
> +                "Int Spk", "SPOR",
> +                "MIC1", "MIC Bias1",
> +                "MIC Bias1", "Mic Jack",
> +                "DMIC", "Int Mic";
> +
> +        nvidia,i2s-controller = <&tegra_i2s1>;
> +        nvidia,audio-codec = <&rt5631>;
> +
> +        clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
> +                 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
> +                 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
> +        clock-names = "pll_a", "pll_a_out0", "mclk";
> +    };
> -- 
> 2.37.2
> 
