Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3280A2E0407
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852328; cv=none; b=LKiX8aHy5UjL3DfdW0nhbpLa0kQr0N+cMZfs1NUHMRGLRl3QVJPApNtbjRmwyBUGGD7WBfkpliYO/Y+K9BayIXiUNSOoJsi3bKBgxnGlGbKAkXnrawXQh1u2Q7rW7AIyCFOdQUD3mlxkcRjAM2T9+vEe22ZxTyQfwAvz2RKLMLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852328; c=relaxed/simple;
	bh=yFTG/+IvVw+bzb3MnGzM0TmgGas2u22oztjAItw/ZPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LmJtAULtMCUeHov4FlxLQJxfKSj7taNdrefOZhRX058QaS+34Rm5rjCHNaBOpMvw3V3hyUB7urYRQK/FpKGn83R0wsHpc4f03oUQ1gaXE4f0p798DQEtlwUGCvl3sntBLvu3nseFAaJjx+Fo6NGrWwfBHMJUzdIhLr4NKBMCbxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgDw5Pm3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgDw5Pm3"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b45edf2303so1967765f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852326; x=1753457126; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wewY8zDENwwbPbKmIemi+OnwOyoDCjMzJlIPnG076OQ=;
        b=jgDw5Pm3q6nSjDAdKIMMmK7a1ybwHxUSBw6LwnyIIxorG05oHYYM7oiocoUHK/U8F8
         9GGU4zPRPeLVvHOgybFEx2uAuSr9Du5U9OwR6Jx88QFpH21UvyJJhz4KMKzIATvpaee0
         2DwROZBG0DupD172vCFR3LR1VfaDeIp5WPn+bYCpbmcHLBa4yQGHpeYq0iYXy3Y7xgYF
         gaxgHWaSc5BOzeO5vfggj6KKT+3PPez9lhzNGvZH6X9QNbUqnVWYPaBaizK9gtY+J8cH
         67jFZA+w62e8aulOKziZGG3QxwCrrXVv3Yr1hcGYZYlaYB2++0MojDONj4qqjxSg1u2v
         YoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852326; x=1753457126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wewY8zDENwwbPbKmIemi+OnwOyoDCjMzJlIPnG076OQ=;
        b=li9UldHgSg9m6k4aM0m+c8raCIaWlSIi4ZPhf4M5FrWADRPPyvQ1SmknzKWaTh8y0O
         ipWRemJquudMuCp3XtGbQgC2iLE+wIs3P3U9T9MXdXpJIqd9l7ZnP2G8Qk8oypob+n/n
         JrYuC4MYtrgZ7nhPGh/4SHsvCO2AdhVkm/V6+BGmpeaBBist7cC65msh/uU0hWkbKRPt
         d/39u/bayQidL12LMZzu6ZoHOK1y15bONrh2ABRo7LxyMU7gPGiunwqlml4lAd0d0BMW
         BKT+RA2Zmk11O9Q/cA2r663It0DaCSjn0GmcOoncAVDiKu1HfOYRx90u5Af7QOFCeRVn
         WTHw==
X-Forwarded-Encrypted: i=1; AJvYcCVItRuOTYFLEhxCW4s82DkL+tdgXME7pCWj6Y21BIdK7vFwWMqvTma5mjcChUZIYWUoHhJsW1PMFZcrrdbT@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6cSnV/0T0pD0Dx70aJM9T3EfnAYlSSpdHa6wTS5Wh0sqzQp1F
	DPufXgL6HoayfUUhBzQP9I3N/S1PVsB5g+wmzrhuVES3I/9IjGfWpM9k
X-Gm-Gg: ASbGncvmuvq418ab0leL3rqNNCCloMuuRu0YnxZ0BZwla41qpcRIRgwQOBbj/5fmQc4
	A0dyhr/6Muq0Ak+/WYF4e+vfef9bW8sYsKX/V4x5AuYH5n5Hcf3p97eo2RfjjMQ3kwB0ZSrso+A
	J3NFJR1Mxfaeafx/PLi0L2L+HZ4Le8imyDrcVh6ydJCqh4lfiJtW+82z2NEPpGyhFbrKTJ0ERDp
	VW1X9UgjaJ6yr0eZB2VRlxvUbU8p3H2CD1pW/j8XiganjBJPo9BOzgM8z+127geFhCoUgXWd2Hn
	2v8EFJAzBb7luFZIk63KiWOwTcXRnejVsVN1lgPeX6GVUhoTOnQlwmh6WHY9613CwmKRjpGFm6h
	+/QjIZgd3Oa1dIPro/3f1GvXWauUmxZnE/m0=
X-Google-Smtp-Source: AGHT+IE57tXda7EJpVP1rw8lpnwZGNJ2JrkTW5ITWytpCAQC/qr+BkMYkue1GB1N87LJiGAHo75/RA==
X-Received: by 2002:a05:6000:1449:b0:3a5:2fae:1348 with SMTP id ffacd0b85a97d-3b60dd886cdmr12074749f8f.51.1752852325423;
        Fri, 18 Jul 2025 08:25:25 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:25 -0700 (PDT)
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
Subject: [PATCH v7 06/24] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Fri, 18 Jul 2025 18:24:42 +0300
Message-ID: <20250718152500.2656391-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
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
index 78ecbab8205a5..02a44db982852 100644
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
2.50.1

