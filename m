Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002D82DCF65
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 19:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694334; cv=none; b=J4u7ce60g5SPPrh7HXPJmX8EQLp9s8LePVi17fMUhuTI2bTw8/+oT1WT3crIqAtub6RZgqeETI1Q323xJXh7WROyTOpnQIBPqpBADx02cCc8ZLg/6GyKvfu1XAtYSZKOycfMgCdTtrPZFku9ApIaj1IsWaFkPhmYpAcgzACzIrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694334; c=relaxed/simple;
	bh=aqzu2YQ5BXADTBRxOe8uZl+nl0L57XcXnUxXYVOmaf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h9hwJU7RKhWS5N43SW1jJ6BM09Ls+tpDIgl404d9v3oV/ZIJMYJI0C0pqJ6+MeJNRx4NjEQz1PgteG0/dLpZw6pdEktyH5EevyWz9rjObf6MtPggF4Tt3ayZ5mHx3t1eubEpZmZqPLiQKsGudFdikHH8upg2NlIXAoxE4Q2/xmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExLRKnvr; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExLRKnvr"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acb5ec407b1so36394166b.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694330; x=1753299130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gllv4hKSr/Fki+4veRVEUIRWNQMSnyDixgo8cykWBP4=;
        b=ExLRKnvrgsccihMPyCi6xSKFcmpWWPUTTjiDM8GBfMkS/ami+Eb4YbqbuOypdQdcq4
         L95tJZb45Bk6n+fqnJbXB3ddsam8VXPsH+JZGurRynZzYN+Z0Q5mrLqAsMCRc1ql6RW6
         TXoFhq69QxJpgP3B0AEqGh7sC2PbdEqfCQHsSM3h31jqeeOunYzSKeh3OXwSugIJTnid
         mnQn2h22lBjIXeM7KAixKu2B/4/PenTZ/nulo8FgzzfmoUlxVKKH1ZcCKMqFZCZP678t
         fiLP3JKVP4lV2GzX1V1z45Ha4QpRlDYT8YpqZSSUrxeN9gQlYC6qsL+/k1emsa3z/H1d
         Z9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694330; x=1753299130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gllv4hKSr/Fki+4veRVEUIRWNQMSnyDixgo8cykWBP4=;
        b=e6Fc++BLPL/mO7DXm6G6rUZbUsmpbX/JYuuyOal0IuLqGCuEQGfUnh4eYOf/hAIWMW
         UpHTiynMr4FBEwl+IM9DXT4zPbIqV4NseJx77UON1H2RVU0GFUvR/v9LhPB//sYkBaVm
         qJdi9cAjo/XCscDDUr4yL1FqG9P9vYlA76mOSxikQGwyMa1Rva92Fb4FDIkMnQhBfg35
         /OY2LvqpoTn5X3bqsfmFLCAWrnnoWgDNdt3weu80zyN4AnWuUPd5R2rWwKD1qxGgDahg
         s5gn1X2GTHrOjTknrPXpMNmhHTFxBFHmUAFxBgvxPP5E/GqtBWhdsf34/h5Ono5CGBQL
         mI5A==
X-Forwarded-Encrypted: i=1; AJvYcCVZGKEltcRDXZrwHj5jeLbAcbZaf2mg1cZOSiK86VF9RFKnDT3C8l2lrSd8XHNTYWKLlcQ7H5/PNB3ODAh4@lists.linux.dev
X-Gm-Message-State: AOJu0YxAXgAGaRx9yLneFQ/fwkOmlFYgAMgxSzzRoLE712j8GpC+q72u
	fCb0VbvvJwP8FPGvNL7hcYPFGflQ0ho1+9UQAlRoWOrUjsbsUPwIsULP
X-Gm-Gg: ASbGnctiIa75IYS/HYnjkJD9YGKGU5AQtkw2iX+DsHHFjNr4vC8/38A2UKwkN0g/ost
	PX6Ux3Jh5TDzitHpqBkbvUq9wkDQIGSlBun/n8lSICLVUl8Nb4C/bW98d5Yc1XbI5wyaOCWAFZF
	293sjaxIIQX0tSXeBVU3hD8r3tZmOounOEa9ogET/DuTzyoYJ8FrFx1grZtOLVRTITcfE3KY1ft
	qjoAMHksCgTNU04sndYrdbVfpVoYi9yzoV/2xXFkaozqTMNQdcC6diKzeSIdhjdS2CObLx2PuEI
	Wdll3+Hv+QO1rbkPny//XcTYMLe1r63GvMiWnkjPceNDE8PxiwUEfvMyT03yusWtQQ80PlBFrQ/
	zq9e0VX2HzS1M/f1M6Vu6ajEaACqaKANQA2E=
X-Google-Smtp-Source: AGHT+IGSK/v+86lRq/XGVjTJfe2IFdQ5oaZ+aYy4IqTOkA5UDk3eVHHV7W/M2yeRakZoalV61a0M8w==
X-Received: by 2002:a17:906:255b:b0:ad5:27f5:7183 with SMTP id a640c23a62f3a-ae9ce0c5bc3mr288753866b.39.1752694329860;
        Wed, 16 Jul 2025 12:32:09 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:32:09 -0700 (PDT)
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
Subject: [PATCH v6 21/24] arm64: defconfig: disable deprecated MAX96712 driver
Date: Wed, 16 Jul 2025 22:31:06 +0300
Message-ID: <20250716193111.942217-22-demonsingur@gmail.com>
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

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91..6f4254f562da3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
 CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.50.1

