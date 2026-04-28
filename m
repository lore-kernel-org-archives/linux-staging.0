Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4166426ED6
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 12:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380097; cv=none; b=Yk4rgcVKI35q24xBo992UslQRIHp6zgqekYDWxKTHNHJNl/MBGKA0xU3SX852dLkRh5u4ugUAkCUnGiF5vg+e0NVBFyt/2IL/l5kd1BD93z7sJZhYlQeWrI2lduvzoKmv+QlHyN/OjVlfYsbvHlWIkCYQf7V1pjG7UZKs0JF32Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380097; c=relaxed/simple;
	bh=GwGpe5Wt4f65zgUFFPN3Xc69ChmANQfroRnFxnuMqXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KvtGfX9MbUI0yHgM1Udm/NJfOsWQaXmgWJ+EeSUzaNzWx50PmfnV0aVXsxHu9yBgg3mkRxb2iQGarvWjdpY5/+A8Im+im51LCzYaluKqGHWeXvnQXpRutYbNFaKgsIoHqRdOmJtd3F+y6WWqcaPh2zfkMIE7NettNbKq2hoNJDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NBGZJoGI; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NBGZJoGI"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a41099fa86so9991175e87.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 05:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777380088; x=1777984888; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jNyWZOzTH0keZ+Or/bxi1/4rkv0VzTqmw2qXTfXKYk=;
        b=NBGZJoGIm+L4ya7w3mQjehve5WJIc0qRNxRBSTU3PFNdmDKUxYVZHlrLXMwoKKm347
         xYO+2wz8QhPg9/KA1B+eupgK0Hie5brh9Qe/8gCAacBt0R4pseuxVOqKWWYRDMykyx89
         /g6Wp1falezZTBfRlLDGN7VfQ/Q4hd7cuDR8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380088; x=1777984888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7jNyWZOzTH0keZ+Or/bxi1/4rkv0VzTqmw2qXTfXKYk=;
        b=Ew6uTGfdsANgoutYBHjIxreA416FIYgHAwilXBkRzERf7xXZoTSD1RXqELRVmQ2OE1
         9F2kSK+OfcUs2ocqimcH9l85IEfHpGu8bC/WDYnnEA4mkVVbYKQ4zgHIT7LcKOdAtb70
         xgDzSI3n5Zmy85yAGR6JEv57OvrwxrGsCfcpd4Wo1WF2eDBJSCHQlwNWbrDZLXQrEpPx
         /th8QvrS/MhN49APv45vLfMas98Hs2+aatoCtm8hIgW6BerPaxoSDeKWXQyKm/MFXe8k
         k0tMna47sZkhPxfkV9PG8CgetDEJc80/BWl2MFtSGWmRhRaIitmcvWccr0iB9K7AcbhN
         PWNA==
X-Forwarded-Encrypted: i=1; AFNElJ/oP6jIF/JG9S1Yiaa6pp42iHj/XvSxMpdOxO3wlwBRmBZd8nHGY56cCDjGaVjBWU8bsrGuVz4Kui4P8Zoq@lists.linux.dev
X-Gm-Message-State: AOJu0YyLXU0JLObXXbUfry8O/lNbnLl8Ml0iuYPxObjfHPdWGJtsTqb9
	3DLaAZ0BGBAn80oVyZnswBlJ67RBzYcPx9Vl9ywp2U8aa6erNC4bjNn6OgmGHWbSFldKYMVuYc4
	drN6ULWNo
X-Gm-Gg: AeBDiestGV9gZ1HnteGBJW79pOh//EXYn9ixHe9B30bU8M6MNL/e6qvO4vAcNgHpjOw
	CYYOI5gLESRLGYg8LrBZI5RbUOsoJkf/mon/mvJhBxA542TXa0nDZgEQVVYYDUUz0bCggg/0RKh
	ConFbkFcrwpfR64N+Ii6RvY+lPP7OK88S1/6P64E7OXFiboJvwAPiFiZB7rp/WFcYj4QO77B8yv
	CpBCPqjENQDS2x7OrUp23O/ezz/B4g6/HzNHuvaJjgTrdi32Rj/cCaVCr5uM7+Mn2ft/qT+Io0p
	AgC/NPWUC0gvQUz4yCNAA+m67115UXybs5WwzMNG1WUwNaDHo5XyY5SfObpvQqyM9ic29AEggwV
	K/ckUDMq2xjlp/tQV3dGYYBUyeZce1FHEXcD59VacnRHDfvIPXRE1qNHmun4XWrvASGk55741IU
	sw1SSlh8oEUGVCsRZxuGdpi0C31Qwr1NsV1SYehLBKPhz+dTOjGQsXUgn+ntc+pp4RmG1cYKKhS
	/5cQiaoyHssi6SZ6Q==
X-Received: by 2002:a05:6512:3502:b0:5a2:86a3:709f with SMTP id 2adb3069b0e04-5a74660cd3amr1254340e87.17.1777380087720;
        Tue, 28 Apr 2026 05:41:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5fb5sm594617e87.38.2026.04.28.05.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:41:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 12:41:12 +0000
Subject: [PATCH 6/6] media: amlogic-c3: Add validations for ae and awb
 config
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-smatch-7-1-v1-6-46890dffb611@chromium.org>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
In-Reply-To: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Avoid invalid memory access if the zones_num is bigger than
zone_weight.

This patch fixes the following smatch errors:
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index 6f9ca7a7dd88..42d780f684d1 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
 	c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
 
 	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
+	if (WARN_ON(zones_num > C3_ISP_AWB_MAX_ZONES))
+		zones_num = C3_ISP_AWB_MAX_ZONES;
 
 	/* Need to write 8 weights at once */
 	for (i = 0; i < zones_num / 8; i++) {
@@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
 	c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
 
 	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
+	if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
+		zones_num = C3_ISP_AE_MAX_ZONES;
 
 	/* Need to write 8 weights at once */
 	for (i = 0; i < zones_num / 8; i++) {

-- 
2.54.0.545.g6539524ca2-goog

