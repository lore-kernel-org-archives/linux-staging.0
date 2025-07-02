Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95184289E29
	for <linux-staging@lists.linux.dev>; Wed,  2 Jul 2025 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462490; cv=none; b=K5sOMLkE4Dn3sHXCrTsAaLPzoO4AUkAy7IONnMWWlnCGkV8pf0KUVTFsQJy3VilGg4EupJ6vqAIXyvPSMq5TZR0jtV92Jnk5bcaJv9fe3WJekmqaui6ErPCm3LcIYgvNCg1zDoAKfsIRUGmQOEmjpo/8oI+pxE7FWsVzuGraOrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462490; c=relaxed/simple;
	bh=2UXQv5xiTOnfjhuEGz9G79TZ0C+5uNG+PUSw5mMQ2Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uxxoYN2jYakgSK+BePpG4MqGSwdevOwGju27TqxgQPR/479Oo35+uCgSry55Q7lobNJ/CYE8GKdNHBNKqg6K7ccBdBqPoYV0EK5/Zyf5yW9t+gCzDl/8rDblMEfNH9iGT632r4eBH7ZyIKY3BV8/rsG/2TDMuJKSDPDBg7cuKdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MP3GdRY9; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MP3GdRY9"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae3703c2a8bso877352166b.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Jul 2025 06:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462487; x=1752067287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNmCPN3gRHp9kE1IhRlEIQDYzdEUXzUNt+AYwUzgX64=;
        b=MP3GdRY9CfxrATKFtFhGNbF+s52W1H/O6ubDlUjDlW1PUO6vdK0olWOC88qCu5tcpC
         2UR7ts+3pmOPNAmIVVtgJvp3Wsd4BNhIrIzAcJEq1uVJSdQVwKBlGm3H7l+CubrWv3dA
         Ge0gV+eKkF1osQkpZyAkNo/PDzKKpUKEcLJKk0KdC40xY3PFZHM8yq0bVsMAYCRIcBYR
         b3HK0q3k0hpJcNvUUgmD/gCfJ9VLI+eoDuI5GjqtxcGPCqT8e1DV0/83iFVEq1GiPPmK
         kF1Sfe3CH1FcGTMWY9F97QXU9rbtd4EyeQisioU4ZzLRDy+cz2UnjAdmJ+DYzKZyOSMD
         yR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462487; x=1752067287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNmCPN3gRHp9kE1IhRlEIQDYzdEUXzUNt+AYwUzgX64=;
        b=t0BLjDqPKm7qsZ0hKbzcWS5zT0UBvGUo+Vj4vf+jSf+yaeSA5HXD/O2XIfD3ncxcAV
         83VCyNoLgs6gEaEhA9EoS24+7iFmRdA2Jti1io3AgeHArlr4ASIKd8ku75rHSh20qGDI
         921vpzVPtkcI0DlZtUYVfWM9A0Ep1svXLY5qpUNSMEniburYu8HxEFXg0kN9rb/ZaQOY
         WmfjnHWH485g5jP+Fo1O0n4OxOYMf4pufaIObAsp8oZ5Z+kLGDR4vbCRNS7UyWySf1HX
         X5lyRWlaPepBo5HQzd4WXii2xaKzR8IjMQhTXQXZhb1fP425MSF0zv7v0ssq2bAaVuOk
         xPjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzO6X1zx/tT3d//OkiE9hdD7X9nNLl9bDckSUDB3cZn6+AVyip3EMZAJla+xcE8F8nt681TFAMxEROi9Z4@lists.linux.dev
X-Gm-Message-State: AOJu0YwRqSN8rNldH3opUlZhXQD8PcnmtBVR8pptDTkOnu2h7ufc9IQ6
	AXdJ29GPWK0esQJnFrzxjvHT9wKGugi87w3t6E/9LPrHurEqGv/j3nnJ
X-Gm-Gg: ASbGncvOh/MXOMm7SQPd2I9I7eZqsj2plgBNqh4Pinn4Gi13unyF0QF0xHp3xTc+Xac
	CwXQ1yM6sX/N3YlT8nDsUKilDAyF2O3LA7ZO1Tc4NQpZjuBhUAcpDfQ5BPHBqkBQWShDngAT1B4
	wMZR4ZVzJHsLUhfwuJslfX2Ann6PlvvAP5qlwQmveU98/3xI2Uh6eSiUilknyKoH5G5gUFdXzAB
	qDBuzmrmOO03d6C3+cvhdolCVDnCGmy17/iTHyqUhl8z+2oQ/c72AKDr7JnMpXQvrTqE19lZl1b
	nUWi6tJKzDtEgUaVqjXvWIXYKxou9sq6n8U08csYqcDhoJlRI7D72ru5P8xR6vgG2IPfMMXrqkE
	=
X-Google-Smtp-Source: AGHT+IEIR8lRO+Q+RXs2O/NtywQw6YqQSrcQ+z7H9VGv25vo3dLO4oH9KC9oZC3d1SPdav0VZxpsPQ==
X-Received: by 2002:a17:906:4fca:b0:ae0:c8b2:3fc0 with SMTP id a640c23a62f3a-ae3c2b0570dmr301043066b.10.1751462486408;
        Wed, 02 Jul 2025 06:21:26 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:25 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 07/24] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Wed,  2 Jul 2025 16:20:33 +0300
Message-ID: <20250702132104.1537926-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
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
Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
index c4bf1503eae3..6a89cbb2d14a 100644
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
2.50.0

