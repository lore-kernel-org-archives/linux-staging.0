Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0314A342509
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 20:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187502; cv=none; b=YZ0r5uyh+5i765ir7aoJRkKYJTLhPFlVCJWxoTV71FK39fCwuPikY9TcArHkB/G2Vu+YgpoF0nbw84G0lYdiDehMfHaxHtlXdo1O0/1MhH5pzcOQtsjvj48RfW9dIszOiJLtK71OK5unnVRdYqwE0kORp7a3tq9ZwCKXwUUpCFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187502; c=relaxed/simple;
	bh=bhiAdfSzncpURbgdsQrG1MdM2mxUmXSubgdV4ifgDbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rzdkS9iqhYyeVqT5j9aL7s3qanXva7WEn9nhEVI6pYmf8uv20ORVrjdI3XzMnkuFFGtJX4gSO80Gl38G6RqL+PawxphRfXbyyYz28LB1M3uozltAdReCSlH2f+6YlmJOXHjkmWPIF38hv9TaGd6xcW0/zowsrME2WTDleedFULc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bUY67jP5; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bUY67jP5"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39393ec4ed0so11952611fa.0
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 13:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778187498; x=1778792298; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UAoOc6QkMdG4r56PaqK1IeCoUwn5Lvm7uulH9yzKLh8=;
        b=bUY67jP58HKOO8E23MsODmVyp2S8+LrXg74ugWGXlRfD+e33ckKZnCXt+KPpcE/ri9
         wrC39+qYA2N5W2AWWXu4o/vjCSQnsWcXRl6Dcos8QzkQSRD8o/+PkuRXWT/0eLw7EW5v
         Td7uwJIabVpDoS2AjucpuYNLhk9gsLeNkclIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187498; x=1778792298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UAoOc6QkMdG4r56PaqK1IeCoUwn5Lvm7uulH9yzKLh8=;
        b=AAsqTVoyuZib4Ks68jKTUWmUv3fq9qIxznp+r3O85OMsaw/p2Kst4d4h9HBrJPRUjC
         eSdhkmg8l60LTmIq3xvBAJz5RqRJHYsI/vr1feoxPKpStIbmsAZq4rKARtbtnKbyc12r
         iGdsurHq1Awy9zes2LkL0FJESowy2AudDx3V7M0OlBCL25uZUva4tz5y3VYRRiRHb9ZY
         MGG47pyGG+BS1wIPgm4lEoWqEYZQRTuKnzqLzftb27oGBcnyHcwZo0FGAqrBxCaih+/K
         QD5oG8MYFkTAY5tEfTwG1RUFAObVP+e0XwDvYmwFYqrT0XJLAy9sJH+3sptldGzfuvn8
         D9Cw==
X-Forwarded-Encrypted: i=1; AFNElJ/r3kQRc1RZi9QMnlhS+vEEeZpro1FRERLxyNYHWU8OEK05TX8Pf2NmeEC6beC0wky59cA/TbjlS9G1rrPe@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+1ixNXjKendtK39laMEvPF7l2+FLNjzwBzC7fdd3JeiW5LnSY
	TwoUMII+YCe7uVcqUO8dsSifkbKBLQYe9Zsw/vOhNeg+2DpSVaHe6D4oQxY3BDfQUQ==
X-Gm-Gg: AeBDiev9nUQ33WdGU9TLa6nuGdWsGbFzfR0z/qOh4sV7xBWaejfqMu3cGqRAH5+dQCZ
	v+6VxA6lK5syD2ldNDRuoKsLzcjG8oYqmjAPy3l14oXJyc7+c3/nStsRNdgH+/vFA/Eu3yG8fzq
	PKqOCw3rNVKgPJS1JLEVoUS+cd2pPegOJb2D4C5fxEWaRFVC0cAZn+s6i8qb0dVp5ehd1E60+dC
	cwFMGi9kg8JYlhyB6IISMr2Gx8c1lwZ28kbvZiQ1/Ac1rijvNL61lbEjl0ODjhMSbzNrnnWAnXf
	ErKBv9Q5FXBFFf5a6cpadfEhAz1/2l9q6VvRYEFTw879dCmD6FPTw6W4rmBSD/CmprMnyvMLF+n
	Z2K3+SjVKL20Kxs/t/vsBwLxRlRspEOeqOc8NU6jxbrYab+rKh+8w1Vg0k0hVjkKemzGi5BIiCO
	+Ft5054H8k8w1PgeCv3oy90lfwZ7fe5w4nqYUd7zPn3vj1A9+niIwYsZ0nHbFxPG7dYbTEh1CN5
	dGosE0=
X-Received: by 2002:a05:6512:681:b0:5a8:52e0:7bc5 with SMTP id 2adb3069b0e04-5a887ce6338mr3443107e87.27.1778187498409;
        Thu, 07 May 2026 13:58:18 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393eee53655sm2325571fa.0.2026.05.07.13.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:58:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 07 May 2026 20:58:09 +0000
Subject: [PATCH v4 4/6] media: chips-media: wave5: Add range checks for
 dec_output_info
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-smatch-7-1-v4-4-cc195f142167@chromium.org>
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
2.54.0.563.g4f69b47b94-goog

