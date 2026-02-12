Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEC22C235D
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890248; cv=none; b=SQb1A3QKwdDs3gMQ8P2e/uzJQrK28wrFqzX62dpEF5jAts/8VxShTYL2IbZ7NUNR1g4cD0aKfOFAq2Gii4WK3LjreKb+CRHgrdIxFODsunqm74dYgYZ/jygyMYH13UmbcfTZfmXgSgAfLYN7HHDFUlOshFOQvxvhGOqAqYMBjnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890248; c=relaxed/simple;
	bh=A5kxwkb9pyLuOZSYwAnJI78nrDm6G7P38RMcwSN8fek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pzvd4j07wFRZuJJXclmu7MJDvBLM1inL08WhSFLXKK+23vakK0N3R0Xb64sZSjdmi/74TzClL22+fzOBNExqnABmsni8bPuSL+gL9mXcvyyb6Ip0tE2WUvY9y21i/3lznONnqRWINQEhN++7/VDIsPvnaD3Bn2HrpocLlE91UuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrookgNl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrookgNl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4832c8f9d87so4051305e9.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 01:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770890246; x=1771495046; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ytyEs1/YnZxnv9lnNRonE6+DQR6UbuV0ywPhF1Dur1A=;
        b=mrookgNlh9Y7NDCsEXKfJhZI/seQGkm2vsp2Kv5FiePH/snnrax1dYDQv2lSEKxOem
         nkEuQpWZWE+MLIN2TtSY0RMO9TBgmhQ+5RINld7jQzCfIhre0jdG2DbOXraUMIeqO9cj
         xDGfLUdGghEFBGVZWRD+StRdOAJlo+YjWGrZsQhE/8oAEX6WvKH+0eGY35UGi9oABsCj
         crCAlSMk466TRJdwrfQOJVLUqFYN6wXpJx9b4JJbAXbklB+cJVxHFrlTdrOTi3V4C6K4
         ZmW2YQ7rqFBILpUZl5G7n64o7rI6M2uvaezHngTONICt0zX06iS3y320S5FJ3V9T1IpO
         pWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770890246; x=1771495046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytyEs1/YnZxnv9lnNRonE6+DQR6UbuV0ywPhF1Dur1A=;
        b=pGp9hsFKuqp6B53VNMhdoQ+1dVU0JjkXxSE/S4anrNsFDGJduX7b1QQGw/4RkF9LZm
         vaCYEC84NHJ9BrW1T984mpJnYY2QlWD1Po4ORXoyL8kPKaGxU9ujCiaQC8RczSFdNXNK
         gat5FMTx6u20QZrOm80vuzYaP43TsPoX0X+/Flk5AY9U1vLNRpo1O/sSJsXGCT8zAC6H
         gNmFW430iFO5Vun4iICBlB5bVK/MS1awvFdYPULcCme4BF9blsBGYDJI4N+xUyFeVgFq
         xmvWouNbAoftqwPKohEflUGZxyEAYE+3vadzMUcI+LduGQKwT5jeErv99/iznyrhAR5l
         kiuw==
X-Forwarded-Encrypted: i=1; AJvYcCW/Lwmb/PHGTlt/enhl1hovg3wjQ65z7tjQqjSJCiGCB3v2q8PS6cwbHQoqJDTBMj2zc+7MssI3B4NbJ0u1@lists.linux.dev
X-Gm-Message-State: AOJu0YwrDM+jFZoXHbb4VOmJ1CB3YJsK6/YttVJL8wj7wmxAmWyJOUyP
	RaATqG5CDfKazl35ynBlsQFo5JdpKpwx9fblN7ROltL4TXeHjL3jjctA
X-Gm-Gg: AZuq6aJYUFP+H9XMb56xVd0CbFEmjVBLwu76e02QM65oOcOoL6bLWTdgBmNNBr/VztU
	XZUAtwVMY+4qXOM3Fu4JxptuUxGf5z7OZu7KqkGzIfwuQSHxQR+swb9dIj1kR1tFccqTAXqwTtd
	kVE3QQss8pXL5pOC5IGCeWVv8fwTaDya2dX0WeTTKGjJX0jZQKeS3O72Ud+xD14ego3QLE7bTYD
	t07Q5qk5jqIoc4v9D5MF9b/Jdwfy4KOFnXPNrd2N2fIR2F2lNPOnlgI9tFpGPL1lgYwToLPKNaf
	yOZqAAc/RNyWPQZNBU4G8K7ZRyhthCpdUT4bqxgEWwQXvJ9hdOFrFaieSH4P2zMlXrCW2NtaBtd
	SYyOP/HzyUnfu+o7iMPZiDZTuI8gOQpQzBTIG/oju947ZQPVFS4vmndZa/a7trFvRiPC1h6fzj7
	F/g2LPNcZkv5mLVUXJUf8ytYx3UgE8751y3B7e/2mZlZ8xvRy06G+2tMy/z2o1rXhaBQUQUpOxF
	UUfsPlpCVGPnQ==
X-Received: by 2002:a05:600c:4e91:b0:477:9c73:268a with SMTP id 5b1f17b1804b1-4836571e7d0mr19202025e9.6.1770890245776;
        Thu, 12 Feb 2026 01:57:25 -0800 (PST)
Received: from rachel-VM.. ([31.44.137.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836131d48fsm27902405e9.24.2026.02.12.01.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 01:57:25 -0800 (PST)
From: RachelOvrani <rachel.ovrani@gmail.com>
To: dan.carpenter@linaro.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	RachelOvrani <rachel.ovrani@gmail.com>
Subject: [PATCH v2] staging: sm750fb: Rename nDirection to new_direction
Date: Thu, 12 Feb 2026 11:57:15 +0200
Message-ID: <20260212095715.2844-1-rachel.ovrani@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the variable 'nDirection' to 'new_direction'
in drivers/staging/sm750fb/sm750_accel.c to comply
with Linux kernel coding style guidelines.

The variable holds a newly calculated direction value,
so 'new_direction' makes the intent clearer than 'n_direction'.

Checked with checkpatch.pl --strict: no warnings, no errors

Signed-off-by: RachelOvrani <rachel.ovrani@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index e1877e5d0..c796d410c 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -153,9 +153,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
-	unsigned int n_direction, de_ctrl;
+	unsigned int new_direction, de_ctrl;
 
-	n_direction = LEFT_TO_RIGHT;
+	new_direction = LEFT_TO_RIGHT;
 	/* Direction of ROP2 operation: 1 = Left to Right, (-1) = Right to Left */
 	de_ctrl = 0;
 
@@ -173,7 +173,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			n_direction = BOTTOM_TO_TOP;
+			new_direction = BOTTOM_TO_TOP;
 		} else if (sy > dy) {
 			/*  +----------+
 			 *  |D         |
@@ -185,7 +185,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			n_direction = TOP_TO_BOTTOM;
+			new_direction = TOP_TO_BOTTOM;
 		} else {
 			/* sy == dy */
 
@@ -198,7 +198,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				n_direction = RIGHT_TO_LEFT;
+				new_direction = RIGHT_TO_LEFT;
 			} else {
 			/* sx > dx */
 
@@ -210,12 +210,12 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				n_direction = LEFT_TO_RIGHT;
+				new_direction = LEFT_TO_RIGHT;
 			}
 		}
 	}
 
-	if ((n_direction == BOTTOM_TO_TOP) || (n_direction == RIGHT_TO_LEFT)) {
+	if ((new_direction == BOTTOM_TO_TOP) || (new_direction == RIGHT_TO_LEFT)) {
 		sx += width - 1;
 		sy += height - 1;
 		dx += width - 1;
@@ -277,7 +277,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		  (height & DE_DIMENSION_Y_ET_MASK)); /* dpr08 */
 
 	de_ctrl = (rop2 & DE_CONTROL_ROP_MASK) | DE_CONTROL_ROP_SELECT |
-		((n_direction == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
+		((new_direction == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
 		DE_CONTROL_COMMAND_BITBLT | DE_CONTROL_STATUS;
 	write_dpr(accel, DE_CONTROL, de_ctrl); /* dpr0c */
 
-- 
2.43.0

