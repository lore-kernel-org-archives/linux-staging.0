Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42E1168
	for <linux-staging@lists.linux.dev>; Thu,  1 Jul 2021 14:03:02 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id f21so7574598ioh.13
        for <linux-staging@lists.linux.dev>; Thu, 01 Jul 2021 07:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=UcGsYoboToTMhhq99sLHVgR7kDyS6L2KqvCfhnRDDM0=;
        b=JMDfOPIKKueHooSVaux5uzzgfuV95wPY1gb4qeanvYia1bk5MFEA/7wTsuKtBPcyWG
         zDXf5P8HpHVqZQgf10lhZTLIFliiNgN3IfqmZHHS601BtXOyUIqUmjLkQ7XN/qAbYf6h
         +of0a/6vNoCMPDWD0Iu4XhIUUnqlhU7Pa8MK4ehYnclgtPhvuocmyVH1QKAde+EySOFF
         EmbL6dFPmbk2MzGQxoj5DusktJBo80c302zIFtvK6xf1IHy1Q/21ZyB4NMlZ+aXW5kCT
         BsPkBoa4kq/ikmY82YlEr7d1e81vXJBuFiYcTNJCix3/eUyHBE+gE9+lHNTdU7+KRg8l
         gt5g==
X-Gm-Message-State: AOAM5327pCUSSTiQJ+MThEklcoe442CN8HsboYMn8IXdp3QzLky9a9z2
	2Udl6acRbkYRPnP2u3m0ew==
X-Google-Smtp-Source: ABdhPJxJk5BSMp+3ZujDe2uG20xKYmB9NoQEedsUGUAOdURlUY0ojNyY+yn9NBjzeaJ+CB+8MsHFvQ==
X-Received: by 2002:a02:380c:: with SMTP id b12mr64155jaa.98.1625148180433;
        Thu, 01 Jul 2021 07:03:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id s9sm32255ilt.44.2021.07.01.07.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:02:59 -0700 (PDT)
Received: (nullmailer pid 2278700 invoked by uid 1000);
	Thu, 01 Jul 2021 14:02:43 -0000
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Axel Lin <axel.lin@ingics.com>, devicetree@vger.kernel.org, mauro.chehab@huawei.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linuxarm@huawei.com
In-Reply-To: <8d871e2ccc544d11959c16d8312dbf03dd01b1c8.1624962269.git.mchehab+huawei@kernel.org>
References: <cover.1624962269.git.mchehab+huawei@kernel.org> <8d871e2ccc544d11959c16d8312dbf03dd01b1c8.1624962269.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH v10 3/5] mfd: hi6421-spmi-pmic: move driver from staging
Date: Thu, 01 Jul 2021 08:02:43 -0600
Message-Id: <1625148163.537612.2278699.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

On Tue, 29 Jun 2021 12:31:29 +0200, Mauro Carvalho Chehab wrote:
> This driver is ready for mainstream. So, move it out of staging.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 134 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  drivers/mfd/Kconfig                           |  16 +++
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/hi6421-spmi-pmic.c                |  66 +++++++++
>  drivers/staging/Kconfig                       |   2 -
>  drivers/staging/Makefile                      |   1 -
>  drivers/staging/hikey9xx/Kconfig              |  19 ---
>  drivers/staging/hikey9xx/Makefile             |   3 -
>  drivers/staging/hikey9xx/TODO                 |   5 -
>  drivers/staging/hikey9xx/hi6421-spmi-pmic.c   |  66 ---------
>  .../hikey9xx/hisilicon,hi6421-spmi-pmic.yaml  | 134 ------------------
>  12 files changed, 224 insertions(+), 230 deletions(-)
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

See https://patchwork.ozlabs.org/patch/1498291

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

