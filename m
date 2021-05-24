Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2111B17F
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 22:45:35 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso12245014wmh.4
        for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 15:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JM27Fiepo3JuU4IMCBkkqX29MSJl4zpr2RA555O577k=;
        b=MWk5a+BtOdxfktnNqoNeEc7ZYi1sDsPuflrivxStySpXB9qYavLQgZdFLBiDy13rkc
         dv3eMIkOVziPFIud4NdoKxTo4SCv0Xx23VY294FK1nhqInqampdls3u49U+prFmFOaE+
         SU2gqiWbGXxDBkZH+DK9xnzUBQK6NEv+4qrNSlzrbxnGTMif+xF+0VDnLj4EDcNTPgeY
         gT6GJZRTnP+tDaVX8N0QFKUwqtHQyiDnMgrOCwu//6xQ2W3hZHM2s1vIoTUD4Zle/zHu
         9Pz78RnYc0TpTypK9KvX5jZ7/IoOdNexjkom0zz94KQgkTZPWJju4tIS4INZV122JneC
         AiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JM27Fiepo3JuU4IMCBkkqX29MSJl4zpr2RA555O577k=;
        b=FdjKPX0myyKblSCiSt2UM93AmUMYYPwxxKaqzv/JW+rab8XUlwN+wLEpqn5z/XwawW
         PuiG7P1qVRyNWKBF8yd8BzPLlOLipy3PD4cdQujaWi3IQvXBsaXJJXC3kWqDdV2vaFr9
         KPCxoRFf1PYH219YzCdkSjX5cx4QyJVvrX0YVBmiQOR4xL5+ZVQSRRkJi1XS5QZffN/J
         74FhBh8X9u12bSN2zj4uoJPEixStPyr0LpCvxFBVklX01WIu548IpCpNiDVgCWkwFy4G
         JOR/Hvka9ha37mHZwxX4zek0KAtDfFgnbxTArJMCX9+K8HhBJ+pyAsjLifjpT/zc8+gw
         NpSw==
X-Gm-Message-State: AOAM530n9SxTW+Y7yIMVgs+7bfzn1ish37Ahdz2/0KoRWHN8tTjYXdep
	jzT9SD6+CC2oVSYkpIQQO+6KGQ==
X-Google-Smtp-Source: ABdhPJwNoGzpsTyPmtZAgP/G1MktXW31VWg7edHaJaei2RDKTIF40g9d1tW/4iotJ8h8Owsrax6w3Q==
X-Received: by 2002:a7b:c346:: with SMTP id l6mr20997715wmj.109.1621896333552;
        Mon, 24 May 2021 15:45:33 -0700 (PDT)
Received: from KernelVM.home (5.d.e.a.c.b.a.1.5.0.9.4.d.7.7.d.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:d77d:4905:1abc:aed5])
        by smtp.gmail.com with ESMTPSA id l8sm13669050wrw.71.2021.05.24.15.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 15:45:33 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8188eu: remove ASSERT and ODM_RT_ASSERT macros
Date: Mon, 24 May 2021 23:45:32 +0100
Message-Id: <20210524224532.1230-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the ASSERT and ODM_RT_ASSERT macros from include/odm_debug.h
as they are unnecessary.

ASSERT does nothing, compiling to a single empty statement.
ODM_RT_ASSERT is used in only one place, in the ODM_RAStateCheck
function with hal/odm.c - it seems to have been intended as an
assertion of some kind, but given it is always called with false
here, there is little point in it not just being a pr_info() call.

Also, the lines relating to the file, function and line number are
not needed as the pr_info() with the function name and error message
is sufficient should anyone wish to track down this error at a source
level, within what is currently a relatively small function.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/odm.c           |  2 +-
 drivers/staging/rtl8188eu/include/odm_debug.h | 13 -------------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/odm.c b/drivers/staging/rtl8188eu/hal/odm.c
index 4d659a812aed..b800d0c6dff5 100644
--- a/drivers/staging/rtl8188eu/hal/odm.c
+++ b/drivers/staging/rtl8188eu/hal/odm.c
@@ -824,7 +824,7 @@ bool ODM_RAStateCheck(struct odm_dm_struct *pDM_Odm, s32 RSSI, bool bForceUpdate
 		LowRSSIThreshForRA += GoUpGap;
 		break;
 	default:
-		ODM_RT_ASSERT(pDM_Odm, false, ("wrong rssi level setting %d !", *pRATRState));
+		pr_info("%s(): wrong rssi level setting %d!\n", __func__, *pRATRState);
 		break;
 	}
 
diff --git a/drivers/staging/rtl8188eu/include/odm_debug.h b/drivers/staging/rtl8188eu/include/odm_debug.h
index 857c64b8d2f4..3c576a029c94 100644
--- a/drivers/staging/rtl8188eu/include/odm_debug.h
+++ b/drivers/staging/rtl8188eu/include/odm_debug.h
@@ -71,10 +71,6 @@
 #define RT_PRINTK(fmt, args...)				\
 	pr_info("%s(): " fmt, __func__, ## args);
 
-#ifndef ASSERT
-	#define ASSERT(expr)
-#endif
-
 #define ODM_RT_TRACE(pDM_Odm, comp, level, fmt)				\
 	if (((comp) & pDM_Odm->DebugComponents) &&			\
 	    (level <= pDM_Odm->DebugLevel)) {				\
@@ -82,15 +78,6 @@
 		RT_PRINTK fmt;						\
 	}
 
-#define ODM_RT_ASSERT(pDM_Odm, expr, fmt)				\
-	if (!(expr)) {							\
-		pr_info("Assertion failed! %s at ......\n", #expr);	\
-		pr_info("      ......%s,%s,line=%d\n", __FILE__,	\
-			__func__, __LINE__);				\
-		RT_PRINTK fmt;						\
-		ASSERT(false);						\
-	}
-
 void ODM_InitDebugSetting(struct odm_dm_struct *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.30.2

