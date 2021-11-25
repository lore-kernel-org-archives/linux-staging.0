Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1334472
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 21:26:05 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id o4so14893884oia.10
        for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 13:26:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=4t8ocAbb9RSagDUoAU33jv1dklB0bRzIRuKEQG6jgJE=;
        b=omtpW364IkUeHKQWLjE3K9ElxX7Y0hfAgQZFOc5I9pCpzE5wDzsjI1q/4hCCUUVGFe
         Y2gzpcak6zJy7igUM+wdb+lNBnEfaXzEvJNcoOBJ9utAriickxHw3dg7ulqbYZej1cus
         s5XjuOOY41GG0g5QeAiA3+lCE76ga7BvWjsb9FsmS6SeC1zfRbKOMErdnEkdaAq+d9Or
         UDNp4su0fwty+fQu8+hpzFvDkIqzxGCsrOVYvpB/nj214/d598FUVCM62MjC0Bhl4RBt
         XyNyfyngibx+RJAjGEOx05UiJJ1Dhl7dNYDpOGROyqnnf0Abf0quJOdwtXN5mD9rShum
         w/ng==
X-Gm-Message-State: AOAM533o92S1Wh1KROUGQKbaHGuZk+qOOKm5pQci7KxPrOgm4DZAC9tI
	WJNYXUjUvyy5uX+ccAUeyw==
X-Google-Smtp-Source: ABdhPJx4vDUvwnCthNffPUNKpAhfHsE4MMgasd0FAy5ggI+9jiyrNxdsNn69r11sgn5fQ53/Iy64ug==
X-Received: by 2002:a05:6808:d1:: with SMTP id t17mr18565416oic.161.1637875565229;
        Thu, 25 Nov 2021 13:26:05 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id bg38sm946554oib.40.2021.11.25.13.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:26:04 -0800 (PST)
Received: (nullmailer pid 2858304 invoked by uid 1000);
	Thu, 25 Nov 2021 21:26:02 -0000
From: Rob Herring <robh@kernel.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20211124084620.628-3-caihuoqing@baidu.com>
References: <20211124084620.628-1-caihuoqing@baidu.com> <20211124084620.628-3-caihuoqing@baidu.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: staging: Add the binding documentation for ZHOUYI AI accelerator
Date: Thu, 25 Nov 2021 14:26:02 -0700
Message-Id: <1637875562.214167.2858303.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

On Wed, 24 Nov 2021 16:46:16 +0800, Cai Huoqing wrote:
> ZHOUYI NPU is an AI accelerator chip which is integrated into ARM SOC,
> such as Allwinner R329 SOC.
> Add the binding documentation for ZHOUYI AI accelerator.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  .../bindings/staging/arm,zynpu.yaml           | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/staging/arm,zynpu.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/staging/arm,zynpu.example.dts:23.28-32.15: Warning (unit_address_format): /example-0/soc/zynpu@03050000: unit name should not have leading 0s

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1558953

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

