Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2832ED87F
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 23:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160083; cv=none; b=WCdns5aIbhC8oKspkfMl73C0k0a8G9YdlMdCrNDhvoLyp1J+D4uvYrma7RW2qmYEmrazMQbYengwwPLVKRX0ddg+w5AgYvgyyQPbPlwInxK5UXrEcGVscm0vBeFhG091u2MD1oJ0Yjga33KyiTBxJxuehAK6O++BysB+hYZB+Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160083; c=relaxed/simple;
	bh=jVsaqFD+d8LNN2vVetFEUNyX22dXbwsz0QkKZ7O/2Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nk+fEqvlruSUgYIaMrdQerVWbwJ840hypfN1CBOgE2RPlXNgF9MQuqpP/dj9LP6n0u1zJNzzZV9GGGU5J0B0NhzeI76dsAAJIWKg4RiEnXvEPKjJGYEOAeJwBX/cgV0R8Zx/Z6ufvZ197WPGx3qSGINaVem6ZeCIKH1Xfq0BFKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYmGeiNo; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYmGeiNo"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65808d08423so9138790a12.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 15:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770160080; x=1770764880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9LC2rgy8FruKnAUghqfggKkncBhJB/4kXDB4TXvEw/Y=;
        b=cYmGeiNopoZKyTdN/mnpoJhhzfwSSLiumPVJhisaQq7Wmagt3qSW7j+8BXPV+VfflA
         KO5BINZ5egobcJojUTpUUUeCXhUVSZTZhkNXeLJC3mc3iBP6OYm3x8WXH7eW77FK+OHE
         ul+PRruXgTPtY8tb0lK+E1IuD/laxU6JZTinH3slX/PLQGOzwdwYGo0gbaZjob0J0mQc
         nu4qbvqX3zux0hguWWY3gY+JlOCd+rTvOcXDikL0a0ZpfaL0BHGLo/UVU6J4OCf0pPrO
         BPt/B5gfBjihtln2lCMkzUi8QrUl5RsJ9VMc9NV3VUKdpCF7ZH+pofKbiqy9Eac9wPOe
         eyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160080; x=1770764880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LC2rgy8FruKnAUghqfggKkncBhJB/4kXDB4TXvEw/Y=;
        b=gqPYs4LNQA1FTfJY/pm/3p+GLifeocdS1Asm0JES9eillIIey5QnFc/UhNDzY9yyuR
         joYmDv593u6HBz+ajkzn5E4b5pfvczF1q6frpz10iKsqMQrpBEf7zBR6gJHDQjpz4j+f
         mu0TlFE/92sn8QQGhu2/wnEdWmfbyyULNqA0reUZotD1i35xo5w53IZrRbposwrcoP+C
         QTuMfpenwztzIJ1bVo5npK1+sqCiI/nTjElizOKFfq/J/Tzx4WOIRiiRDVO/Yl8pKlfq
         ocLpZHtZdEoM0A1h0GvyMBLzsy7JYt9chRcMrW7v6wtPvJBsPs5JfY20fhD70h3j8wjX
         1N8g==
X-Forwarded-Encrypted: i=1; AJvYcCUAv5lE4FU9qf+5i0sJ3tzfKakUfgdR6U7JRJTb1RxG7622Vr03SCwSkMEorijgNbG8HduKhbXOqpE0DN6l@lists.linux.dev
X-Gm-Message-State: AOJu0YztG8Fp8ImDVspNV1bm0RH2vGggC6M8DytV0u9LVLlqcn9rMCmL
	dOckpvX1unqy8Idqo46Cr5YVcl9dhH1GXZycPDH/cZ680p0O7KGGjwL5
X-Gm-Gg: AZuq6aKs4RH0npPa+dhuBLJUWfjrYP3c+S6lNrSNtBfT6mUJIxQrx2sXnYapHG0t4W8
	tWUTb1JJaz5pCB731y3BjJNhF+YKtDo9VlU5YEMTRpF1Q4lZ9ZtPN62eifhGLFY6WxJChfXMoZD
	A8cf7173lxvFFTWHvtkyxnAudI/G35czXh/JuDXXTcqyshRx0xV6O5OzJa4mmNHuMLdt4V+Tb3f
	hp8wEqWFcAqNrFpqudzuzH7b58XrKSWhNkV3AsRHERkT1adw2YnRX4F495RpV1BjVZ3gAnhd2kC
	4p2PHuTJY26trjM11YFJGgwGW8LsyfoTgkrn3ss7nmZmXCRc6y6O+E4IHPi4AXrz9cHX1ufQSp7
	0TPCK3Yt9T9qiO3rUPQuhq4F42HeAKLXXbq0llE7HtxHdZYf5tKEGyjGp5i2cQeNdzMPMDA8sGx
	8OIiUnaghCIsTmUvzPGdMbVRxCQWHnjky9LA+6ub9Mi3iX8M8nYhaxDMf1fK2kxBWkC1KZLI+sz
	i4bvtROGOzrRPc5F4N58p8AruHyiy8BuHN+zMyHrsyctiHjBUx8tzfpqy3P2FdaS63WTQ==
X-Received: by 2002:a17:907:60d2:b0:b87:d09c:1825 with SMTP id a640c23a62f3a-b8e9f14c447mr73686566b.13.1770160079802;
        Tue, 03 Feb 2026 15:07:59 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.od237066db22328bb-tp.internal (33.242.13.34.bc.googleusercontent.com. [34.13.242.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0021b3bsm38486566b.49.2026.02.03.15.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 15:07:59 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH 1/4] staging: sm750fb: replace strcat() with memcpy() in lynxfb_setup()
Date: Tue,  3 Feb 2026 23:07:55 +0000
Message-ID: <20260203230758.3056-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace deprecated strcat() with memcpy() in option parsing. The
destination buffer is allocated with kzalloc (zero-filled) and the
write position is tracked via pointer, making the null-terminator
scan in strcat() redundant and potentially unsafe.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fecd7457e..4c6e84c03 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -1163,7 +1163,7 @@ static int __init lynxfb_setup(char *options)
 		} else if (!strncmp(opt, "dual", strlen("dual"))) {
 			g_dualview = 1;
 		} else {
-			strcat(tmp, opt);
+			memcpy(tmp, opt, strlen(opt));
 			tmp += strlen(opt);
 			if (options)
 				*tmp++ = ':';
-- 
2.43.0

