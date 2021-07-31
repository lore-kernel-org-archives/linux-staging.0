Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA3A3483
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 00:39:50 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id c16so13339811wrp.13
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 17:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FFK35TeNRCpJMMYpkUlLwh47HmF6IKjwmwo/sLbCW6w=;
        b=jEJMSLHuW5Faxo7X8HNN3jpzrW0sZ61wBiXF3SjwYHuBWCbYmutzALlZJRqcMjjKGx
         4zcCBQhpRuZXHlWvvllgitPjkYr35qapx3IIpvm07bWlB1QO4NmHTcuP5pGlsI/32eI6
         cuKasqRXw9gZkRktQlOAS0ln6eOHxxlPGp8TsBwkUM2M7hd+LveMziPGUABqunlIve6T
         k4TjvGGAZDAiSLbqon6+00sRUn6WwbYTFwadLg+zgLe2+GtXEp3ATvln0BZDMDH6loWF
         a60BrTVCBkGTmYPBuQ5rP/ed3QbWtz6ttaOdeyu2XTG59JLSrXHDOpIFY+2Cgq21WqTb
         ngCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FFK35TeNRCpJMMYpkUlLwh47HmF6IKjwmwo/sLbCW6w=;
        b=d2ad/1DHJNu6fEq93VMgpsH1ALV2yfNtV/+HRiOv4nNPwbJI5TfvZ+MVHuSkfhx/7J
         Vi5PjrBXS4tiOLeIgdNEkh0BOLr/6Z/mWxbAnWn9iGVniZBi2zyffqCE2HkziKwgj3AF
         GI2aaWwSGaN2PXv/D4PqFu92leJSSGvfswKEVpY7M/vQACatCyxSuOcwptNQNk1FD4l8
         B87TAIuL0+8Kb/yr4+dx6OKO814/Hzp8hmHQiMZxzd7nx+eOd5MAR+IsHDhnwTNrP8TN
         3rQXFLGTWDf69ZN3EWSjbvp1tWmxq4XScZ3BqRWouEYXdBzMyuknGiDeWcC8CDGzx17G
         yjaw==
X-Gm-Message-State: AOAM533aGFxo0msw76zCJjEmPCbGlV0fh88Oy2QcrHAJdgzrkeJWSx5O
	b3bkC3YPv94MnU5Pee7wI7JSOQ==
X-Google-Smtp-Source: ABdhPJxUn6dQ0Uhg1nSDRqcGY/dgaFfFuwmbPk+bFqhyxkauiyEIHULQ2GeZ1GYeOv5CaNGZp5MwBA==
X-Received: by 2002:a05:6000:1152:: with SMTP id d18mr5609062wrx.303.1627691988905;
        Fri, 30 Jul 2021 17:39:48 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id g138sm3829614wmg.32.2021.07.30.17.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 17:39:48 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/14 resent] staging: r8188eu: remove DbgPrint and RT_PRINTK macro definitions
Date: Sat, 31 Jul 2021 01:39:36 +0100
Message-Id: <20210731003937.68615-14-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731003937.68615-1-phil@philpotter.co.uk>
References: <20210731003937.68615-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove DbgPrint and RT_PRINTK macro definitions from include/odm_debug.h,
as they are called from nowhere and are therefore superfluous. Also
remove comment in core/rtw_xmit.c referring to DbgPrint so that future
confusion is prevented.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_xmit.c     | 1 -
 drivers/staging/r8188eu/include/odm_debug.h | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 7ecffadcb61f..c87ecf59b232 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -670,7 +670,6 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 				rtw_secmicsetkey(&micdata, psecuritypriv->dot118021XGrptxmickey[psecuritypriv->dot118021XGrpKeyid].skey);
 			} else {
 				if (!memcmp(&stainfo->dot11tkiptxmickey.skey[0], null_key, 16)) {
-					/* DbgPrint("\nxmitframe_addmic:stainfo->dot11tkiptxmickey == 0\n"); */
 					/* rtw_msleep_os(10); */
 					return _FAIL;
 				}
diff --git a/drivers/staging/r8188eu/include/odm_debug.h b/drivers/staging/r8188eu/include/odm_debug.h
index 38b07664b07c..c71d890ac552 100644
--- a/drivers/staging/r8188eu/include/odm_debug.h
+++ b/drivers/staging/r8188eu/include/odm_debug.h
@@ -64,10 +64,6 @@
 #define ODM_COMP_INIT					BIT31
 
 /*------------------------Export Marco Definition---------------------------*/
-#define DbgPrint	pr_info
-#define RT_PRINTK(fmt, args...)				\
-	DbgPrint( "%s(): " fmt, __func__, ## args);
-
 void ODM_InitDebugSetting(struct odm_dm_struct *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.31.1

