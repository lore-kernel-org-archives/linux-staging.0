Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA70B28980D
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 09:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240784; cv=none; b=QNev5mu2VIJduN4oodaRcNNaqPE/DiPLjael8SVMCIQQM/Ro5RcZz0rW8Rzbo1zsJOzssYt5vP8P9UrUs3Ev5T3qhm4/2P2nUssc15iqmBZXxkV8zKP3PFEx332c1GNT23SGBTs6DZTzTf3p47FjvPR1OgYCEcoQnhKkSEAQ9mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240784; c=relaxed/simple;
	bh=XDzI2iGQ3ZbL3atG8VBYjM1NLqB9r+TI86rhel2I8VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VvXHxsqif5b2BQBPCNAZlNFLcLu2kZpHeXgTQCifAEWV7KWeWRUKGOCEShy7R98lSHLnluXD1wVdRu2eErK92enxZvzuwSfQPlFnSKKe8MkR1CRDXFeUC3+Y/U9E25oHohcL5D/auJw3C80ZSmvLX/Bn4h6mu3HdaAkmOgR0mSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFncM5kc; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFncM5kc"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso11893435a12.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 02:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240781; x=1750845581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6baFX1dgbZUxvw76cQruvAgLUvKTOPaVCHPv3Fym7bg=;
        b=KFncM5kcvk3QxG2VgKuPILywy8iaGtXMOCQdTaVjH9y0Kk4LIM6pzo3ZAEDNdDYJyI
         UtoK5wVbCXNqpxZxEh70XEadN9tSAahJNtRnIvMmceqANcxkFAFiONu1G55NvLoWD4gA
         TeU/HYJthjiDuOFI7nld7+wu1ladzQsh4vFoaJ66yprzSvCXD52gW43Majw/9QIikHkq
         04CftFokPxoSSb/bNGyMDFRz5ekgQl9Suz1AkSHeABGBS3zzol1DGeF+Tm572akD/ZCm
         Lm74Gquty5X5dwLvb1OCSz02NaQE031O6hEqqJz04pmElKfAvsTE0CXq7PEwLvMG1+4P
         kb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240781; x=1750845581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6baFX1dgbZUxvw76cQruvAgLUvKTOPaVCHPv3Fym7bg=;
        b=FP99aJ62ofk8NeJurEwZ7GaSO/WSj+ErtMZFj+MiU2tU+R0b/31njjIKXpnbx4AVzX
         i8TOE80UuVtGfm7VZlC81JvpKpftVCxiglGKoTRvyW6+UfFkJnA9WZuhQ130bMMRv8OA
         BQs0XXWtk1PmdGX8XxzJeqc2it5+Gaw24bOHwkUELYesYoCQwe64Q1B9nX3Ha3WrhdX6
         QlDY9gsgr0EhZtGEKqIIBEqrMFFhLGKyuuf0X/iMixdTSEZQbnW7RUd65oAtmwsQCX82
         pZC0s2UhZ5QUqxq4NLhSRmDu0N+K9cCgy4v3F9tTKft7iGN1MEL6D2LxTrUvu+ZW8Dkf
         X7yg==
X-Forwarded-Encrypted: i=1; AJvYcCU7TbRU6+BO5XtDgEQG6Lh8esfrUuAyUFZVGEJ5CaLOfQ32EYD0xWJCPW+F61L05bx0ixYptaDhhvHuZPHN@lists.linux.dev
X-Gm-Message-State: AOJu0YxCwS8pRErH+b6Mv8d/En5PtG2c0xTaTfM8LS8gqVMer59mNOiB
	Jj2SlTr0G4gGGefjdLOdqmqBWVDDiyAyqMlAKn1FQVU44yRBqspwJIN3
X-Gm-Gg: ASbGnct3piH6mU1h374E+1SthY6sTtDOx26KtwWBIuG4J5bxaxR3eA+vCepqPgvkC3F
	0uWEAuVvsrny0wPFDZuTAssSikwmHtg7rOJDFmVv5ZZETckBQD1pkZnXvZC8HMHHRbfM9uLv5Q5
	N63IK8eC+6ideGHi9+EmeX/WMIpXTtMhGeyz2BcWQ8aeAA3H06ZlI+qxp3zm6VPV3tnHN8nJ6/f
	yxFMH5CT5i4OZ8WCDaHIhVjPod9wAOsCeFU8nz9VI+qoJBPW2ReEoc+osk6M7k1SYlz/uJ7sGX4
	MNWlXFTcFYbx0q6GVKeDEkF50lv9kekeUs1PiPYFXC0NvW0KJamTjkwRHwDJK5sS5BckzMqxFx0
	=
X-Google-Smtp-Source: AGHT+IEOqE2l3xi6qMOQbYwERKlj908Tdc4WnQFs627svU5I3y3cZFIHL0K+7zXzTUOHmPs+LVxQuA==
X-Received: by 2002:a50:d519:0:b0:609:a91:87e with SMTP id 4fb4d7f45d1cf-6090a91097amr8113971a12.1.1750240780979;
        Wed, 18 Jun 2025 02:59:40 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:40 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 07/19] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Wed, 18 Jun 2025 12:58:43 +0300
Message-ID: <20250618095858.2145209-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd..efdece2b33b9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
 
 maintainers:
   - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description: |
   The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index 01363fbcb9b3..77adb1f7ac9c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14728,6 +14728,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.49.0

