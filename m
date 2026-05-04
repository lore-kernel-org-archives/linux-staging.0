Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F442F90C5
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 06:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877663; cv=none; b=c7FpsusBAZGYlrcBcUSSZTueqDI22rFV4V6lJjkzvpHrbf1TVw63KWjMj0B24PUjWa/nwlkOI5MV7pyNkoIW6Zu56HOAWsnKPVcNFjwPOZgDm6fgqNIdnxBzrbSezWVfbhxJQQwQ5POtMJCfrWlJu4SLwYroUHCPoGRzs/LNE8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877663; c=relaxed/simple;
	bh=maPN0uAGh5T9TmRwUDufwkMVbmorC5oANIGuNmwR7ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gHZhTFRXTW4ue9WJdzXQcABDt0+BA4LzNBRcK8rc/kNwtN07yyh+BtoLMlTmCFvxuIuVsvVgwCxItF/mv8F5UEW5CKO2Rp7X2Mv4fzU5Fp4TrgljpuBVv8wTg7jXL9efkB8pmCw5ztZFXF8IVWr8SWg6SDX9gSnjhuEBzWI4KMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ht8Iu5WN; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ht8Iu5WN"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so3410605e87.2
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 23:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777877659; x=1778482459; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kcPDoUx1Q/YaISrAn+S58ePlDUIO7Y3t/DDUcj1x4Y=;
        b=ht8Iu5WNsLHXnVnWkQa0OMW+DfzpwOdjpxt38bJBRPP7w85ttuWktBSFgSAy0cCz3e
         6GMINU5FC0BvJHJhP8F7q1Erq3MChtQUoF2ZkOjCNkPVmxGXFStrWEXDaHA/xMZWGGkB
         CtbK+tzjeGshqzqnaYHVBP4dvYc97je0KAkKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877659; x=1778482459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1kcPDoUx1Q/YaISrAn+S58ePlDUIO7Y3t/DDUcj1x4Y=;
        b=OZn9Z16ygTT1VXPTLOQvyXSIdq96cTI5KwL45RdxVihtBrti8BnPJSAPSzHyYwukOu
         KnDPfecd4w33YXKtYmOaGJd6EHJK/h1mWDEuVhwdzUwnWLSPKn+PJQuAemW8IpWUoCOu
         mr7bV0hEmU3eR1mBFm02Bj/xMicz0BkQ1WgjZC1IJNf9INptqV5MUvgDvlZf8W8dy8ET
         FpWi0Hsc+q+t5hrDYniyrAUYToaZ/mjid06QpWxEuxLiOP/06f84prnhEJDGITlNBsvo
         mhtHx5I7RtZoYm/kMZrLe7/nb7IJznKH9yAkb12cgATMvXPpFb/vVpAMXkGAxAKUJLQI
         Qjdg==
X-Forwarded-Encrypted: i=1; AFNElJ9h/63w9Js8sdib8LA3nVa++XOLEgbyVzUHFkx/dYfBhaCAdO6kll/kpdgxS5+ZSoX4wV3RRYYSca+3jjZD@lists.linux.dev
X-Gm-Message-State: AOJu0YydvueHs1IoxRIj9rLKXobDr1y5hmyQXkhZrTvesZrWhVHOdTWe
	99FwVw6k8zr7JMaCgnL4DCI9kXob18DG3RPYJe9AvHmEYJsQwTQZtg19SstcJXbuIg==
X-Gm-Gg: AeBDiesbBmBrtL3WpAUz83hCQXvXErt/zM7E6g2g9VSqtN0Stu/11p2ukJlJAihV79K
	LQhNdv8eWa3ym2KFifCPBAD0dgxBA4NlpMbHksQ1Rl1sgJ+hkXRQKicyqVwWiF/VD6MnecqXvD2
	Fhqw6MOMonsZgb0k73g0MBTLsJuQdRmcxa7Nb0Ikn+iaTMs8bl6UlL3KnNQvz5DPU741X7Q+LWw
	uyImTeA89WKYNGhiC4eLf0ZXhPy6uhXnKFBWa3s+onoyibhCuaAd1TYf4z4Lmgi/XfM+v1bM+eK
	03eK/Ymal4rntzs2HvuzPnSUatLUQoEKhR24VVlTJSz8kG5MrilULpgW9a06EvEnFMacnzLIfa+
	UtgX9dh0bAxY/dC45RqcohfFEPyIbe/ec+7Gvq68XVLvce0DGD7aaRqawKVsup4jdLHKshEiaHw
	7VKotxjDXhQ0+uqHZUst8IDIGWGy5UobmRodWykQva6ZV2iqeNmzGcOZ/WSVop5YZFYdlz9QnJj
	OKy5Twa04MhHQUqXw==
X-Received: by 2002:a05:6512:3da2:b0:5a4:b2d:25c2 with SMTP id 2adb3069b0e04-5a8631bed57mr3075056e87.27.1777877658949;
        Sun, 03 May 2026 23:54:18 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22e1d4sm2674579e87.9.2026.05.03.23.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:54:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 04 May 2026 06:54:09 +0000
Subject: [PATCH v3 6/6] media: amlogic-c3: Add validations for ae and awb
 config
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-smatch-7-1-v3-6-fda125c30058@chromium.org>
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
In-Reply-To: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
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

