Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899517F
	for <linux-staging@lists.linux.dev>; Fri, 17 Feb 2023 07:17:05 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id p5so253555wmg.4
        for <linux-staging@lists.linux.dev>; Thu, 16 Feb 2023 23:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t6BNOSoO+eqzIrGc5YjcQrtOV/AtVG7dChYQ+0FvYWU=;
        b=TrSAhZBPF86tNyg/885rPM42yd/1yTX/JCj8950pBROvXCcaEyVL1xvhIBRz5/3qmm
         C8sZoImPpifyoRDYb+gZ3fp87svz49OLgqYFt25pR5g5CT+mFpvLDSybvvmu2oIWvyUY
         o2BTAJfGud/HEVMPRxPcTB/01L9vGE2Fxm58bx8Hr5WPxN80hWFKkOZvU6M85BAlu2k+
         v54XbPoby3bbk+ZZbIB+5NVjSQlKwcOcwPabqFpA8wt57iyrMEdM1PO8MP+U+dfXYR9a
         lvbZTwkIXZdtLmymJuf1b2GurWLk9M3BStpTIlV+J+jAOf0h8SLzVYjQYENHMPc5ILOi
         58Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6BNOSoO+eqzIrGc5YjcQrtOV/AtVG7dChYQ+0FvYWU=;
        b=rF+nJ4M5OHjQrmXckhlTDqZYH0ZW21M37l7M2byhfGv+NWbuQ1WzQKhr+9KDcJr8Wb
         Me/hQhsvUI26i7/L0+kfC6BnVLGu/3PxJHlLULD71E1tG10gLbGz23qSBbziqiO542Np
         RwgEXbd/L3+2vDz6hhDmWvs0U/NX9f3bTwcE2GiLijpUmilM36GvSztqQ5AAuOSJfLt3
         7IKF1nuvmAaKlcx4Yq+Xiurppr4OKuELgbFKH+PDa+cfCvAJBHLRmuT1ZRlfqGe9Tsex
         Wn7Eq3bl2M1Dlx7o6GwMOTMUxaQr16ZTsCPLxL5k1rI1RYaPiVvzn9QdJuQnoocdyLZW
         BrKg==
X-Gm-Message-State: AO0yUKViCOsAHrBXZ3fRGzE6fjj6p4+Brg1GTcJFwyXx0cAho5qjBfZN
	/2ZNQq94Gy2PXKHRHsUpD8c=
X-Google-Smtp-Source: AK7set9ly1Ia+mXD/0+G0LftnFvvo5kcUZsWLkRQalwdQCTyCbPKucIXNoAJZ04MFCdv+PLnHFVYGA==
X-Received: by 2002:a05:600c:818:b0:3e1:97d:6134 with SMTP id k24-20020a05600c081800b003e1097d6134mr7476102wmp.37.1676618223659;
        Thu, 16 Feb 2023 23:17:03 -0800 (PST)
Received: from khadija-virtual-machine ([206.84.147.59])
        by smtp.gmail.com with ESMTPSA id k11-20020a5d518b000000b002c55551e6e9sm3367053wrv.108.2023.02.16.23.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 23:17:03 -0800 (PST)
Date: Fri, 17 Feb 2023 07:17:00 +0000
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org
Subject: [PATCH] Staging: r8188eu: Fixed block comment
Message-ID: <Y+8p7Hyaf4LhO/Sw@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed block comment by adding '*' in each line. The Check message was
shown by using checkpatch.pl script.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index a7c67014dde0..03025dc89533 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -36,15 +36,16 @@
 #define WAIT_TIME_PPPOE	5	/*  waiting time for pppoe server in sec */
 
 /*-----------------------------------------------------------------
-  How database records network address:
-	   0    1    2    3    4    5    6    7    8    9   10
-	|----|----|----|----|----|----|----|----|----|----|----|
-  IPv4  |type|                             |      IP addr      |
-  IPX   |type|      Net addr     |          Node addr          |
-  IPX   |type|      Net addr     |Sckt addr|
-  Apple |type| Network |node|
-  PPPoE |type|   SID   |           AC MAC            |
------------------------------------------------------------------*/
+ * How database records network address:
+ *	    0    1    2    3    4    5    6    7    8    9   10
+ *	 |----|----|----|----|----|----|----|----|----|----|----|
+ * IPv4  |type|                             |      IP addr      |
+ * IPX   |type|      Net addr     |          Node addr          |
+ * IPX   |type|      Net addr     |Sckt addr|
+ * Apple |type| Network |node|
+ * PPPoE |type|   SID   |           AC MAC            |
+ * ----------------------------------------------------------------
+ */
 
 /* Find a tag in pppoe frame and return the pointer */
 static unsigned char *__nat25_find_pppoe_tag(struct pppoe_hdr *ph, unsigned short type)
-- 
2.34.1

