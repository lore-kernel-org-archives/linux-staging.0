Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C592384
	for <linux-staging@lists.linux.dev>; Wed, 13 Sep 2023 01:02:18 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5774750a6efso2580949a12.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 18:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694566937; x=1695171737; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iP1lkvVYjBN+KkdHkwdbL7/nnWbR17dZlHeb1s8O7n4=;
        b=ECbOE1CDUCUG+OEo2aHTM0bry8PGNjs5QwHzzaEsH4v/awBC7yKVXYLGAmK1iWNt2L
         KiApPOkDKf9HUsm7AcT5ehR1k9PEyT1ruupJiqU6VyF88LZ1Qrr28idAEX6dy1ftUcb1
         cxesFXacrKjvGZumhTl6XwywtkDuTjuD7iPXpJazOdTQnR2sKPvWUf+cGr4ZnqjDIr8e
         o4Qung8PuIZa1A9gbMbaQfvx/MGL2GffZZxfkwS+P4/r3DMWrl5SsE/rfn6AWacwZwmg
         Wv/9PGE6YNfEWbyK8sp8QA62iCzfSzInoPRM2wG0lnfUWWDn6OvBpPpuMC30nEjBoL1D
         E6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694566937; x=1695171737;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iP1lkvVYjBN+KkdHkwdbL7/nnWbR17dZlHeb1s8O7n4=;
        b=netbuE7u7WfCafAu0a4cfXiusoCXIKeNnNffF2Hv7LcgBd2b3XZB4PvH/1uz1iIeou
         vYJd85YXZAEayhRmmIgE5g61cwmDF1b4VQrI6TJ+B1jl9fSONrrmN9TV7BLyJ445za2H
         YIh6+glxYbvk2KijqbpRAzwjL/l5ZDwmj9F0sjux5iXdeQttEpAj3LH1ZbaSSjvwejY3
         o7Nu+zdKayF8wZZOf36YhIONo85RUW16lqUHOUe/MDLCd8hggDSe2qs/X166yBM9P5lK
         4+SKH7V2XYZ9nta85Nokxr2bmu50AZScqlrEitJGnqPiAhIwVYVXzB5Cj+4FNAQ7xVIY
         hMUA==
X-Gm-Message-State: AOJu0YxOu02/9w5kh52FkfrbFZl6WQbrdN31i9X3NwKNVk+hXA07pihg
	4LcgikubmfRCXAowMaXa1SI=
X-Google-Smtp-Source: AGHT+IFN1PhjaXlp3JAOzpJIqkPhljBgbMWen3PGjjdkTkL3ORlcQHP+ND9StB5BT8IMPAYJA6wFWw==
X-Received: by 2002:a05:6a20:7d85:b0:13a:12c2:359e with SMTP id v5-20020a056a207d8500b0013a12c2359emr1424023pzj.2.1694566937349;
        Tue, 12 Sep 2023 18:02:17 -0700 (PDT)
Received: from midnight ([2001:8003:6434:b000:c30f:d88d:412c:6e9a])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902748400b001bbb8d5166bsm9102235pll.123.2023.09.12.18.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 18:02:16 -0700 (PDT)
Date: Wed, 13 Sep 2023 11:02:13 +1000
From: Angus Gardner <angusg778@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: Removed unnecessary parenthesis around
 conditions to comply with the checkpatch coding style.
Message-ID: <ZQEKFR1OPoXGI2lO@midnight>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

---
 drivers/staging/fbtft/fb_ra8875.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 398bdbf53c9a..658f915b8528 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -50,7 +50,7 @@ static int init_display(struct fbtft_par *par)
 
 	par->fbtftops.reset(par);
 
-	if ((par->info->var.xres == 320) && (par->info->var.yres == 240)) {
+	if (par->info->var.xres == 320 && par->info->var.yres == 240) {
 		/* PLL clock frequency */
 		write_reg(par, 0x88, 0x0A);
 		write_reg(par, 0x89, 0x02);
@@ -74,8 +74,7 @@ static int init_display(struct fbtft_par *par)
 		write_reg(par, 0x1D, 0x0E);
 		write_reg(par, 0x1E, 0x00);
 		write_reg(par, 0x1F, 0x02);
-	} else if ((par->info->var.xres == 480) &&
-		   (par->info->var.yres == 272)) {
+	} else if (par->info->var.xres == 480 && par->info->var.yres == 272) {
 		/* PLL clock frequency  */
 		write_reg(par, 0x88, 0x0A);
 		write_reg(par, 0x89, 0x02);
@@ -99,8 +98,7 @@ static int init_display(struct fbtft_par *par)
 		write_reg(par, 0x1D, 0x07);
 		write_reg(par, 0x1E, 0x00);
 		write_reg(par, 0x1F, 0x09);
-	} else if ((par->info->var.xres == 640) &&
-		   (par->info->var.yres == 480)) {
+	} else if (par->info->var.xres == 640 && par->info->var.yres == 480) {
 		/* PLL clock frequency */
 		write_reg(par, 0x88, 0x0B);
 		write_reg(par, 0x89, 0x02);
@@ -124,8 +122,7 @@ static int init_display(struct fbtft_par *par)
 		write_reg(par, 0x1D, 0x0E);
 		write_reg(par, 0x1E, 0x00);
 		write_reg(par, 0x1F, 0x01);
-	} else if ((par->info->var.xres == 800) &&
-		   (par->info->var.yres == 480)) {
+	} else if (par->info->var.xres == 800 && par->info->var.yres == 480) {
 		/* PLL clock frequency */
 		write_reg(par, 0x88, 0x0B);
 		write_reg(par, 0x89, 0x02);
-- 
2.40.1

