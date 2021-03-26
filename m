Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF2070
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 21:14:18 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id y17so6166632ila.6
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 14:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p5p8NGReQEBGHa/zB+g9T8XDzJGvpG2p40Wi1X/7yZc=;
        b=eJbFg55h6o8u81nUIM54ePHlYco3Ke8klZC/ccliYPkGmM/iFyj3SrfMjMh7N1ldqp
         d4Oc8My/8L2oIWowOHeZZYFRm62ZwKTlOSL0VQPXESsoyHBNGzmWriBHDrLsER8Vln95
         Uvk+H2WI5tMDnQs4Tdlg7Rd3YI5fkl/Ked3b1pgE/SaXVcZVwmIwbTJ0AXxGyY6vj2Nv
         lR+ajcDCrI0CU5E1r5FJbri3gFsdPyMu6GCkVvwQ17NDcWYCc8S3jX77dAh9514zLz52
         +Abu/h2jxp10PZYhccC8ogJDTpqCylRBlTVLqDy//z8IWL+2izd52NDsiNnqiveZwh4V
         CFRA==
X-Gm-Message-State: AOAM532f8twyBnq6Oqr/ocIdAbn0U17uHTNZOeD4LuT8wUfHr2leWEb+
	c5FduFWT7DLyxLckctewqQ==
X-Google-Smtp-Source: ABdhPJxKyA7A2t6fNdltfGVqtSFmhB2VlJjmuIaVmZOryPpucEWapXabBay+wuooGHaBDd0+8v/sUQ==
X-Received: by 2002:a05:6e02:1541:: with SMTP id j1mr930938ilu.301.1616793257820;
        Fri, 26 Mar 2021 14:14:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id w9sm4953775iox.20.2021.03.26.14.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 14:14:17 -0700 (PDT)
Received: (nullmailer pid 3871506 invoked by uid 1000);
	Fri, 26 Mar 2021 21:14:16 -0000
Date: Fri, 26 Mar 2021 15:14:16 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 (RESEND) 3/7] spmi: hisi-spmi-controller: move driver
 from staging
Message-ID: <20210326211416.GA3867921@robh.at.kernel.org>
References: <cover.1616695231.git.mchehab+huawei@kernel.org>
 <697f26c380dc2c22c07bedc63a0eab8c9325fccc.1616695231.git.mchehab+huawei@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <697f26c380dc2c22c07bedc63a0eab8c9325fccc.1616695231.git.mchehab+huawei@kernel.org>

On Thu, Mar 25, 2021 at 07:05:35PM +0100, Mauro Carvalho Chehab wrote:
> The Hisilicon 6421v600 SPMI driver is ready for mainstream.
> 
> So, move it from staging.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../spmi/hisilicon,hisi-spmi-controller.yaml  |  71 ++++
>  MAINTAINERS                                   |   7 +
>  drivers/spmi/Kconfig                          |   9 +
>  drivers/spmi/Makefile                         |   1 +
>  drivers/spmi/hisi-spmi-controller.c           | 367 ++++++++++++++++++
>  drivers/staging/hikey9xx/Kconfig              |  11 -
>  drivers/staging/hikey9xx/Makefile             |   1 -
>  .../staging/hikey9xx/hisi-spmi-controller.c   | 367 ------------------
>  .../hisilicon,hisi-spmi-controller.yaml       |  71 ----
>  9 files changed, 455 insertions(+), 450 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
>  create mode 100644 drivers/spmi/hisi-spmi-controller.c
>  delete mode 100644 drivers/staging/hikey9xx/hisi-spmi-controller.c
>  delete mode 100644 drivers/staging/hikey9xx/hisilicon,hisi-spmi-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> new file mode 100644
> index 000000000000..6b755039a74c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/hisilicon,hisi-spmi-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HiSilicon SPMI controller
> +
> +maintainers:
> +  - Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> +
> +description: |
> +  The HiSilicon SPMI BUS controller is found on some Kirin-based designs.
> +  It is a MIPI System Power Management (SPMI) controller.
> +
> +  The PMIC part is provided by
> +  drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml.

Out of date at the end of this series.

Glad to see the person fixing all of these forgets too. ;)

Rob
