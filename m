Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B529D285074
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240776; cv=none; b=R69grjMZB0pPKcfzcsfE0+bqdbKqdL2POIbFoD16EQVAqRSIgCeqCdGJ6ot3z0YmbBV2JqQDIxp7Vj+OhRROUov3KKiCBKhgcp4sg19Rz8xjQjEArBYfqPtRFDs8P2tplRFPRe1uf+Jicg3vfHcc2fP2WrkNobq4lW3/HL5WXVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240776; c=relaxed/simple;
	bh=OOn+Wgmm12j8z65b2aVXjeWeYVRaBZ4GDMPMP9p092Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kC7EsItj8nVcFp4+97BunlEYR6vPzK80L8slZDIcOfWQ5kOoFGKdz8/5PO6F2SyiHMveR4ZvWBl95qlkWWydoJvXkgVO3iiWSfTYGXQaFMj2rSfRSgSq/UnrzSH1E5Aekh79iAce6NkD2BF1hnhXxynBY2MyerlwCzuygUi51Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyo2M/SO; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyo2M/SO"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso12217594a12.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240773; x=1750845573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZM7v4p+xV5gPJJpmqTWsdUNvs9q2qx35L0HvHBeAlV4=;
        b=dyo2M/SO2z43vcqoFaPs/vdilVYuMw8blsyhHPVh6ow6uQF55r9i19r+9hb/7zdYL1
         4adRIu2pa9x+Vesf+M9KSGLVe2X8wr4fwlE10J1vLPv7NdKq1Qm80mc4rlyXx6O7jgqE
         iPnSJgtHwo4g7UHi8LIehBqUAj3GbGsMRJeyKs2CDgPYHhnCq/DeyxSzyH44eCRJ1gQQ
         IByQBN8uit9LGz5uIUMx1IyR4lxG5i/u/qVrxgPImtGmvOu9xGCQKK16fo0oNQ6l9G0D
         WY3a/WusqU5Zz1nGVb+uG4sHK+8vQbE3YKYYY8y8khKNNHK8AsXMkhhazdYgvhbUTLud
         cfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240773; x=1750845573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZM7v4p+xV5gPJJpmqTWsdUNvs9q2qx35L0HvHBeAlV4=;
        b=lmGlJJCtf2TmEiTpyVezwdG0ohnqO7Qf/CBjddTmgRD7seOVKeEbBIJZAOgq4kjuk3
         YckRZvPlkGUnIxi+lWiz6TU+wSVijb0OXwU9AwFzr7RwOW7O9LzlHe7MRJVontgs1wYS
         Sjdj4KF+tgjNUC57Lv4TzGBI6nTb1ZuuVdIyMhwxZwLfqb/28bQNOvgPC/jPJPlOqrbg
         qbI/ZAJppvlZbKISFwvN8OY0xJNVpVkdRafmy8p0HNFzmle0kImHhkYCj9fEp9B4bKMO
         YEWZLGuIcaojzMkwptH6FSpgidaU+9B6myHV7UwgbaozZPdS6eIc1cKzN3bik1KNPJMk
         j2bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMHMRAfz9eMxabUGhW8IkoW6MFjmSRRGup1GrgF8xfh9Uih36dfcy9PxMvc3+IF8fAlAIJndTmGAwepBhV@lists.linux.dev
X-Gm-Message-State: AOJu0YzpjNTgd/TDdrAj/dcKx3UKqjZW1wpkPS8qC87Pg7CfrLZ+48zE
	taMgV1BvILgCq7Hx8wT5vyEwjPcVjTdASJv6ob4OKsjoxzYcU0u2kk03
X-Gm-Gg: ASbGnctuNBywq8YFf9pL+E2xPRXXGEnBpDU3GPVYZTVO8YRXgUBROjYT5a3kUBnIycr
	Q0uIsbOaRG8BkTTwQuykPvoDR0LTRf+iy8IpJViJ5yu+vk+ik7cu3RWa88kjbPkGQndiG8ROkuN
	PJgWnYZi0wm4LEIzcEnE492pcRBI8RHlTsKQUuay78jPAIS6bfoOeMi/v7JnZiRZ4La2w3vqRA3
	1WevvwxgqtxfaiJajjp3LOXAMAlw/1ByJ/3iQSGP01WA5WrbuyXfpqHAZukNTA3JWtHY7vleJ5n
	fDhRBHzsauCwkl3wYlkW99OtWs3yv8QyCeAMO7aTnYgfRfV1gcGIWI2GFzk+hqUS5R4iFrx7Wt4
	=
X-Google-Smtp-Source: AGHT+IF1vGugdRmxmc+EGSuEOAkqel6fu0udIatnhRPXHDXTkY8odVb+a9IZeK6Zi6Cg/i8OjJgchg==
X-Received: by 2002:a17:906:ee87:b0:ade:9fb:b07d with SMTP id a640c23a62f3a-adfad367b40mr1540072866b.4.1750240772740;
        Wed, 18 Jun 2025 02:59:32 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:32 -0700 (PDT)
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
Subject: [PATCH v4 02/19] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Wed, 18 Jun 2025 12:58:38 +0300
Message-ID: <20250618095858.2145209-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
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
index e8f3dc93a569..01363fbcb9b3 100644
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
2.49.0

