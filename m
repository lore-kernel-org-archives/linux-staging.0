Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC55FD536;
	Thu,  5 Jan 2023 16:18:06 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so1693674wma.1;
        Thu, 05 Jan 2023 08:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qg9Z/ezQ2VP1OzBT9xNik8ur6PBM8ZeCnIkxjvkNCdA=;
        b=ZVjIz5m0hX8PlIXMGahJ6x/Csgadc5GJ9Zd+rVumUwtBq99GX7dkkYFL7AZQF1oj9T
         y5ICbFMI9cC6zeXuhiqA9Sacw3BcWcoDBtJ5ON/+Eo5Jq9Vsl4zsRz3qwg3CmjEW2e4w
         W0+bhDkAhXoq22eOKduRjSnsct8jj+IZuszeti+y2cFQnnrmg1tG82ezdd2P0oKcxWXJ
         vFQ6FOezDrkrdLRGk/ZHZLkFZad+7zFnZjbvNVriYgMzTBayde0OMF0UDmoCzDMHrLsc
         O5SkLRr5FLGl+wYpoCxFP5t2txoq+xnRzk4UCXCmxvGjpr4IF7kSWqsFGv4VRXabVJqt
         poBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qg9Z/ezQ2VP1OzBT9xNik8ur6PBM8ZeCnIkxjvkNCdA=;
        b=HOnPB6C9CVH/Mn4LxgZaNf+zPT0VoZyY3EZnclBV1qLaBzw7m7Ym+YEU9KN3biXEvt
         BQr7q/uUxbL11hexItrxecP9lrgCloS904tmeAabV3P6pzEtgSbkas8dq7pbnRzRCWd7
         b3UGIsbdd3d39AnviIw3pNcv8gkL1SIX1T2vGA6gY7ZzVewNaQ8o+t8Haa4A/uUUeMH6
         IJ5KjjKDXz2VCXhMN2vrvWqERdaI4//OuhvCHD9VxOxU7Xji5zuRsPlNNvjW+Yeo3ki2
         lWr0+0zsYf/TRlEeuhonM+xLgMBkmY16lJKsSbGK+o61hEL5HeSu+SZtaO7Ap2RU5YwN
         Douw==
X-Gm-Message-State: AFqh2koqp2oudz9SYd2XnrDLdkr+2ewqHY0Xxpw6vMAaZSdhFV1UDKf+
	mbonln06cFHqnfLYuh8jygY=
X-Google-Smtp-Source: AMrXdXvGqO38SjpeDx+nQ5mO3gltv5DwVHr3T+e4+/rn3MECG1cCKPkwM5HXIKyWHVlh4HQG9zupiA==
X-Received: by 2002:a05:600c:4e13:b0:3c6:e63d:fcfc with SMTP id b19-20020a05600c4e1300b003c6e63dfcfcmr36682966wmq.35.1672935484869;
        Thu, 05 Jan 2023 08:18:04 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id he11-20020a05600c540b00b003d359aa353csm2779923wmb.45.2023.01.05.08.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:18:04 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 1/4] media: dt-bindings: cedrus: Allow power domain references
Date: Thu, 05 Jan 2023 17:18:02 +0100
Message-ID: <5891785.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20221231164628.19688-2-samuel@sholland.org>
References:
 <20221231164628.19688-1-samuel@sholland.org>
 <20221231164628.19688-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 31. december 2022 ob 17:46:24 CET je Samuel Holland napisal(a):
> The Allwinner D1 SoC contains a separate power domain for its video
> engine, controlled via the "PPU" power controller. Allow the
> power-domains property so this can be represented in the devicetree.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../bindings/media/allwinner,sun4i-a10-video-engine.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.
> yaml
> b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.
> yaml index 541325f900a1..d5be7f604e8c 100644
> ---
> a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.
> yaml +++
> b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.
> yaml @@ -63,6 +63,9 @@ properties:
>        CMA pool to use for buffers allocation instead of the default
>        CMA pool.
> 
> +  power-domains:
> +    maxItems: 1

Please add check if it's needed based on compatible. This yaml is one of the 
few for sunxi platform which doesn't have strict checks. Same goes for sram 
property.

Best regards,
Jernej

> +
>  required:
>    - compatible
>    - reg




