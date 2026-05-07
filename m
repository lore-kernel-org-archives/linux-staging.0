Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA46C3451AA
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187504; cv=none; b=J6mMdA8KsYloq1evFF9CVSWSejmGHBSmg9+3N9udNDHQ+zIloztsrY/vDPos8p9AB+P25Il3L4BXw5G9WOnBfQwcnTayFvgG6u60pYqd5egApOmkTMjK7tzLNNjw1WsR+YEtj7pPyBFZuWRa1iLdwP684PE96qtXYUA6N5mS32I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187504; c=relaxed/simple;
	bh=d+O67gl2GIGylI6phsIj9TBlpbKokc/OVLyxskjLlYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kTTCTi3RHbZQF7BH9jyREXa7a9s3HgdBp/1kTUPUw5cupqRMTzbTMEUS36f8ucbZpZsrwMcLwEKuE56iZFpP4FMwFMvphhNupxBmbYe5tqVerO8evpaMSxvkS62o9mNvHnPoXuSYPb9s7IbUg7W4ghcJ1Yk7Sc1tijpROQfZ3ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EBRZdmqj; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EBRZdmqj"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so10686181fa.3
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 13:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778187501; x=1778792301; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62sCEoVz1H20Bvb3z6VX8x/23MkbndGwBQZwPeDoJW4=;
        b=EBRZdmqjVGUOpuRIUo4nGOyDkSnEZutev/jeKPjkboQ+hAr2HxYdYtVtBGICRsQARb
         dK3btDj5Mh41FIGvRPl7fJOUWBmbirbLPji97x+jihrVhuzp7XUKRK1a9Zwh5kRDtP32
         Q1LEy74tLh2e1QNFeUseT4mYFEJdhS2wK9VJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187501; x=1778792301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62sCEoVz1H20Bvb3z6VX8x/23MkbndGwBQZwPeDoJW4=;
        b=omVG1Karht/0pAFr+ss7qZ/3LjFYOEXglNCb3eQCNxW8/5DKIBc6L2j5k/CSBBdP4/
         1XjDo8xGyY9X/QGov1c1pgd+V8+uEfRxJL3MvzPgkflk3mbtGzc+iHgaZNr6bCdhgoIQ
         hBD/MS2cqxegUzxxQbjhQAS40mQqU+gXM/B4XYWdcPEGHylQaNtSuGp7IaJ2YgOgongU
         D7TLytWcUIxaY7cHUHcojOcjcoqjrWACGJxIOUdbsxFSYR7BlWqd+VCnYtxkcfe17JLY
         STOwh/OtD4p7ngoqD27FUq8jdMcaWk1xq3RThg/3La0Td3qauJ+5io8Bp4KXVxPO+UnX
         qKTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tuaKLe3xQGtJIGsZLCzj0+MSw+iUOe/BI3QPoNL/WiX8zR0q2dRAltGIWXpbb4FTihQ3LJiXug1LNkbPA@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1R/q/U0a8mZoxx0lJLfYdPR8U7bckpIR5z+zVm+8WyGRuRyvR
	kI9MYN3FEaZNtgkqhkIAiumINwZN3oSN6/1I3WdSx0wAh2fD3YvPs6L4UmecssBK8g==
X-Gm-Gg: AeBDieuteEAmalGrNUY9L8c4neiavws5DHi27jdUulJVWiDudZNh6+ZeLHb/g9qhIjd
	nlvD+Pg+Sxb9sLD8sUPNjvXDcuewRC2R+hxso90fF42DFpe/EPqUIxoevc5z3LSyH9DlIZ766Zi
	QRjKsB0BSWUYcJXtkWO6xW06M1xvUGOoTZ5iwG0Q1hAheZKJqtItWyfPR2BdA6ghlPeoMvm9foY
	m4dPUcZodsYoubXEAf8e5uF7Ro4ngWMLRTv8rpIL4SBf5zLQ3IrqrlGB31Nws6H9lBs7ZLpgF5l
	dDXB1b21Ef63015Jvt0TtdY+L0hd0aQK2geGPzybXQ4Irt81KsSgg1VIYQVlbVumaOZ7JKgRTjI
	fve14DKx3nhLa+i/fgaiUJ5SZ3oRwKcvVl0Q8EBKmaofam4ujG5p8XVtwvnuvFaNNWPiOO0NsJz
	+rg/MUuhnhPhruxXURPpIWl+S/clud25wx7ivEc4BgIw0iy9/EGulARYCXdJfDb16JEdscFXy7o
	fjtVK4=
X-Received: by 2002:a2e:9783:0:b0:393:903c:225b with SMTP id 38308e7fff4ca-393c4338719mr27191651fa.31.1778187501297;
        Thu, 07 May 2026 13:58:21 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393eee53655sm2325571fa.0.2026.05.07.13.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:58:19 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 07 May 2026 20:58:11 +0000
Subject: [PATCH v4 6/6] media: amlogic-c3: Add validations for ae and awb
 config
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-smatch-7-1-v4-6-cc195f142167@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

Avoid invalid memory access if the zones_num is bigger than
zone_weight.

This patch fixes the following smatch errors:
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max

Cc: stable@vger.kernel.org
Fixes: fb2e135208f3 ("media: platform: Add C3 ISP driver")
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index 6f9ca7a7dd88..aec3eed0e443 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
 	c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
 
 	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
+	if (zones_num > C3_ISP_AWB_MAX_ZONES)
+		zones_num = C3_ISP_AWB_MAX_ZONES;
 
 	/* Need to write 8 weights at once */
 	for (i = 0; i < zones_num / 8; i++) {
@@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
 	c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
 
 	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
+	if (zones_num > C3_ISP_AE_MAX_ZONES)
+		zones_num = C3_ISP_AE_MAX_ZONES;
 
 	/* Need to write 8 weights at once */
 	for (i = 0; i < zones_num / 8; i++) {

-- 
2.54.0.563.g4f69b47b94-goog

