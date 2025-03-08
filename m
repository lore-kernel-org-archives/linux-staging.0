Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EB120B1E1
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458924; cv=none; b=t5FPkdigy2dBPFBFibH6t2AFrfixHNd5aupqpng+ME+t6sepxmvPO2JjVthkTEnDSjRq2jbIy3saSUGtF6rjXhSCBi3nty89SlWeC/22EMTaQVYMKRMGvFxtPEbCuxR5jCRnAXP3hXt+zBEw2CXCrKR6+L/dSgety9d7PIzthrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458924; c=relaxed/simple;
	bh=ECI+YYqiSDocPmZgoGfiqNbqVHbdsHypglZK4S7zrnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QDev2QXUwWdprAJZbzE7jv7DI/LwM3yaOj3HYM5kUVCIRlAgo0QFZGxjBv2FsW+bcHqFgIOyisdXdoO9S/6RG1JQfoEo63IEV0yOLraRrF6F8A19M5S5+yGdokL2HNyHC8OZBo+OPNRodETeWRS70YxEAD/cPwiVOnkOsRACDb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQxgytoz; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQxgytoz"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abf6f3b836aso455541166b.3
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458921; x=1742063721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baE3FlbyAib1Dal/N03f+Lej7yknyKf0UFF4oZGMBs4=;
        b=QQxgytozX+NCReCLK3BTqSlKnaV6FwcI0gXI1GbY6xP25E/2JmlPCHcTpzZUWlNzKw
         lSrX+B8YnyadhaFcrM33h8s1BkxQHQZ5eaCLVebj8qV5pONiRZKaP/0E73U6uITdrgx2
         5ZRE5+S6MVrtFK9xWgKmxfw5zQiAQ27OCvDuzfdtz/Ca1atMDkitCVqY5u0IouK55M+a
         GCzl3TdKy1py5rcr5e9NVAO6Ae6rTUOq8D96m1XhkRKnY5WxAPTU6iGvq0HFX6upxBed
         aTNC8YPWEaVVkDjKDb02MS/ics6nfYU1XcsLgmRGtGG1QLFY6f6UCja8eCEUKGr4l+Z+
         JdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458921; x=1742063721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=baE3FlbyAib1Dal/N03f+Lej7yknyKf0UFF4oZGMBs4=;
        b=EMaCigldF5nVJPdoYf3hm2QsbZclb7/uwO1UXWS8gPl7Bs/V0uEbpdk7bnBLGlRZl9
         crgVINWiHl97hW16vAFoDRFndzkjnnvxL6JIlaTp7bLDaqTp4+hE2VYtfGfoikyGhC7g
         ftNWEFR0vKU1zDGmyoixgisWnZZMWvrPxQL0onSGLFMOJYEhxaJZwA3poMmblJ2KrEqG
         8e8neKsNi8gfxel2nCoHLfg6RuUE/9VUkGWnQwWQkszLoTifgeBgPKbel483+KH5toU+
         iftfbW+jnIt0Gj9JRApJP295D+7YrdNwZp4rjwn2cgHz/e6tGsdnZokqRY+tr77Rr97H
         RhtA==
X-Forwarded-Encrypted: i=1; AJvYcCVGoapzehOqzBII9kqkgLrcAP+rUUBHkFI4cYvbI0ozLk5M6pkcXTrI6UIX919xWzH5Ag0rJabAe/rYUPTB@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz5kuGBmdfe0y1Jlf8WDnsz+s4LkhHd/O3Ohi4b0H5SI1AIBk1
	MLD8ryl28K1QSybrzz+PNTRYdNNh3rKqm3W8bAfFM9Wq6KtOnC5z
X-Gm-Gg: ASbGncvw9vlow3J5ObU6bbqPwTdofgUOKJpCUh7+sc/N+O3F3C4xUXtUW+0+TIR1oyh
	o9f1hYVkc2YIjuULME/lnlUnRGa2R1/fBdIkZ0VT6vfz55vM838eudhh4Lh/PMH9QLFKJzql0C2
	EsRUZ3jAxCt/WYWEQ/yFVMfETcG76kpXPrCl4n/N53Poq4YQkZolCsOuXpEqk8su3ivoui6Wb1k
	JpvJ2MJhnXfYNqptELWx5xmXYyaQai3Ao9V+l/Tcnv4mGEaCfi/0yeQ9NkD1sG1+RI4eavqGJf+
	fyiOsdx+OgnuzPGdcDGemzLfFxrdk6c6oMrh6HreMeFdEQKzRk18WTXN9w==
X-Google-Smtp-Source: AGHT+IFeoNQFzdeGQAk7Bpgr0BvM/R3lxDF9QM900UyUvrHBnqHPA0/fWbTTYKQNUdbDVHoVSrFw+g==
X-Received: by 2002:a17:907:3f2a:b0:abf:77f3:d1d8 with SMTP id a640c23a62f3a-ac252a9e1c5mr850948766b.19.1741458921149;
        Sat, 08 Mar 2025 10:35:21 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:20 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 14/24] dt-bindings: media: i2c: max96714: add support for MAX96792A
Date: Sat,  8 Mar 2025 20:33:43 +0200
Message-ID: <20250308183410.3013996-15-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96792A is a newer variant of the MAX96716A, which supports GMSL3
links.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index d4055ecf673f..a392da39c154 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -26,6 +26,7 @@ description:
   MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
   MAX9296A only supports pixel mode, and has two GMSL2 links.
   MAX96716A supports both tunnel and pixel mode, and has two GMSL2 links.
+  MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
 
 properties:
   compatible:
@@ -33,6 +34,7 @@ properties:
       - const: maxim,max9296a
       - const: maxim,max96714f
       - const: maxim,max96716a
+      - const: maxim,max96792a
       - items:
           - enum:
               - maxim,max96714
@@ -120,6 +122,7 @@ allOf:
           contains:
             enum:
               - maxim,max9296a
+              - maxim,max96792a
     then:
       allOf:
         - $ref: /schemas/i2c/i2c-atr.yaml#
@@ -163,6 +166,7 @@ allOf:
             enum:
               - maxim,max9296a
               - maxim,max96716a
+              - maxim,max96792a
     then:
       properties:
         port0-poc-supply:
-- 
2.48.1

