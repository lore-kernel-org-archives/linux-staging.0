Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DF317F
	for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 12:56:06 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id i14-20020a9d624e0000b029033683c71999so900282otk.5
        for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 05:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=WDr90ifdj3u4jYGhMgen8Q6MrQ4gfRqH3T4/ru0a4II=;
        b=SExc2JjnXpUXVyqvCiWUy8NRS/4jPLvwhVcG80hF9h6QJ8wedMC1zmM7URoOYpxj8y
         J8ZbY9w0aEY7nl1ig9xd71kHUFLGMbyDuT8xsQGelHUYnYAuGMaton+h0Go/sdb/LXy2
         qt+g9iAKx4NtVexYXH16IbH84VlbpqGvfJjmuhVlV0tL6yNQhoG6l4as27mABehnZqrK
         tt1i+lSD14E+bVd9FJXqHGYMjgyG2ja4+Pe5ISQsGUYSrgtgGNJLT/zCBo1kQM4qM1TY
         cZmbzTp43mXuhuk6rpMftFU6V/7lZAiiE0PJHAxuS0o6ZBWDn8tJKLqiuL1Fr1ere8Xg
         pz3w==
X-Gm-Message-State: AOAM532oBCaUqMZB+x8YFfj1oLDLC43aUYaAkwAeYXXyWUd+C8rSSE+l
	PtkCPH2v6y6vQvv+5ZYcytvEdfZ3Mw==
X-Google-Smtp-Source: ABdhPJy3kdIks/OI8CbwKalMBM56yICQjALGsg75Oj3b8ExULJoXEYRQiX3P5w2JcRHh7aqnH9h4qQ==
X-Received: by 2002:a9d:6d04:: with SMTP id o4mr2124928otp.57.1622033766082;
        Wed, 26 May 2021 05:56:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x65sm4410986otb.59.2021.05.26.05.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:56:05 -0700 (PDT)
Received: (nullmailer pid 2377033 invoked by uid 1000);
	Wed, 26 May 2021 12:56:03 -0000
From: Rob Herring <robh@kernel.org>
To: Alex Bee <knaerzche@gmail.com>
Cc: linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ezequiel Garcia <ezequiel@collabora.com>, linux-rockchip@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-staging@lists.linux.dev, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
In-Reply-To: <20210525152225.154302-9-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com> <20210525152225.154302-9-knaerzche@gmail.com>
Subject: Re: [PATCH 08/10] media: dt-bindings: media: rockchip-vpu: add new compatibles
Date: Wed, 26 May 2021 07:56:03 -0500
Message-Id: <1622033763.765019.2377032.nullmailer@robh.at.kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

On Tue, 25 May 2021 17:22:23 +0200, Alex Bee wrote:
> Add compatibles for RK3036, RK3066, RK3188 and RK3228. Also reflect the
> changes to the additional clocks for RK3066/RK3188.
> 
> Checked with:
> make ARCH=arm dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
>  .../bindings/media/rockchip-vpu.yaml          | 33 ++++++++++++++-----
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/rockchip-vpu.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/rockchip-vpu.yaml:26:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/rockchip-vpu.yaml:29:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/rockchip-vpu.yaml:54:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/rockchip-vpu.yaml:57:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1483524

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

