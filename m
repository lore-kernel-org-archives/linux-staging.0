Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6204B6D10
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:43:39 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id i4so314618pjk.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=juPdFsys4r3Aaic/tVEakxA+SlqXVvRJQMcNPtT88ko=;
        b=V3Jd8on2MAtBF/RvEHZ1tA0fxsIBKGL9HyHv8m7MS02I+BhhMaFAxvfwKrxBtdmgIa
         ZsvnIg9VaPf5aQw5/FhyhPtpNNezI9I3/ThfdWf1zEZR9/dAyrl9yIgtsRPYFey6OqMi
         qNdSDWkx/74o0qT5iirVrEh4HwyXNShC+jPlWitcli4StnQCtIHI2ysMQCAQs7K6k1er
         D6dccbtfNj0/+sPSFech95aVrHX7qDadNgR8dQiQo2vYZ7woqy6ZIt+nPa1TyfbMYxv7
         WEMxEyhCUQAo5KbGGsbd7pMB4OC5ZNijgLZQz1Jz1eEupTBufLJkXPS9BjKuav0Vxt03
         ts+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=juPdFsys4r3Aaic/tVEakxA+SlqXVvRJQMcNPtT88ko=;
        b=EZYkV26xdbyuk2hQPJU6tDvbyLdhSBDy9AVZTTMAMT1dJiSS07ppb5XepHlV9+xSff
         +34k0I/pBP6e/DxQTulafVsImYQOLA/00IpvD1ECi+5rtHaxJ7XwA1k7xcv9YYGvTwqP
         D+HW68OhpqIWeGe6flEhHTfRw7TO7/hgktrwDbuQp6653CQy4A0gRR5JvGLLLgeQvgEK
         7k2zAkfl/G1JUbGUX18QDrYPnqClLkuyP8kV9sdgVZYfFZXsqmv0gQhgjGVXasLobKLc
         ECEA/kA8C/IQ2Xu2OTN6sEkDwZq5VvAaQVsL+81mPnKqmDg9SjNBPCLq6AQ8ketojrBZ
         ojQQ==
X-Gm-Message-State: AOAM532CqMSU54OwUP67o5gQTMhhVrNd5foW0/a1cKlJxnYBI9zONKiC
	lAD33CutLUkEGnMV1E2I3c0=
X-Google-Smtp-Source: ABdhPJzooZZLcFRKF8gWsCfqXUMmjqpDRxFfh8K5S0UQaX5Xv3UXDYqGmunEpRFbquOtNCtZ80nsCA==
X-Received: by 2002:a17:902:122:b029:e8:bde2:7f6c with SMTP id 31-20020a1709020122b02900e8bde27f6cmr1686322plb.29.1617777818946;
        Tue, 06 Apr 2021 23:43:38 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id 14sm19981411pfl.1.2021.04.06.23.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:43:38 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:43:36 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 22/49] staging: sm750fb: Update local variable in
 sm750_hw_copyarea to snake case
Message-ID: <e112c237568818ab77e11d5785c89e7932a62678.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpoint.pl checks for the local variable
nDirection in the function sm750_hw_copyarea.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 4ad2814b5b54..760dd036d71a 100644
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
2.30.2

