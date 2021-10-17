Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC0C2C81
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 15:29:35 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id e59-20020a9d01c1000000b00552c91a99f7so809348ote.6
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 08:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=93fgBEU/HvblzqNVZvyNUvoGq19PcRTJNaML6VONTnE=;
        b=3kIN1WCcd7Kqd8l3/zc6sg8me7Rs8esI6lCOonnBHf9Ybi5qAz0zlV/VQt6wKWpW0e
         Ep23Ndx7JzogCZE8bO+hNO86MhPlFrN4exyT99imeM3u9olb5l6eNkgU2YSRPYwCR2c6
         XSbIUuMGfBCpgfU/UbHPYeCcmdnSxdOVr1tinky9iGKA3fo86vfuEITnTXRI2ZrBA3MN
         2Sf9ZGzGKxZkv22RXdwqDNalcgzLv3i5UFYoJhtglVrJwb7wK6NJhgE2rLPY3x3HHjQv
         3rkf5LMtZF1KsEhyFV9M+v+SoPJVH6y74DaSmqsIjYzwEuKX2+WnKgd3B2/TlbCsClgX
         M4Lw==
X-Gm-Message-State: AOAM5312yQe2fByJjKFD8uaUWXcsksaNkyQjS6PV0kgGBhLR4wpuBuiR
	9gOMK2lquYqBsvQ0DjNRmw==
X-Google-Smtp-Source: ABdhPJz1KZdo3L9besg6qw/okXJV8OoUe6DBoYrOkDOws9pZmjTrQrNfA24ND+KVBg6VFk/rpQh1wA==
X-Received: by 2002:a05:6830:2151:: with SMTP id r17mr18109116otd.141.1634484574539;
        Sun, 17 Oct 2021 08:29:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bo38sm1706904oib.13.2021.10.17.08.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 08:29:33 -0700 (PDT)
Received: (nullmailer pid 60705 invoked by uid 1000);
	Sun, 17 Oct 2021 15:29:30 -0000
From: Rob Herring <robh@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Ojaswin Mujoo <ojaswin98@gmail.com>, Mwesigwa Guma <mguma@redhat.com>, linux-staging@lists.linux.dev, Scott Branden <sbranden@broadcom.com>, linux-arm-kernel@lists.infradead.org, Ray Jui <rjui@broadcom.com>, devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <1634475996-6809-3-git-send-email-stefan.wahren@i2se.com>
References: <1634475996-6809-1-git-send-email-stefan.wahren@i2se.com> <1634475996-6809-3-git-send-email-stefan.wahren@i2se.com>
Subject: Re: [PATCH 2/2] dt-bindings: soc: bcm: Convert brcm,bcm2835-vchiq to json-schema
Date: Sun, 17 Oct 2021 10:29:30 -0500
Message-Id: <1634484570.846584.60704.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

On Sun, 17 Oct 2021 15:06:36 +0200, Stefan Wahren wrote:
> This converts the VCHIQ bindings to YAML format.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  .../bindings/soc/bcm/brcm,bcm2835-vchiq.txt        | 17 --------
>  .../bindings/soc/bcm/brcm,bcm2835-vchiq.yaml       | 47 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1542230


mailbox@7e00b840: compatible: Additional items are not allowed ('brcm,bcm2835-vchiq' was unexpected)
	arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dt.yaml
	arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dt.yaml
	arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dt.yaml
	arch/arm64/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dt.yaml
	arch/arm/boot/dts/bcm2836-rpi-2-b.dt.yaml
	arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dt.yaml
	arch/arm/boot/dts/bcm2837-rpi-3-b.dt.yaml
	arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dt.yaml
	arch/arm/boot/dts/bcm2837-rpi-cm3-io3.dt.yaml

mailbox@7e00b840: compatible: ['brcm,bcm2836-vchiq', 'brcm,bcm2835-vchiq'] is too long
	arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dt.yaml
	arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dt.yaml
	arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dt.yaml
	arch/arm64/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dt.yaml
	arch/arm/boot/dts/bcm2836-rpi-2-b.dt.yaml
	arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dt.yaml
	arch/arm/boot/dts/bcm2837-rpi-3-b.dt.yaml
	arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dt.yaml
	arch/arm/boot/dts/bcm2837-rpi-cm3-io3.dt.yaml

