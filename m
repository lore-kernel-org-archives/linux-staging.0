Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2954C340DB8
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 20:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187500; cv=none; b=r/8gftcNzMyfBggE7i814svfFcyZGofTTVnh/wDShE3xzMHhjOrrEdI7r9fb/CIpdiQIY7h3fTUZovZSGJIhfrMzaAKkrXQQOL86h9X9/QI19XPBYJiiOXovh2p68dTsbMHWCJ372cpphOCQzekrZY4Y9/sM9L9WmiVfdSNISbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187500; c=relaxed/simple;
	bh=qlDyVSguO43yD+o1D6syNL7bDlNFGJb1XrBv5FCyraM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R68GzHS5LQPpI0KQzq0FaX/zVx3daBQK1awjUbvRWz7xHMPCpWfMSj/5EqA2/dnwxI755J/jECv125A5Q8IdaPUzjq1kuEg4RoLxdUGT/t0wrqHnupnMPvA1uUyrNl3fweEIeQxBPriqPZ0LhfufXSCtRbevHa6ex0P/b44qH2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OROTtEn9; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OROTtEn9"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3938cc204a7so10948661fa.1
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 13:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778187496; x=1778792296; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rR9uqI1Ds3GQSANQEb3RBFKQcN17Sla3ff1JK+seUFw=;
        b=OROTtEn90kJwhB2dcKMdq7jHbC/hoyVxxx3IRXBgAkFqrPxOSYQ4auh0xOARxYQfM4
         T+FivEjouVIrBR9Jc3+S05146/wd8Jr32Is4Yn5/NJNDGY0lgDPN5WG841CEJjAnOh1j
         8LWPh40KWZycF/EKNZijCtfarbirji61SABoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187496; x=1778792296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rR9uqI1Ds3GQSANQEb3RBFKQcN17Sla3ff1JK+seUFw=;
        b=KSG3guc94UIGN+r1POqGmG6fgoFXhvZ/OVcyAsacAaHfB+enkSfRVCsUlHDkialX0b
         7Sca261gishpYvYLL+e6gn+U0CUZ6vC/pQv2tXYVIbWFBAqerv7G7rHj++VZzQPmz57r
         LrJLZfyjT1TaHlOngxKbwnXf4Ahxiso3C6T0WH6Wi8s7wxIRk/MhU+b3960KP+OcLpgL
         eJHOMx5WUgSPP2E9ZGgTMPZggHDtmyeHBqH/DtRdRtkr4D+kjSODKz/5vtfXR8BX6RPR
         CpH2ybMpgk5+TS150eXqDAF1ILJiX0wGh3yqq3nYxobWchCXKEGtkGEkw5lcmrmlhp5k
         188g==
X-Forwarded-Encrypted: i=1; AFNElJ8UHzLHFzd+OhNXY1z2oE2SsBP1Ngv26rB9X0fM0rBqsHcZxZ44STUT7lrIxDilk1A7smmwsEH6uzlIYwLH@lists.linux.dev
X-Gm-Message-State: AOJu0YzbbHVgPj87SzJywexuFlPgU/BEUJn6RVffYJJBB6mob/Dk/I/3
	3v46IMlpzTi6MpS8UGHf9qQX5Io9+bnc/8xXZmWVbiKCx2nPiy08vOjfmud0Tu/FVw==
X-Gm-Gg: AeBDiesJbTqRmL6FOh1HdVpHz9LfQorJ95n2+kJKVZhKCqxU7LU21k+eniWkdsjuuBB
	ZEMIpHyH7J1YWVUXmto8xW61AEkQ7suVhmiZbeRgQyKcEORxZi/Ffo1jRxm9IO0klGFiXktb9Mi
	ij6VzQiBDQnRKtPBd0onnw73lkf5oZ8kBkn28DEZx+L1Bsp2kQKbFCvTJVFrQsJYNwfvUkhoK9b
	PY+d9qXARYgiCmjrSzMMXPSNHUcauvzpJFeDz8xyymTKRiheg1+VUCAeyAtXt0Jt9gJxAsZnsH6
	x7/CuJJ6NED9BNtVbGtJCzKNxrdTnFw5pRg9Fub71H0LMKXyIihcwyYny3IXfpT92oFkzwIBEL7
	uYFLx1Mq3OTCGGqZOj+kdP7mtAn7uQQTBrqTwYqX3V0/koUrvT4m4JG0fkoAmxACMRnr6TQGe1c
	lpmjpSfwSdeQew9yn+QWNdTuYfrzyhtq5al13MUS9jUKWr9T7KAooLuR3qVmuQjXfKWYRRKFvXk
	EvQZ9Q=
X-Received: by 2002:a2e:95d4:0:b0:38e:d870:1db4 with SMTP id 38308e7fff4ca-393c41efc1amr27481061fa.22.1778187496487;
        Thu, 07 May 2026 13:58:16 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393eee53655sm2325571fa.0.2026.05.07.13.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:58:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 07 May 2026 20:58:08 +0000
Subject: [PATCH v4 3/6] media: i2c: adv7604: Add range checks for chip info
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-smatch-7-1-v4-3-cc195f142167@chromium.org>
References: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
In-Reply-To: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.3

If the driver's chip information is invalid we can end up accessing an
invalid memory region.

This fixes the following false positive smatch errors:
drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7604.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 67116a4ef134..ae75982fb514 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3668,6 +3668,12 @@ static int adv76xx_probe(struct i2c_client *client)
 
 	state->source_pad = state->info->num_dv_ports
 			  + (state->info->has_afe ? 2 : 0);
+	if (WARN_ON(state->source_pad >= ADV76XX_PAD_MAX)) {
+		err = -EINVAL;
+		v4l2_err(sd, "invalid chip info\n");
+		goto err_i2c;
+	}
+
 	for (i = 0; i < state->source_pad; ++i)
 		state->pads[i].flags = MEDIA_PAD_FL_SINK;
 	state->pads[state->source_pad].flags = MEDIA_PAD_FL_SOURCE;

-- 
2.54.0.563.g4f69b47b94-goog

