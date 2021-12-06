Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C962CA6
	for <linux-staging@lists.linux.dev>; Mon,  6 Dec 2021 14:25:25 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id u74so21663686oie.8
        for <linux-staging@lists.linux.dev>; Mon, 06 Dec 2021 06:25:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=1UM6mk2YqDOCPpxKmVW4hUay67A5ShMZFccLmrgtyws=;
        b=si9mRqX6GcMg6nF4CHNEABt2FhFfPeMQJC/Okpo56bj7JCPcEF/F9QtcQf1lh6Qv8B
         VRTnZ4zg+oocEYEbxw3AEdKgZzkyd7ejP6rPZ6jJ7b1cc7klM8ObsYo7mdXZAqJJTN9n
         emPIKyGD9FuOl61qu+dzAdYwRusO66k2OtYnFh36wtYCPMQbNLkXDsgngUgMfzvjK2M6
         3Q0pfiFsdvd5kkQxJ8epHkx/fxrZnTzLc7nd2o1bxugYlYsxLTKVd0EvYmpHKxIAogep
         L0KZUGrQfVgAm4gos65bLA7Sh2JbVXCVTs29iqcm9kq6f8KAZrg5w6UBr/8uTdeUzSrX
         zj2g==
X-Gm-Message-State: AOAM530ixPBYNWk0ty5Y/7tPTgyu4uObmopAcLSy78fQCWwFEpb1Uja4
	NLjRAK9XmYWCfB9oA2Fe+A==
X-Google-Smtp-Source: ABdhPJwHh7iLhlSQhwyOIjqD6otmwOl55D4ggjQJihayjKesYaNOleTLyfqMib/TY7E6KZA+XSLjEA==
X-Received: by 2002:aca:1c02:: with SMTP id c2mr24930352oic.53.1638800724490;
        Mon, 06 Dec 2021 06:25:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x12sm2181654oom.44.2021.12.06.06.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 06:25:23 -0800 (PST)
Received: (nullmailer pid 1976291 invoked by uid 1000);
	Mon, 06 Dec 2021 14:25:22 -0000
From: Rob Herring <robh@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, benjamin.gaignard@collabora.com, cphealy@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>, linux-staging@lists.linux.dev, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nicolas@ndufresne.ca, Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20211205181618.1041699-3-aford173@gmail.com>
References: <20211205181618.1041699-1-aford173@gmail.com> <20211205181618.1041699-3-aford173@gmail.com>
Subject: Re: [RFC 2/5] dt-bindings: soc: add binding for i.MX8MQ VPU blk-ctrl
Date: Mon, 06 Dec 2021 08:25:22 -0600
Message-Id: <1638800722.475991.1976290.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

On Sun, 05 Dec 2021 12:16:15 -0600, Adam Ford wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> This adds the DT binding for the i.MX8MQ VPU blk-ctrl.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  .../soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml      | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.example.dt.yaml: blk-ctrl@38320000: compatible: ['fsl,imx8mq-vpu-blk-ctrl', 'syscon'] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.example.dt.yaml: blk-ctrl@38320000: compatible: Additional items are not allowed ('syscon' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1563759

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

