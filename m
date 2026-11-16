Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851536;
	b=4UL0HUECIAT1G61XDAJiZ+7XJDzV5iMfQ7Gwo5F3JR2Z9q9NE1HZiFbxG6tgFqAQAqH8
	 ePPT3rCPSGgAto6HY7ShavSFKRH26GCT2rRv8bIrkdc20/AvQnvzY+mqu+V60TSPcU7nm
	 AgF3vBaDId5N+RUnj1AQSnNGs56RIutrM5PkvfaKSSKVU4mGWTpQ/2EaMHP0COPVb5wNz
	 mRLYTzlvV7htjXd1LUC/LTrZsDa3BEuubvPtSUVjd30eUeWb4nvjVLdRgvthVSHRUoLR2
	 v8ZjuNhfIOvaWjw+wgme/dpu+7wIqwS1p6Y+qbd1ccS9LBj56RmJr+XgRFJw2sHoqTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qY3Sg/JCmnJPeKpitC3p5SFp98fK3Xr+Qc3dOamC6F4=;
	b=E9XqIWPv8cUGQxnPQf0o6Dxv+c36s8/nyywR9F9b3h8L9vgnXg/4Lt8ulpeeqKU/HnTr
	 CiEmsJRnKI/z0NFfH1chiBb6h+iEtk6RULsk/dsqq1tLzTOBfAUAWpXK4AV9ebSWOE6E1
	 OlHxY1I2hq8nwMJxvEoUBXS47vFId/802ahk6iHcYWysME6s/wYSXFxfPhJXPSXgtRK7w
	 zdUqXWFpbsR8coJy3MvRA84eJBEGtIdVBCFNj5r/GyNFiF+s6xQM/Df5k6en20RP9zSHi
	 75nhLhq2Rr5P58YrDRBc15u8vzvn21f1vGQ2JNsajmGZXzVOvENcUCrYNaQKJdFH+jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ngtb3BcU;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91563606A88B
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 17:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91563606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ngtb3BcU
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so13871945e9.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 09:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851534; x=1795456334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qY3Sg/JCmnJPeKpitC3p5SFp98fK3Xr+Qc3dOamC6F4=;
        b=ngtb3BcUi4fdUzOcWOxDFi5C5sFf7aBcKvWoAo4XCdmkXl320nBHg1oeoiqWOhUr07
         WYYAwNiWQBpF3NbdQFGQUsXEuCOnhg1QN9E5lmLeS/CrWWxtojRKPUQNKU8EfZw+xlo5
         HBqoi4sfARKHPxh+Eceftyy3NJqvJOCP/3TqP9dy6E7oHj6tWmMtgzdoPT1nBQG0MBuT
         15945oS+SgZWvLmOtcTiGrkv0riYld/7LtiyZRYD8fW9B/n+iyE6C7gvC1toz7am1CHr
         5KnofwyescMEqoUkn5GilhOS6Hgu2hsEDRLtyGi8KCz6V3xezMwzXG00c+BUm4bgTJrG
         AWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851534; x=1795456334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qY3Sg/JCmnJPeKpitC3p5SFp98fK3Xr+Qc3dOamC6F4=;
        b=U0oGykXWDzibaC/3vD7Tip1z9MFbqV5OqIqxseQtMJgRmod5L4RpttISxS6ND6qCtq
         YswyYto60BHezP6YSzZ7UiY5lYcuYlx82yF8xkNVAsYR7xiHgRuisiLA411lQ0mQUUub
         gMxuOuGwl30p2KtpbVJC1OSx+v1eGM1uUQeVqPnhSAKNSwq8i3bKJrohwK8HaMo2zxcB
         VgDb7lL1Hf5sfG3L/GePZGeQPswCaOUFtWtxpib0VRQyJs01AK/O/3Zsze0/gqGRd5Aa
         INdRals9+oJHKid1zJBVrWbuwnO9OYWvubpAAdFRPaxvzyp/L4g+abaEEWMGVa3SbPWh
         Epfw==
X-Forwarded-Encrypted: i=1; AL+hErFtBzsKRgbSAdGuBuVI5RHbZhptg0nQIuQztWHFOo+5AB4K1YBgUaq/RO0eaeFJ9XBqkuTWyvG6C42VAmgi@lists.linux.dev
X-Gm-Message-State: APuU4Z8pp6kw+efEmqwvhKXgic/5m8O+YL4vwkS9u+QC89yZc5QHqfYy
	qdx/dxq0Ttxr1ZMzP6HgNv2foiDXh+yNV/5iMHMRL/2bOgE3KEPbJdbD
X-Gm-Gg: AYBFou3pUKe0IiRbKUFrEHStUk/LNX9wcvh9lyCgIhYjwm5QC/7qgbIGDaBqvRwnZDa
	z69U/3dkfQdjTmk8BI9t+mPZUmXF6D9BsZmRC3Lzp//qB+0denrgN8WD4lBYFTCw6y7WXdKOCYH
	AnWTd+h+SG9jwHxt5zaRo6QzOhfoKPfqWm3EFtD6bODTTTU+24kYd2jNN4MgOuOUi8iyobs3d/k
	SPc8uc98+bJuHqewi9hf3+qx8GOP/IMLWMnGFppNiECDlwSl68QFowySvzNz7Kikk3VvQNBLule
	XB5T0uzSd/07JaI1miqfyau6p2BZwl7aMUYQVWPIYCixgX5RsrbwFQ30k1lQRguoM3BqKgLXJkF
	ry9FE9oyu7t5h+FslkEgU7tic3y6Hgeq2aYYoKsocfjM/agIgylCmoCaHeKRm6ByZ7HVS+/pozX
	tnnewy5JXwunA0E//OVLT5XQeA5E32mAywYCigLn6agYbSUlAsAUOT43MpYSmAQf8fPPTyQVfz3
	g3Vt8WSYkOgpG4rYEpQ65teHzeUSdCL7bUBA0nBZ7e6TADhXxt7iaISihKB2/qdeUZDk+Yrx8tY
	NO1X08HMqfwc8U3QicehLldqYG24Bz2xJnK13bZU4jC5gQ==
X-Received: by 2002:a05:600c:b86:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb55a67c61mr252740735e9.26.1794851534022;
        Mon, 16 Nov 2026 09:52:14 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm4546075e9.12.2026.11.16.09.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:13 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 2/3] media: ipu-bridge: Add Sony IMX175 (INTCF1A)
Date: Mon, 16 Nov 2026 17:51:50 +0000
Message-ID: <20261116175151.20150-3-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116175151.20150-1-volodymyrchapman@gmail.com>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ACPI HID which the Lenovo ThinkPad 10 (20C1/20C3) uses for its
Sony IMX175 rear camera, with the 320 MHz link frequency supported by the
imx175 driver, so that ipu-bridge creates the fwnode graph for it. On
this Bay Trail machine ipu-bridge is used through the atomisp
csi2-bridge.

Tested on a Lenovo ThinkPad 10 (20C3) together with the rest of this
series: the IMX175 is found ("Found supported sensor INTCF1A:00") and
streams through atomisp.

This patch was drafted with the help of an AI coding assistant (Claude)
and tested on the hardware by the submitter.

Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 5e419c7b9..880b06d71 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -94,6 +94,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
 	/* Lontium lt6911uxe */
 	IPU_SENSOR_CONFIG("INTC10C5", 0),
+	/* Sony IMX175 */
+	IPU_SENSOR_CONFIG("INTCF1A", 1, 320000000),
 	/* Omnivision OV01A10 / OV01A1B / OV01A1S */
 	IPU_SENSOR_CONFIG("OVTI01A0", 1, 400000000),
 	IPU_SENSOR_CONFIG("OVTI01AB", 1, 400000000),
-- 
2.43.0

