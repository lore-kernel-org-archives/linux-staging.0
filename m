Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8906C6139
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 15:03:12 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b01d3bb571so32473525ad.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686150192; x=1688742192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Msfw3FZTKqUZwLFrkysjS96Cdf9AFaQ0r06ieq0j1EI=;
        b=ae8/YKfoLrOaxVyfBu/iJH3C6PAtvFYaQurwvNiYf1D9kRVaGAfUs0+4s1rxmS0/f1
         QAWo9JqKmCam0wf0B/CDYNnWcMId90CBErwYs1nGzPp6KLjyfu/699sLJqpmxt44Ju2j
         y3EvTLYYI9qZZKAJEawMh9XwfYCBcNYwTt/kJGrhTlbB+GTP+xgjgi3dW9JE74V1jvPM
         rktd/zKC2Ndwf0oe7MKoP0os2CLh4V3jyJRzSrZNZftsDfqNwp1+siCwC2y1pw4Nn3Bh
         I/ZlWvthFgDf27Ix00KcIyLDulsUnkl4rWRBXM1+FZIOMt/KRPwxvapLDLA0E/0P60z6
         R2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686150192; x=1688742192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Msfw3FZTKqUZwLFrkysjS96Cdf9AFaQ0r06ieq0j1EI=;
        b=TRXpvfTGAe03PySM3Jim6sjlJ0sN1lDM+HH86nYEpL6JP+I3uhMC9j/a4FleuRf6gR
         W1bkFZy3obIOrVuuxbkAdC+k8SLZEsy2LmYyjM1XddR4HfKq3HGEnMvVDUSEft3/ZOND
         GsH0ZhS5bX35nm4V1aeU064qxg/orU50MPtAjynqGxYaKJ+zCxhrItxn0KGXxhK1Wcml
         IMSoPm9t9HsGIQPrnTrx0QI2TMETk65MAZM46G4EbussyRilfqjog73CUgpNaLu1ed4A
         cNRsYnaGZWKy9VVJiSXOS+O4Tx/+Rm0jALYZ4o9lEr5bMMZGv6b2p1wwbYXrvvTcIfdi
         4jIQ==
X-Gm-Message-State: AC+VfDz8c9UIkHbMq4ivogta180KMtf3uQo219VySjftDc3tROWLROaL
	QU2NzDeYStmgNeRivU3IMncOvTx0fLY=
X-Google-Smtp-Source: ACHHUZ5zTs8y/Itlfgfy+8u0sBdZokuQYGHRt7t3asqdPwB0slrZgugbMII/lgbtqzi09ALnSjxDnQ==
X-Received: by 2002:a17:903:234c:b0:1ae:1659:bfe2 with SMTP id c12-20020a170903234c00b001ae1659bfe2mr2531711plh.34.1686150191792;
        Wed, 07 Jun 2023 08:03:11 -0700 (PDT)
Received: from yogi-Zephyrus ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id ld6-20020a170902fac600b001b04c2023e3sm10569143plb.218.2023.06.07.08.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 08:03:11 -0700 (PDT)
Date: Wed, 7 Jun 2023 20:33:07 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] staging: rtl8192e: Remove DRV_NAME definition in
 rtllib_debug.h
Message-ID: <41c6c24e703eedf6fb4febcf4cc7ef180af1db58.1686149467.git.yogi.kernel@gmail.com>
References: <cover.1686149467.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1686149467.git.yogi.kernel@gmail.com>

The macro DRV_NAME is defined twice within the driver, once in
"rtl_core.h" and again in "rtllib_debug.h". The definition in
"rtllib_debug.h" overrides the definition in "rtl_core.h", resulting in
warnings during compilation. This patch removes the redundant definition in
"rtllib_debug.h" to avoid the warnings.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---

v2: No changes.
---
 drivers/staging/rtl8192e/rtllib_debug.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_debug.h b/drivers/staging/rtl8192e/rtllib_debug.h
index f6b23defe225..ab8bd5fc4ca0 100644
--- a/drivers/staging/rtl8192e/rtllib_debug.h
+++ b/drivers/staging/rtl8192e/rtllib_debug.h
@@ -9,11 +9,6 @@
 
 #include <linux/bits.h>
 
-/* Allow files to override DRV_NAME */
-#ifndef DRV_NAME
-#define DRV_NAME "rtllib_92e"
-#endif
-
 extern u32 rt_global_debug_component;
 
 /* These are the defines for rt_global_debug_component */
-- 
2.25.1

