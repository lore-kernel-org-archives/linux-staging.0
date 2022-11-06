Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73C823A9;
	Sun,  6 Nov 2022 09:12:44 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id f5so23152941ejc.5;
        Sun, 06 Nov 2022 01:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSBiqNlNBgNvlKGWuMBUaPKxalzmOwOwUz1x9SgGcjQ=;
        b=LUALh1kWYQyMVLx7cxytjtQLUkOhZzWe9Om9WRCBI557dTiX96PYgYozsR6wCPIx2l
         QWUaibDrLttjOFpsMe/NuHm1b1kYfXdkZqKnF7l/b3LNbrunE1hU3JEhkTyLRE8XW0l3
         SVGum080bylTATTcuqridl2mPyIY25jEXPfv10Wh3Y2vkZsCJTuSpL76i+AmlcUdMb6l
         Fx0a1HIjQn+gXAuaTWKKmisHhkM6nBZis5qYuDhSRWeUE/4SLgyhbvGMutO+6NrnrZQE
         vIKYs3aUP8VRkr2URzhyeo8JiiyvmHD4d+wbI4vujr6udryw74B4MakmNHI7l4kuWr+c
         AhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSBiqNlNBgNvlKGWuMBUaPKxalzmOwOwUz1x9SgGcjQ=;
        b=6TXSiHMUjsrkSjLVMsR17LyySVUKQxpWCeXZuJaT9IcxgWC0qpdc6jCjLjAQ8WM2uc
         +v01LApf6IbNVLE8WnEtErekDRzipL0FektHxnqWpBS//O6q/80ojlbPW8RZdzD36o2x
         4SfyT4LCZ4lGwntPpLhUgaR0o/qa9/iayMd9Ydwq+bhQUvP8wJVHUUveGUiala8alA2T
         WdqhA/y/MWjUIyXfaER28s2gwVvQUg6S1SfD433F5+embdO+nrmAyPPY15kD9HFpMqal
         ja9uUuq1dwSWx+ZFPv9dWB9oZKScGXD/Y3qa273ChgY/RUDMKXRxU6MVmzAn8ppx42KS
         GS8Q==
X-Gm-Message-State: ACrzQf1PnjTJ9SGb7JmS45zrS0kXCsWHDsfVw2h07uwF2PZBHX4lXdlP
	1W8yeXMTyRSUUwQ9T9iDoXg=
X-Google-Smtp-Source: AMsMyM7ohNOYzEIyWaeEnQ+5i9q5aQoQJ1XqPUaLHl3klPnbQbCFqMfooVfOoaj24IRCDX1yb3VlnQ==
X-Received: by 2002:a17:907:88ca:b0:7ad:b635:2f1c with SMTP id rq10-20020a17090788ca00b007adb6352f1cmr40788233ejc.6.1667725963116;
        Sun, 06 Nov 2022 01:12:43 -0800 (PST)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id r2-20020a1709061ba200b0078a543e9301sm1849285ejg.200.2022.11.06.01.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 01:12:42 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 5/6] media: sun6i-csi: Detect the availability of the ISP
Date: Sun, 06 Nov 2022 10:12:41 +0100
Message-ID: <5312214.Sb9uPGUboI@jernej-laptop>
In-Reply-To: <20221103163717.246217-6-paul.kocialkowski@bootlin.com>
References: <20221103163717.246217-1-paul.kocialkowski@bootlin.com> <20221103163717.246217-6-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 03. november 2022 ob 17:37:16 CET je Paul Kocialkowski=20
napisal(a):
> Add a helper to detect whether the ISP is available and connected
> and store the indication in the driver-specific device structure.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


