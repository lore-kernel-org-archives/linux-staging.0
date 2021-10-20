Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE4472
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 08:41:03 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id l38-20020a05600c1d2600b0030d80c3667aso8295787wms.5
        for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 01:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0DxiQ6TI/H+Bup1Rn6Wt67LAOz/W7N5QmWO1MsPbNPg=;
        b=hk9EFm6Ew7/OwTOILie+GA5vHO1+XXROBxMTy0GYFycHK16AAuIKgfwOauIM9zhSoT
         iNyaXuY0zIlwORFLZ2Jn4WR4UdQ2HEUgjwoVudlGjMCkYLXVzsJh3xzXwLCOKQY0xHeE
         ION4kdrI9I/wwG+fHY2eN5Js8chUiGO56m2+OYdOojZrLn6Ipw/dw1Wxph5PsBB48aAI
         NgDUa9XVtwa1qAOOeO8LbZtahrUKm2BLEoHwAHF7NokfQzDFvYsIXOfYjKm5ixEDcaAL
         dHUGxQBsrIKchpo+QJ/yM2dv5zeWcmVM7UX1Jtrg9/09qlEqD5etSvOm6TdWrZawFu04
         L5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0DxiQ6TI/H+Bup1Rn6Wt67LAOz/W7N5QmWO1MsPbNPg=;
        b=ocs3O7vR9g/W34iwpRNWkm9WJPDYb7N371DftW8X+xZbzgNoa7jv1B32JWZkrMrcT4
         1AgZQghxbNBlNcgPq84ddFU7WGta382GS2sf+SiGESjIOKSUnqgtMfANKk6MT0cHBaWS
         1oB164ua1Pr3UIOjHUgt+HkbTjPYIlvx1v6budbGUC3q5N4lkp+lsMIlKwJVfxanx9vN
         brIoqrhKlLUZB1qXqo716+f/RPsoEDDCjy9Nyxfe4I4dXyilNIQuBuwZNbuEfyjkqiIT
         qqk09VtziCbsCb0sD7TmSB/dnSFc/90i6sXkGhhvYAL5dVoSRp7IsI+P8foCPG0cE2as
         CqWw==
X-Gm-Message-State: AOAM5334E7hrMeL/vXB76jwyhv7VV1jyfKuS9wY6hYXYm8//TOS+6oO7
	mkPDSkviRNqGjRRpTVTBhnI=
X-Google-Smtp-Source: ABdhPJy2PDjuqRp+g9ERz9QKvam31pZxlBxQEt2dG+zVJYs9p8Euwqqiib7deD9G9KBmhre8peMfFA==
X-Received: by 2002:adf:ead0:: with SMTP id o16mr18972262wrn.106.1634719261399;
        Wed, 20 Oct 2021 01:41:01 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id l13sm1348612wrn.79.2021.10.20.01.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 01:41:00 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH] staging: vt6655: Rename `by_preamble_type` parameter
Date: Wed, 20 Oct 2021 09:40:33 +0100
Message-Id: <20211020084033.414994-1-karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop `by` prefix in the first parameter of `bb_get_frame_time` function.
As the original argument, `byPreambleType`, was renamed to `preamble_type`,
the parameter referring to it is now renamed to match the new naming
convention.
Update `bb_get_frame_time` comment to reflect that change.

This patch is a follow-up work to this commit:
    Commit 548b6d7ebfa4 ("staging: vt6655: Rename byPreambleType field")

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/baseband.c | 6 +++---
 drivers/staging/vt6655/baseband.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 5efca92f1f18..8f9177db6663 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -1691,7 +1691,7 @@ static const unsigned short awc_frame_time[MAX_RATE] = {
  *
  * Parameters:
  *  In:
- *      by_preamble_type  - Preamble Type
+ *      preamble_type     - Preamble Type
  *      by_pkt_type        - PK_TYPE_11A, PK_TYPE_11B, PK_TYPE_11GB, PK_TYPE_11GA
  *      cb_frame_length   - Baseband Type
  *      tx_rate           - Tx Rate
@@ -1700,7 +1700,7 @@ static const unsigned short awc_frame_time[MAX_RATE] = {
  * Return Value: FrameTime
  *
  */
-unsigned int bb_get_frame_time(unsigned char by_preamble_type,
+unsigned int bb_get_frame_time(unsigned char preamble_type,
 			       unsigned char by_pkt_type,
 			       unsigned int cb_frame_length,
 			       unsigned short tx_rate)
@@ -1717,7 +1717,7 @@ unsigned int bb_get_frame_time(unsigned char by_preamble_type,
 	rate = (unsigned int)awc_frame_time[rate_idx];
 
 	if (rate_idx <= 3) {		    /* CCK mode */
-		if (by_preamble_type == 1) /* Short */
+		if (preamble_type == 1) /* Short */
 			preamble = 96;
 		else
 			preamble = 192;
diff --git a/drivers/staging/vt6655/baseband.h b/drivers/staging/vt6655/baseband.h
index 0a30afaa7cc3..15b2802ed727 100644
--- a/drivers/staging/vt6655/baseband.h
+++ b/drivers/staging/vt6655/baseband.h
@@ -44,7 +44,7 @@
 #define TOP_RATE_2M         0x00200000
 #define TOP_RATE_1M         0x00100000
 
-unsigned int bb_get_frame_time(unsigned char by_preamble_type,
+unsigned int bb_get_frame_time(unsigned char preamble_type,
 			       unsigned char by_pkt_type,
 			       unsigned int cb_frame_length,
 			       unsigned short w_rate);
-- 
2.30.2

