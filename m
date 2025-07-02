Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5900627A102
	for <linux-staging@lists.linux.dev>; Wed,  2 Jul 2025 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462479; cv=none; b=UDfNpfOrKFECr/OudYGyQ0CHyyGyOIaGjAK6TEmpJHJKac+nnqXq61w9h9tqAGbjavWXn2g6F+GRYZMyP9LEUcUiCbhnuEttMjzQf/wH91tFfKCfJDUKF7+omTlGM6xQiSFwf0WEGrw2RDq2x4sMOw4Ljg7UJZhWU/FgBqm3YM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462479; c=relaxed/simple;
	bh=yNhtigNBLH83jANEaSNQ3UDj0/gZqbTIvADDw0JdcRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6VUNlblK8NBaAtreSA0tae5ScMjmrp4ToMl3ZvTgbvETnicMc6o9YryZkGGrQYs+IHDRpzfcaw+gFcKcXSsrJCymyca1Har3vfECtXQ3k/diP5K38jESmQzHf9gOOG6rFSt/pw8/UAHNIxARtNVlSotA8d+8HsVpBSf1hrfgXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHbLMcu4; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHbLMcu4"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae35f36da9dso893297766b.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Jul 2025 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462475; x=1752067275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPtAO/bCMb0ayQy1ZZ4Q4T0/klypPIiDPkWybUy1oW4=;
        b=DHbLMcu4SqjlQw2pML1nYJTavBhQusRlUOETiK4a6tqe3i5zRM6uc+bDrL3KEUBU8z
         cqupexHJE86BMPbQKJ0kja1nV96OCxfAKHV4FKpMdCPj1olwpCTFnmtf5ymLf/WERnmg
         trOek0fXlJ+BRJv/0Bd9Bxp7t598tX6umZMx4apDskhYaKqz1r3mbgx1RlJxBHT2b2oR
         71h07SlpdMlmPHFB2KHYKs3Uoxh4ZVSJTbgKJmySMj1BmfSFln0Vro12pmG1OskNSUa8
         kCIYARjpQkJyNPHdtgh/Fwyw16o7tx1chQI6sJ13yu8mjYKwchsnN2WFIkf7bES24vt1
         jW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462476; x=1752067276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPtAO/bCMb0ayQy1ZZ4Q4T0/klypPIiDPkWybUy1oW4=;
        b=sykQOltvaB92D5y5MLEm2bz8HPxKQZ7WRXoLBb8LfNmsdtIW8f6LSE64DXOHyf1EWH
         v1sAUlPqLanRaKJSUeJhHuCoxCblc8zhV1EipFwAGr7QQgU2vdaTFmxee4Ppwp/1njuc
         0Pel6dyjGcnHFgfBo1c50lsP+m2T3zWbhcUVa3hKQxu92gOCNRVw7D/Fz6dXaZPeTMWb
         WyoUCpugyps7HC+iSbXuL03xswtw7DLWdABpsE6zKWI3j2J/Fu1RMoOTQhgTbMem6oLN
         SdJ1/A/xYJ9N2ukoSNEabxvyWCy5Ds4hsTnKHlS5v9RL8RUHSGHr7JIfhf4zHIUWgqjg
         Hixg==
X-Forwarded-Encrypted: i=1; AJvYcCVQhM0GRjt6nzeAPm/yAMNVgkhBcR//EQXNfqml0fxVZGmumLWGG3+T/9799qZjmjbRYLZeufRkCTc8oRnv@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpek1XZls99ESVz/n9/fOLv+oGioYHUPjyAX/YY8FZ2cHaBGpx
	krk5PL1GX7H8KX6nQBUFOgl6HxuyxbKcrs3Bpek1kn6yBuKPnPCp/DE0
X-Gm-Gg: ASbGncvCWirZ3fuHZac5jI17PrD5vAQUKlpZHF9NbFCYObqt3bVK6aTXWVkaDTJuHIH
	XZE9hrIEqgfmY0H7sAAtlBg1fmwHPUnGFR5BBXDyqiQVmE4g3FTEjf2qRMNxoZGr7cwpCLAeUNH
	stG57MxwgJx9Q25tBoiTmQkX5YgaCifzB69WMtLM119K1uETO3l/OG9w/lOWaDLyzykpYN84mWk
	wDHBqOMXfC9/o4HaXVJ7IKJpd4d3ob4xPQSpRMRsGKly5qr7Od/botc14hHpap4+bpcTgnHNkhE
	wKB+86kKVBlps1i/OW1YVZUUCtI2QDVzeS5qFddmiO1ErTu463Ow4s+Hmnw0wjY2YKIFiF0ExDc
	=
X-Google-Smtp-Source: AGHT+IEA3de2m4giSGKNLKSmBJkZ2z0wYHzUm6md3r9AFoIBaZoB/eT8gjgMNLZxZI3iFqQoSe+Zcg==
X-Received: by 2002:a17:907:1c13:b0:ae3:b22c:2ee8 with SMTP id a640c23a62f3a-ae3c2dc3540mr275616366b.37.1751462475207;
        Wed, 02 Jul 2025 06:21:15 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:14 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 02/24] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Wed,  2 Jul 2025 16:20:28 +0300
Message-ID: <20250702132104.1537926-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index d1e8ba6e368e..15ab37702a92 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -9,6 +9,7 @@ title: MAX96717 CSI-2 to GMSL2 Serializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
diff --git a/MAINTAINERS b/MAINTAINERS
index 276c5a0b2dc5..c4bf1503eae3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14742,6 +14742,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.50.0

