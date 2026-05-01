Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E64533A6E2
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 11:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777635184; cv=none; b=O3oFyPKCsxNvuPcsRNtoqGe4iAQaGHlScgmPzjW9toWmMyQROEw4e1ZAaALumz6qYiZKGuz0GLhFieUzV9nkoflOUCJPKGwnLEdqdM3nQOCq9cc+GNwFuygqTkqBNYEtJ+F6jlkInQV0OIiFPFFOz8vVIYVTC9S7+S2ehEQjM9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777635184; c=relaxed/simple;
	bh=fM+EOez8tTjZWMaKaiEYlL+/TS0+1cDYerp5pGjy9hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bLpltPA9uhQAMXbZLT5k29RfiZ7fwhKgvPOgXhd9Fe1f3lkNnwFEX6QjNPcUCGHoeesVBtwDPoP4QDj6vcSZgmCXosxNHKYFyW/8U5AbLY88KvsdfKvuV1gia1VHS8E5W/ybbgEAbrPk8demW1J3GLzpafiNNPKl9q4gIJv38zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eQjx1KVq; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eQjx1KVq"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so2053015e87.2
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 04:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777635182; x=1778239982; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu0V+UWGhKofbsqLMuK6FkwiFliyODBO+j8A2mvjt3M=;
        b=eQjx1KVqBIdhjT5IpaokSh6MzBRcPgJgKcEurW7HoTEg2pi/Z2tRAUq3ZqAUyWwH+d
         kJF72bmZDti8idgoys3ZZDN92ib3enCHmaSizYS6fJnx+B9Ur474JdGCDr4KUU6FCNRJ
         Anq8JsCzFcHt7Oxroo7FiIhsf95U7moc1z7pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777635182; x=1778239982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iu0V+UWGhKofbsqLMuK6FkwiFliyODBO+j8A2mvjt3M=;
        b=SVDCH451ETWxnxthXYiVI7dArPZx3d5/5RONcpLdtnFWOhdnBbV0+SXuyeTGGG5Pfg
         S8LjF3Ijn+oq7HtHT5QmdUYpuCQUjQ/q+OEdwciRMCBaE7guNApQoNwZyxwp8Fw6KD2i
         sEQXfs7OIG/j5EFRqfqi//lCAUayJxcmlZ26LHPZsByK2rGY+bqSaS1Y5xw0dALMbkFx
         TXIN8h+TxmgJbqEhfzKLCzolhW3n652Ld2QYOpzVPIPS2z14slBogGkjOeuflIbRDgkH
         WEmFIMca1bEoj7HvCW12mXbL/ePXgWDodkyHwN3grxYwpq4vGrsFJOx1Dnr2Dq8PwP0T
         Dn7g==
X-Forwarded-Encrypted: i=1; AFNElJ9RAyy6Rt7Z+eD2G4DKwx/U/tYeXvvS4V4lBjQhyoBxPnRl2rscyowmGsXRLO6Jv5A+Z2bf5UV3v3ImVNd4@lists.linux.dev
X-Gm-Message-State: AOJu0YwA9oWJFsJMn28L+hGwCJch94Jf1utdRchaO2Sd2g85xjkxnP1f
	qhvq+E/P2DggBe/7pNrEkXZ6MLMJTtk98UrrEcE+tQLnvRhozMU5EqkHbpcpzHyW+A==
X-Gm-Gg: AeBDietUW3UFJRO25Bt8ooi73EnKTqvD0oA9plcI6VS8c4SJTUK7yyQRHKTkaAHv34W
	y2fzIuw94ycaoN3xT6nZ5A/oLX+mOMSbKGQPrOSypH5KUht8dqwfDmNcarclzLQ50zPov8/A92O
	sEGQK8mhbpNOL2EA4ac/FegB+c2TtlVMRKgpXr671Pu6oQ0dKcdb3zpMrAurJCgkRfmcCQdaBAi
	OH0ifVrvig0hdlPNZVu7uS5AbjpKcn22LXLm181eylTZTj/a8YnTYvxffsPAovkWNNzPxNHW+TY
	bhBQM11YV1akA0YlThpmhtZQyYomeW3158+28SzKlDi3smsZa09eCPlYbwLdmVRur2uRItOfgTj
	xfKpB7TkPoFwLUwnVDjiPy1W3lX6+VVXimp48fvO1zjD4sptdp8V5HAkVcX5TcMWhpOfHdE4TMY
	eOmXj2+XHxYk7Bt/AaM2UCddozEch9rjx6Gq14VKrdocykHo58hnM7KnD5+jzT7SnIEBmZtEmRc
	t6OW5z5ZnR71+ma9Q==
X-Received: by 2002:a05:6512:1095:b0:5a4:1add:c56f with SMTP id 2adb3069b0e04-5a85aeabc17mr915710e87.36.1777635181622;
        Fri, 01 May 2026 04:33:01 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346c02sm429166e87.74.2026.05.01.04.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:33:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 01 May 2026 11:32:49 +0000
Subject: [PATCH v2 4/6] media: chips-media: wave5: Add range checks for
 dec_output_info
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-smatch-7-1-v2-4-a2fcfb2531ac@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

If the driver's dec_output_info contains invalid data the driver can
write in invalid memory. Add a range check for that.

This fixes this smatch error:
drivers/media/platform/chips-media/wave5/wave5-vpuapi.c:588 wave5_vpu_dec_get_output_info() error: buffer overflow 'inst->frame_buf' 64 <= 127

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index d26ffc942219..f77abd5e122a 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -584,8 +584,15 @@ int wave5_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_i
 		p_dec_info->num_of_decoding_fbs : p_dec_info->num_of_display_fbs;
 
 	if (info->index_frame_display >= 0 &&
-	    info->index_frame_display < (int)max_dec_index)
-		info->disp_frame = inst->frame_buf[val + info->index_frame_display];
+	    info->index_frame_display < (int)max_dec_index) {
+		u32 idx = val + info->index_frame_display;
+
+		if (WARN_ON(idx >= MAX_REG_FRAME)) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+		info->disp_frame = inst->frame_buf[idx];
+	}
 
 	info->rd_ptr = p_dec_info->stream_rd_ptr;
 	info->wr_ptr = p_dec_info->stream_wr_ptr;

-- 
2.54.0.545.g6539524ca2-goog

