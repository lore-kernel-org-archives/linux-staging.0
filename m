Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D465C2D979C
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 19:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694300; cv=none; b=GzDQUeB8dze07d8sO6un/Py+XpPcv6LoR8AstE6LyXMs2xQagfjgO2MIY/qQMNXKWFfz/8bgu+wXg5jC963fLiAdqQbd86DUXkRo12uJ/9mkmaikbFciQrcQ4sPg+lw/QeH5bzcJYp4udBhfZXTU3dqzW1HpY1NyqFwwWVqThM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694300; c=relaxed/simple;
	bh=RVveu7Evk1TPpysgWbQDv8i6qZhE42ob6nWPtfOaz2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQtfhK99HTJSzza86XChQ/1lxg+4Ef/yCQ5uNNJNAyLw/66QakFbNfZlW0hGnv9n9Ds17VSlFq4Y2klVi5p4pk/2veil1VSyysZi0JY4ri+tCZum0UapOpdOTz4jbeLL/KjdabdXC7gkIqZp10R20i/0W5v//mOhfW2DSPVTTyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjY7YZL0; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjY7YZL0"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0dad3a179so30521666b.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694297; x=1753299097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DG2Ojz6YKxpY0UTt6+EJTFAtjpkMtyyp2I7xk76Z7Mw=;
        b=ZjY7YZL0OGhg81IAoDaJwqheFV7B9H4CVoXpvLtnlJp2pW8Ziw15+EUTiyM0t84dnv
         gHznwhbTjooSzZAmP8uhmk4za+gTuOFnjmYIR5Es0iaBaZmj/UV5PaqzqWZUfYnT2mjY
         m8aBYzxtjtj4SvBJD0xuF4xGs+Fu3bPrQIX/NFlqwFGRShh4P19TQ1MNEzo/12mUnBkh
         l6FVz8kHnwUQiCSw0WfAx/x87R79OZmcmgs62Mem0Z0Fas0wbgrv9gRf8bypgoq5Sycz
         tdvshdPCzxZ0vjpwbWZJcmeqrp3yjBgCrKVQ9QeqZQJ3FA2TjXfL5z33KsyGE9fHbSYE
         cn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694297; x=1753299097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DG2Ojz6YKxpY0UTt6+EJTFAtjpkMtyyp2I7xk76Z7Mw=;
        b=jiE7gMJY4l/p1K3OJUPplPj74UtbWiHH8UOT1QT5TKTX/dka0p3ZpF7LpaUKUhUQLP
         6BrxdGeIcHEZRn2MffzHFOA0pArTw+TZwi1X7PBWWYkuCCkgmJRcjz2B73l8aPrh4u7v
         1JV5noJY8+D/f3EZh/k0jjTrPCP+YltB7vaDkL12u4f774FZiqbhSm/7c2XWL8mrUX58
         crZHAEPxRoci0qWSs/0tS9fqchS1X9QugqlnotGwB+Yfcah6ewad68mLgMo9ty2u+3Ym
         LuagUhsyGc+o7aGv5IjL1aOoRkoCjGLWISib+hYCun7stFTJiOSUBdZ9QTQ83GWExMAe
         in2A==
X-Forwarded-Encrypted: i=1; AJvYcCVHw3lrnHsDCdBEOUUr0iUxACr6IjC7heq4PXsz50QsLXJIjsgDMatACXhqjngk5dPExo0kRM3P3okZXgz5@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg4K8EwvOSxAmayPpaQITLus9nYqKhasv1ZXSB+Oxrqqigy1/c
	jvr7yynKLyTdx97rV/iD3tuIx5v5D09QtAvyyA/ecwGnh9EiFHXtt/II
X-Gm-Gg: ASbGncvf/egU57dPhfEWVpZPL9R7qTkBM8sEJjZwGVpI+q761r8+F9z+oBfGuVP1AvN
	HJPN8FK93No1mEmU1nCZmLyN7aW7UviZKpklTvwhp9Fr9ne38CkQXg0xzhcBP+U6f3mvGkf+hGS
	83x7+F3NZ0YwqUGG9QU5O0rjSUjdbED0NZT4YbbeH02FQ3F393DxMgg8MYcpOWVFwCVbwvxGGfn
	6msY6N/YFVIddF9MLrDdjdJl23RVv4KYCUQtWNCHuLmCr5KyekBX6KH1ye57VQYCm47/1sDcb7K
	vRZ+QH0F8ApJxyAyG7m0Kip2f3RP7crjdyco8WKhfI5kpUxTiFGNu6VmtijWyz43nZZyO8Yr0UN
	TIt5fHerU0IsmFOouGaUhCaChoC8VzH4Ba84=
X-Google-Smtp-Source: AGHT+IFHnGRB8Zbsb5skhelScTg8x+HOj/hT5XQA3F9WDpWtwluScncqS5TTowKEUi8eWz6u+e1Luw==
X-Received: by 2002:a17:907:1c15:b0:ae0:d201:a333 with SMTP id a640c23a62f3a-aec4fbea40fmr21957066b.30.1752694296855;
        Wed, 16 Jul 2025 12:31:36 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:36 -0700 (PDT)
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
Subject: [PATCH v6 07/24] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Wed, 16 Jul 2025 22:30:52 +0300
Message-ID: <20250716193111.942217-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
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
index 26f85151afbd3..efdece2b33b96 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
 
 maintainers:
   - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description: |
   The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index e973b0a985815..3117345d0619c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14747,6 +14747,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.50.1

