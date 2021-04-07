Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B6D6D11
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:43:41 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id h25so12297438pgm.3
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7SRBX2zWlmG+Wnp7OjpNFHLRL6YKU9gaSLUgjStjeSA=;
        b=AMYUtoZ2wZYY0gE9hzXqShCPRugVZ8z0VUJuJH69xXJaXI/FZ+5yIsOAHHhp/Xa8EG
         nG060gKFAckyldI9nEBSQFRlUT5CBU5SN/CdLeGI3klVLm++zuw+TWeFGFhcsC4+J2Tr
         YT6c2ZKmlY8a3+ecoahFAL7uMsLzRMzRR01xwgPZhBbBmxe56yV8/VeRhVyaLqGT7lDN
         7dVox0XD/bmyyw1HFVvKsHHtMj11E4isqMso+4SBhUk2EItcxuSE0vnAEObsO8BNXkEO
         wnG4SUBiLS1blPlV21YE0eSx40atF61ipiDIbZ5sqVgOW+UnA6x9Z1T2uG8dTOAw+OFR
         yCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7SRBX2zWlmG+Wnp7OjpNFHLRL6YKU9gaSLUgjStjeSA=;
        b=VhkvuP7pKiHSH7RQ5pGekxCqMVB/nxNUcpN71qRna+nX+Pu4jiepbxk66HDgbHN024
         8+V/6DBkFQVAzfo75YrAPxMq62cTCDk881GvOCVwYYz1v9aEyRKJh3O0XU7x+Lbt5auP
         E0sZ0NLldeiTIGSD8tRsLRwVzxdy+FOl/qCT4TPjc1tRkMFmR9En5Jl+J8PU8VX8p4wJ
         1DbxcxaRwWKJo1mz5pQJl+adyq2RnYRhzxXVH43nV4Zwp103gemS2RIcgqG5o90E2xue
         dLNTGzvfYOnDCqY9xk6G7vVsevY6tjmYEcTVOwLagHi6y5lCc8jPPCuPT/2oMRdo0GDJ
         zEeg==
X-Gm-Message-State: AOAM530KZxcC9fPy5iFEdiarUuWbjlzMMVQHoape/LKLXgc+koNaWwXn
	m/kJTSTHrSA+NYTscsYdPwSyTkBv8jgiEg==
X-Google-Smtp-Source: ABdhPJwqQmSR9ejO+2SH7wVFCu55gOSjGn+5iNaoES3fzICyJ7d5/kNX9xjU90SUtbPAmh/KqTV17g==
X-Received: by 2002:a63:dd14:: with SMTP id t20mr1912847pgg.258.1617777820715;
        Tue, 06 Apr 2021 23:43:40 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id x2sm20604956pgb.89.2021.04.06.23.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:43:40 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:43:38 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 24/49] staging: sm750fb: Update local variable in
 sm750_hw_fillrect to snake case
Message-ID: <cd24d36b55d3bdb6121e86b8fb2112efbfdd3f89.1617776878.git.pavle.rohalj@gmail.com>
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
deCtrl in the function sm750_hw_fillrect.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index c840873e9622..1eeedacfc4a8 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -90,7 +90,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 		      u32 x, u32 y, u32 width, u32 height,
 		      u32 color, u32 rop)
 {
-	u32 deCtrl;
+	u32 de_ctrl;
 
 	if (accel->de_wait() != 0) {
 		/*
@@ -122,11 +122,11 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 		  ((width << DE_DIMENSION_X_SHIFT) & DE_DIMENSION_X_MASK) |
 		  (height & DE_DIMENSION_Y_ET_MASK)); /* dpr8 */
 
-	deCtrl = DE_CONTROL_STATUS | DE_CONTROL_LAST_PIXEL |
+	de_ctrl = DE_CONTROL_STATUS | DE_CONTROL_LAST_PIXEL |
 		DE_CONTROL_COMMAND_RECTANGLE_FILL | DE_CONTROL_ROP_SELECT |
 		(rop & DE_CONTROL_ROP_MASK); /* dpr0xc */
 
-	write_dpr(accel, DE_CONTROL, deCtrl);
+	write_dpr(accel, DE_CONTROL, de_ctrl);
 	return 0;
 }
 
-- 
2.30.2

