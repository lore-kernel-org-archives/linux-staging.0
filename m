Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5576B2DBF47
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240793; cv=none; b=uabQBHcG0b66QWSDS4ljdMbr0c+vp8mZfwSNTeFJBkv0cBJ78Lg54VC0m7/AkCgN8aofKdifKRKuuDvCWB/I1HrS/tzJoH7cGbsl2GD3Mq6KfZ+gR11vAxHryzTU3XXWqud+/rottRAj82tuL3QJUBAtbNZWQzGq09VR+znEZuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240793; c=relaxed/simple;
	bh=gIyaOL/GH2nwn0BYIMfsTgulPERxN4X2Ld4ChyXRgKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWXyYRyD1Bd9VDgF98ZgpBsAAyYhCnXVX+EEoaUv5u6P6aUKFejE26NV0pAOpSVG60GFXH17xuskcD7uNlDD9pKsCRSgn91mvXgR975gJNEM5GuqczFNwxKaZHlm9jbh0fK5us/BF5encHKjE4xxgZBCTlXU15/BtH6mpxeZTjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpNzugke; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpNzugke"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607c2b96b29so13163974a12.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 02:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240790; x=1750845590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sX2+2gdHzfIqMHzK0HUE6rBPOILvK+9cIYaOod1fnc8=;
        b=HpNzugkeg6LWJB6l48a3IXAv/9Zj0MQ2fBf9mr3LH3QESP+XRAvVwijVtpHExtAWgX
         AeKzbNBGKCem9mlP+ebGfPPVQbBQQuSl/S4ffoYu4kd2gB+2SYo58lphTADYnMXpmE1W
         K0mwyWuROD3HAa2PBQMHYySa/HWjC66NTmRtPMqGZy2Hyf2ex2tSH81+HINrk2tHZGRe
         wvFVhRCDoifmvlDfMvAQ12Gt8k40MN+LUA+pWRMn8Wgc+Nfm/zsP49LO5jDPCoA1k7l+
         BI2WaR/6Xdd/B1C4oXYUR1OSI3ZPUGL19CdoiG0bhJY52WvBgXeDEiBtsJjzHnHkPqd5
         kiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240790; x=1750845590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sX2+2gdHzfIqMHzK0HUE6rBPOILvK+9cIYaOod1fnc8=;
        b=iGvjsHyhcpLPKdoXx545qujMIOUdfFa/1LWS3cEvr6Am6Gs8BQwyk+FHheZAIO/CT0
         9TBUOPQjh+SfRo5REOPbi2cSKxrON1PMRQOSZIIILeTxI8fcc20H2MW76dO6nCGRPW4Z
         jrzpumBNWdpTed0c0U+29KqMz3sYN4zRsTtBO3jdsf/ItJOi6NJXcqMg1zv7rJJg2/mA
         sU4C55sTO5NvjhBMWWI+ZH9c6D3ujud9Zvi6IL8KS0r2hEA+YOuidKH0uMPvpqLuPiLC
         yVoeIeGia5ZV6r/7+pjLW6o6BpGXVnhtRTnJ5WOtBpC8lr85UuiO9V2MM87/flsRLuR5
         NbhA==
X-Forwarded-Encrypted: i=1; AJvYcCUnABmBXlimXGoV/7gFGqxQ00EbSZmt49K0KgMWq/q1NZPUvnV9qboul7y8W7Z8FgS9INqU9fTJAI+H1EJ3@lists.linux.dev
X-Gm-Message-State: AOJu0YxqYkGzHdBgAzcBeezH9ybo1RDt43OU1LubjktDxgZNhDWN/DXr
	GzBLFuN4fq7IowumAVL06cWNe5DWCGUmHDcdl0dmFPsdrvajNq8+rTIp
X-Gm-Gg: ASbGncuQ40XQJvlrFZeKv9vfy7aTkpB0Ca3hYfD7SzYZsy0G1FwVAlduBrRE5KfGMCB
	kTRcfsD1DVL12ewAYY94grsK8u24fOT/vM2LxikEWwbZ22SxBeBa+Oiu74IslAbDuMveKvk6/Uz
	t/8l4Xw6LUUJ+7AGhlD7IWkYmDp6h0SKKKpJE7rNaMafKXI5amHVlYmo+dcyP4pKyV55ANuqxyO
	J8jgNWBpDsOH2FoniGficV0w1RmCYZh6JM5eS8IgOaqv/Rj6atlU/NBguYOKMJX4+Q9qTVwqDFI
	iTEDjwRuWaOI8tsOTOfZ747a3LyjZkCHdTLpOC/xvvaz2wcX0lOuvruJBGwAaoFkE1XoU5KcTPI
	=
X-Google-Smtp-Source: AGHT+IG9Ltz8OOKzg18kmieWDJZRnteyY4BMf39tj5nKgAg4iI35WEGx6FggKsNK/B/tndtnp7aXlA==
X-Received: by 2002:a05:6402:3552:b0:608:4945:ca47 with SMTP id 4fb4d7f45d1cf-608d09486c4mr16001513a12.17.1750240789542;
        Wed, 18 Jun 2025 02:59:49 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:49 -0700 (PDT)
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
Subject: [PATCH v4 12/19] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Wed, 18 Jun 2025 12:58:48 +0300
Message-ID: <20250618095858.2145209-13-demonsingur@gmail.com>
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
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921..f53c72e5c572 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -8,6 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
   - Julien Massot <julien.massot@collabora.com>
 
 description:
diff --git a/MAINTAINERS b/MAINTAINERS
index 77adb1f7ac9c..423ef18ca693 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14736,6 +14736,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.49.0

