Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773E46D10
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:43:42 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id d5-20020a17090a2a45b029014d934553c4so38210pjg.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iNQgMFGdHCJQybttnc8ZktUg+AuixFV373VKxt8OipQ=;
        b=bL4tLK6rPdC9+pMpm+HgZ5dgrI/LpotabRYSpDBBWA/GPfObATMmj0oDciLDLRPShY
         sXA5qGSY6JqDDlUxFrNOS5K6DaOhD9FNkeKi1J0yNR0qgBn+MEQaHHyUVXB1iUSuRRSX
         hLE9ZBm3U95hSbeespJke+/a1o7eI0a4QBzAZxjEerBV8nRf0XLzTI2RRWQMKKw4tTFo
         3L0fO/i9Q/XwMLOVNY7XZkEzBF9+fiP0M0nZE0wjpRz/N+p2CpVmROeA2QMHqWcVK5Zu
         ZmkodlE1i0ppSsaj6gZiuVrTH1z74+GTKxLid36gFbjvz/4cZubHTHBH/bxkSkOQkTr6
         QoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iNQgMFGdHCJQybttnc8ZktUg+AuixFV373VKxt8OipQ=;
        b=VBq445Yq/uy4y+oBQ9xg9ENnmyvO22zEMEnGdhSeDU903hjMdk9MhMasUiA/2YqOBY
         ZN6tB1c6MV9yucdSYmyI9SJa85oHmH7QjSjjL4hcCZ1k0VE4TdbrUzK2GMOHzDWIlEOU
         l2ZAKOOWUlEBqIUuD+wf1DpHUTF1PavG6yvVDxnEKrepAqIKp+gNbuG/UC5G/FjIupvx
         W22tAVd8TW2jpqnto77LzQSCWrrgZNyGFZMHvSRLSt/gqEdjR46GQVxi5AuPovO4h7of
         X6Rw/Y09O6ZyCpFhq2GtcCDgrjS8q7iciLgZjQ2D7hC1s8V5PNHZtNxTpYMpFJc+Okoj
         aP/g==
X-Gm-Message-State: AOAM532nlx3OQwoGHadcPCNIxKwBrbyHejnhX3S4kebkQlFfmDyEbeqF
	ohxKBKuk8TqcDiXtLxTxOq4=
X-Google-Smtp-Source: ABdhPJxBAsCxXKZcvwuM32JlND25qmOd8VBz/H1GWFe+6qjtmSIae702aXP3xKjzS3nHNJ6Koe5VCw==
X-Received: by 2002:a17:90a:9281:: with SMTP id n1mr1867246pjo.146.1617777822010;
        Tue, 06 Apr 2021 23:43:42 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id j205sm3817856pfd.214.2021.04.06.23.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:43:41 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:43:39 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 25/49] staging: sm750fb: Rename deGetTransparency to snake
 case
Message-ID: <1cdaddb4b127cf70c3ccac2496a29da1b761cfbf.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for the function
deGetTransparency in sm750_accel.c.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 1eeedacfc4a8..8ab7d827a99e 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -284,7 +284,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	return 0;
 }
 
-static unsigned int deGetTransparency(struct lynx_accel *accel)
+static unsigned int de_get_transparency(struct lynx_accel *accel)
 {
 	unsigned int de_ctrl;
 
@@ -390,7 +390,7 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
 		DE_CONTROL_ROP_SELECT | DE_CONTROL_COMMAND_HOST_WRITE |
 		DE_CONTROL_HOST | DE_CONTROL_STATUS;
 
-	write_dpr(accel, DE_CONTROL, de_ctrl | deGetTransparency(accel));
+	write_dpr(accel, DE_CONTROL, de_ctrl | de_get_transparency(accel));
 
 	/* Write MONO data (line by line) to 2D Engine data port */
 	for (i = 0; i < height; i++) {
-- 
2.30.2

