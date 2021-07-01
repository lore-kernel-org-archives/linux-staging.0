Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF7D29D6
	for <linux-staging@lists.linux.dev>; Thu,  1 Jul 2021 14:03:11 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id 3so6484591ilj.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Jul 2021 07:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=VRXNiq96Mf6FxPX7Y/PomxvV3ZtFTsWrlFbJZRhnpHI=;
        b=K27vTgPE9ZPqCxNeiQ7xwAfhId05zjttuXaNYrIM1n0OSdeFs4Qt5iLNUCUJ/X/mlt
         Gg9oNxOHPLIpu+UDJk6xOnLFWIpJsEeWQiCECy6kVG64ItFcb44gifY20TF4E+oxoHu6
         93htaJVC85MPUG2torLA+w0I0AQpynGFjQNIjj+jsrOeBaW1SidcDUOZ2p2zZhc/h5XH
         ljNamH05jzBy/0XnP9Rrd00lqiV9tczAeMywb0d1iEVB0VC1zKZjVkM+xCd/GVCmaMjS
         MiNz/UWmGIwLbKTswGUk1/2SCgkoX+ZGm4MSx3sNvodT+6QDgZZwkfv3AvSVakPy84Wy
         lPrg==
X-Gm-Message-State: AOAM533Rhz7yU0ltOK+etMKBN7HkkYtQI1nG6P3KYHYJ/X7WAEBCUQ+V
	0sjOw40U6jqDwvVQDIaUJw==
X-Google-Smtp-Source: ABdhPJz11CrcTuArbwbsEd4i11UQNsajjU7M6YpaEEnrcFZED9/0iLNTEA/vVLbN74nS/cq2HnUyOA==
X-Received: by 2002:a92:6705:: with SMTP id b5mr29248288ilc.55.1625148190925;
        Thu, 01 Jul 2021 07:03:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a10sm10052933ioo.9.2021.07.01.07.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:03:10 -0700 (PDT)
Received: (nullmailer pid 2278692 invoked by uid 1000);
	Thu, 01 Jul 2021 14:02:43 -0000
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>, linux-staging@lists.linux.dev, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, linuxarm@huawei.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mauro.chehab@huawei.com
In-Reply-To: <35b9f9169889c1f4d51eff8bf2035450c9e02576.1624606660.git.mchehab+huawei@kernel.org>
References: <cover.1624606660.git.mchehab+huawei@kernel.org> <35b9f9169889c1f4d51eff8bf2035450c9e02576.1624606660.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH v8 02/12] spmi: hisi-spmi-controller: move driver from staging
Date: Thu, 01 Jul 2021 08:02:43 -0600
Message-Id: <1625148163.497219.2278691.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

On Fri, 25 Jun 2021 09:45:54 +0200, Mauro Carvalho Chehab wrote:
> The Hisilicon 6421v600 SPMI driver is ready for mainstream.
> 
> So, move it from staging.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../spmi/hisilicon,hisi-spmi-controller.yaml  |  73 ++++
>  MAINTAINERS                                   |   7 +
>  drivers/spmi/Kconfig                          |   9 +
>  drivers/spmi/Makefile                         |   1 +
>  drivers/spmi/hisi-spmi-controller.c           | 367 ++++++++++++++++++
>  drivers/staging/hikey9xx/Kconfig              |  11 -
>  drivers/staging/hikey9xx/Makefile             |   1 -
>  .../staging/hikey9xx/hisi-spmi-controller.c   | 367 ------------------
>  .../hikey9xx/hisilicon,hi6421-spmi-pmic.yaml  |   2 +-
>  .../hisilicon,hisi-spmi-controller.yaml       |  73 ----
>  10 files changed, 458 insertions(+), 453 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
>  create mode 100644 drivers/spmi/hisi-spmi-controller.c
>  delete mode 100644 drivers/staging/hikey9xx/hisi-spmi-controller.c
>  delete mode 100644 drivers/staging/hikey9xx/hisilicon,hisi-spmi-controller.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:

\ndoc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml: Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml

See https://patchwork.ozlabs.org/patch/1496992

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

