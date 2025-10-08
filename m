Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A112F2F531A
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908690; cv=none; b=EQvMVSgTyKp492CLBKaVMiSXwFKvkrehGamp/Vn/wFEXPrd3j4T8w54yCzV9tJWo4/bax7zAzHz/9HuZalj2D5FXPcvoVa+FFnxfOZstsuJlut1ngDfUMW1JhJNlnGiYJcG0Cd9uNi5BQgutGVid3PDDjeETgxcYHq0dEPuNK20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908690; c=relaxed/simple;
	bh=u+qJVWyapenrodgmMyyh5sdeoJQIHo+UHZurPNrBBEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pAVYO/dk7/Yqdm0qEwpGUJSbLXAetBjT2M88OM8itHC8NiTzU8yzVFmB3vxifB4VU9LKfTBlhcEWS/vovycYDp7sL/icyppMVpykAXJgQ/V5qyNxvmkqlcFRf8c0ZhqvLDxjUFyg1z7qflXM/G+tN6iUB24K+aiXKQ1NVRT2Nxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Am9bpAXn; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Am9bpAXn"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so8424160e87.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908686; x=1760513486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=Am9bpAXnUNd2+/IUn5KeiQZGy/BRuRR1fyVoT0K1V8cpWY+0gsCWLtKAL6KDD9hjcw
         ldsT0CXEYACCSmXmxA6FY/kNOJdr5iOYl0dvhcX8VgnokJK5oZZta5wePAyPhnBiQrz2
         niKI49V+O5YsVccBR++3Lw9eqaaWt5GO5NQON7L96CdZm1JR4NAnJ9SYqGExRVY6rDnK
         EeDz9jfyLCosmUDbn7uV8pzo3o3fU3Mv/Rbsmvlu2gTNHP9pGMNDKqLSGn9SzJuudV85
         hkgBiNnI4drebHVL2f8QlhXQ9l3xfdp9Fg5tKriJudB/wT8vlT+PXeNK6R9WctyVH50u
         xRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908686; x=1760513486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=YKYFdy5YnFxT1JDfE1KJ7PRsZ029u9FL0ztoaY4gGKw6GxiVh5WDXs6KRPfL0TUN6i
         hHkU2+Fk3/aLVa0RABosTl7sLlMQKT/C3cT1ZmODSbY5kaUsVM+deWGpnPhJ8yCxtM9T
         /jOO5U2hqxOgX0XtUfpfhTdRM/AMg3YejmyKrXi2TRZDeER6yd00CEZi2QKXVuJjojOH
         pEM4XEtX8haO/gSLF5m7uqg84V6yYNkk2OmnmqNUdN2XF9Y1k9LIt44UgS2IRPwuI16n
         rPTvXh+9ZYDT80g4/GsW9+Uoyu6H9cDgkYDDGKcIHxrsC4cYavlUAsLaL3N9RBpw95KL
         r/ig==
X-Forwarded-Encrypted: i=1; AJvYcCVUbcoe6KoEBdX7cx4TxTnwKRwjU4sI4IuB1dpYuA0vsckTYBH8gdzLTJ9rGoTZnXee7YARW/clH3e4CSL/@lists.linux.dev
X-Gm-Message-State: AOJu0Yxvb12ocFLdScJPkFSj6PJdXGrDMl5XpyH6vxT1/PBarKv4DR3z
	zVUXamAsFZKk2H0kHlN6glS6zeEvdVUIOwIodnxp5/L625kah611PFrz
X-Gm-Gg: ASbGncvs/zHlQ6EddKDEKTwqSz0RKqcUtT1gHXEL6ZrOhbk850Y4q+bcwFaysIqjI05
	fp6Vc2q+oleIDc5Nn1v6ogMTcXZ1y9lpiNIfLK9PSUIHadIUmkwaa/VfO9rNQD2Oeggv/upAPbG
	5Kk9JYxEd6zE9dsB0uMBKpwQAegyGzjVdcOYgnDLzqea4InMqvVw7dLHNnzovSj3FOVoJNNwaCI
	KNZspC/FdIUlk7Biy8d16QQBs/q88ST4wTCfaG/+pNuZT+c6e6DN31fZrRuaVVlb1mWm7rU5tB1
	ncD7EW5h1wjZFnWKfE44sQLyntneNfqPIVkg8FcFTRUBJWGbaXZMaj65GWLZ37PYI5pu09ocLwY
	vMgRst1FDfqJnz6GN706hCY48j6oegP4bHx1IUg==
X-Google-Smtp-Source: AGHT+IFR32lh8FtdUEL6SphWqMKGIHQLehIZkE6OfQDikiDPLeDxw8CjYdXaviYneZ6ag7JJ8WYzTQ==
X-Received: by 2002:a05:6512:ad0:b0:57b:1ca2:ab60 with SMTP id 2adb3069b0e04-5906de89076mr686708e87.52.1759908685358;
        Wed, 08 Oct 2025 00:31:25 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 07/24] staging: media: tegra-video: vi: adjust get_selection op check
Date: Wed,  8 Oct 2025 10:30:29 +0300
Message-ID: <20251008073046.23231-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get_selection operation may be implemented only for sink pad and may
return error code. Set try_crop to 0 instead of returning error.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7c44a3448588..856b7c18b551 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret)
-				return -EINVAL;
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.48.1

