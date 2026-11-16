Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850318;
	b=3el2SdaKho8qr8yVWXRAEnrpuVLCWrud6q5XLgVqn2aB0TarBOVlN0t6DNO3Z7EJuPmz
	 lURHjM48PDZhOiN9ueo3TzOC/cmQfiu0KDhP0x0UKyRTUTYjC3I3yNM33lea+KmhjMRA7
	 fGPt/fw9+a3dLxy5EkEsJyFVRoF+btKr+oEg/9t6z16yn4Avp/gXo2pe3+BsqQrcYxiO3
	 z+Vaqm8g8sbLrhN57V57K2fyygNL6TUnIzXsoJpi7DHtfZlRy0UFOqVuVtpmGdT/pZlIB
	 itQ2ECEPGT4dphpUqILCKoczvmUh5+/SjS1A8TWC/oiXy57OnFBuVA7OH3pJ3mI+y+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BtzJTBkGllC2z/+DmnD2D5jXx4V+JoeyDI7VKbMd1ao=;
	b=zFvSfWMyZqoTA5FTuPb0xOyXjgRfPm4R63xP5gfBjXksLV6oLUAOgSiBqob3Vjsq45FT
	 slM7M/hiH53Hu9yiRMJeWb7lSXIEy3/7HORwV5p74ph/oiRiItpBsQ9CcoUFNHjjBLbE6
	 6duggJal2hxUSgjuDmSPAG1vXWZpLGU1uoYAyPsbQl7Y6XN3YSEraDdFjkBWgtg01ptGq
	 HGaKxsRB0hECLA9tTGaCPUKL1IZsoRktJkaodm1xkUllAhlly+RvPbjFr/oESCOKBXmRq
	 vVwCoMgjjJHc057muVDk/v41nP2I6z85Kg1H+bMWM7xP/+uBP09KBf3wJWBuq1lKUKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEOUp7ko;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB582606A884
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 17:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB582606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEOUp7ko
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2642100f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 09:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850316; x=1795455116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtzJTBkGllC2z/+DmnD2D5jXx4V+JoeyDI7VKbMd1ao=;
        b=nEOUp7koTG76QXeNrEnT1nPmI05V1jEUZnPqRfGYKTrJtrsf12yvDd/RcAOuSKwmMy
         A9GWehMeGS2uLK+OxGc+9ALRe0FOeXLIe6E+HzImXRpy+cupVl/jfn+5Z2nJjl2wyvtS
         Jez3pM+zakhnoFLpT6xQMtcC6oxV81iyfJIRw8AskCccrq4c3peLQIkmxCKAZ8MM/ZqD
         Nj0oLmy7Lv6/AikwvDDsUETiV7Nzs4YlZyQsl+pvzXKus6uuYHQPTrNhPKzUJc67QlJD
         peBrInktG/kPHAcRHTnRnXexZlObAfvIoFuopUfgsZrdnrz2lDQ+gw0IggV7+wIil7Np
         nQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850316; x=1795455116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtzJTBkGllC2z/+DmnD2D5jXx4V+JoeyDI7VKbMd1ao=;
        b=WwXACfrm+WvERO3SCCwqn6bbXM7JitE/c/oFaUzr/E8wHNiH6K1Ha51gsWygoArcE7
         dRODvggJS8xlfIiuL9wFbQh32LCa2r08BzbDMLVGbO48Skcz3oj7W7QOQ6ryP/xBNmME
         WOWBLxN6sha/AwgXaqt4dv5JiP7gAq6NHRFJZa7QhRGFO6450qBnsK/Pi/jC0kKv7wp/
         m6lm/LWus+O/ZgnK9YmIMFiDMrOJyQtn5jvozLZxfbM5w7gxnaGG8yaVCMfIPVX79Zh+
         +Dz9+Cynx+jmc1Z37zCDyAytpCbpN/G432og1CeT4Ay4m6LCdO68rA4ZbS5fyIJcgi6D
         2LRA==
X-Forwarded-Encrypted: i=1; AL+hErHeFnCu00wNdqljRJa6fZ2+p9gqUeUd4yhJwIvJjYTr8wvnkPkpeqTb9BJNIsVB3tqfX9Hjgc3tf9mt6a8Y@lists.linux.dev
X-Gm-Message-State: APuU4Z+IBKKKjS4LStP5rQMYfYC42kgTd5K+OMKaEqQ4fw3xx3LfS2ec
	WsRUSNhbj+mcGgPZu2FTuSZkPvTBLBPVvaFbURQSB9ZI1u/HYpclN8I3DifphOiUZBXhClpI
X-Gm-Gg: AZFdTZc/yaSDeL1nHbDecKuQW1vSjLDjeQGeXQksrWzzGncckNaVOAU8gTxLLHCQRF6
	Hqf6prHBCTUuacIAXphYIfWsp/pKFAF+cLr+YEMsxXgvC5wMMdQNFihpRypz+pSHl7f7FKHJLRj
	YM9lmoIAGHuTMXVptzDQT2oFEH7Onfej1gNI8qEnMeqM3XJjP0jXDB7d77jZehQRFfZNtoFsbnH
	UXAL/BtUyb4N6eQaGTV/KvElO9iV2OuqwMLF+GBiiz985kAJ2hRFMjLFq1CvWuaY5nT1tPRwwtE
	An4gsHuHAQNHP3j6yNHcSVtcrdVjLWo1p6pQTXoAS18RBiKNgGPnJrOhMzBtFNaQBEwUx04zNXo
	q3jx2pnSV9mlnUcQFstNVXfJcO7bhHrSv19gyx6p+cOOSAuxD2YEx51VX6EcxLNV5G7pJ1uyaYK
	E5J0464mB85VC3P/bAfizxLy5+V7b21B+SEfC1HSN2KDX/AEToW99bD+T4e1Jz/Wzwtk+dsDilk
	IteG5S9XEOcWbqFKfTE3OYRnZk9XuYWhY0f2pp362tuVrgPJS0uoKZeZXvk/KSa+/vhUkfCCTv6
	0Gi9mjnlnGZ7x9uO1IDtlSkKdxn25e55EsIIozG8crvdCQ==
X-Received: by 2002:a05:6000:1884:b0:498:42e3:3f6f with SMTP id ffacd0b85a97d-49c6d63fa5amr26505111f8f.5.1794850316246;
        Mon, 16 Nov 2026 09:31:56 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm24022722f8f.5.2026.11.16.09.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:31:55 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH] media: atomisp: ov2722: Report SGRBG10 consistently as media bus code
Date: Mon, 16 Nov 2026 17:31:42 +0000
Message-ID: <20261116173143.13584-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ov2722_set_fmt() returns MEDIA_BUS_FMT_SGRBG10_1X10, while
ov2722_get_fmt(), ov2722_enum_mbus_code() and the format initialised in
ov2722_probe() all use MEDIA_BUS_FMT_SBGGR10_1X10.

atomisp propagates the code returned by set_fmt() to the sink pad of the
CSI-2 receiver, but link validation compares that pad against the
sensor's get_fmt(). Since link validation runs on every stream start,
the mismatch makes streaming fail unconditionally:

  atomisp-isp2 0000:00:03.0: Error starting mc pipeline: -32

and VIDIOC_STREAMON returns -EPIPE.

The sensor registers atomisp_bayer_order_grbg as its platform data, and
because the platform data sets an input format, atomisp configures the
ISP's Bayer order from mipi_info->raw_bayer_order rather than from the
media bus code. Changing the platform data to BGGR as an experiment
produced a nearly colourless image, while GRBG produces correct colours,
so GRBG is the order the sensor actually outputs with this driver's
register settings. Use MEDIA_BUS_FMT_SGRBG10_1X10 everywhere.

The Bayer order does not depend on the platform: the driver passes
atomisp_bayer_order_grbg to gmin_camera_platform_data() itself, and the
board specific data which atomisp reads from EFI variables, its DMI tables
or ACPI only sets the CSI port, lane count and clock. All three sensor
modes program the same mirror and flip settings (0x3820 = 0x80,
0x3821 = 0x06), an even horizontal crop start and the same vertical crop
start, so they all output GRBG.

Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795, BIOS GWET50WW 1.50)
with the ISP configured as PCI device 00:03.0, using this driver built
out of tree against a 7.2.15 kernel. Before the change VIDIOC_STREAMON
fails with -EPIPE; after it, 1616x1076 YUYV frames are captured with
correct colours, and YUV420 frames in all three modes (1916x1076,
1616x1076 and 1436x1076) have correct colours too. v4l2-compliance on
/dev/video0 goes from 8 to 7 failures (the streaming test now passes);
the results for the ov2722 subdev are unchanged.

The problem was found, and this patch and changelog drafted, with the
help of an AI coding assistant (Claude); the testing above was done on
the hardware by the submitter.

Fixes: 1c3432df2339 ("media: atomisp: Call media_pipeline_alloc_start() in stream start")
Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2a8c3ee77..4d0ab2555 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -711,7 +711,7 @@ static int ov2722_get_fmt(struct v4l2_subdev *sd,
 
 	fmt->width = dev->res->width;
 	fmt->height = dev->res->height;
-	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 
 	return 0;
 }
@@ -851,7 +851,7 @@ static int ov2722_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index >= MAX_FMTS)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	return 0;
 }
 
@@ -976,7 +976,7 @@ static int ov2722_probe(struct i2c_client *client)
 
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
-	dev->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	dev->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);

base-commit: 3fc9303dba01676c2090768126e5327e341b7761
-- 
2.43.0

