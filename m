Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1868A70
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 20:39:12 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so5384971pjb.0
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/L7A3l46tNABUmGq61qq6UpeuB+FYzbiNc0Yan16neA=;
        b=EwDXlZrtDBcn1kmjhbjlnompQxgc+bbs+bYgDfMiDzrFJ94mKNOX1TEvsKhTafxSQ7
         gi11uKhdIR2lqzhqyvJkFrEMnPLLFipZ18nx+Tx5WpFSTf1+kaADZaB3uqtiyCgXFdwE
         pAh2IEO1qgBCdb1UVuKMoiaNRvNxfLg0zP2XBosCWQInzx+ANb9KYuTiiDwU7uYsU7Fo
         TPNLCYmUekzGGFkcoq64rT8xDGowGdzRm/Ei6+6PACZE4N3QC9v4xZkSOlqTb1y2OVce
         eb92xWSEAbwd524KsdZX8+XCFaY+dP0iP7rlDB+fsYZFwj2b3NO03i8rAWzD+KkGiCMI
         G4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/L7A3l46tNABUmGq61qq6UpeuB+FYzbiNc0Yan16neA=;
        b=mVNOqSSJ2T7dwTN+BSf1qX3gbyCd/VbDLl5b3/ALNKoYDoCUrNUVCX5Q9ylqJrYWrN
         vEOWwYQDvcE2nwfrq6YfnhVvhX0ZeEWZ+FjV6fl8to++aIloygPgwuiARPwskBugVyn6
         j6iYBtyoZ4uippDh11rUSSvhTxtDSJSpc7S9c5g9CJXI5m9zIU3DkQPnFII5BgwcOhpb
         0xrEN5dwg6tBPMyyStOTAdk9R1fm/z4+TuBbNWvJo2fpo1lpvVlunwyoUM3LeVDBOEwj
         stVvc9tDywwEFFpp7yGQ2hsQ3Dy/5bKV9A8pjLLU42OlAnUkfPNiv50gAOEmSXysBOOp
         I78A==
X-Gm-Message-State: AOAM531/zj5RSP0O9Z/0IAx4bmSbiudvt79QolRxJvpp9b0Lo+cVeaEK
	LDy0i55UJCBaZbJgn6uJibk=
X-Google-Smtp-Source: ABdhPJw0TdUMwYSHaKKvvRCxUme6TrxQBpONY4bga2EFyFtosnFHSNkJ+jdNS5lpJvYQFyORFbgOQA==
X-Received: by 2002:a17:902:6946:b029:e9:4dcc:9966 with SMTP id k6-20020a1709026946b02900e94dcc9966mr9601041plt.6.1617914351540;
        Thu, 08 Apr 2021 13:39:11 -0700 (PDT)
Received: from kali ([152.57.11.236])
        by smtp.gmail.com with ESMTPSA id t10sm259255pjy.16.2021.04.08.13.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 13:39:11 -0700 (PDT)
Date: Fri, 9 Apr 2021 02:09:03 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH 2/2] media: zoran: replace bit shifts by BIT() macro
Message-ID: <ac8ec2b70ac2cc7c541c05a1d9a8db1fe79df793.1617912177.git.mitaliborkar810@gmail.com>
References: <cover.1617912177.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617912177.git.mitaliborkar810@gmail.com>

Added #include <linux/bitops.h> and replaced bit shifts by BIT() macro.
This BIT() macro from linux/bitops.h is used to define ZR36057_VFESPFR_* bitmasks.
Use of macro is better and neater. It maintains consistency.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/zoran/zr36057.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
index a2a75fd9f535..93075459f910 100644
--- a/drivers/staging/media/zoran/zr36057.h
+++ b/drivers/staging/media/zoran/zr36057.h
@@ -8,6 +8,8 @@
 #ifndef _ZR36057_H_
 #define _ZR36057_H_
 
+#include <linux/bitops.h>
+
 /* Zoran ZR36057 registers */
 
 #define ZR36057_VFEHCR          0x000	/* Video Front End, Horizontal Configuration Register */
@@ -31,12 +33,12 @@
 #define ZR36057_VFESPFR_VER_DCM          8
 #define ZR36057_VFESPFR_DISP_MODE        6
 #define ZR36057_VFESPFR_YUV422          (0 << 3)
-#define ZR36057_VFESPFR_RGB888          (1 << 3)
+#define ZR36057_VFESPFR_RGB888          BIT(3)
 #define ZR36057_VFESPFR_RGB565          (2 << 3)
 #define ZR36057_VFESPFR_RGB555          (3 << 3)
-#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
-#define ZR36057_VFESPFR_PACK24          (1 << 1)
-#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
+#define ZR36057_VFESPFR_ERR_DIF          BIT(2)
+#define ZR36057_VFESPFR_PACK24          BIT(1)
+#define ZR36057_VFESPFR_LITTLE_ENDIAN    BIT(0)
 
 #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
 
-- 
2.30.2

