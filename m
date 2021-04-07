Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D626D10
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:43:40 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id a6so5503937pls.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sykweF1xow+67RG88cYdeLCD9JLGGBr6+VUxqXfVo3c=;
        b=tMCGc6exiWT5/SzYX95SEtNEdMhsPtWabVZ7qpaIQtCMQr0dLxD+cl0mp09sOgtIiI
         Ce+Hbm33MTfaJAWNV3q8V2n2GjOjww0lkrj5EeXUwHimuzbFmhiMaTXwQh9RFZYt0X2m
         +BVu2C+sqHI/QygpybP359dH28as4BQ4P3zvHxwldYit7tZKFBk4UEH++ClZzfbJZZFl
         7UzdMUioFXLYDD/O+qSVnY1OW93UCI8nFo79d43UpH1X4AkKp4K0qznpe18ugdDKGUfc
         FPHIGN0+UI8fyu3r8gI5wtRhZ6TEqUj6Zb2A2CDUSOm+1BG4IEKz/s09ZiQQitcfZ1av
         7Y8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sykweF1xow+67RG88cYdeLCD9JLGGBr6+VUxqXfVo3c=;
        b=tbTVEmKPXovwNo7qotq6VheJoFvlJLWTElTf6tvCeuZRijgvm3kEdkGIhBL2dJANNE
         UVDymw7pAlyF+bWoW27VxlcvCOOAib/DF0L+8WClU27DZVNYDt3ltNhTYnQiMvUjZF8b
         5ZrbkiMOFRAOZglP177f4f9lNVUUBdkaiJ4xlj0qO5uSCCFUiWDuZr7hqrOxuZDSZGkD
         yDRiitDRfqJpVi9VktpncRot3LTte5aVrcRBY2ZPFaaKQbUk3ZO/UQftDidU/O1gyisb
         u1zhGGY3Attqb57/GIU7jS3YmgfACzjAb26o4lCHhqplw2TEptSs6Gx9IfTejOAD+5in
         EF0A==
X-Gm-Message-State: AOAM5312JbVsdPFZWjr9CCfQtTyRbGTAxLgXcHBE+By++bPLCVwQvydo
	51R3FABuXeWrrVbl+KLb+2U=
X-Google-Smtp-Source: ABdhPJxBKfSQkEa2QkysRsUeMg9hiBbRFrLc9DHXYZggn8Gl9H0/Yjp+K7ab73tqIK60RcdNyb71mg==
X-Received: by 2002:a17:90b:f93:: with SMTP id ft19mr1811479pjb.135.1617777820160;
        Tue, 06 Apr 2021 23:43:40 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id e6sm13641235pgm.92.2021.04.06.23.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:43:39 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:43:37 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 23/49] staging: sm750fb: Update local variables in
 sm750_hw_imageblit to snake case
Message-ID: <8785050f4c2d4b9568689fec897aec03ca01da35.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpoint.pl checks for the local variables
in the function sm750_hw_imageblit.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 760dd036d71a..c840873e9622 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -319,17 +319,17 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
 		       u32 byte_per_pixel, u32 dx, u32 dy, u32 width,
 		       u32 height, u32 fColor, u32 b_olor, u32 rop2)
 {
-	unsigned int ulBytesPerScan;
-	unsigned int ul4BytesPerScan;
-	unsigned int ulBytesRemain;
+	unsigned int ul_bytes_per_scan;
+	unsigned int ul4_bytes_per_scan;
+	unsigned int ul_bytes_remain;
 	unsigned int de_ctrl = 0;
-	unsigned char ajRemain[4];
+	unsigned char aj_remain[4];
 	int i, j;
 
 	start_bit &= 7; /* Just make sure the start bit is within legal range */
-	ulBytesPerScan = (width + start_bit + 7) / 8;
-	ul4BytesPerScan = ulBytesPerScan & ~3;
-	ulBytesRemain = ulBytesPerScan & 3;
+	ul_bytes_per_scan = (width + start_bit + 7) / 8;
+	ul4_bytes_per_scan = ul_bytes_per_scan & ~3;
+	ul_bytes_remain = ul_bytes_per_scan & 3;
 
 	if (accel->de_wait() != 0)
 		return -1;
@@ -395,13 +395,13 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
 	/* Write MONO data (line by line) to 2D Engine data port */
 	for (i = 0; i < height; i++) {
 		/* For each line, send the data in chunks of 4 bytes */
-		for (j = 0; j < (ul4BytesPerScan / 4); j++)
+		for (j = 0; j < (ul4_bytes_per_scan / 4); j++)
 			write_dp_port(accel, *(unsigned int *)(src_buf + (j * 4)));
 
-		if (ulBytesRemain) {
-			memcpy(ajRemain, src_buf + ul4BytesPerScan,
-			       ulBytesRemain);
-			write_dp_port(accel, *(unsigned int *)ajRemain);
+		if (ul_bytes_remain) {
+			memcpy(aj_remain, src_buf + ul4_bytes_per_scan,
+			       ul_bytes_remain);
+			write_dp_port(accel, *(unsigned int *)aj_remain);
 		}
 
 		src_buf += src_delta;
-- 
2.30.2

