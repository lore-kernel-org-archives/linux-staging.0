Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B32533C0;
	Sat, 16 Apr 2022 22:17:41 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-df02f7e2c9so11014420fac.10;
        Sat, 16 Apr 2022 15:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=7dPcFs565C9c1WFXikvbzN8qlHn8qJL0dUAk+7Q/+p0=;
        b=I+3wwI14h4kzrKZM3h94d0NZ5lePwzG0xIRJbwdHEOsR3nQoRHNPtvI6XYnbQKVDb/
         Zf9U15Sug+iPqZWco6Nt7P0MnyB6RK/ARF02EV+7FIAI4OfJLDUp7kCPDqY727Y7rkLS
         1q8leWCvOOtb4qr0fq8RDaIhmn6XbLszHYieoxikTu5BkDCO26/Rt0Iw3TV4TBMnv0tj
         /XM8StTSH6nTKuuzxiZ1jDBiYmZEwynRr4BMXC5V69Guh0oibkK0or12TAPIWDENMVJO
         JcoHlVaRelv0s6AvkeCVwHH0cQL/fuil/Z43+apVpmwrBPFQhytni7TVlI7ZF4Q7c7ul
         FyRA==
X-Gm-Message-State: AOAM533G17wnjqDidvphrXZq6aJO1sRIJrc7hKtt/VNd21FekIiFltXx
	MqSjLuqC7VnD1UAMq95jMg==
X-Google-Smtp-Source: ABdhPJzcOBOFLYRBnjRkFKYm36bRA1+9aCycXC6AAhf5bxP7oOLONMn2t+h7bqsghdRFSNm7zPU0jg==
X-Received: by 2002:a05:6871:58c:b0:e3:25e9:6792 with SMTP id u12-20020a056871058c00b000e325e96792mr3791936oan.147.1650147460477;
        Sat, 16 Apr 2022 15:17:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id os2-20020a0568707d0200b000e42ef7cff2sm2727982oab.43.2022.04.16.15.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 15:17:40 -0700 (PDT)
Received: (nullmailer pid 3544946 invoked by uid 1000);
	Sat, 16 Apr 2022 22:17:39 -0000
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>
In-Reply-To: <20220415153708.637804-2-paul.kocialkowski@bootlin.com>
References: <20220415153708.637804-1-paul.kocialkowski@bootlin.com> <20220415153708.637804-2-paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: media: Add Allwinner A31 ISP bindings documentation
Date: Sat, 16 Apr 2022 17:17:39 -0500
Message-Id: <1650147459.143664.3544945.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

On Fri, 15 Apr 2022 17:37:05 +0200, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the Allwinner A31 Image
> Signal Processor (ISP).
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../media/allwinner,sun6i-a31-isp.yaml        | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml:73:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml:75:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

