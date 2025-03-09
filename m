Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0E919DF98
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 08:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510113; cv=none; b=jnWeFRmRkhwwDGn3OHH+Ek/pmKGWFKjDkQKOieNoDbVOWgwblLXAzkNN6gG4zOSOTpzIR1ufQCTxvr2Mdhs7pwQEt+xAQqbhM9VQAi/Xppfrvhv5WtRjDMuLZ/tk1eu4x09SoEhT0Kf58IPHbum1uukZnd073QSvVqUymo/Tlrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510113; c=relaxed/simple;
	bh=AbuPWLIU45qyQVYNe0RinxFUH4fVcFJyxnkCgDaB8A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unYL94TRxafCSOCShYO9+COU0AHwnJ6fyuz8GM0+QIfYEgKTsMqpyOAwVz4Z7k9kBlvUGuSy02Q3oQUpnFmjYeS0S8HtlXp+WDJygtYoU0TbkVZV1kFXACYAsQUeR9aecOEMm9pghlR/ZimL03bmqLipi2VnDBlAG4Rm5JwMcoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPSO3ZkT; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPSO3ZkT"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaec61d0f65so665207666b.1
        for <linux-staging@lists.linux.dev>; Sun, 09 Mar 2025 00:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510110; x=1742114910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkDL/nUvpfh1eHpxumsRvR86QwXqar6N/bhFMrxJa6g=;
        b=LPSO3ZkTrA/xM0CohPlenwvNSPyx7ImtsA0mg138TZhJB6GRDF3k6Q9KhvEdwWznbA
         YUWvz06qXI6EOAqf2JwATXGN6Kj5l65/hrU9xTWu2+mqop3CEckKS0ba5BY4XsEUiLP3
         p1SQ45SiOQQYMc7vDytR9DzUfA7uQ8FOMATd3dXYJOLy2j0j9i8Yi/2sRewEdiPfQpJZ
         8yfH9Gi8GF3PziDdYkT/Wo84MMR0Il68moa9jrZvb5+z9PuDJaomvQ2egCRxBpJqtzIZ
         fSsyhHcJCGFOYbo0p1dI3JxaPTUo/+7fbHbWvBur1W5FM21HZSaAR1nF1w45Mzi0dnp/
         SWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510110; x=1742114910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkDL/nUvpfh1eHpxumsRvR86QwXqar6N/bhFMrxJa6g=;
        b=RXY8RpCwC7CF5eEElWsmKWXLp6lyHs4GGjHUeR8mLtlWpwSa26rh7jkd9OGSrd+URt
         XSJbAUFlsFoDUawYzpWBLeJvvLnaIIfj/mokokMqpRU3+3FTth9221a74v+bBwCEKrGT
         /R5ahPaUwEiF5BNEsGGhZz5y7snBcFCANncuM1O6G+wVechAdZsoNOMd4xIOojLMW9nS
         wsaCDnihFPCYog93jBPojVdcNy4+ptpQcdzwwcDTd4d/c/f1DAuooiJztHtOnlCsW3FZ
         z9eikSyEWKi8a6vgJv2hX6NUw+1AZdPezafoWaW2ai7zdyl1H/wTs+i7wSr0J7UZA7sy
         ZAFg==
X-Forwarded-Encrypted: i=1; AJvYcCU+5AOHuNEaKS2q9Xtu8CfzAYd5eZtM1HJjAGXSqb3PZbj1a/FxoVFygOMBnTD7lOQoocA//lx9y8aoINCH@lists.linux.dev
X-Gm-Message-State: AOJu0YzHll3Z81K0se6skYAqBxmo4jZZbCF7FvyKRLhzaRqjl9HQ+cjH
	uI4r6FR2kmA27XsTAe4ZWw8EyLZnvT9eTO7/xnKGFkt+MukExKHC
X-Gm-Gg: ASbGnct1LDGUnBhoIH+4HrQisr96eBNAc43NgnM0nmA1xamxkP7uf6tYBM1Z+26IScr
	jBuiHuCpAkw0v3voSHg/YBA4DEA60eUfSO0hXhG5LlSjidif9F8xMFOt/REpBlS/ohjW23cnpNC
	gtaJCF/v26q50KRe7s+R/mysMKkrZhXxrrOpuX/AUAB2aHGY0bku1ivQSOnll2h9tJKYYV7cpI3
	/nNfONxdrrmGGJiTtTonHGLMx2lb8+1iXsU9Q5L/SgRTVieXCRL8WAtA7ymCvwOFo3XOuK2BFVv
	hWyLqVSsZv47Mt5tLOxzWg7MAE/Zzj5rABGFlB0oyiIK3gW+VZbRsWlgYg==
X-Google-Smtp-Source: AGHT+IEfjqH7txw3ZNGvVC8ODURGsipO9FHidgAsOnuk5C0y4Kr3jGdwpFvRT4Ar0+alm3pK0kJ5Aw==
X-Received: by 2002:a17:907:6e8e:b0:ab7:1012:3ccb with SMTP id a640c23a62f3a-ac252628ecamr1038989766b.14.1741510110006;
        Sun, 09 Mar 2025 00:48:30 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:29 -0800 (PST)
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
Subject: [RFC PATCH v2 02/16] dt-bindings: media: i2c: max96717: reflow text
Date: Sun,  9 Mar 2025 10:47:54 +0200
Message-ID: <20250309084814.3114794-3-demonsingur@gmail.com>
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

This text is using weird line lengths. Fix it.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 15ab37702a92..1026678a17a7 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -12,16 +12,15 @@ maintainers:
   - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
-  The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
-  into GMSL2 serial outputs. The device allows the GMSL2 link to
-  simultaneously transmit bidirectional control-channel data while forward
-  video transmissions are in progress. The MAX96717 can connect to one
-  remotely located deserializer using industry-standard coax or STP
-  interconnects. The device cans operate in pixel or tunnel mode. In pixel mode
-  the MAX96717 can select the MIPI datatype, while the tunnel mode forward all the MIPI
-  data received by the serializer.
-  The MAX96717 supports Reference Over Reverse (channel),
-  to generate a clock output for the sensor from the GMSL reverse channel.
+  The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input into GMSL2
+  serial outputs. The device allows the GMSL2 link to simultaneously transmit
+  bidirectional control-channel data while forward video transmissions are in
+  progress. The MAX96717 can connect to one remotely located deserializer using
+  industry-standard coax or STP interconnects. The device cans operate in pixel
+  or tunnel mode. In pixel mode the MAX96717 can select the MIPI datatype, while
+  the tunnel mode forward all the MIPI data received by the serializer.
+  The MAX96717 supports Reference Over Reverse (channel), to generate a clock
+  output for the sensor from the GMSL reverse channel.
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-- 
2.48.1

