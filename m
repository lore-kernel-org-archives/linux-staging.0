Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671B33D9045
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 15:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750331; cv=none; b=pKlR8fnooxtEL6PYOZh0+hr0YA7DTbkKINKWY/oIWBOw2rbXg53hPUSEX7EMvU7ga7HRbPa0VzhpDb1sSvjXLoHoZG2w0jVzTbS95PqmbswF6//KE0rLIdAgewQBgqH1uIlg6i3CjmXP9HcVvDSD1hYi+rXz87HdlAt4QAz7kYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750331; c=relaxed/simple;
	bh=4RJcvPMyl5PqcgPXvQ4VGCjMXYk/SloNlz3pAdCeCTM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kskLZirMRo0vy6qYO1mqywpLlCAkhMcUulNu41RGww7bAyfe8x7+jPPPpJsK5qyInNNNqqVl7Nqp7MF7Y1NO8sTxWkg5+fn+EGp8W/0y4GkmuEHk+25OLiN5MN5tFnlCQXTnWKu6LqX1CAU4Y8UOS9yW9i2ksAeD+uD2ku5liZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+40D5d+; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+40D5d+"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2c7d8bbad06so1643446eec.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775750329; x=1776355129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XM2RE5mSvaPlHGre9Lf8kPtJSxgysytky2N//YtXII=;
        b=g+40D5d+r5O0detC+gbgWxaU5n3MbfAM7lkdZj+lh9nxKh42GNDlfT0Q7HNFTPEqQJ
         2tngKIH3uhWILwDMpcDh9dOgMxQelKLxoyzupAPFisFLnprzR94bPPeXHIOw3O6naUYu
         E7sTG0qFmIYkffe2PxObV15uBBygvNC7+ml0WPZP7HQvomwN00qmM2XU3UFSIiRG3JKb
         CWXGlUSx8ucyslNmy0DCiGaVDiw+1GoQTxyfLgtF0nv8E5Dol5DlxRRrR0ZobJr2uoLD
         LhTDbvVkiQAsnUCN/C5kxFb96hXrmqVZqlmLJsyHXhl430hfaongie03aNPqqSwRXHPu
         EoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750329; x=1776355129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1XM2RE5mSvaPlHGre9Lf8kPtJSxgysytky2N//YtXII=;
        b=SVqNEueE0cBVJiOs5JFNwiD0qHQue3FKr/9MnJQvQeNi7z2ssZXjgXVhPftUF6901z
         +DmC2ow1xC2vQ6FGNz/hH7ia/9g4rNJhihyxeLglJ7V2GAVGhLU/Zh/7H+yGyJclQDIz
         Tc+J9lb5qz0Kym4OELtVzJJRW33pKKIKeUuTgkXtrLzLnXJtJoT2RWOUOjzxvMTP0MDO
         +xmf2yIbJwIgll6aA7hB+17AXMqIGtn86S4GEeiOV4r5cXMnOSJnKzKgnUWEmB4frbvs
         HRx0FU4qSjHM7Po63ohR0LldswY0PLi82Jzd2lKmrRUblcaUj4Yd3hRZLOmoA2jStc3C
         Vlgw==
X-Forwarded-Encrypted: i=1; AJvYcCVChQI3OjqVtNW9GteYmxfrVAZ3/IO3FydyuyemBJG2Ho22PsQLkLPf2chy3v8SFOpNXqHGr96UyeOyOvjd@lists.linux.dev
X-Gm-Message-State: AOJu0YzeP0BDu16bBzO/qon0vRJOd4No1bKiQnU2ve5buQjgAW4EthDg
	sH8jHWfIN7pY1ZiV5QNRxaDqp8GIgGA8T5PD2FWx9lsZd4UHLWC6YS7S
X-Gm-Gg: AeBDievNM6rcAOl70SLqhVlLEF1VI2u2Nk6zEkJUO+eM3Tj7jwn4duirK5Z6/O2bvrR
	+iTtDWnEYjjWW5iOJUMXddMgQZqf8zq60uuA2IreI1/HcYtHXQN8V06mhdieYQYUvm2z7ZC1PY0
	0rDX6J68Xbd2z8ZkzBh95xUDlPkGUfOF8ocFWrLW4CPygtkUizaV5IOaregm3V54cEqos/hKGas
	DNeQqsOgx7ChXD9gTnje8fSlKWkLaybrTTvVJY14IlgHTamkPKuX02zzXxNLpUCuV5yobqpocWb
	VJordeHMD7lyMwpX04Es5Ii+8Il3+1NdP/Hwdt3FIl0qhRAoLsQWSZkyIhZWhOGFe5LhAQJt9km
	2YCcRmPZYQ0uZlbBl5QUpXTjjyK6IkHjgNmWfQrRM7gnK+juPiw76Xo5V+QbohLzvot1s+gDBzq
	WTEVgnEfwZ9Z69UTamiNLvIlvwzlDgxydCfEQKtTzD4esVKZTec68hWVI=
X-Received: by 2002:a05:7300:bc86:b0:2c5:a6ce:e534 with SMTP id 5a478bee46e88-2cbf9fe1d45mr14374181eec.8.1775750329282;
        Thu, 09 Apr 2026 08:58:49 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5621d5e43sm153746eec.21.2026.04.09.08.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:58:48 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 2/2] staging: sm750fb: propagate error codes from de_wait()
Date: Thu,  9 Apr 2026 15:58:21 +0000
Message-Id: <20260409155821.23375-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409155821.23375-1-dennylin0707@gmail.com>
References: <20260409155821.23375-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sm750 acceleration functions currently return -1 when
de_wait() fails, discarding the original error code.

Since de_wait() now returns proper errno values, propagate
the error code instead of returning -1.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 0f94d859e91c..688ec262a8ed 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -90,14 +90,16 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 		      u32 color, u32 rop)
 {
 	u32 de_ctrl;
+	int ret;
 
-	if (accel->de_wait() != 0) {
+	ret = accel->de_wait();
+	if (ret) {
 		/*
-		 * int time wait and always busy,seems hardware
+		 * int time wait and always busy, seems hardware
 		 * got something error
 		 */
 		pr_debug("De engine always busy\n");
-		return -1;
+		return ret;
 	}
 
 	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, base); /* dpr40 */
@@ -154,6 +156,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int rop2)
 {
 	unsigned int direction, de_ctrl;
+	int ret;
 
 	direction = LEFT_TO_RIGHT;
 	/* Direction of ROP2 operation: 1 = Left to Right, (-1) = Right to Left */
@@ -263,8 +266,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		   DE_WINDOW_WIDTH_DST_MASK) |
 		  (source_pitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
-	if (accel->de_wait() != 0)
-		return -1;
+	ret = accel->de_wait();
+	if (ret)
+		return ret;
 
 	write_dpr(accel, DE_SOURCE,
 		  ((sx << DE_SOURCE_X_K1_SHIFT) & DE_SOURCE_X_K1_MASK) |
@@ -326,14 +330,16 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
 	unsigned int de_ctrl = 0;
 	unsigned char remain[4];
 	int i, j;
+	int ret;
 
 	start_bit &= 7; /* Just make sure the start bit is within legal range */
 	bytes_per_scan = (width + start_bit + 7) / 8;
 	words_per_scan = bytes_per_scan & ~3;
 	bytes_remain = bytes_per_scan & 3;
 
-	if (accel->de_wait() != 0)
-		return -1;
+	ret = accel->de_wait();
+	if (ret)
+		return ret;
 
 	/*
 	 * 2D Source Base.
-- 
2.34.1

