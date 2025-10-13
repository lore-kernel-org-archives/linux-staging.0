Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A80211491
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367060; cv=none; b=ak+iNXX9IT2aeRR+ubKcHhLXaaSjdCX0XDcMmgYreB1oQjfv0DIwaArU6DlPzAVPzB7cjdyCnLs7ahGWD7tiP8km4nVZs5svCW4sLbWqdULr6EfIERe0JFJ7w1HVdzFPTmHU+YMscLn7C58f3UHF9hhy678KzOq7NDWPvyZwsek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367060; c=relaxed/simple;
	bh=a8rzeaiQ54tOFcMOe+sIUa8tfmcif5r7xjlXNM2RFaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SHPSkQUsxsoey8e10D5Yx/bf9BjOPv4EAKA3zTeJQWbJP5ntJ0DEjiMB/9ckFKjyFEse2anUveB8fewpGE9nAPiFQT/ov+N+y/TOKrjwmmJRtrUTzZ7bHFYbmoKxI5jVq13N5aNhkEsS1wBh9lJCzPeFsSd9FDYFQzWX+V24oIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-7970e8d1cfeso77794566d6.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367057; x=1760971857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BF1nvJKgerbunlxq6rI58NsjqwKmmQvTj5E3RRtPIQ=;
        b=fxxXxrDg88lOClnQhlkLtCIHwGpXOjSSA/OJ6l5Jmy2aqM3N+1ehTU/6+FTL6H+MNj
         hAoJUGWpR6E4SUj2tsJR8iGLC6lRmAnaqYxaEEvCAfyR6hIpjNSoDLs0VXCI0V9cJSBB
         ZMOGUq2trI/4BstYbXpFMCLfqheHdKgzItPMsz5RbkoeVrYSYRZgDUsrePRKpWyo0A8E
         rotDzVXWz9OBrgwfrpCDC/BeSMZgWAQDHJojTgS2QziTaFwjhNovn1oE44iBgPm388rX
         HBgVlEKNYNnrSgZmNzDokh8hYB6e5vOhLNSNTFNfSQmd22N6sTQcT+GscNXRXAAI8QtB
         XwPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUON7MIqHSq2trDFYeEOTQsZvOZfQowQnf54UdSTno/z2Axdk1nD7PJHexiTBjyfCNLCP+/ARjeYAds5LBM@lists.linux.dev
X-Gm-Message-State: AOJu0YwVIjXOApJGmQHfIp4NPdUAKirVi7lcCOr6bqrYkPMQD55qvTHR
	3y3H0EQzzI3BILZgQgfxB24EJeffXv1CWQO6g9mfyHZEMTdMoMRU+HvmsM7Vo2t5
X-Gm-Gg: ASbGncuwJS7a+oQquDTLDhceoVImO7utHc/K16kcU4V3FB0piMZk3XESu0i+gud3cJ1
	ec1pUt4ah31AYLqEzMU1U0bQRmWtQSj3rg2aTnh+u6bXp2ry4n98aw4Elq1pQ7j0y0VzM2yKnIu
	MZj0UiPtcS2khUNyxFlx+KUCDqOF0XkAJPo4FdBFS3xQpI6rmHwbSLRQw3pZU9LGS/thGvvD0QW
	tYALprrVhWlK5eCMTl8RVpw+Lc7aOrNDsGihw8M9+rZ6VcODiyhQunJThPsUMGwOi3SOkWgBst0
	ucm0ZqvPgNDVRjnDrgcczMmk4czIslVORBMEjotb2h7j8nN+dUOssvvB8m00AorlfL59Uoz4M88
	ShVWaE3lsdN7s4BVwF9lNGLvUqkr8h4bCr5QSiQ7wxw+6f5qZZUIx/CrLr6sxUeb6Zgwkv38KUd
	Kg988VxDYO8KG/uA==
X-Google-Smtp-Source: AGHT+IF0eRyFMQcPAD4OYB7Pc5ThDUP4v6Q+EWOXjhVpEkbZOp9mFM9NEtrbdGKH0CAc84DkClHXlA==
X-Received: by 2002:a05:6214:29cc:b0:7f8:fced:b994 with SMTP id 6a1803df08f44-87b2efc3386mr276411046d6.32.1760367057351;
        Mon, 13 Oct 2025 07:50:57 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e706dd9727sm76868461cf.44.2025.10.13.07.50.57
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 07:50:57 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-80ff41475cdso88460076d6.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:50:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNLQEiL97vWVscWQnukAnavOTU7zdR0LnvQdf8SqleplFmCgKVPNeC7hgOxO3fvJ00kDBExqj9VbvdBJu2@lists.linux.dev
X-Received: by 2002:a05:6102:598b:b0:521:57e7:3b19 with SMTP id
 ada2fe7eead31-5d5e23ad946mr7466194137.25.1760366582403; Mon, 13 Oct 2025
 07:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org> <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 16:42:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw4x4GxxZ+m+108rp+_uiuiNFHO4Vtrd3vftb_LwmCLQ@mail.gmail.com>
X-Gm-Features: AS18NWDbEQGWUFg0r_aGxPQP6vUjubUz4v9cHDpfk8kXxZq-lj2695LEwK7MQ10
Message-ID: <CAMuHMdUw4x4GxxZ+m+108rp+_uiuiNFHO4Vtrd3vftb_LwmCLQ@mail.gmail.com>
Subject: Re: [PATCH 27/32] media: renesas: vsp1: Use %pe format specifier
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Daniel Scally <djrscally@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Oct 2025 at 16:24, Ricardo Ribalda <ribalda@chromium.org> wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
>
> This patch fixes this cocci report:
> ./platform/renesas/vsp1/vsp1_drv.c:958:4-11: WARNING: Consider using %pe to print PTR_ERR()
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
