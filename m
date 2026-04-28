Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5DD43CED3
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380095; cv=none; b=lhvGsnJ5x7i4Q7JefOId1LaaVyiamXQE9WTfG/2AH36lc08iRKp1yV6cbKX+F6Skw0SlQgHlqW5bg/TU/uoc2xPQsr0lWgDLk0P9u2gGtWPNofNYx7W/epoEoHUTus42tNeqQ/87VitYjrWtLQH1Yf62npwd//ykwOGbC5hajaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380095; c=relaxed/simple;
	bh=fM+EOez8tTjZWMaKaiEYlL+/TS0+1cDYerp5pGjy9hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQe/VVmt3cQ6r2mnqPRXecmonuFW62HkcJdA40lOZy/LhqeQwjht9IJEawdE854MYMMCAiRcCBY61SFLRKH5aFwcYWnapBhka2BCyu/xFDy60TvkJDoIqbUN9RjnE7eCAMY6Tt5ExQpBFS52fCtXpv6gdfElhiTNYR7Aq5okD/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cGsBUOzq; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cGsBUOzq"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a337552604so10444704e87.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 05:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777380084; x=1777984884; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu0V+UWGhKofbsqLMuK6FkwiFliyODBO+j8A2mvjt3M=;
        b=cGsBUOzqbDZuR3ec+PyTB10+JNOYmpHbp7OwTCfHQCvoYkYbRNVBhOpf1WswuYS9Tp
         e5ombFzt5M6Ho0L/nO8B4M7lVncG4watPq2pd4Qz+/44U6k+F4TElRRfhAstFKGDU9PW
         oy+pTZkSJCzLuUzw2p4dF6ilh12odU7rS0rN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380084; x=1777984884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iu0V+UWGhKofbsqLMuK6FkwiFliyODBO+j8A2mvjt3M=;
        b=jGB8G9eXmUm4/jTVU95r9hAH+88UVz9jAreTZF8OEHAfJGf4zzWw8ho8/hgyrFXiZx
         GZbT1+gKbiaEWoxT2RrCCsSejJ4G6YNleZVbeBEiRa1BH5oZDutYrKZHsnMLWfTKJsck
         E8wSyndRH6ncF1HhLk2oQrV/s4H840MPmIz4eublYWWBYz0KcNcIoUkHwX9Q83Fiomlr
         XepVax0rbuPHpzilDMcQRQvFMOqwR7dSy5Qw9YMOSKn7QLs8592mNWV4JQedgsSfdCiW
         L+5HE+JwzGSpCViQgZ6G6paShwnX8CSplj0QB6gYHi1DSc6tpHV03Tv2J9VtnPp3Zx12
         LWLw==
X-Forwarded-Encrypted: i=1; AFNElJ9DarrQBM1LCw4I6xgGihB4KEypVPa1QGXYiexeG2KC4ZdrPO/HLorhSE1dle0gb1NEgVewnLaIwsW6sNt0@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8GG9XpDaeaHLTwULV9TAz+Q9hAv7UPHRh6qgsd/qNk9X/mRSd
	y+Z2DgV18eHoqm92FMuxqKBReGHyVhzQeazCi7+DM69oTp7n/c6jGtDapAGzwM5fbNUQghGAFma
	/msVjF7Pw
X-Gm-Gg: AeBDiev63N3QKoUBvNRGpprQHayenmQg+39ZGqw/MzNrjz+NLbjPGNmbI3j6Q6QR/m0
	C5U34CqtZQLBcmtIXXJDmyU370sDa496nJ/pP4t+t+byapKtemgX2b23VEiszcfTrysoqwQTNfW
	4qyDVEnTBUNB85/kvuqWxpF+QudG7MqR/NMvV8E+tPGNZwvU+fuoL44pmWC1xEqYUdwxeddywLf
	SuB1pZBONNjyUgpbzrL/Dt1snq/0248y3YUmm4wbd5p6VoP2ycM1ODpoFa4qZwtW+HVj/zclBXF
	1ZmvZs4Siy/FADvGErhMJ/neZf6PZnQr8z1LPXk34KiI9S0WH9bw7VCOJtuD/4Q4/pM/rXY9ySc
	pznyDHF8YT7koXzUpGGX7oNeB3q31ch9KBRiqvvSj6e3wnQpi9FcIEEelPOxs4LvTnavuC35Nb3
	Lq67yg7zGRiOOHaD6719KXX0LmYxIefNHwjVWAXs8Bk47zobwATktwVdJMkzcQPOnz2beO/5t5p
	QNyvu2sG1VGnPchAA==
X-Received: by 2002:a05:6512:3d1e:b0:5a4:1672:59d6 with SMTP id 2adb3069b0e04-5a746416040mr1270829e87.15.1777380083740;
        Tue, 28 Apr 2026 05:41:23 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5fb5sm594617e87.38.2026.04.28.05.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:41:22 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 12:41:10 +0000
Subject: [PATCH 4/6] media: chips-media: wave5: Add range checks for
 dec_output_info
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-smatch-7-1-v1-4-46890dffb611@chromium.org>
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

