Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD863947B7
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 11:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777635190; cv=none; b=RuSRO5IYhLP9i+1liOVsEI4rgNiRuURNfPbPdQR/FsUVq0jfhDDBID1cdCvQUJMH7xY3xaollKxxWj1vTO7mKbiCNwQr9AiWmWVtf/ynMUEhMTQhQm3MVp7H4wzuu8MnAxKrrCf4nskef/AuljadbFZ/qlIF5SCHfkk7Kpya2Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777635190; c=relaxed/simple;
	bh=maPN0uAGh5T9TmRwUDufwkMVbmorC5oANIGuNmwR7ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ODBFyNIL3SJVsd7z+3lkZgmhg0DGJGnANIgdcv3YowQTvRgOfl61h8SixzfbwazOdQysih88v5mRDY9y2aQVKt7U8ZMVDF0UDYeKNcGk/zQgazBLJjrErGgMRdQ+lNsdFqQlVnf+kAVIY9COe3ugLTh+m5JKGb++lt6hChrqVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BidNw9r4; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BidNw9r4"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso2016491e87.3
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 04:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777635187; x=1778239987; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kcPDoUx1Q/YaISrAn+S58ePlDUIO7Y3t/DDUcj1x4Y=;
        b=BidNw9r45oyQDj/CsJmw/ckONFa95ajArynrNO3o53CiCIbHi4HLeT9cxYVGakZ7OV
         SGNd3alohLd48HEw1YaVkVxDtteJY/4gJbFP6d23M8A7/1nZztEE51RKI2QtbhqYva5f
         INgdrdoQTt7X2GhFMNDTbAHKT945pYwnf/2Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777635187; x=1778239987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1kcPDoUx1Q/YaISrAn+S58ePlDUIO7Y3t/DDUcj1x4Y=;
        b=WevLHmt8zv73+D22pTjBLriIQawgiq1ta2PDE3SOQZxChj0yvULFTK3o17UVf33Rsd
         z+ChpoHzMhlzwnWs9fpPYzylFZ9VJtregVwo+uPNwu+PhIYQ7Nx2Q17d79ylY3dqveM0
         kvsxD16q8p875x/CnMycthL0ArzJpMqO/JtJMOo7H177STfbE8rgYi6E/BhybFAyaHEY
         7PJT+mmOPIsz3A7v42kBx8AxdD5SWKCWdcVeJhVhWDMvqSepqCLcomfRy55/nFjTBtQy
         Z++sE6094HhwYWIktDP0Dvq/wcmRPOsImRWk+l7IjLX6mUlMJBF2o1m8RYKSHmG+2g+P
         TZKA==
X-Forwarded-Encrypted: i=1; AFNElJ9v+T8BlqLMc6Yhcp6Jz6TXOlfUSDyFNoiNmWXB5MDBB9w5IsRpyvoq+7qGQnWzIz9fnkwuDNEmnLxHlSXo@lists.linux.dev
X-Gm-Message-State: AOJu0YxPIBqNttZI4ToWX1cu05dp3cfo53Ij+xjBsL6vFPwYRxw+7atJ
	7kKo7dMJ2zumbhA7/CK/lh6K+YNv7JRaPqkUtHjDNm8lCI8eUsfZZWYh5PQQNzcXvw==
X-Gm-Gg: AeBDievI5IzvJiKNu5WayEQliVdwsAmxVSOD59HkRW2evDwhgxLR/ukubh9uK8e+GTH
	FEWH/TT7GuvA11jIQ0HBV8lqTwii2tWMD6SBcCnSIoamngr+yFn9vTyaY00z72LuTAWxVG/Ft9R
	GLXK5h8RC0EwjpKb9XW28wXe1R/pHHUDX2uHH5D0a9d1Z3fL3g6GuqClKjrGnpibgiFeLhzEmlx
	ak8YABLwbO0iPBnsLCVjH8XO1de2Ak5fgLudwf8iF9bGYCySGis75E/KW8LQ42aMCix7zvk5JKg
	VOqkr0ODuOchirr9Q0OW5w5p1QBqcoJFQzDgqMxVVVA/YxNCSEGYbpUBdD4raYjJIdl6TRone3H
	45c+CaRXxZk9QyEBJXNTcU9CuxohYpj2Z1WBiMp2x9gevSGnbwWj1Q/eNNGBHaoPPlw/R/bj+AI
	EmrCur3PqQ1keWEVO5ttMInf3V7nvjrpfbERqZ2gcc1m7+8VuXDC/TCODL3pGO+7eaE/sX5rOgF
	H7X4pvCTKPFV+d+qg==
X-Received: by 2002:a05:6512:10cc:b0:5a3:cd94:df73 with SMTP id 2adb3069b0e04-5a8522dda2emr2212355e87.38.1777635187389;
        Fri, 01 May 2026 04:33:07 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346c02sm429166e87.74.2026.05.01.04.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:33:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 01 May 2026 11:32:51 +0000
Subject: [PATCH v2 6/6] media: amlogic-c3: Add validations for ae and awb
 config
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-smatch-7-1-v2-6-a2fcfb2531ac@chromium.org>
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
In-Reply-To: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
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
2.54.0.545.g6539524ca2-goog

