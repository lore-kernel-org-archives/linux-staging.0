Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0EE2E62A4
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877658; cv=none; b=Pu0nzqEKbcFP3/osByxbLdEGlUC2Ri0QdQsSRBjTxrkQDD8tWi2suC45TLKgGvFiCMrX3b76UJpogYYMNvkHiBYIHakFyXfk7ISyKmNM4Z6wejm/dKveAo+UibOhMT8E8hjtb4N7c8JZVA7UICgXwWRdwo2JF9EaHMhCHCqN/w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877658; c=relaxed/simple;
	bh=fM+EOez8tTjZWMaKaiEYlL+/TS0+1cDYerp5pGjy9hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HnSpH1LzYTSJQp4muiB5gLw1qHYvp5qr1KgZDKzpwuZQsxZX9LhyCJdDHC9/ib5Oiijy5yIMw8FRdXhw0MrF7U5vl2Cwv7cBZHPfsFPYR65IuBDJ3HEY8U1OpvlTEvDKUHMRb4Mu762Nq4nTDX2ogP3H1w+25qtv6+JYHYUZq/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UhOtfcs9; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UhOtfcs9"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2b636b944so3831220e87.1
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 23:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777877655; x=1778482455; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu0V+UWGhKofbsqLMuK6FkwiFliyODBO+j8A2mvjt3M=;
        b=UhOtfcs9ua7tu4yos6qJrO+AsbIxATxp5pivLQOTH2P15wZ7Y42BD8elEw7SWwKnHj
         KcgXI+VJUC4z+NYHNFKjP/gQDJ6NvTdWAe0qxPIJYxB/hlqFhtvNLWhFybfpQNxOuMco
         AuV4MaZoi2XtApOIpGGnYSQvKCWLKeUomKqUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877655; x=1778482455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iu0V+UWGhKofbsqLMuK6FkwiFliyODBO+j8A2mvjt3M=;
        b=IUAVJAKKrSOy2WInj+pkQMn2jw7WKKqMOJyPm0cgDDDjA667pz/bSepetTuNzg39Vc
         FRxbARhcq1VNqq4o3yLVX0ts9gIi1sYlSjN6nFLqfoDB4WwHUZjZmAu3Zsmx0qkhkO3K
         k1hOaZc+dl8kwjrkGNu5HpptTPTs45H7us6tnswtYRfA6gYz1SXCu14VJyOyH1jbqO58
         ejsyBhUpGxu/veXssg9wMWyxzzG5GXM4MphNsvTLbONSxQjH+RN5kDO6Ro6TvBOD5b2p
         WL7ZmLA/UPEu49d7Wgbr7yMRpHuXyLVbn5sgJzxM5y+Oyq9A0XrSmhiH1rTyEASOhYN8
         JFjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ItpMLRTdMRhaTnMVCf1B3KhrIltVxQCO9CIXVORURgoFVfYB8NMqoHndpF8rrG/MpttcEa3I0QGixnjph@lists.linux.dev
X-Gm-Message-State: AOJu0YySasLKmZTvXDymk2cgKhZJiZufAKOGblvxxc9IHBys4NcvmL6D
	AOpoD1Beq+fqlZEoe2bGuhhSm6uK2AhOx5F9l6NpM5o+PEnAQYKdmU0l+fAHFCm/Tg==
X-Gm-Gg: AeBDievkkbzOPLUitJ8B6KRg+jOlxbJbERYwuvnMfgUkgAOArRPADyI6yHDWD5LGahv
	bI7fmxczJoIm6udnXeaSuf/h62Sf/o+bHGqlZdQx0GRSI+/hjcJywC/3ElB2mEOZWrB2KJeU0Vo
	qmNXSAsAC+Ib2KT+G4jhf/bu6j4HTYcnCQtwnzew9zvAxFJopuRrR04KFZ1hjW1q8eLWTcFVVdl
	WKbZ+VmXYl4ml4d9ZEG60526qx+zk/eL72NdMjTPIQS/ktlGOcIDgmrSgFivbTghqDD4bv28Z0g
	IrPJE48KdqQV/+xwvABe4grYLALVLEFMf1Wwcn+kLzyAEBBTWIORZHoWheSu82p/1Wbs8Iuz1iq
	jhiQqvTiWEBj/82RiNlU+kNBsY5pEVeSiyN4ECooY0ZRqoDvLkSX1Q+EUMStwmtiuP98ChbiL2y
	NmCR52OzyZKMXhnAWfBFWPgbRre7KNVRW4GWoDak8XnZjuELAUnQSAl+Q7cxsx4MX2xHr1Le8xU
	D4QYUduqeaWg5uoHg==
X-Received: by 2002:a05:6512:39c8:b0:5a8:6746:3f9f with SMTP id 2adb3069b0e04-5a867463fc4mr2661114e87.40.1777877655087;
        Sun, 03 May 2026 23:54:15 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22e1d4sm2674579e87.9.2026.05.03.23.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:54:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 04 May 2026 06:54:07 +0000
Subject: [PATCH v3 4/6] media: chips-media: wave5: Add range checks for
 dec_output_info
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-smatch-7-1-v3-4-fda125c30058@chromium.org>
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

