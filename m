Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D91FA7
	for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 16:34:39 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id y2so11533158ily.5
        for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 08:34:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YUQ13UNlMnnU+RdBOzrUXm3dMsngq/6hNGyj9q9MZiw=;
        b=upJb1C2aserzFh/CXWOxbXO74iUVhAyqkQTDbaPPsR/5Pzr/44+lzNIxMlO9SXdq4e
         hrwmwc1ydqmQZXnSxKDB6UyCpiTMYf9FQ10GLRNJHeWtTSfEgvGlPv9aQDTSVQ4rGUE8
         BNJuMMVNdeV/6PxE5vO8YvlwDJSKRLgN6lpPnizuaqdm2atQibIqxNuKDYYmsHXTVs/U
         HG4lGGhcjkjkG2k0/+c4/kc4hreNYXMf6Mp/pZJxsNMxv41AIZ7Y0V024wQ3+Okke3mw
         M5xXzsvAAXdYPdBRMk2kzOGtI5hTeNK2c4x4w9JSi+YAAPGh0LIo3groy68FavYZFxp0
         LlVg==
X-Gm-Message-State: AFqh2kpqZnuBAa8xJyNHe4utJtxL+apdW6BTUf/68xCqnHSDdrkV5Lni
	/TnIosxzwPNIeESnl/g3jg==
X-Google-Smtp-Source: AMrXdXuqzf/p/KUX/Q6NKkpnki1GkGA1OTlRSftkvhspmWMJCquaB27tfx1TAffdn4xlh0Cred4a0g==
X-Received: by 2002:a92:504:0:b0:30c:323c:f7d1 with SMTP id q4-20020a920504000000b0030c323cf7d1mr1707763ile.15.1672418078764;
        Fri, 30 Dec 2022 08:34:38 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o3-20020a92c683000000b00302f7654187sm6670218ilg.72.2022.12.30.08.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:34:38 -0800 (PST)
Received: (nullmailer pid 1935053 invoked by uid 1000);
	Fri, 30 Dec 2022 16:34:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sowjanya Komatineni <skomatineni@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Richard Leitner <richard.leitner@skidata.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-staging@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>, Dmitry Osipenko <digetx@gmail.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20221229133205.981397-3-luca.ceresoli@bootlin.com>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
 <20221229133205.981397-3-luca.ceresoli@bootlin.com>
Message-Id: <167241769230.1925726.8527129486424295727.robh@kernel.org>
Subject: Re: [PATCH v3 02/21] dt-bindings: display: tegra: vi: add 'vip'
 property and example
Date: Fri, 30 Dec 2022 10:34:28 -0600


On Thu, 29 Dec 2022 14:31:46 +0100, Luca Ceresoli wrote:
> The Tegra20 VI peripheral can receive parallel input from the VIP parallel
> input module. Add it to the allowed properties and augment the existing
> nvidia,tegra20-vi example to show a 'vip' property.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v3 (suggested by Rob Herring):
>  - drop 'endpoint', unneeded as there's no extra properties in the
>    endpoints
> 
> Changed in v2 (suggested by Krzysztof Kozlowski):
>  - rename "i2c3" -> "ic2"
>  - add review tag
> ---
>  .../display/tegra/nvidia,tegra20-vi.yaml      | 64 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 65 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.example.dtb: vi@54080000: vip: Unevaluated properties are not allowed ('channel@0' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.example.dtb: vi@54080000: vip: 'ports' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.example.dtb: vip: Unevaluated properties are not allowed ('channel@0' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.example.dtb: vip: 'ports' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221229133205.981397-3-luca.ceresoli@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

