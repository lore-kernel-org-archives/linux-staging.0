Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8362FAD
	for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 12:56:09 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id v13-20020a4aa40d0000b02902052145a469so262450ool.3
        for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 05:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=5TB/SHe/X+zDtrYw2YxYbY1YRqVP38bTz1Qf4xf36SM=;
        b=JIQ20LaFFM+HuUE6jeIYoUuvRvB551KDoPopAQnZIijUa9UvPyaVns7ZV49Y0JaG6T
         e2TQKWdWf8qEFYTAh4ZLXszJkNK08RHoQPcYpjwUNg3V8rlEXl7N3WN/Cge2RKdVSov/
         8+PPm07BaEOe3nuq8kQQFl8QBPoy2C2cGnASfWfN5ZUsuwbi/yoa2C8aMJQwo3WkjVCU
         rdyxA5DxSKm5XLJYSHWPis6a4BLpReiXzQCQU5BGYjUZNhb18gM7mBITzF+cIb04b//3
         3pXzm6jIyU5PcHihoe2GP9+MUD61Zxqm/8rqOO6jy4HyhDYb51waETi279ia8IsZEA3X
         dMIA==
X-Gm-Message-State: AOAM533jZMv03vZ2OGFDM9gwRQrZUiz1l515a+ciC4rTrMH4K9n2ZeUI
	dTGNKdVDO6jPS/Tt5A5EOA==
X-Google-Smtp-Source: ABdhPJx/wh7g4D4CYGH7ibtdrflqxgEzKG7CJwLQ7CT974mn8HeUIO7mDRBNtkrVn8LgAfyQ54eYqg==
X-Received: by 2002:a4a:e715:: with SMTP id y21mr2171382oou.54.1622033769085;
        Wed, 26 May 2021 05:56:09 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b19sm3716364oib.46.2021.05.26.05.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:56:07 -0700 (PDT)
Received: (nullmailer pid 2377037 invoked by uid 1000);
	Wed, 26 May 2021 12:56:03 -0000
From: Rob Herring <robh@kernel.org>
To: Alex Bee <knaerzche@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, Ezequiel Garcia <ezequiel@collabora.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-staging@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>
In-Reply-To: <20210525152225.154302-11-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com> <20210525152225.154302-11-knaerzche@gmail.com>
Subject: Re: [PATCH 10/10] media: dt-bindings: media: rockchip-vdec: add RK3228 compatible
Date: Wed, 26 May 2021 07:56:03 -0500
Message-Id: <1622033763.779031.2377036.nullmailer@robh.at.kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

On Tue, 25 May 2021 17:22:25 +0200, Alex Bee wrote:
> Document the RK3228 compatible for rockchip-vdec.
> Also add the optional assigned-clocks and assigned-clock-rates
> properties.
> 
> Checked with:
> make ARCH=arm dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
>  .../devicetree/bindings/media/rockchip,vdec.yaml       | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/rockchip,vdec.yaml:21:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1483527

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

