Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C610E1DF748
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770819914; cv=none; b=VHVL0KDEGIGCJE2epX5bnou4mYvyLbk4atpTXoPvLv8H+Xmu8onjMVONhNt109qkkvyhDdELPRNPpqIzNlR7I/dr8y9riEq0135OwvvG2/IGIWfFLiPC6FohknqtxcmeZIlHOtzRqQ/mPpjmaiD5f5RsOmj9EhiSU78uAPeSiHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770819914; c=relaxed/simple;
	bh=MRKb64R7M2k/4tb6NUEUYyTbV9gJoZsd3aOWYmHnG9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hv/5Ri/2+lbQbQ3Mco1s4iSOKJsJE8UbnVcv8kL/RZsHFZ05tr/+Jp931wP6c6/5yA4urAvkSSia6XMHwZCvVrJc/SCFHP6kO2ZVcYDWcG0ZHLdW1rP1eWxt76b3smz7eIoZcGQV/ikvij4imNVHf01Gr9q6lMFTi+RLU4YKmgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sivoo8vH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sivoo8vH"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4830b67aa6bso7326415e9.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 06:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770819911; x=1771424711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cvNdR7pVcMzecfp9WHQ/bIW4OQ4XE6zPka3hTScbHhU=;
        b=Sivoo8vHv/CKlr6oB4TYEy9Bx/uC6IHZ64BooIf+XdHoteq5x492v08TvV3ZV9hkRn
         MK5+rm9kX+JW1mrJBtAK1WuvGIZFiWgq1eZDshJiz+EOMygdyw2RHEny1WwBi9sRGH9m
         eeiuZF83mwVoREwpc8rO4v8nIb5CJ9F13cN09MUxpRb0cy8WcXt7DQp0SP6fHPio7LM0
         1VnaWSrxkSAbs+rLnCqd0Lbp7nBs2cjgcDRxcPSv3XlCpZGYwa/KdiAnN+kczk4uvkEB
         ReRxKdG6RsAm54tEe/fpYZI41laAHRk1MKiKyB+FKzkm20N+I6kd1Gi+Ki+VEQTuaM3i
         ltyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770819911; x=1771424711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvNdR7pVcMzecfp9WHQ/bIW4OQ4XE6zPka3hTScbHhU=;
        b=KW9NuV3GFP/ZBkzlWXzKSQ5zIsYEC6IfISvHjiGxzPQ/CuOFB6OUbAzhk7m6yfInk/
         8flkQQKFGmqZgVtPDTWs7KD4x8VYf6Z8DDVAgtYZaOwi6jla5gnNsrL6OlZJU/w+4kwg
         rPnYD405EofpjRyZq9HfiXzMwwhIdsdC3tNp0Vwnv+ZCaH5IpxB4FF7cuLWmnZT2yfPS
         WyHfzJVq78yLMSrpVLe7B2Yw/7IxqAnBufvR+1HO08y3Es7/zikGkwLyFMyFkP/pjOld
         Mk40BcNjTNQGh7HmNYurRo96vVdvRGSz/a3D8awodx9c0Qh4leWZgTd19FheLCq9nXGx
         r8NA==
X-Forwarded-Encrypted: i=1; AJvYcCUKknMmTITEO0jYKscx+BJIocTNQeWn6K7YrS6rsK2FX1s44mCq6gZa5QdWOQBkp/kdc62Uh3iDZMiuBcAp@lists.linux.dev
X-Gm-Message-State: AOJu0YzjFwatfDT5+/tgikuuV0bew5mtb3sjJc9rk6RU4nwq8MXS3iHn
	wyIHv2A1b/iX5bJoVG73Kscj/TsBae6dc+iEewM/GJ+fytqf9vMjP8mo
X-Gm-Gg: AZuq6aKX1aTQmK9X0UZxbU0G/My3EL2qMbBJ3qnG8wVi0Gb6DVa+6pqCc23VE11hQFu
	byt4QwTKKvpxYJZJUTuJMwIDVzkCngdOWRdYXGw7gB0lAJhbb31ZU71peZ4ib5+9bM2oWpO9gpg
	GEl9tiGxKvfnkffNaJLHd5QJ0luug5qzwh/u/hxTYXfk3tLdgDnntbPIR+2nsu/vukYIIjJXwfU
	3k6dGGKpoRJRnh2uZLWzK2Qif6U+RQOUQIrsp3F/G0YkO85TW9p6YEDVTHpM88KsecBHL67oglm
	Cw7vvo1Mc68TTGlQnXXCvaLZfHal4QTvVOR00iv2ZZTDL2H92VS4rWWEQDjcBNaxoQXQ8FO9puJ
	+0cVSlmwJmwI0B+owQGkJTIi2kvUET6PHykQVB4IPnVF3cKQtXFDcYMqxz71hVgPno76JJwCqst
	D5UFfA1+8NTVVTliPZjp9kMTk/0Fd7ONHNFapmloUXlTjEZZHVjTpSVEOlHW1WHRSv4Nu1uGRiU
	0NpXngVIqZtsA==
X-Received: by 2002:a05:600c:34c4:b0:47b:d992:601e with SMTP id 5b1f17b1804b1-4835dd85ad6mr19197125e9.2.1770819910883;
        Wed, 11 Feb 2026 06:25:10 -0800 (PST)
Received: from rachel-VM.. ([31.44.137.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d989165sm57573175e9.2.2026.02.11.06.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 06:25:10 -0800 (PST)
From: RachelOvrani <rachel.ovrani@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	RachelOvrani <rachel.ovrani@gmail.com>
Subject: [PATCH] staging: sm750fb: convert nDirection to snake_case
Date: Wed, 11 Feb 2026 16:24:22 +0200
Message-ID: <20260211142423.4922-1-rachel.ovrani@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the variable 'nDirection' to 'n_direction'
in drivers/staging/sm750fb/sm750_accel.c to comply
with Linux kernel coding style guidelines.

Checked with checkpatch.pl --strict: no warnings, no errors

Signed-off-by: RachelOvrani <rachel.ovrani@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 046b9282b..e1877e5d0 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -153,9 +153,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
-	unsigned int nDirection, de_ctrl;
+	unsigned int n_direction, de_ctrl;
 
-	nDirection = LEFT_TO_RIGHT;
+	n_direction = LEFT_TO_RIGHT;
 	/* Direction of ROP2 operation: 1 = Left to Right, (-1) = Right to Left */
 	de_ctrl = 0;
 
@@ -173,7 +173,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			nDirection = BOTTOM_TO_TOP;
+			n_direction = BOTTOM_TO_TOP;
 		} else if (sy > dy) {
 			/*  +----------+
 			 *  |D         |
@@ -185,7 +185,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			nDirection = TOP_TO_BOTTOM;
+			n_direction = TOP_TO_BOTTOM;
 		} else {
 			/* sy == dy */
 
@@ -198,7 +198,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				nDirection = RIGHT_TO_LEFT;
+				n_direction = RIGHT_TO_LEFT;
 			} else {
 			/* sx > dx */
 
@@ -210,12 +210,12 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				nDirection = LEFT_TO_RIGHT;
+				n_direction = LEFT_TO_RIGHT;
 			}
 		}
 	}
 
-	if ((nDirection == BOTTOM_TO_TOP) || (nDirection == RIGHT_TO_LEFT)) {
+	if ((n_direction == BOTTOM_TO_TOP) || (n_direction == RIGHT_TO_LEFT)) {
 		sx += width - 1;
 		sy += height - 1;
 		dx += width - 1;
@@ -277,7 +277,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		  (height & DE_DIMENSION_Y_ET_MASK)); /* dpr08 */
 
 	de_ctrl = (rop2 & DE_CONTROL_ROP_MASK) | DE_CONTROL_ROP_SELECT |
-		((nDirection == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
+		((n_direction == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
 		DE_CONTROL_COMMAND_BITBLT | DE_CONTROL_STATUS;
 	write_dpr(accel, DE_CONTROL, de_ctrl); /* dpr0c */
 
-- 
2.43.0

