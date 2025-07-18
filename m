Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41F02DE715
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852321; cv=none; b=IOls2R2M/S+m9GuxIJxxzfMBhkLLBdJaw0Arn2FSttMmNchgIkTvtpr5qf3S9azv79YwN7aQPu5D83HCuDT/nmdyVudSi6922ZB9il4yqahM0T1RV3QFOCUII1KLNH3PGM7V4YtvMlq998zBiQ9P+aDF/PukDNGM+Mhiiv6XBOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852321; c=relaxed/simple;
	bh=zcLk3E8m6QKZ807ZGbq64IqbDDccDL60ZUVrGYH/xx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGdJxqJvsyOQx81y7nYqEMRShtHxcCQZnMySODNjM1zQ7Yc4iHXIQ0M9rK1vVdPj6tZkUBEua+sykXCdQPvvkmjw/gb0oC3TYbl8vBwDWStstSk9s+xqijpTzesO1nOCOE0kjZrliQEQOjzKHTjQ6nGYz5GRPkZhwNuy1KvTxPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeeoB7KG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeeoB7KG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4555f89b236so20224545e9.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 08:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852317; x=1753457117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVxh55aabjNpQwgd6JsidGTK+fKXf2/FtFM7EHjRQPc=;
        b=eeeoB7KGkLsrHCCY9C/vatL2hChC6w2b5ZU17D3MNWijrvU2SASLTszkF91CH8Wcvu
         K17Ck2RoIRNqxcnJzz8Lvp5WmHx8vqtdEsxDE475SwV0rRJcrW97i4znj6xn8JShU0I4
         CvU55OgSkKI06QFFXIBTbu9vfJqUojnrrYdmcQwHPnLsZ1cRkPW8rZU9J5+OVD9WrjsF
         RetmnqQEGQJWEomxDtvZSuy5O3QkLYGxkFw+PIWSsKCUKjN9DVP+NEMYzHxXRwoKCLR1
         pOGvv2ryJ/o0L20VxCqP9eS6ApTnPdnWz+xo4Z7mxh3G6SIO3ZchuP4GzbyKXu5Uz7NJ
         NqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852317; x=1753457117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVxh55aabjNpQwgd6JsidGTK+fKXf2/FtFM7EHjRQPc=;
        b=FbgAelcbg4yJC1HJ94YToPk9eeupL95TBX/lYDSgiCCEBi9wQ/OSfNyT4m1c+RcaZa
         itAEzXa+UN3J4UYzTpBbuof9vhGL8LhuZJEbMjRvwtKW8I0VVirtcHdHgktmcFyjnIYE
         /saqPTe/j6/1ILyG9Qg6qii3OTSbDdZh9o8G9B3Ydwf3Eh7+of+q41KEdPqjj1b9wnN7
         IIbDrYwymIbuhrNDgcR/6FK2OJx9OQIdFJ8G+wQ3k/gB5RdxLGbIFJHxxNGMQF+/Zpus
         bM1SSt0Qxb3391P38pZKL7gHOWyz1mLeKKgARJvKF2YiFNYKdOl+mUfg5UEA0FihZznl
         hXxA==
X-Forwarded-Encrypted: i=1; AJvYcCV4kGrlPk13RuN1IEYXJ2IJlv+FBGlpmUayW2lmnGUeUVkxenYFpScw8aoC2MEW4csw7eiikJ1N8hOYPlrr@lists.linux.dev
X-Gm-Message-State: AOJu0YwB6q0/iB37SFCb8u7yy17Nu9+R5F+RJeUcarpn0voxlkxQBn+Z
	MnSqhbLX3qp2orgZtqu+BNwRgBhUvC2zXWIv3OF2nCz/buB4csnsWw8Z
X-Gm-Gg: ASbGncvncjW7tpvtaetLiGwjHSsXhOCtZram01V5x3fs0t4pJudRIVyq9vh8czuTRC2
	x43t3cV/zVbQyBSwgWZt3C9ntv/ffD76jT6qRQPlZC2DKxk0+ZfYkToTEPkEjArgrISGrJMKrZJ
	NmGtRpdqGTtSi8DMNzOofa/GFzkzuWklIGG+JXYoVsHsrI9lukjeO9YzzceZYuILAAlNFpA5ox0
	YRRXBmEhB51Zu+GkusypOg47MfphtJssjKWIT9K3VRJxMNqmZyV06gyt57phngKCmO0OJYwulnU
	D1kHVvFetECzmi2i9cNBV0d4FVU3lCkChg63HH3cnf9mtKhT0gwWd0xAG6AvOcz8pZbXeHDTAIH
	lAS1G4H/71lhwbkOElas97tUTTvzjPpaKkfI=
X-Google-Smtp-Source: AGHT+IFxyUdRfZgEPkM7R0qNHuzdLNKFoTZgeb0mz6125GBptl1i6RQm1WyjXllR1VirPJEl5oAsmQ==
X-Received: by 2002:a05:600c:3e09:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-4562edaa0b3mr116293185e9.12.1752852316906;
        Fri, 18 Jul 2025 08:25:16 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:16 -0700 (PDT)
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
Subject: [PATCH v7 02/24] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Fri, 18 Jul 2025 18:24:38 +0300
Message-ID: <20250718152500.2656391-3-demonsingur@gmail.com>
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
index d1e8ba6e368ec..15ab37702a927 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -9,6 +9,7 @@ title: MAX96717 CSI-2 to GMSL2 Serializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
diff --git a/MAINTAINERS b/MAINTAINERS
index 24c557ee091d7..e973b0a985815 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14761,6 +14761,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.50.1

