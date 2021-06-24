Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF1470
	for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 15:26:58 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id k11so8715995ioa.5
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 08:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Lpd5za3dZjGLZkNK8IONDaXRQC0MpG6W9WKoTOpJEic=;
        b=io2JcmvJTfVx3nLQ8v2lq/nH9Mcvj9LaB6sMLrfbdYGuTKGFj3pNgTWritxxbGqwUU
         h3gR3mo3fJtgacZ6NverrAnopb/qkZjZ4cA48Pr+Zr/rvFFfZrTwUQ2aPXYKw+Y4PaHZ
         /m9eYYJEd6ogGL1uAlKlmzUaooDBoHxphjaoyxgtlt3CEgUMEv6++HtjY78olLGYU7Vc
         xUP7gVi5z6P4Uz+DxpyyEWmV8yAm6uKEuKTwwrc3dWfX8RtgFP87Hk3lmqWfQJVNkQNa
         W3WU+3c+z8E9eIywXPPZVRakMQ9+vHlurAja/z19eYvQIRpRb8XtP7WSrQLV1+iD3END
         J5Yw==
X-Gm-Message-State: AOAM531bpTWWkDLxPagzun/+d/1ni6u/5zmG15hIxmeUQ0ZQQ+QOe4JC
	eltjpKCurJl1GSv+YHvs3A==
X-Google-Smtp-Source: ABdhPJzNvu/L2aSmJ8pUz8GEkVdEXFN/A4t8nbnJmWO27uA5Fk9oHVl3KzTts6kq5N/hOHu6M5y6ow==
X-Received: by 2002:a02:600b:: with SMTP id i11mr5319850jac.86.1624548418226;
        Thu, 24 Jun 2021 08:26:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r6sm1398859ioh.27.2021.06.24.08.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 08:26:57 -0700 (PDT)
Received: (nullmailer pid 1393286 invoked by uid 1000);
	Thu, 24 Jun 2021 15:26:48 -0000
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linuxarm@huawei.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mauro.chehab@huawei.com, Rob Herring <robh+dt@kernel.org>, linux-staging@lists.linux.dev
In-Reply-To: <1ad2cbbd182d18ba2cae716fb5f1497b1cabbdbe.1624525118.git.mchehab+huawei@kernel.org>
References: <cover.1624525118.git.mchehab+huawei@kernel.org> <1ad2cbbd182d18ba2cae716fb5f1497b1cabbdbe.1624525118.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH RESEND v6 6/8] mfd: hi6421-spmi-pmic: move driver from staging
Date: Thu, 24 Jun 2021 09:26:48 -0600
Message-Id: <1624548408.771970.1393285.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

On Thu, 24 Jun 2021 11:01:10 +0200, Mauro Carvalho Chehab wrote:
> This driver is ready for mainstream. So, move it out of staging.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 134 ++++++++
>  MAINTAINERS                                   |   7 +
>  drivers/mfd/Kconfig                           |  16 +
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/hi6421-spmi-pmic.c                | 316 ++++++++++++++++++
>  drivers/staging/Kconfig                       |   2 -
>  drivers/staging/Makefile                      |   1 -
>  drivers/staging/hikey9xx/Kconfig              |  19 --
>  drivers/staging/hikey9xx/Makefile             |   3 -
>  drivers/staging/hikey9xx/TODO                 |   5 -
>  drivers/staging/hikey9xx/hi6421-spmi-pmic.c   | 316 ------------------
>  .../hikey9xx/hisilicon,hi6421-spmi-pmic.yaml  | 134 --------
>  12 files changed, 474 insertions(+), 480 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
>  create mode 100644 drivers/mfd/hi6421-spmi-pmic.c
>  delete mode 100644 drivers/staging/hikey9xx/Kconfig
>  delete mode 100644 drivers/staging/hikey9xx/Makefile
>  delete mode 100644 drivers/staging/hikey9xx/TODO
>  delete mode 100644 drivers/staging/hikey9xx/hi6421-spmi-pmic.c
>  delete mode 100644 drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dt.yaml:0:0: /example-0/pmic@0: failed to match any schema with compatible: ['hisilicon,hi6421-spmi']
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1496456

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

