Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EEC27FB0E
	for <linux-staging@lists.linux.dev>; Sun,  4 Jan 2026 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767524822; cv=none; b=uILBs4Hwq+Cm+YZEUbLfIYuVCesldkqeRbici+9H2jdgyLleLO0r7SmrzifeE0klG0q74/JFbUJNypKMTrXZtcCcLzOohm4s9YJuCJ7yh+yfq2H27Jkw+wSZTQGAJazvjBr0XTL5jtZaHB5ZzBcVDphzjal3Y25QCqPH1llJZz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767524822; c=relaxed/simple;
	bh=f+3myA36qIJFUPihmtSiNKVjQSejhix/AnLZkNszVOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecMOvRrw/ErqG10p7AZgqGer2FishRwPL7C7jai1rgjGY2HvSsrVnRejOnMpVH2OX6ss+GfvtdMfE+PDDbEyMFFTBQ8ZlMlo5kPfKTeUdxpGZzksbK/EzTmvU6Fq3LEsLnl3aWTN10KZJwCgxaI6l8ebirfeZpTK4MIKVlEdZ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyRyq0Tq; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyRyq0Tq"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bf5ac50827dso8494117a12.2
        for <linux-staging@lists.linux.dev>; Sun, 04 Jan 2026 03:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767524820; x=1768129620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8buk09gLSh11LVEaXhuV14UfJjZO5sV2eu2MPf5Bj8=;
        b=jyRyq0Tq9WbJ9tlR1KR1mzHuS6nlV2IW1SL7y25tCsWTq188NtmpUdCbnqeqbPNvrk
         8vRZdr0JBkHllDLRmcOpbZNFOtyJ6BY3KNoa0d7YkIiQyZxyNDnAZPZf8/fug4rXawtB
         6632NAIwv1GRjXN5PYO8jn0aZUABHMwJA0VXr1iHmCbVaPzC+s4lkWhtxlAYpKgcv1+y
         eeA3kFfjuDaNiSPCYNGJJZ65boTMJXqMDZX/2Dp9kxaW+ub4achD6J9LPPtCvfTMZW88
         7OlsF5n2q1bNvT/DjFL2xfwKfPy+khLQ13dveO14deSXPEDzS8KL7Y7W9zdCDEqd4aO0
         n+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767524820; x=1768129620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a8buk09gLSh11LVEaXhuV14UfJjZO5sV2eu2MPf5Bj8=;
        b=ChsgpPE4ny92z+MhR+S5GJDh1Yufj8Hzdvrm/1V9ll3qhSUcOFyCC85I6g6ROmOmC7
         V0tEu6LxNsjMOUf9FGGhWw659BXfrbooV6SLE4ShSgZCtphp0My1Ab/fogHjF5261+zB
         YPYUEbiA5UJnu3Og/UONAYlFshcOWew/yXftLVLfa4EDUs9glPjc7nKHGtGfz365B13d
         UT92OOKz8ZvLf0KmrwLQm3JbmKItfCmt50utZG/goMaaBcJSVZ2ipMVjkb4y0lRtybbs
         4IoB3YPCRfm6puXjqIqNwwAhUMPSVQ7lI1q6d+P75+7ShIAedMg2sf/14tOQkwD8qn5W
         trCg==
X-Gm-Message-State: AOJu0YyspZTdSpIyvJr0hXtvzS9//qpg9nI8dfHg96VWDVsvjj0nad1G
	t+uocx9j17XeFFrEKEO1BXldWAqrPKxT1CrGZvARZyg0NYarbsrMfXFl
X-Gm-Gg: AY/fxX4V0ea78MB1sbpBEyhTicW1oF5jFiURGwtvCi1uuBlcl5qXewWfvPDZTqkKFVS
	Tx6ufWbiEiAIc7ad9TE+R0a9jm/ukKC4rRi17WuIYaETlhi41md6t1yNRm378uW6B/YhJnJNg+z
	JFF8hgl0HElNJaTrVz060ESAfQYB53TGlvou7lKl6tYINQrsVMf4L/030DacJQkumoc72jc9aaQ
	v+P9oIZ3stu05wrLp1Z0szjGmUtzoPM16idWi7Xi+20eT2G0lMAYjJ/e2kYsshynxl/HxOoOFIG
	PA80hp2XrUiKpclp3oiTWAb6oh00ftK2phgL2k6yhHYZnWuKYcnnngohHESlFsqf5SXmxlhJAlD
	0mUFAllySnDIdR+/eQnax1C6fmWT2I+q4r4UojNKDPTZkhJjbgVF7bWyzAIuoIpLh9CFmXxmPLS
	A2XpEYJorlmk16VfpR5Xo8uS3VSqvAS78AuXOPP+G3/Cr85K1rN20bREJtT9QloE+pk5hSylsnn
	W4uTtA8Ekw=
X-Google-Smtp-Source: AGHT+IEG7AhWv3k0U6Uxjf929Ja2jLSdUI1edkCr+Jls8BEFxccZF/h5EZO5GMeycslKnhnu+WhPSA==
X-Received: by 2002:a05:7300:de07:b0:2ae:51ae:5cf3 with SMTP id 5a478bee46e88-2b05ebd0d80mr34290611eec.6.1767524820215;
        Sun, 04 Jan 2026 03:07:00 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b140c42e4esm7743509eec.15.2026.01.04.03.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 03:06:59 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v1 2/4] staging: fbtft: ssd1351: send gamma table via fbtft_write_buf_dc()
Date: Sun,  4 Jan 2026 19:06:36 +0800
Message-ID: <20260104110638.532615-3-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang reports a large stack frame in set_gamma() (-Wframe-larger-than=1024)
due to the large write_reg() call emitting 63 gamma bytes via varargs.

Send the command byte (0xB8) and the gamma payload using
fbtft_write_buf_dc() to avoid the varargs/NUMARGS stack blow-up.

No functional change intended.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/fbtft/fb_ssd1351.c | 35 +++++++++++++-----------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index 6736b09b2f45..b4ab2c81e528 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -119,43 +119,38 @@ static int set_var(struct fbtft_par *par)
  */
 static int set_gamma(struct fbtft_par *par, u32 *curves)
 {
-	unsigned long tmp[GAMMA_NUM * GAMMA_LEN];
+	u8 data[GAMMA_LEN];
+	u8 cmd = 0xB8;
 	int i, acc = 0;
+	int ret;
 
-	for (i = 0; i < 63; i++) {
+	for (i = 0; i < GAMMA_LEN; i++) {
 		if (i > 0 && curves[i] < 2) {
 			dev_err(par->info->device,
 				"Illegal value in Grayscale Lookup Table at index %d : %d. Must be greater than 1\n",
 				i, curves[i]);
 			return -EINVAL;
 		}
+
 		acc += curves[i];
-		tmp[i] = acc;
+
 		if (acc > 180) {
 			dev_err(par->info->device,
 				"Illegal value(s) in Grayscale Lookup Table. At index=%d : %d, the accumulated value has exceeded 180\n",
 				i, acc);
 			return -EINVAL;
 		}
+
+		data[i] = acc;
 	}
 
-	write_reg(par, 0xB8,
-		  tmp[0],  tmp[1],  tmp[2],  tmp[3],
-		  tmp[4],  tmp[5],  tmp[6],  tmp[7],
-		  tmp[8],  tmp[9],  tmp[10], tmp[11],
-		  tmp[12], tmp[13], tmp[14], tmp[15],
-		  tmp[16], tmp[17], tmp[18], tmp[19],
-		  tmp[20], tmp[21], tmp[22], tmp[23],
-		  tmp[24], tmp[25], tmp[26], tmp[27],
-		  tmp[28], tmp[29], tmp[30], tmp[31],
-		  tmp[32], tmp[33], tmp[34], tmp[35],
-		  tmp[36], tmp[37], tmp[38], tmp[39],
-		  tmp[40], tmp[41], tmp[42], tmp[43],
-		  tmp[44], tmp[45], tmp[46], tmp[47],
-		  tmp[48], tmp[49], tmp[50], tmp[51],
-		  tmp[52], tmp[53], tmp[54], tmp[55],
-		  tmp[56], tmp[57], tmp[58], tmp[59],
-		  tmp[60], tmp[61], tmp[62]);
+	ret = fbtft_write_buf_dc(par, &cmd, 1, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = fbtft_write_buf_dc(par, data, sizeof(data), 1);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
-- 
2.43.0

