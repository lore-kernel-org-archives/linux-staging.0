Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E94210EA;
	Thu, 26 May 2022 01:46:46 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-f2cd424b9cso653072fac.7;
        Wed, 25 May 2022 18:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=6furrOjrDUV85XtAuBJ6m/tHv7Cr2IP2D70aDr3j5Hs=;
        b=4/1bIVxUYnz/gpkXFvZWP3bGy/nE3JrSb1p2r9ptMHyzFF0B6wdsk98QeicQR0oK8h
         +YS9lOvWKQo2zrvLZYWAvFBz/I9BMUTKHT6BUV4h9vB5I1tkiqRRDvyHPwM/pqjTdkh/
         UwKF3Qdqqx7F8tMGVqXM0naJOpp2FctJmLqczoToCaINHd0vJjr/bWlJ6yuJdBibRcqR
         ljZGWLmDKk3B7Kvw9DcjCmu8oKHQ8tveaupFzQV2uHqkKha0bMIsSRFjv7bFwsQHHwLR
         PemksWjhradzV+QTCXIZeFvE7fSIOqZr+COu0+hd5aFtlUy6FA451HBTHt8+bhjshfhg
         xGvA==
X-Gm-Message-State: AOAM533hSVTMfekujNtVoxhw5qv9lYa0YtC/Ey/oKzRIzSYJCeqn2AaF
	u/pcGVHYw524QNhG/qnyNA==
X-Google-Smtp-Source: ABdhPJw0MqIKEAYGSj8vFkwsSBLltgN0uJecV7/4E3iNGQwDikRJ1m1S3Ib8YDRu6U6xOvZfW4rMOA==
X-Received: by 2002:a05:6870:b609:b0:f2:74e7:9bf1 with SMTP id cm9-20020a056870b60900b000f274e79bf1mr4887oab.141.1653529605213;
        Wed, 25 May 2022 18:46:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y5-20020a4ad645000000b0040e5ff4a737sm141390oos.26.2022.05.25.18.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 18:46:44 -0700 (PDT)
Received: (nullmailer pid 2880899 invoked by uid 1000);
	Thu, 26 May 2022 01:46:43 -0000
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
In-Reply-To: <20220525191026.696636-2-paul.kocialkowski@bootlin.com>
References: <20220525191026.696636-1-paul.kocialkowski@bootlin.com> <20220525191026.696636-2-paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: media: Add Allwinner A31 ISP bindings documentation
Date: Wed, 25 May 2022 20:46:43 -0500
Message-Id: <1653529603.421651.2880898.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

On Wed, 25 May 2022 21:10:21 +0200, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the Allwinner A31 Image
> Signal Processor (ISP).
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../media/allwinner,sun6i-a31-isp.yaml        | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml:53:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml:55:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

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

