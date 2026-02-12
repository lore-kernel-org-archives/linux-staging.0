Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E453521ABD0
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 18:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770919455; cv=none; b=OwrM1nrerUuq0x+ZrWrIrDIr4D0U+TePdTGqAhbRNThP2NYlID7vT2rMxG7RQR+K5wuZwuA6gUgo5aw/VWBe3IYCTMxvJmMZ+pRRMYatfFYtRuIufF/U9aj6eZDXO7JWUIW2CAkckLyfcYT9x44kQw88fGQmqCp0Z8/LSmmHaj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770919455; c=relaxed/simple;
	bh=TEU5ACtBivSpOWfnK6Sn/cIxkKLzyBH/+2XoKUoppMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kYuGplaDt3VzLQvCdSR+91jbNSh/dlCnGS+bbv0fNWthtsrfkMjmMQs142wz8Qm3znHb7M30wA4Mfy6plBkcMzBbBpIhE8X7YXE/luRzXpd6s0Zf74j6SiQJ8WSD0mZPW+BeesljwEu/M2rMql7hdoatx3LKc0/tzmGvOGK7VKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBAMOFDw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBAMOFDw"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4836d9d54f6so114255e9.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 10:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770919452; x=1771524252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h0wk2xsCrS3DaAr/gCoCsMedTcrkDGhrxiWMWwsv91w=;
        b=OBAMOFDwqYk9OlhqzIjNYcLy0tsa11mUXrqFzcqDcrel+iRCT5PLUQj4wnHgQF88ME
         WsVl9Ooiss9SR3imUstCgQh0xLgoQw6RFLo3lwIbvVx0zZ9o83k1mc0tw9EVs3Hia8p7
         TpVg5XeLQlRl5a8BUQRdvlHTr3A1zKotBL1QXCbLHLMgOwMo11GmhB9WqyI5bFSNkofl
         Sg9I+RG6gaqSAkNPuXp0dUxzpYKBbBHKJkf4IW/M/JTeJMa7cpdweFqF3SomEVqPELTq
         FzsWX7y/6KhENaFhfdReXK5dwAVmaqdeaQCUZxBUXfnrMao6pTMEOI2C8//PO5hd2KSP
         tg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770919452; x=1771524252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0wk2xsCrS3DaAr/gCoCsMedTcrkDGhrxiWMWwsv91w=;
        b=Bba23b2PFSGiBaY1bF7q41jMQjdlVS+vRxvzUJLBOVb1h2l7r7rgKs7GSD/eU3vg7f
         YpHA3a+0hgLX+oAX9Khv8w8Krq8tzgstrTvjsGLNxh4jdp9kplKiQ9C/wx4czUU74EZ8
         x22Up1Jwnz2PYjTsuB5L8CcruRYWY5X5HjVUd1QNxBTzu26Q5RogE9WbEmgN9nWDxXWb
         8iEi1I/hRFFXK7rSYLs0NmBOWbfJER85zGvFhb5iZwb+j3jzb9V1uLsR1hOGQomKSL3b
         3sWqTqSDsjhufR7+wrdq2LtHC0vdl0ZPUs8BhTJ+d9j3qPz84dug1sOBHnccRurN7XLx
         f7qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgKHfOTd2wd/uennxre7bgJjVN2yHsPkZFy3zhjAdGbpYIq9pGe+byRZJg5fwmB83rSswZK/ejpBnIiEnf@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzdwrqdrhziwzlb8vaJsC8oPV6jQEp/3O5zhlqBMWgUeP6EYQF
	IYZZwEJWi3iRsNLvSJutMXM9wDL12cd9UJf3DS5cd1RdSIuNYP6FYRuk
X-Gm-Gg: AZuq6aIZy4RjBDNOPAaQZUyxqLjr2fXtiO2pJHkvwe/thpy4aSgvJH0zFyzZhy61XQl
	zSakb2x1hyCLagt3bHZrCNeR0IkILJkP8czNx9Gy3tQkPRyRkMVfeWBHG10+khjcI7eXsb+FBm4
	obO9Tlo8knBGxdgUlTUu6WxgaZTVtRfBRCBRiNZNGw73ytitfDa805eIKqkyxt77FZrdPh3O8aU
	8zJO8qhHMCv+zfDtCZWG2kkMZRUYqe+2jjJLIwCI2EoKUuvDL8tYktQ9M2nwNK+5p77Mld7iM2h
	RdUo40EdMhz0q1ICcrGyWPmuwj4gJOor6QZ9hokBP3Zf5LwOOfjXmm47T+eTznuEmpSNc579Loi
	8fs3ls6sWOSFjACZk1UQ1CIDnvvbmfGwa2SQOlHUEtk0ZpB53DzNw74hrddJ48qfDYjdnJauZEN
	WrSlRwzeqwCUZryo/HEJ+q1HbVbYHgvIoqqC/B1B2xw2k+lvanMlaMtQL92tEQ59zcbnLZp8Iv/
	A3kqCuJxFTBhA==
X-Received: by 2002:a05:600c:474a:b0:477:7b16:5f97 with SMTP id 5b1f17b1804b1-48370cce47cmr111215e9.0.1770919452101;
        Thu, 12 Feb 2026 10:04:12 -0800 (PST)
Received: from rachel-VM.. ([31.44.137.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783d34657sm15932004f8f.6.2026.02.12.10.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 10:04:11 -0800 (PST)
From: RachelOvrani <rachel.ovrani@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	RachelOvrani <rachel.ovrani@gmail.com>
Subject: [PATCH v4] staging: sm750fb: Rename nDirection to new_direction
Date: Thu, 12 Feb 2026 20:04:02 +0200
Message-ID: <20260212180402.69356-1-rachel.ovrani@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the variable 'nDirection' to 'new_direction'
to fix the warning reported by checkpatch.pl

Signed-off-by: RachelOvrani <rachel.ovrani@gmail.com>
---
 v3 -> v4 : Directly rename from nDirection to new_direction
 v2 -> v3 : Change the commit message more appropriately
 v1 -> v2 : Renaming n_direction to new_direction 

 drivers/staging/sm750fb/sm750_accel.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 046b9282b..c796d410c 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -153,9 +153,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
-	unsigned int nDirection, de_ctrl;
+	unsigned int new_direction, de_ctrl;
 
-	nDirection = LEFT_TO_RIGHT;
+	new_direction = LEFT_TO_RIGHT;
 	/* Direction of ROP2 operation: 1 = Left to Right, (-1) = Right to Left */
 	de_ctrl = 0;
 
@@ -173,7 +173,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			nDirection = BOTTOM_TO_TOP;
+			new_direction = BOTTOM_TO_TOP;
 		} else if (sy > dy) {
 			/*  +----------+
 			 *  |D         |
@@ -185,7 +185,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			nDirection = TOP_TO_BOTTOM;
+			new_direction = TOP_TO_BOTTOM;
 		} else {
 			/* sy == dy */
 
@@ -198,7 +198,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				nDirection = RIGHT_TO_LEFT;
+				new_direction = RIGHT_TO_LEFT;
 			} else {
 			/* sx > dx */
 
@@ -210,12 +210,12 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				nDirection = LEFT_TO_RIGHT;
+				new_direction = LEFT_TO_RIGHT;
 			}
 		}
 	}
 
-	if ((nDirection == BOTTOM_TO_TOP) || (nDirection == RIGHT_TO_LEFT)) {
+	if ((new_direction == BOTTOM_TO_TOP) || (new_direction == RIGHT_TO_LEFT)) {
 		sx += width - 1;
 		sy += height - 1;
 		dx += width - 1;
@@ -277,7 +277,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		  (height & DE_DIMENSION_Y_ET_MASK)); /* dpr08 */
 
 	de_ctrl = (rop2 & DE_CONTROL_ROP_MASK) | DE_CONTROL_ROP_SELECT |
-		((nDirection == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
+		((new_direction == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
 		DE_CONTROL_COMMAND_BITBLT | DE_CONTROL_STATUS;
 	write_dpr(accel, DE_CONTROL, de_ctrl); /* dpr0c */
 
-- 
2.43.0

