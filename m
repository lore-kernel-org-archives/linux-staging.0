Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9A748EC7D
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 10:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887388; cv=none; b=Z5g0cZ2N9rVqumJKx6V63DqEIJiIkX8+MvjSpzTChsjLHG/uTXFWadyU2AwbzsofYj/GbB+Qke+3GeS7IekgsBa9E4go7B3Ud5DFh8zz9jExo55WNdY0g39NFa8r8IHV3SdLEAUvgfGz1R8uH3qGLvLmM3TD2Pe6ZPQxtNideB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887388; c=relaxed/simple;
	bh=km1G/HHhK4mc4byWSgOHYVTFBTlTfLPGrUqU5+gvS1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FcvNaYSiWp9AoHEVnNvkOQmknD/zDwmO0KeWJGtPsLocjXroPR1IxtUVSG2WNOSrOAbEPzK/cAE08baoT4Vij90KW6aP8FxHZ/vvqk6k5zJmgXujw5C7IysW1gGnF9wI0xxesPtWn/BCOiz2lO5AV/FstRLgvy5gTCZNSoIXqk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91b52ba422cso32857466d6.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 03:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887386; x=1792492186;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mGQ/GpRO6vnxq7fb84hh6aj2KXsZIXY1TgeovdND5Hc=;
        b=AVCef+YQP3emWpObqBRtCUntip6f+g4DwynYAp4uFkJ38E2DobEVqt3pvPXyW8cTLq
         ghNAlyabLOtRZmVyyYxRqcnKLPTFf/LAaTLVC6Y9TwtcNsd4cyOdN1kQeTVXveNiX5Og
         h9+/81aWZAYENThII6g97MZkYo1E8/a5aPIzCr63azSb+reU+CrpsZVuldbuj2tenhGI
         mToWG2j0AMUsGZdz5AwdG6EbZIyJwu3HPKmirnoRt6439SssNZmYI31qPyh/vueAMq69
         El/e7cThuHqV//DdXhMTPoGRks1+HIBDNOuDWX/1hOHs4v5pMQ+bTca0+m1tRM0RE1M/
         T4Xw==
X-Forwarded-Encrypted: i=1; AKwUvByMymsH9yJfOJymUZsD+fN4+yvqFR6f8j4amFpX1x/Qj8MDWAh55F4sgLrExSaJckw42Ms+5sowVDQr30yQ@lists.linux.dev
X-Gm-Message-State: AFq9FYLiBJdv7mllJ1xHXjce8+r7v8rUiZiuxrMJbzP9Mq2+BuyoOxNC
	TnJJLSlmomvRME637DDBqofipsoYvpWqeyzcSD1rR8gBIMg+nfCSrZvdbnbr/LAU
X-Gm-Gg: AYBFou2NHfe0vy+bFdyUCGHs+6BdPku+Y8XP+wgHuz5vMP1OgLkQ7/hdNvrEfs2qQtI
	flggSxZWIiRgw5HBQGUQN0bPUySio9m8X571WukOwIIPZbK0QenbgFE+gkmtN9AXHsjtjjJrBOX
	p+wXkqL8Hu6eVFzieo4lUHw8zt+vFoNAsz48rRXhHxPw03yRyzncPQP8lMC/aWWe4J0ujdYduIA
	fwZs1/l5mU0RXmCkIk/2IEYvv/88HYaKe8UG4oX7lRBxxpLyl8ONm0XYbEivQ6lnLR+9gncxang
	k6xbgv/kXm+hAi/C9opMJnbXDyGg+/8r0Y4DWmB3Ttw5AriwyT7ZnVaL7zxdCy+VbLMszToD48e
	zr9k//laxNY6JjPCbh4OFU8A+b+J3NYRnkSwtoc0tvmJvGQt5vTOM3aCPeIcojXaPNEcgyuEmRq
	ybWsDGyVV35kOFg5iUW41LW0Z3cOOBbyrvFgsuYfbtGIi6N8+2yMdbO4WEfGenKOnZj8q2QduoM
	MxmN+n39G3lodFP6MXa/39iAErqgDwAGE93rtcw
X-Received: by 2002:a05:622a:4ccb:b0:532:ca82:51f7 with SMTP id d75a77b69052e-5359fdcec61mr187212281cf.54.1791887385694;
        Tue, 13 Oct 2026 03:29:45 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535e652f3c7sm21414141cf.26.2026.10.13.03.29.45
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:29:45 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53504882980so33685281cf.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 03:29:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz2Xn2QrruDF5mV1GkBO/irUraJJ3f2XX7lDCzKeRcxIaXRXDevKjnk0vjLT5Fbs0Ws+dbMQrYVNjIXOQHP@lists.linux.dev
X-Received: by 2002:a05:6102:149d:b0:7a7:ad9f:53e2 with SMTP id
 ada2fe7eead31-7cb36987a53mr4125862137.1.1791887065725; Tue, 13 Oct 2026
 03:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250718152500.2656391-1-demonsingur@gmail.com> <20250718152500.2656391-22-demonsingur@gmail.com>
In-Reply-To: <20250718152500.2656391-22-demonsingur@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Oct 2026 12:24:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXA83Dm=Mf9MFdGNH+-J6dPrZJGS0R_6hPNgC0x1suBHw@mail.gmail.com>
X-Gm-Features: AclHuK9EzHrMNGZ9VqEt7mZlsF4wljWQ4a5mjitwSzx9DSYBvOK99D8Xhx8xmLo
Message-ID: <CAMuHMdXA83Dm=Mf9MFdGNH+-J6dPrZJGS0R_6hPNgC0x1suBHw@mail.gmail.com>
Subject: Re: [PATCH v7 21/24] arm64: defconfig: disable deprecated MAX96712 driver
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Fri, 18 Jul 2025 at 17:33, Cosmin Tanislav <demonsingur@gmail.com> wrote:
> The staging MAX96712 driver will be removed as its functionality has
> been moved to the MAX96724 driver which makes use of the Maxim
> GMSL2/3 deserializer framework.
>
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>

Thanks for your patch, which is now commit e8d5a57e6d0ce827 ("arm64:
defconfig: disable deprecated MAX96712 driver") in media/master.

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
>  CONFIG_GREYBUS_BEAGLEPLAY=m
>  CONFIG_STAGING=y
>  CONFIG_STAGING_MEDIA=y
> -CONFIG_VIDEO_MAX96712=m

As Niklas has already pointed out in a reply to v5, you forgot to enable
the replacement CONFIG_VIDEO_MAX96724, thus breaking operation.

>  CONFIG_VIDEO_MESON_VDEC=m
>  CONFIG_SND_BCM2835=m
>  CONFIG_CHROME_PLATFORMS=y

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
