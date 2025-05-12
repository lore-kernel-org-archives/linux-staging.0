Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73D129AAE9
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085345; cv=none; b=b9PGm94Gy/5M2boUI5XKMF2nEAvTAhkk17Vkurvtqtslq61Pxpcr0i8hgxQwRCSa67a9u4M5iB6VtalnSCBhsX2uuB/Aft+UPEo7Y9aiTqLs7iymYFakvXjXCLsV4GY9EedQ3p+nC4QjhOGoX9g24qRlbmvSBd8V37aejQX+ry8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085345; c=relaxed/simple;
	bh=dIGaZjQPQz6vrNCJA2N/2896GL/4RNOJuUvDGl1IyDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBbhT/lEbOrw2zXztFNsC3d5ruCB0FsO5v/nwVoRER5na06P8c7KN6Znbc23wAEXkf2r1xcP8kCaM88paNeFd+budxLnMmP7B61AWJZ8CXWekcxXBYoW20ts1ijPNdJBuHd1X0EegDxTBDgyxWVu2NbkoTPZRkPWVjmbp8aBUk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5jCfqhc; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5jCfqhc"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acae7e7587dso776954066b.2
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 14:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085341; x=1747690141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9j2lA1EMTdFSxUbGh/w2aFGWW404Bip7eSa8WNABgmI=;
        b=h5jCfqhcETXDV6wiHdEtfnOLgTUyJF9+Zh4XBcOh84SzPtgrMBGm222I5Sm5uf5aM3
         SILZW+4Pbn05ReBHV4Qz0Z4ppqopp62j9MDXtQLbXEVShbB+91/kfMg7QArhl1WGjLyB
         LKb/cggxttwW09XucIHB/iM5O6YqxWALo9Dez/689LrgAkIgN3VtGzvFCYBy2AvYTcRe
         7gGUj8XTobWvR2DFJ3jWvNdgCAU0SkrdNh6x0926swlMd3REAZ15SzMzA2a1aEnl4n75
         trXki4AxFukw9IrxfKT9Getk7+BK5JSAmROO7sU2d/sBwTnmrXcvbvXm2k1bkwjia5o/
         7GpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085341; x=1747690141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9j2lA1EMTdFSxUbGh/w2aFGWW404Bip7eSa8WNABgmI=;
        b=myHFqFZQzD31Mr/CXDuBAZgh+Jy3HZ5LmXd/W97J30tu4mbb0L5MhGJCG0gJ8ie65X
         T/JZiij0/kPCyHZ0gby9zKLDtzoLlHapZEEcBYO+/OOYqt+izPrLyXzQD57YNwu+R2wK
         9sDhVaXlOObgS052E7YkmfrFSyw9a+8UsIdnScTQXhC44K4bgUCGZDYMrXYSfYAn9lEt
         L41pkOLJK/CpQu5iP9YIN7Iv/K6FA9+A1RzxzUnKXHM3lqa2XSO7G05rLp9I3F1dLbm4
         Vdt87LWhWZJiWu+U11YMx9FcM2ez/Z/p/bYEoYiQ/BuFXQsZggcaNHOKhtohBY2ET9nB
         kAQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXN/Z3EJSU7b2/yjgq6vRYlPIJFs97nvwcOHrJ0FYTz4ifRJC8ygFgb52wGElQgWNblxjIIgnhxaYgEKwX@lists.linux.dev
X-Gm-Message-State: AOJu0YxSF603eZHMkoR5RhaN4+pWnu1mWkMSqox6NH4DKJDof3GXt5PM
	1GmEU7eT1EIQp4XQObyBTK46K8WmP/1prt5WjjSy2ed0Af5hicb8
X-Gm-Gg: ASbGnct8mVmOxvR48V5Ncv8X24r3L6zxajmSGVHZVn3nlxzk5WmSTLr2Jhy4i3p7ve2
	Hm9DSSMVlF8a1V6Eq3H131goVOsh4EoBfu0D4P4VrUKMZy4OZXh2vNAfpkMVSo03pOtZxVtRkQU
	JNCvJUKQTdKNaODDJ48rNqtcmSyMhRlvPcS4/DXLv63xajbr2FH7iBO1wsL3EiVL7wrEd7VEiHz
	Da8ZOc5FpsY4bEkTWGfAcqexX3tOptQ0qlzjQWJHqnf6cUVwPaH7sN4AVZAr8OrDnl7AbrkUn5m
	emk1U4A4YF66U2WmZRxYdSLGUd1eCmuXFAQogI+fYd+90/hxHgWV7X4xchbdNvz9xtNBUXPPAg=
	=
X-Google-Smtp-Source: AGHT+IFOOtRWKQKAOEfYjriWhASXUPsC1Ft2pAi084Z0/XAKj0GzAdO7h997QXgzay9OEo+vZzgtoA==
X-Received: by 2002:a17:907:6a13:b0:acb:6746:8769 with SMTP id a640c23a62f3a-ad218f48713mr1441083566b.18.1747085341045;
        Mon, 12 May 2025 14:29:01 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:00 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 05/19] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Tue, 13 May 2025 00:28:14 +0300
Message-ID: <20250512212832.3674722-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index ab46a5f0bd7e..23f611177a87 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -30,6 +30,8 @@ description:
 
   MAX9295A only supports pixel mode.
 
+  MAX96793 also supports GMSL3 mode.
+
 properties:
   compatible:
     oneOf:
@@ -39,6 +41,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':
-- 
2.49.0

