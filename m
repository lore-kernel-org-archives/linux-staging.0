Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D0C72
	for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 17:51:51 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id t7so13028255edd.5
        for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 10:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aGbz56H8ujbUDesy1/oT8I6SQUEMIvYV/AjVeEK4diU=;
        b=RFXr7S9jv2q6G4nXNWmwTF/d06A2om1azDDaVj46MDaDAMln+jhQNl9SSUcdkJ4QHo
         x0ZnTfUv8kquYonGLZ+NRrNAtqHe6YOriVQuIwA2d71wBqtJ5FO6RhIu14Ck4LJql8Vj
         XdOfVXHlxg91xQiDikqxyIw77KuNlNyX3cEyNeTgMM0eGvO03yyufZJXV4+uYwqB+jHq
         58cYahFLVLALbngvvGJlhSyJf4M/veKtUGJYcmfAfr89SbqCZMNZ+bFDtAgK3a1CFL/m
         QXA+5QE8NTYqJ+mldK+viXjQeMdQGJ//9OmWqtcIJSpZzxI0t8GUt+/zlDTwSQM8oER2
         NJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aGbz56H8ujbUDesy1/oT8I6SQUEMIvYV/AjVeEK4diU=;
        b=k8cescsbDlqbszvIvOIv9E1i/IqSEBAohTmki4NYOWYQPWoIhajUqiV7Z1YEIZfdCV
         s/ZUCz4bInldzS8hqoDpIWKnoCGWCs1eDFK7A11LoBRJ5RByUcq7CJiJL95RzPkU/juN
         InF9nq2Ii8PfuYvP8zji7+NWT5M5KIo6X8DQ3HquJ82K2POY30E+DlgfgM1ZTqQ2ToA+
         QcfWH7YG9VeCDt/U+nou43lHbkxhWY2SF49WieN+uiXoY32R5dC672PqqA3dD+ribq53
         vP3B4yu/GGq8OVe4p1DqtImMl5w5UnRbwfKKefOrCBDCKRpHMv040aBGh7Kw+E/yCsvN
         V3bA==
X-Gm-Message-State: AOAM530LMunPE2p7VERIuCX7A7kHCSKgIO+dEXh2wpsdOrBm91TYxP04
	7CVoEcI7Bjue1pdHJgmDUBU=
X-Google-Smtp-Source: ABdhPJyKk2RnEPNGJ3SuGvoYgX2qdYyaPrYa+QO0Ke2wDUFj6O6RzW75Zq/I/aS6GD5fSMg/Ndr6sg==
X-Received: by 2002:aa7:c04e:: with SMTP id k14mr11439392edo.157.1624125110116;
        Sat, 19 Jun 2021 10:51:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::1264])
        by smtp.gmail.com with ESMTPSA id s20sm5459428edr.50.2021.06.19.10.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 10:51:49 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	martin@kaiser.cx,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8188eu: remove useless comment
Date: Sat, 19 Jun 2021 19:50:55 +0200
Message-Id: <20210619175055.5122-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove block comment about function HwSuspendModeEnable92Cu.
The comment contains no useful information and there is even
no HwSuspendModeEnable92Cu function in the driver code.
'git grep -n HwSuspendModeEnable92Cu drivers/staging/rtl8188eu'
returns nothing.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8188eu/hal/usb_halinit.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index dcdf868b394d..6c88675ae251 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -601,22 +601,6 @@ static void _InitAntenna_Selection(struct adapter *Adapter)
 		haldata->CurAntenna = Antenna_B;
 }
 
-/*-----------------------------------------------------------------------------
- * Function:	HwSuspendModeEnable92Cu()
- *
- * Overview:	HW suspend mode switch.
- *
- * Input:		NONE
- *
- * Output:	NONE
- *
- * Return:	NONE
- *
- * Revised History:
- *	When		Who		Remark
- *	08/23/2010	MHC		HW suspend mode switch test..
- *---------------------------------------------------------------------------
- */
 enum rt_rf_power_state RfOnOffDetect(struct adapter *adapt)
 {
 	u8 val8;
-- 
2.32.0

