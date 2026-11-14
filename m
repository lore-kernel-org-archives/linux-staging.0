Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794642456;
	b=FGdDHsTO3qUK0i7Pzv4O5zNNRegJzmVMmDM0jSJRWvpDN2CCGKtB47waqle/qSvWVG9a
	 c/aCjbgrJBbVSKq4PiP4o/JHjydKAd7pPoZ08bNNmtgJ9F/LGdVlCXn2xO1btAi4aoNEs
	 0pTsLm6Qc+aSNJzd2OEYYQFi6EgVu6rWJ1GfjOKGFkuCqeHhFBq/VKOJeDMb6AGLtl2PJ
	 yihI0VuZRDCNN1Mp8fV3prqOtyjpI84Mecsu2OvSCTvWlpJoUsvhZQabddR2rdRW+Hj1i
	 WMjOkVuBCQ4QmmUuBOfQANLv/q2oGo6mRXm0m5iyGcoA++AUX+lw48hIzrrli+4fr0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794642456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LoEuyPAEuv/KtMP2tAI822a/WrEKEfAXHtneAA5BxxM=;
	b=koJYSJDNSHPVpSM4OZtnc6+I1i4WNe3Isg8dJ1gbwzzs03fuCUv4EL2+assXRmrIQwxT
	 tPCNcZrpD9Al12kgPsjm1Z/3stlqCqXygWJPqHfiw837qAPzySH20Kkx2DJwhuyRmk8JQ
	 rPQ45m3gjyOWlf2gZ7M0XTLkL8clmN0YBYpOTH67M0o1Nml+nZniH1mOZcdnS8Qc++Amq
	 g4QngWk+smS2xBpa9lDono4abJrKrxDDxUN7VUlOQbEEtYks/X9q57aygSqCCa2fU40CD
	 pW8OYBqJMcyyQ7OEhK7Rq9KbG3qx0xEg/LF2fli+IbWebZwVM/9LQ+GLbCS9+TuWfUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPjlTAGf;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE11606A32D
	for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 07:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE11606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPjlTAGf
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so1263102c88.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 23:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794642456; x=1795247256; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoEuyPAEuv/KtMP2tAI822a/WrEKEfAXHtneAA5BxxM=;
        b=aPjlTAGf1V69DyKEdB0Rdan6+l8qBZFT2I1YnYS2WemasItX08isWJt1ciWaIVKfiq
         3UN7gnwoSJmtoHeDZjYY6V8SNk721AqaBX4zFUY38ufWABaOyPr0U3GExeriE+LNTdwd
         skMfAwYwbJbkGOxhsK37Z188OxGuq42rRGP72eo5Gpp1OReh/7VLESbawXxnDaz4dcix
         TJpR6TvRi8acD6QAVGm37TFjXdK82Rx6Rc/fX6FNNNbIECIEta1E8HHw23IwA0DnSEy4
         n62lGFltbug/vv0k3uXA5YEE/z9yNg8glCROku3NhpphlqfnMsFKJdnwis8DNS+RQlFd
         WyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794642456; x=1795247256;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LoEuyPAEuv/KtMP2tAI822a/WrEKEfAXHtneAA5BxxM=;
        b=vt5Bf+Xpm6+E5snhRr6JPtE+MWvWGlPBvaKoc5FPlsVtdjB9r59n2/L57ZRBARZ1D3
         wQtWJNzvI9hClCBgzu2oegVykRZL2GiNO8ZZr8BtKxOTL7cRWPkj6aZDDiNvaz/RGSzh
         jvvRDeTy9i5V5kqvMX1PWvOQOlHA531TJbnPMCUrCaUvCcLwEiOAuxbbHg7mkB6GPOZh
         yYrlcSbaFb9FAmd+hSNbu4o38wDush85tcELBI13r4MI6zsknur7aRdM2nURBuKzq6Pq
         rdckQAUZ/lz8IS41Tl6lyVRiw2srJFRh9LKwLpreMUyZybG3eOUGhhJNu0NneMwozjKU
         MOHA==
X-Gm-Message-State: APuU4Z8TB3BZTLzzH9IM1S6Kf1X2KOpO0Kf82pxr71fenuVliMDQyvVO
	Yz2vRCa07XGbCcukRbeXgVUwqPUkysdg608fsaKdGsKKMZNvwEOeGho2
X-Gm-Gg: AYBFou2MOWB8uWQ+FTwhIoBvWNJAj95iiiSXrV79jiHgq8r4RoMmgJqQR5H0ObkE/bs
	KsQRxVxvz4kdHOsH328T4AJsIkMfUNypUpSP5b+Gmrzm6DEbpyMYhvE57gqRU+dQcMHiFT1b8Zb
	wHXsYzFmDUhWG2+1VAlb1vNcjf65PB633DzFAHfbN3ZXSZbmWvWaAG1qUaI4ixmWHTd+w7yBQdR
	1NrxxkHaRX73A4QaMSXaDU/mGhtCuyf5PlBnf3g9TNqiFV8Kamp/XujKfbFTkaIA2TtR1KU3Pb4
	iPJ9ULTEVtv1SbgyBJNG+ncphqAhLlkYgjVHB7vezsHaG2d89YrHPVsYZMmnIKknYyqFaLefi54
	+FVUvupJ9VknIHLFEhQrHqKr4kBnXgYA4FEyNl17DY9DBTf/Rg7WkDl+M7F7pqeaXr8lsyxKnlK
	ldSVRe4QCIch3Gg+OV62VSS/BJPgrpGd+AF1Td/a2Kzydbp2ak5+ROpcPF7b4DFGLJ0sivP1PPq
	t5brJI1mx0rNgspO2PNdIY08UBwa3m9kftn9n7I7JBj8VLsHGFWsw6iQTnwR/MHyeR+m15qWq1k
	wN7JVj9BUAcuzi3fy1PIpDF9uItWyLj+thV0ZpMcXVTkQp6dR97vqZ3LHVJibku+pfQaMC1TDgl
	kyhDMMZOfjV3jI7y5W7N5Jhvi0QTZJrSr6ohA47Ch9I6p
X-Received: by 2002:a05:701b:2802:b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1b50318d7abmr4653633c88.27.1794642455503;
        Fri, 13 Nov 2026 23:47:35 -0800 (PST)
Received: from localhost.localdomain ([203.92.58.30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm18467132eec.19.2026.11.13.23.47.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Nov 2026 23:47:35 -0800 (PST)
From: Shivani Patel <patelshivani2283@gmail.com>
To: outreachy@lists.linux.dev,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Shivani Patel <patelshivani2283@gmail.com>
Subject: [PATCH] staging/most: video: add lock documentation comments
Date: Sat, 14 Nov 2026 13:16:58 +0530
Message-ID: <20261114074725.24319-1-patelshivani2283@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

---
 drivers/staging/most/video/video.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 3a0445ff6..12ab06919 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,6 +33,10 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
+	/*
+	 * Protects the @pending_mbos list and the @mute flag while accessing
+	 * the device from interrupt context and user‑space.
+	 */
 	spinlock_t list_lock;
 
 	struct v4l2_device v4l2_dev;
@@ -40,6 +44,11 @@ struct most_video_dev {
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
+	/*
+	 * Serialises configuration operations (e.g. start/stop, mute) that are
+	 * performed from process context. This mutex is taken in the open and
+	 * close paths as well as in any ioctls that modify the device state.
+	 */
 	struct mutex lock;
 
 	wait_queue_head_t wait_data;
-- 
2.50.1 (Apple Git-155)

