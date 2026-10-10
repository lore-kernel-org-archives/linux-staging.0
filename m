Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955A637B40A
	for <linux-staging@lists.linux.dev>; Sat, 10 Oct 2026 04:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791608372; cv=none; b=or6RjA2UnuVLaenNJJwnhYKJogqb9I0ZHNXVRyuQl41DdWHvJuJWdoKIYxbQdphK6T9lfHKUKUgKazRDn+jlZqun6X2GAlyuulnF5ynpzYWy6r0aRUk9sex1AME5zpcaXJz0vPnpFIZrzWHE/po8pjBf89v6t1i2L2GVfWCkK48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791608372; c=relaxed/simple;
	bh=j1wmvJil2lJCCEi5mxhSqR7Ez4QAqAByUVbsg+6GTDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dE7CoiREEeGM3HQ+Q4cebSmZOdiR3Uog4/OVgSDUgeq66dMqHAewjlVqkrkgNPIrf8BNqDQS4O59mR+CXPvwZtjeI0dASZLDipcBSqWuK+C0x5eo4VJJ2C6xP3ZxIZ8jlvWX1+fW1t2lkCduzLMtrHhEVj2aNV7/7lLkAxCmSZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=vzp4EqdA; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="vzp4EqdA"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5350c1b9e0dso4841351cf.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Oct 2026 21:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791608369; x=1792213169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kal90amSbaRMY1YFdpgEyggfZOCC11kFyumtrLhWcfo=;
        b=vzp4EqdALTxF+TGIUYuoVRIbJi9W/QfCg7ZZ14NSC+qumK9kd4XX9b/NqjbDn8R4KW
         QKjs48brK1uIUf3+4iqE9/6vqL5GA/PLZfW5pN6VlzAyxNGp7wjyhjY1D5/zOvTAL8vK
         AKRWPzimUZFlfTqV7QIcEX2ysWeyEeqhAINI4TVG/NOUa5LJyDgENg6G00F4Ikx5QSDM
         W8x9kf1T5ex7/pxULgoQXm0M8BmKz2lH27c2WxVKRsMwk6hPL3z60HoiBQRFUzUqGtDI
         mdwGD1U8jHcGfuuLXpkoyWaZmW02hL8xLluu1p1PfLOSk18QqTImWaJWnoMklBKzlUOR
         Ximg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791608369; x=1792213169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kal90amSbaRMY1YFdpgEyggfZOCC11kFyumtrLhWcfo=;
        b=tcVzbC3lRnSAnqy76DUeWg0dmhXe0H9Gvjw3EDjQr/8QDzp+FLqHAFKybwATHOEHvX
         ch9SxQfWR9Uh8UYH0YPFxM0FNLM/bfX1nCZj//qqmmSkEix1/U32VeNesG5wG2EAAwwD
         bi70S/rSNJ2LaX+R7/TjFAGFYEV1h6lfSRAXO61FaO64f7+lutTlHiwGgmXTsd1DlOCT
         SD8XFxsUOL0G27F/6Bz5nJ2qUbwo06AUh6wCqpltRYy/b48cjhmiy3b4+Tw23qdsiI7u
         p0nc3UF6SchA3suA0jkCc+pS9F0EA4Ww5qSmrwaKTiKYALtNZqlbY5wVroWMncGvIsR6
         TDjQ==
X-Forwarded-Encrypted: i=1; AKwUvByVZcKfrtJw0UMv2jzIgYDsJNPQzXG7PjiysiaURMlxVyM9dlew4YfOVHgrBE5j96ZD90RtMgzi/URC/Atg@lists.linux.dev
X-Gm-Message-State: AFq9FYKb7uo1+F8RTKZx3n2a4jrTh98yTMPt9IIMbh8LaFuj/gFM1iD1
	Ttk8EsNezrIQjfujs/onYQ8ZzmvNcMRrp6M05fiUWeI5AwMBNsZ7Aj6BsT8AKbaHMHw=
X-Gm-Gg: AYBFou2mhkr597zR6cZJUJqtDRObFTg6hl2rBswbt38OChK+PivInB8unWDKVOabpHt
	S03q79QxvKUT0Md+b2+5g2p744je/EHoRwbmky8NHEh7/XfGbX6bx1Qho1D3CBL0nUkKLyHQ4AJ
	cPAB3wcTybip9N5InJYFPSdMy9Rz0VePm7D5kK0w0WgIxifP+76/ixqIpqc0JHWHisWm9aHkoLE
	6OgLODQ0YXw3TKAIzdm2/5/Kyo8CTT/Y1axPlNR8DBK3vAjCJ5hGG0aNXGF4atw3W6Og5fJk58W
	vPh1kDELPXkbtysi3fTubZ+TmF+uliIixhF1Rp165FgEQW5prb3TjMSlBM+apUBlgl0dqnVkMGp
	ubY7W6IqRW+L6gwEdhPNw3VYiymSrMMa9AwAHuIHcOiKtTBoM4+9Be6BGRDLEVyeQyzUmVzL+gL
	kW7KXgzyGrHBFMzEXYa0qazniOD7W+UswqB5x2DIWfW0Oh3903vgKwTEFnX/1zRCtVY7C0v9Msu
	+iLBiQqnAHfNcThe3DlR+YETcQ90540XTH1JVlMZGK7uK1266wLSWvM0cG9/t7w2g9frid+3hXJ
	wN2DRo2gPOAolv3hjQ3Bi3stJOup7KoxU//CCWTajbrIe12Ay1xVdClD3j/+C+e+4Z7wgA==
X-Received: by 2002:a05:622a:1e12:b0:532:c057:9564 with SMTP id d75a77b69052e-5359fab3627mr63226981cf.23.1791608369574;
        Fri, 09 Oct 2026 21:59:29 -0700 (PDT)
Received: from jake-laptop ([153.67.39.44])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550887ebsm35827736d6.33.2026.10.09.21.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 21:59:29 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: Ramshouriesh R <rshouriesh@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: staging/ipu7: Add 10-bit greyscale capture formats
Date: Sat, 10 Oct 2026 00:59:22 -0400
Message-ID: <5423f57000600f27626ff785f80f94d3e7ad1106.1791608336.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1791608336.git.j@metarealtyinc.ca>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com> <cover.1791608336.git.j@metarealtyinc.ca>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSI-2 receiver sub-device accepts MEDIA_BUS_FMT_Y10_1X10, but the
capture nodes have no pixel format that maps to it. Link validation
between the receiver and the capture node therefore always fails for a
monochrome sensor and nothing can be captured from it.

Add V4L2_PIX_FMT_Y10 and V4L2_PIX_FMT_Y10P. They use the same firmware
frame formats as the unpacked and packed 10-bit Bayer formats, as the
ipu6 driver already does.

Tested on Panther Lake with a Himax HM1092: both formats capture
648x368 frames, with 1344 and 832 bytes per line.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/staging/media/ipu7/ipu7-isys-video.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
index 8c67308..8a7c2af 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -54,6 +54,8 @@ const struct ipu7_isys_pixelformat ipu7_isys_pfmts[] = {
 	 IPU_INSYS_FRAME_FORMAT_RAW16},
 	{V4L2_PIX_FMT_SRGGB10, 16, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
 	 IPU_INSYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_Y10, 16, 10, MEDIA_BUS_FMT_Y10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW16},
 	{V4L2_PIX_FMT_SBGGR8, 8, 8, MEDIA_BUS_FMT_SBGGR8_1X8,
 	 IPU_INSYS_FRAME_FORMAT_RAW8},
 	{V4L2_PIX_FMT_SGBRG8, 8, 8, MEDIA_BUS_FMT_SGBRG8_1X8,
@@ -78,6 +80,8 @@ const struct ipu7_isys_pixelformat ipu7_isys_pfmts[] = {
 	 IPU_INSYS_FRAME_FORMAT_RAW10},
 	{V4L2_PIX_FMT_SRGGB10P, 10, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
 	 IPU_INSYS_FRAME_FORMAT_RAW10},
+	{V4L2_PIX_FMT_Y10P, 10, 10, MEDIA_BUS_FMT_Y10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW10},
 	{V4L2_PIX_FMT_UYVY, 16, 16, MEDIA_BUS_FMT_UYVY8_1X16,
 	 IPU_INSYS_FRAME_FORMAT_UYVY},
 	{V4L2_PIX_FMT_YUYV, 16, 16, MEDIA_BUS_FMT_YUYV8_1X16,
-- 
2.56.0

