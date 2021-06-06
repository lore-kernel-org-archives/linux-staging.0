Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32E470
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 03:40:43 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id s6so15936880edu.10
        for <linux-staging@lists.linux.dev>; Sat, 05 Jun 2021 20:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gD8GyiAl/H+wS42xF/dTntBfAP6bsJgpIEJdko9JNos=;
        b=KgL6TvXFrfSYf2mXOkY18UYYwPE9wSx1hVoJQp4nA093VryYKKDbfOGGxwTuyCymWc
         mnrPqTfB/sGi2HjH9gR7fzYJ7YK6lBdFfFnd0nPCEFovPqbQ9MnwPGuevjyRmpEDyEko
         cvn2DEGJoe1ftY+uFzaQvt9RsTXTqztTh0Ta1u/+WLm1S+pyLL6LJpAo1zElpegY7vrT
         nsESb6Jj50RK49rOKbF0CJa9IrazmLfMKImNyA1HZNCyp6Karxrn/YpgWcvBdYm9bpFK
         2t9WHbjyiAkkhoTOrxRB67ctT3S4mSzJB/aUiu+rmDfvRw6vHH/rL0gAuVyYPrhbPkxD
         zvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gD8GyiAl/H+wS42xF/dTntBfAP6bsJgpIEJdko9JNos=;
        b=gNfrEa7DWVvzKa9/k1hKTp8SSi9i0Tc6yZ0bU+XOIIueilAxKvGwv8VFe3MZH/QjxB
         Cr+K7ey4p6Q51q5CX922cEaeypL9AcJAk78/B9/6UsB4bf7Id2eXClygl9kVsxYqJcAh
         PPVNyvFX8lGHdHxcT/ggfGCBMIz5GGlxWcu2Wpq2HXiR1srQua+ILX7300EwPY+64nhJ
         cT2eJ53rk91RvegZk01HKCiUGzMQRPeATk1zo2YKvpdk2+Q80liDjPgrvIv+Ar1twZBE
         Xx+Fso3UsIPMzlVYJlJL+0GubpiAcBJRZ8IE/qcID5Ui0+HIrF76Utdcgr7JQ74O+zxX
         7QHw==
X-Gm-Message-State: AOAM532nKTFuvfH7xvY3qH987KIU2f81yJoMhf093KfsRgOwpagFfC4c
	3ybNWAzJ/NvPxhHZc2rW4ew=
X-Google-Smtp-Source: ABdhPJxx0T9AquvpjLUbFiwTW0g9PlgIjZoGh5kw+Q6Lz+Oa2GA0Slx2OEeTnL9fgUc09GSL6o436w==
X-Received: by 2002:a05:6402:487:: with SMTP id k7mr12998011edv.315.1622950842534;
        Sat, 05 Jun 2021 20:40:42 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id zg9sm2814845ejb.116.2021.06.05.20.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 20:40:42 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: rtl8712: Remove unnecessary alias of printk()
Date: Sun,  6 Jun 2021 05:40:38 +0200
Message-Id: <20210606034038.9657-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This module defines four alias for printk(). Removed them
all, because they are not used anywhere else in the driver.
Converted the only exception to the explicit use of printk().

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_cmd.c   |  2 +-
 drivers/staging/rtl8712/rtl871x_debug.h | 23 -----------------------
 2 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_cmd.c b/drivers/staging/rtl8712/rtl8712_cmd.c
index ff3cb09c57a6..e94604cb71fd 100644
--- a/drivers/staging/rtl8712/rtl8712_cmd.c
+++ b/drivers/staging/rtl8712/rtl8712_cmd.c
@@ -55,7 +55,7 @@ static void check_hw_pbc(struct _adapter *padapter)
 		/* Here we only set bPbcPressed to true
 		 * After trigger PBC, the variable will be set to false
 		 */
-		DBG_8712("CheckPbcGPIO - PBC is pressed !!!!\n");
+		printk(KERN_DEBUG "CheckPbcGPIO - PBC is pressed !!!!\n");
 		/* 0 is the default value and it means the application monitors
 		 * the HW PBC doesn't provide its pid to driver.
 		 */
diff --git a/drivers/staging/rtl8712/rtl871x_debug.h b/drivers/staging/rtl8712/rtl871x_debug.h
index 57f2a38cb71c..69c631af2a2a 100644
--- a/drivers/staging/rtl8712/rtl871x_debug.h
+++ b/drivers/staging/rtl8712/rtl871x_debug.h
@@ -127,27 +127,4 @@
 	#undef	_MODULE_DEFINE_
 #endif
 
-#define _dbgdump	printk
-
-#define MSG_8712(x, ...) {}
-
-#define DBG_8712(x, ...)  {}
-
-#define WRN_8712(x, ...)  {}
-
-#define ERR_8712(x, ...)  {}
-
-#undef MSG_8712
-#define MSG_8712 _dbgdump
-
-#undef DBG_8712
-#define DBG_8712 _dbgdump
-
-#undef WRN_8712
-#define WRN_8712 _dbgdump
-
-#undef ERR_8712
-#define ERR_8712 _dbgdump
-
 #endif	/*__RTL871X_DEBUG_H__*/
-
-- 
2.31.1

