Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EBB27A134
	for <linux-staging@lists.linux.dev>; Wed,  2 Jul 2025 13:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462487; cv=none; b=QyUYyMxla5p0perKZNEEHVSgFXTKceDydtueQtlnX/VD4Y5xDkl3kwD2ZiwEWShQfINk5LyuI5t41wmKTcGszT65N936KKT/5juoyO+dNWQOQH4TQr3mzg4bOp2NToCosOb4MhsOYS07fIswtHwhRTeOfGcByuUs3kX4D0qBiOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462487; c=relaxed/simple;
	bh=h3Zw3p+jhK/y/UgGvWRiSJ+KmdCa3CBYV5h0Z36Ikjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QZmwHHTYVTMcQmj9L2psEparskJUIYtG9wriACpVKKaixD8LYwMRao0kivmes0CIpNkfiJe9D87rQWkXNrE0BAAk87S7T9JpgDJ2v+H5prpGLxaEOPfYdCYPwm6WqCPWfeGIlb19hsxhVxq6Tg6JF+temJHlUEHtQjLHkJL48u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbuwSJQq; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbuwSJQq"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade76b8356cso842850766b.2
        for <linux-staging@lists.linux.dev>; Wed, 02 Jul 2025 06:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462484; x=1752067284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Utu49gZ9ZdunlufpSNh+aHZgAg6knuxu1sYPi3U69A=;
        b=EbuwSJQqkf9KN2kueD/2kSTcwRqWmo2uCfHKFiyFbpKrIU8zvusUKAgj1Aqt459bU6
         Vefm12HOtW/eUKjqlwGaVfUNO/GARER/Q5axa5fsH+tQOBHedP3FnnWCL6RO5Ih7sLaz
         B6zm/BInySI6mk8N+w8uGGpNrO77r9THNhd+i3/ifqyVuJNIwmklBtK5mlGlQgNVeUOi
         cSjHEaTt2KW7omt6XKUTtX1/7cllpbyVlABY95ZDtSqDhmReLMLsSRvucW8Y0HOd5CZP
         bIxBV7gv2u4pTWPdU3tlylxkgIlq7riIRu7oKq68BjdJl4FTigQ2D7g9Xg6fAPzIztuA
         e5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462484; x=1752067284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Utu49gZ9ZdunlufpSNh+aHZgAg6knuxu1sYPi3U69A=;
        b=o/b8uc52znkcwGAldxWpg4XbWpayZWOfiGEp0PzhS+BZLSLL24EmBnPVQPc1FQBRIK
         DnYJ2lpqNOxGFgsx4NHeHRjIhgcESvKTFADPvNZPO8mGStDaVv/1q5ZtHUdajCyqL4xf
         ctVN75uUJ7xb3Qibu6i6wA49KN7UcMhG+tzO72dBXM8ibEjfel8OV83XgbL1qMacBry4
         Lp7fnx42G2bubdeO+MhNPQ+hhCHAaqdITMecFkqvBFrAbmhv05nlb9eejP6nQJQ83M/4
         kdx/JvZ7G+GZdyIQxvvM6JOu4jbAWIXC5cl1dayyih5i0/DCI9Isvn6MeuALJholTMi3
         pqHw==
X-Forwarded-Encrypted: i=1; AJvYcCUF5C3UAkPuHfKqI5ebYHESD2kZgLGTEltNezGRQzzo1DRmhHPAxfpfOlI9zPOwQEP0B9IMCjPEpsiT9Q0J@lists.linux.dev
X-Gm-Message-State: AOJu0YzADIcx8Pg62/ruimxPRJpVZCks+8iEb9nPHVRekO0gWTEyCoxC
	CDUyBRqPawM5kzxEpfstSH47AcYtfaYw8rJaa1JDpmQteXXSJoBZeLOc
X-Gm-Gg: ASbGncuTCkk+8JsEAd+sPhUHgKLtt1eSXX/0LtdNEVryZ6uLt4ex4EccaJ4x3aD7+vq
	KU9YjX67ncvZvPTp0z9yR6uYlS73JMVcsTghmTEGFaDLGp2fuN23QrM7Van8I08SrS6EQc8FNRP
	nCklwAIWDaAIncLNcN8f9g57LHGm0W8UqaYjg9T1MAYmJqQ+yhgJ4Y7l5qW1aoxvZFztrSYyg+q
	wrB8s+zM9MgP/21mEpMt3//igIBnIAoAdklCz7SLxZIX8ALwA6ArBzrK6i7zKZDMLyFakYPKv9l
	kUAhb4hxt71wtHS+UsjlduaNSwrQuyQpOLn4Mm/WnC0Gd7Wy1CmmtWT7ulCrOjF/WGRPPW9Pvvc
	=
X-Google-Smtp-Source: AGHT+IEqn7Qm1Pzei4IQRz8Ezf9TTzuTp38w4YNOcsq9Mh7+jeMr6GzuX1TetleMO9Y8z6HK2C40Sw==
X-Received: by 2002:a17:907:948c:b0:ae0:be38:64bf with SMTP id a640c23a62f3a-ae3c2e668d3mr292897166b.58.1751462483818;
        Wed, 02 Jul 2025 06:21:23 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:23 -0700 (PDT)
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
Subject: [PATCH v5 06/24] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Wed,  2 Jul 2025 16:20:32 +0300
Message-ID: <20250702132104.1537926-7-demonsingur@gmail.com>
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

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 78ecbab8205a..02a44db98285 100644
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
2.50.0

