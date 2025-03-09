Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237F0148827
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510150; cv=none; b=R+TlesKw7+hRRMU1abK6TdMdg/T9Oqt7oMOTbvwc3U78C2axwrWMpS9w/nutaJ//1CcHwmZfsh5k6FMNnhDDHs76MaU9J4bmWm9MPx/wKhfem7ehRmNnlDSN7fxaeENW5iwsJfhtd/xCeHn5gL8215ccQH2B5mod69P/Wnj6IQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510150; c=relaxed/simple;
	bh=9o7dWxkAzzvkB2Imojs5J6AXrsEiMQLNW5n5ACM0GTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gy9BnGPKzZYFdc83N/kkU1wf7TuvabV3aI7GCsVqHQw60eVpJewgBZzU2f4EkIy7uA4WdUsWIMNAS8fw+DC4Kew9EuWwjFjyLjuUTmpDSEPqZpkpkcKO/uh+46dat3QyMvnWkCDx1x82zdnjxGlj+1yt7Yn/IcVyKv9VhS2FZbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITd334co; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITd334co"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so6112237a12.1
        for <linux-staging@lists.linux.dev>; Sun, 09 Mar 2025 00:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510147; x=1742114947; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dW4CzmrzcxsS+VFvHNn6mQCAsXdBank+JJs+zbf7Qs=;
        b=ITd334cotEoTE1G5+HNpa43Btj7Rev/OzU2pwYlxXykthy2y6VRO7/VMrzx3/4dec8
         1qidTfENRH6V9+I/0EWa4fGZr7MiztPPzWFTWEV/qVXggRs9J7oM1RLCQeh6wqoB7Lzb
         4gNn+6zrEt9DZ0SOjEXfqNcdrQTsNFDZgB6ePD2qP/JMa4VDSTKCQJYgE9x3/zX5dRYB
         4VNw5Iv/deLmr2PwL9YiZZUlGN9EjzsbORlG22TxJ11STuAx/mYV4F5qe+fwuyXSOcw2
         4H4VRpt4OnWzqN5/UrXxmTs2toHn7JOzQd+LF5X5+3IchXUyQIDkKdHfj1cfAUAk8Md0
         FD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510147; x=1742114947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dW4CzmrzcxsS+VFvHNn6mQCAsXdBank+JJs+zbf7Qs=;
        b=IOolzOaCAqi0H2+06DQBGImb47Tqe08RLcu4SXnxZ38h2UeBTbPecf0kx7zY3CP3kF
         6bbi/XtPzQrIOy+BSonzP7+vEHXiCkGKT4gUq93eVlye11RXKJSFhW8I+c/+7aSRyhJG
         nJ+TguzzOXzVnFScEcQGL5vMcEdk2xjqkH5xIurjYMdhgAcZVfdrkiKnj5bxJInoEvDY
         U+TIX/BKkOrw/laPtz/w4IvNmc0EmOcKnso9XiEb6XQ8qd/n0d/c4nlAF3zl0vg7r/f2
         hnjuF0ekIJPS19MpcNRE222RGQbcBVo2ro7QqhBrFzFl5a/y3R9PNt+FDIfT3jRQyA0N
         qUOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyraaBCso06E4gffHQ0KXvaZXDw0SYOFdQBCcRhWpIutMsZ4YkMVcTWFXZQEJMvVeQ6l4cea2m+EIBXyQM@lists.linux.dev
X-Gm-Message-State: AOJu0Yw89Dvgr276bMFCjeCJR51Zq23IQBni9MfejyC30A6uwl3AejF3
	c8Oca0ZOSMWF7Oai+VLr2rhHhcfoYSuHpOL438S5axzOOPH7TxGP
X-Gm-Gg: ASbGncun4lciO9B+qhzL8YNjZjhHPcFg40ulOAYT50MCmYh/Q8mhQTt0ee99G2kv2l1
	GwDXz+KxXOE/ZFrzsiGEsFarnxnjl9mV1j+XCHKJY3PI9KVI6XpkG1XwHhrruhaq5+k3Z5scnrZ
	QCxfMwvNgWEuGoc6V5SHjcW0fHosZPhfZnDYtp6u2CbOZ1OBqHKzO1xmcoZNldNaG8xylxEDEdG
	O2NPmjT+BQ5Gl+aJmMaqbV5lTLsHg2lwIr7LKmrRYqUICfmIgvuex4wjQPYIwhVofdx6v5yGx6L
	kAOyMyWPOyrbVzApfhObTCGe3vkmJFkxPU6t6/VuaL7vUirPoZWP7uWoeA==
X-Google-Smtp-Source: AGHT+IEtJgNKkcfiGC5STawEzBHIltzLZ/lVjlnump5VNRcZ/7ElRKFxJl72L3LSI0tucNmXfakjug==
X-Received: by 2002:a17:906:f594:b0:ac1:e00c:a564 with SMTP id a640c23a62f3a-ac252ba468cmr1117297966b.38.1741510147444;
        Sun, 09 Mar 2025 00:49:07 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:49:06 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 13/16] arm64: defconfig: disable deprecated MAX96712 driver
Date: Sun,  9 Mar 2025 10:48:05 +0200
Message-ID: <20250309084814.3114794-14-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..6e9bd9072d11 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1272,7 +1272,6 @@ CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.48.1

