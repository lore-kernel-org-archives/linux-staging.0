Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E7B29B79C
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 21:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085359; cv=none; b=SHEP4A0BzprFGPjpI7u+ivsmwCG4cxSWVhTi1l6ffDLvzm2XCE8oLryGC/LJf7AEKL01lzRWlOstCHFDqbIyKnltFZTJ/vDseUUX+J11RvfrVIyuGrQFS8ggGRVF44j54GfFWyMCSmMPh+z5xIhujTNgMbILHVkhOs++u7P0OPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085359; c=relaxed/simple;
	bh=zfg+RJSUYWmDFrYgKmNlgJ0fy4URxTXC0G5qvYz8Cek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDZwhu/kl4gDgr/dhnJsqpNaNZi7BuLDcATShDFYE3WuiSHhzrZYA51qxtrFEvz0J15gFghmhm/MSqEglV5P5xoZ1xgs5iBRrqwU1grAVos7udM49Sf7norJ8pA7L1P5qFqFjrS0znD7N7M7fRSrBwAZbvI3rlgF1xlcTHEohKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixD9PuFp; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixD9PuFp"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5fc3f0a5506so1719431a12.0
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 14:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085356; x=1747690156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Az28+HlcLM0sL1av0MSi/fM4ZT2oYYKjFc0IsJNfl4=;
        b=ixD9PuFp9vNVHtOOviSYeqdQJPa8otV4OLpFVSqLAZZbKSnn/Mi9JaVueOZXa8uWM5
         B1tAhd1ehK4AS2DvG8tOqOMY44lD7zzrZgqRJcdsfcyt73SgVy73QfqqYJ17RxMJqlrK
         kbDS0Z3NRJkkXhI9SmMCgNH/u4Q2Ea5nQpw8tHmv5qvJVfnnpLLs7bc8jMApJ9c6muja
         jzHovFjPcRBkvv3kqjJu3PA60nGwaHC5+wSeC8EpEH8IHdYR05frUZppQ3ukvrYI24kN
         x73mq4OMMxEUHlCIq8s/fgB6+su0BBEB/iveLtgzNOj7DScvRNrrS9gmyjFs9XWa5214
         Y9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085356; x=1747690156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Az28+HlcLM0sL1av0MSi/fM4ZT2oYYKjFc0IsJNfl4=;
        b=o46MOtLJZcGKUFbkcWKiUKKMSOlduV9YBxm6xD9NWtyexNZzBF/OPGlEvTOXcNIozf
         5CgdjH8++rg6KrezWxvMsS4x3v/bY6mEpbijNNqhmUERCr46xAHI+OvuWQoD/CwKWg2n
         dn1bk2wxp90TOITKIbtws1Zv6MwGNX5fhmcJFlI5JvwAMtHAJw1P9zZTEoJFkz6L3igj
         p722AnWl5zhtBZKSOV6uj06Y4+BgO7vpzUBAV2SgRbfFeqigk+fuLmnonhoEYGTtNOmt
         Sm80T7ORwJufhAR+JdKxlHv9l0lIDz5agrV9iQjktm1I9hBhhcRTjsjKEjtCSpG07KiP
         dboA==
X-Forwarded-Encrypted: i=1; AJvYcCV9D2TUn2h7I6byoedCapXgcKhrn1pFC2P9uN8NsU7wx2KSPoPLM/KWCxnvgwkRJXYjC4rnK35BtfY6EfZj@lists.linux.dev
X-Gm-Message-State: AOJu0YyNo2lmDiYxwMT/0LkKgE+WjmpGycx+VxA0fCcyzSm+q8nne3eM
	hHMSGlr4uXPv5ZVMTJudGNyJAegDVlb0n59URxG8xI+QuGOhORSD
X-Gm-Gg: ASbGncsUw0TKUFDDJAOll1agR4NqIxpxD8kj5G/bJatJOKbRy1HywZDtQPqczeniv5r
	zaD8uspVSF+RorjqQKIMdNfssZw/cZDjrYmdJIXtuXyuzI4iwFwsQAYuQCtOqhUoPkth12jzn8+
	rTvzRKS2uq1qb9PW2dnrfIehE6RYcJuLhFyXc0uiwJyxVrCasMYfrJcAjb5Tf+TRwYkZ5qTgkl+
	MPZFMOBvgIRKGVlG6MJTG49dtKqqKjUsK8styBcdtGBvL63KZecMxlyzymBozHeef0JT5gdBqXP
	8iLPXOqQnK2VOVhQi0u0ZDDAxpRBxtXNnKJiMz0tBYSY1+CdtdgL5qsnrkTjq5A=
X-Google-Smtp-Source: AGHT+IHxZimkUK3H+FypaTOTN70zLrjfhJRz1zTX6CpTIj/ujzs/pJwUigs4Bc+mQ5Ey6V2j7ED66A==
X-Received: by 2002:a05:6402:40d6:b0:5fe:e999:e553 with SMTP id 4fb4d7f45d1cf-5fee999e5b8mr1117281a12.23.1747085355831;
        Mon, 12 May 2025 14:29:15 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:15 -0700 (PDT)
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
Subject: [PATCH v3 10/19] dt-bindings: media: i2c: max96712: deprecate enable-gpios
Date: Tue, 13 May 2025 00:28:19 +0300
Message-ID: <20250512212832.3674722-11-demonsingur@gmail.com>
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

The MAX96712 actually has a GPIO named PWDNB, which will put the chip
in reset state when held low. Esentially, it works as an enable GPIO,
but the naming is different.

Deprecate the enable-gpios property, and add powerdown-gpios as the
rest of the GMSL chips.

Change the example to use powerdown-gpios.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml  | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index b345305acc4c..e38213209973 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -35,7 +35,13 @@ properties:
     description: I2C device address
     maxItems: 1
 
-  enable-gpios: true
+  enable-gpios:
+    maxItems: 1
+    deprecated: true
+
+  powerdown-gpios:
+    maxItems: 1
+    description: Specifier for the GPIO connected to the PWDNB pin.
 
   i2c-alias-pool:
     maxItems: 4
@@ -128,7 +134,7 @@ examples:
             gmsl0: gmsl-deserializer@49 {
                     compatible = "maxim,max96712";
                     reg = <0x49>;
-                    enable-gpios = <&pca9654_a 0 GPIO_ACTIVE_HIGH>;
+                    powerdown-gpios = <&pca9654_a 0 GPIO_ACTIVE_LOW>;
 
                     ports {
                             #address-cells = <1>;
-- 
2.49.0

