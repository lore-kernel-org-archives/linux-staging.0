Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FE92DE70D
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752581950; cv=none; b=mWvNtdh4DstZdrmc2B3iug36z2Myf9WQFcXIh6sTnmyKCc33kpPk/dFqKzbHBeICzrcAxCQbffqIfbdH+QVMBr/+lhIzAIxMm903LKsIwbPeSB6LwYI3Xj367WLjJT4dPzaV10WSN0t0YMQ4o86CIk2hWelpkLsU50768T1Nt4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752581950; c=relaxed/simple;
	bh=qvgiBgPI/1MvYYwFH/XMV/9+QdkZpnesuL1H6Zud1mI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u7KgC8dJ8OqfxUZghKIaVLtFOGv0YOnCPr8FJynRWffxvsWSz3w1yiMIlQIU02FtcT2a5014ILB9h38p42ba+DbmsakWmz4w0CztikP+6IK8zQ7lU5mHVkX/bkzlX8f3l2F8ge6u3nrcJWMyg3qgjDj2SojRhmNGQBYK7j7Ki0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CX6WoT7o; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CX6WoT7o"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e8bbaedb460so343043276.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 05:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752581947; x=1753186747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIfmy0/3xkga8hiuCxq1ZZdtAivDaHAR4qHd1TqxdHU=;
        b=CX6WoT7oTjiEijAarttUeHG2GiDNeXTLp89JBdYlDVF+xa7Y0/DrPtWO0enALY74f3
         irvYzNbAgz8KJrxbPgabxhnLDdB+3kXKRk/oosPHY1c4kgIyQHRO1QqswnCxWIv55KE6
         DKHX0taPFyOl8BpK8SR75+MHqNSWqY7c8/Efb4CpjhB2dK8Uo++XXbxWM03He6AcNomS
         P5/Jf0BX3s0R0slX58Uq7XifDKIycq49qoFt4XU05caWddpzBzl0NETfJHJzg2cz/Een
         q1yVhW/Lt2/sNlkMsj6NkAzRTwp8Ag2Zgenz9IvxO4Xbhx8lMrBWvLIRchhTps7Jx5G6
         NOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752581947; x=1753186747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIfmy0/3xkga8hiuCxq1ZZdtAivDaHAR4qHd1TqxdHU=;
        b=rtqN/cLPvTSoBaG+o6AixgQHYXEEIfenghPWNDZRkg7nbCz4lvkAKEBTMdu0dmRJJx
         ADJUol6Id4vvTNLFi8OLh4KZ+yM76vcrIRrEIlox/CQ3TFhMz3z0a96PVbXTkEOj35cC
         llJCMPULtWsYS3Im8mT5hLnLMwk7WXuYeDGodl3bLx9sw4FZktnW5RzhzJvw0q7JHstZ
         t8iFqsERuAlfQQxohVoeXVI8AAIIlZfSo2c/JSGuyzVJNqtjQpygzPszeN0FaUQ6bDo5
         vdkZDXnTlaGAGI3hOEijSQGHsLveOB+G9gTdX/clW0UZc+UXDTnsK3Napj4ZZv38/QR1
         fLXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR8Ic9YNNOOMZ2vxEFDoc3nRwbFwxxTDuOnIzaGofY32d+yUk6DoewpjmLll2ewn9T2FBFG47i48t/cmZj@lists.linux.dev
X-Gm-Message-State: AOJu0YygJVTlsc3p2n7z/zj86AduYJsLyNE5+wnHcLGMYc39rQyBKvlD
	wIetjFyJtpuikDhDZ+YGH+Vgj0dOlpsRY72wAyX/5urenbzP6V7YHPY1
X-Gm-Gg: ASbGncu7713i5Z8cjAc3PoW8Tx1WEjOay3ct5MxaD53RxBWgCMwexozTmcpll57rJQf
	tvMuBtVGicDVovKSjQ/A0NY8syoPN668zhhbK1A+WXI4t3V7EKIPWpWn3YTb8AzaVrJtsX87CEv
	3xC/Ke8TOCGS+sulwhdrB/fjKdMX14xo14I5NcRegVLtnFhGnl2lQW1u6v5f0DcClPS/glJLi4I
	Y+6IJKdKfVggYAqZmOxvxvemt7Myb82b9uzdQEOCKluvaVd+NzDjKgylNfhPLH9gCQxYV70WUDc
	QJM2mZQyRBsb0DirHcKZFC2TzpELKA/KOfvM+kISJX44s22VeTQx/RM6R+yVgxBiSlCU6XjvHYV
	n5zE2FFVYHY8P4IGaOykhKpqkZpx8xXV3fQ==
X-Google-Smtp-Source: AGHT+IGfSxm300vEgPQlNRYqtUBzpiflKmyfITdm3khjnCbUjiMfC5i1vY9+2xSVU+3qZKC6YuCnvw==
X-Received: by 2002:a05:6902:260f:b0:e8b:444c:a1b0 with SMTP id 3f1490d57ef6-e8b85aa6ba2mr18358309276.16.1752581947558;
        Tue, 15 Jul 2025 05:19:07 -0700 (PDT)
Received: from debian.test ([89.234.162.240])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e8bbaec0d01sm230378276.6.2025.07.15.05.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 05:19:07 -0700 (PDT)
From: Michelle Jin <shjy180909@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Michelle Jin <shjy180909@gmail.com>
Subject: [PATCH] media: atomisp: fix trailing block comment style
Date: Tue, 15 Jul 2025 08:18:39 -0400
Message-Id: <20250715121839.12987-1-shjy180909@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a checkpatch.pl warning regarding block comment formatting.

The trailing '*/' on line 78 was moved to a separate line to conform to
Linux kernel coding style guidelines.

Signed-off-by: Michelle Jin <shjy180909@gmail.com>
---
 .../media/atomisp/include/linux/atomisp_platform.h   | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 6146555fe9cf..95e18c7ddc13 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -73,9 +73,11 @@ enum atomisp_input_format {
 	/* CSI2-MIPI specific format: YUV data.
 	 */
 	ATOMISP_INPUT_FORMAT_YUV420_8_SHIFT,  /* YUV420 8-bit (Chroma Shifted
-						 Pixel Sampling) */
+					       * Pixel Sampling)
+					       */
 	ATOMISP_INPUT_FORMAT_YUV420_10_SHIFT, /* YUV420 8-bit (Chroma Shifted
-						 Pixel Sampling) */
+					       * Pixel Sampling)
+					       */
 
 	/* CSI2-MIPI specific format: Generic long packet data
 	 */
@@ -119,10 +121,12 @@ struct atomisp_input_stream_info {
 	enum atomisp_input_stream_id stream;
 	u8 enable;
 	/* Sensor driver fills ch_id with the id
-	   of the virtual channel. */
+	 * of the virtual channel.
+	 */
 	u8 ch_id;
 	/* Tells how many streams in this virtual channel. If 0 ignore rest
-	 * and the input format will be from mipi_info */
+	 * and the input format will be from mipi_info
+	 */
 	u8 isys_configs;
 	/*
 	 * if more isys_configs is more than 0, sensor needs to configure the
-- 
2.39.5

