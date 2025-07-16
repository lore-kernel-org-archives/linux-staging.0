Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D10E28F51E
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 19:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694288; cv=none; b=cRC6EVe7RivfPJh/PsqN79CCq3YoALLxmQqZf1DluJ6zn3HvcdDUFNPfxufRjYVxLe/S5w2581NLpOUr7rBAnRUVe4sC5Mm+EG1UPWj6NV0K3+rqEUcDi1lRSMt+kd+ZyhiFB3F0Ob7dJezKYY9GSqQhDiXcnVBUuFu/JGAyQt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694288; c=relaxed/simple;
	bh=zcLk3E8m6QKZ807ZGbq64IqbDDccDL60ZUVrGYH/xx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TNg0FZxYYA2HydTVG2u85n5Qr4DYdyNsv1SmDdsRtTrUdl0jl1CpY5DEDYUUPej7WIeCFSM/C9a/NDof2nISewNvHAVbA6PXtOpbIkhrFIV57yWcRrhZg0RMRIrPV0kljlOO64TdXE+MYw6Irn1W80hDP9Xy/2X96kq7/85RJ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsPU6NBB; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsPU6NBB"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so45207966b.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694285; x=1753299085; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVxh55aabjNpQwgd6JsidGTK+fKXf2/FtFM7EHjRQPc=;
        b=FsPU6NBBHVGMKd1ZPEkiiPx57UKeTJiVHHulSUc0euoVJD8DFTkxhanv6ThL2tfpSS
         YTr2fOSCnZGnatrb3EqClcLSMwDhbyimXjuZMSdlJy4fNsLooQnpvlkH0YMzueYQLzhz
         C2TPSc4XNz6QkYUI5hZcywNUusodcqQH3cqluZP1A4zWKU62bPig6ba0QRQwYVpniH6G
         q7m8WQXu1PgmZtavmligJDHbvnuec2qGg1+QwwBTEci+oKfdpekvUMFqh2A9pnu+Rexq
         Y1Rtemxp4+kga4rQPU2nZ3ZaMJdcLD/JWxz5p515kIH8Y/t8YHChFAkGfkHN8PI2qHAO
         55Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694285; x=1753299085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVxh55aabjNpQwgd6JsidGTK+fKXf2/FtFM7EHjRQPc=;
        b=KGjRXtCKTqY4KxnKgfnurbO70lgPRW09JcTQ62YwKwj4ZSwsztR60tQ5INoOnxnMml
         U972rSF5+UqkhvcjqlqcQAbB8d8p9ZJTT+yqYqgOJKDyI0CN8KDV0NcBvA+PgtQ1ciOp
         /N6nouwYW64+UCWba45Sj63KQLH3ci44rugNU+nmSSapGkif7edT4M7ieNBYd8usXqrS
         YDYbbMtPyMNzu9ssEApuU3zJ5ajbSN+xWqe32UtxQWd4N+uQ+aakT6FiqGfQA4N6+SfW
         sontDl0pIlFJcEVqXMVbV6NoWO9QMyiei7vOrS9ek2QwnC+tMTcgjSxrEhVznChcWkkv
         zbRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKwgyCO5NiPaBa/uglYBpJqhLKGKX6AhVxllWFlKVO+zq3bBSWZVkiTdFpDUA6Xy0+ETLaVvOfi9+j92LC@lists.linux.dev
X-Gm-Message-State: AOJu0YwyGlGcVZVeCDcJDHwgtzYzFLZOGt//OJyPwagLs+alF1v1wcKJ
	iTRVZWZ+u2bhDfAUaW7znG6VIGkntA8JtuHFNv/FOh3HXPBxpOvv2lvC
X-Gm-Gg: ASbGncvi+rhKe9wpRP6GDsWnd8sv7k8lvYmvUOo16z8mAbc0tSYf4+Omo0Z1QhlmY1+
	IU3SnNmcrfsQLOJl4vY4dNnkywLBWbnBu8leccdlGhYC/yBBWo+JgS+N7kN7cZCUV5eYCR+6fiv
	T4cZpisJRvwUuMCznyynhRo1WUKlDDm2ZpyqJ1fvGwBNGBgLXcvbsLC67qRjkAQMtXsZqjU8nHk
	HErOwfwnHedYEFLc+CyitlpBWGu8ihu3TdPDXu8J9wBs7m9ZzoaokULjaZeqvkLZX/pFD8xA8M2
	k616GFtemepmijiCPuoCnhklg7qte8Y4C/jFU/B32eZc5gCKb6BLuhh0+UXOv894qaDQk071CvF
	GDQkr8Fi2uvgvhsmuVocuKVBvhG1ZRm+iGJU=
X-Google-Smtp-Source: AGHT+IFSA4AiC68Qy08vTumwlbKm1tuQWQ2gsGG9cujoxGVmA40XsWkJjJbkAdrdu2z+pb2qG6iypQ==
X-Received: by 2002:a17:906:9f8b:b0:add:f2c8:7d3f with SMTP id a640c23a62f3a-aec4fbea90bmr19353366b.33.1752694285308;
        Wed, 16 Jul 2025 12:31:25 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:24 -0700 (PDT)
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
Subject: [PATCH v6 02/24] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Wed, 16 Jul 2025 22:30:47 +0300
Message-ID: <20250716193111.942217-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
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

