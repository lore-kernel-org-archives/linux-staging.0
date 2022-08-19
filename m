Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE032F2F
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 12:54:45 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id z2so5564927edc.1
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 05:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=MXV4DylOF0ZdaiLo2QJuGxzw6UXL1e8It7jaBClcFvg=;
        b=osiPXDjtr2ryf+P6+tDShDm6e+MFPpDx47vXUDtsOoJPTedOqf/j96FBlkhOYqtROd
         XwPx+LuduCt8UHcnYqZ+hGJDHj3TcNA2Mn317Ng/3QlG2RVrlyUgEN5gtzW/gCFD7nm4
         PTCxowDthgLU/Pa4KL+/G+1jyTwzC2ghWvEsuX17Dn2/AjOCqP5bH8+mP2UTPZiOERHc
         ZI6Bfiwz0rZhtD8TOGmgJRjIv9/IQPFc51Pv+TgQ0qq4PVdgJdYKOSWNhnxWglpVH+i5
         cfuLuiMo5bimaS6P5i5K24pk4PKOEi9HDw6IGvBLvYzv3St9Mn0pRjpYdnNPfbQE7bVf
         NtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=MXV4DylOF0ZdaiLo2QJuGxzw6UXL1e8It7jaBClcFvg=;
        b=fHZLVU3AGodEdCuKkUbowCc+ba7r51oXMWbJvbRIXihzQRkp09itU0z0/UyOj2hf/c
         0r0rsjz8rmn9R2aE6OINYsYtnBXNep2hHGHZxMPeESsG+w/ixrqQFHqaBDGDfyvL7pLs
         Xv6lEKTtWs/XdbZDgcwS4dzizVmukV7++c+dvwPbQ/ueLPXYJpNi/9kt5vJbs2iBB6JY
         36LJwOfYN0wyxO7eQB5Vh3L9ynjrLXcPE4eEJff01IQvLjr9B9qzQiK6qUBim2wCsRXP
         2oaH86OHLQhUwKgxBuh9qURrpvZs7+DSNrSKRHat5HQUBRGW48Dp8KPDqS2Wl3ztCvsq
         m5aw==
X-Gm-Message-State: ACgBeo1zkQDOrQQ8qrY4Nsebm6JIp4cO29wccxFSN3Ps5KeVmuVBniAd
	357eQghQs0YdEncKVklHL4cki5bPWHU=
X-Google-Smtp-Source: AA6agR7Q+W+RLgMxyIBfSNlTMD3yN5X4f110uXeDFuTtojrjd5h0HtViZ742+1fDJKRBkAGgKtZLbw==
X-Received: by 2002:a05:6402:e01:b0:442:dd7e:f49d with SMTP id h1-20020a0564020e0100b00442dd7ef49dmr5958364edh.355.1660913684914;
        Fri, 19 Aug 2022 05:54:44 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id b12-20020a056402138c00b0043d6ece495asm3000955edv.55.2022.08.19.05.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 05:54:44 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 10/11] staging: r8188eu: merge rtw_{os,}_indicate_scan_done()
Date: Fri, 19 Aug 2022 14:54:27 +0200
Message-Id: <20220819125428.8412-11-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819125428.8412-1-straube.linux@gmail.com>
References: <20220819125428.8412-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge rtw_os_indicate_scan_done() into rtw_indicate_scan_done().
It looks like the driver was originaly written to support different
operating systems. We do not need this wrapping into an extra _os_
function obviously.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c      | 2 +-
 drivers/staging/r8188eu/include/mlme_osdep.h | 1 -
 drivers/staging/r8188eu/os_dep/mlme_linux.c  | 5 -----
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index bd86fb679d63..594bfaf27291 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -894,7 +894,7 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 
 inline void rtw_indicate_scan_done(struct adapter *padapter, bool aborted)
 {
-	rtw_os_indicate_scan_done(padapter, aborted);
+	indicate_wx_scan_complete_event(padapter);
 }
 
 static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, struct wlan_network *pnetwork)
diff --git a/drivers/staging/r8188eu/include/mlme_osdep.h b/drivers/staging/r8188eu/include/mlme_osdep.h
index 5f63e2051419..d5e367e2d0de 100644
--- a/drivers/staging/r8188eu/include/mlme_osdep.h
+++ b/drivers/staging/r8188eu/include/mlme_osdep.h
@@ -8,7 +8,6 @@
 #include "drv_types.h"
 
 void rtw_init_mlme_timer(struct adapter *padapter);
-void rtw_os_indicate_scan_done(struct adapter *padapter, bool aborted);
 
 void indicate_wx_scan_complete_event(struct adapter *padapter);
 
diff --git a/drivers/staging/r8188eu/os_dep/mlme_linux.c b/drivers/staging/r8188eu/os_dep/mlme_linux.c
index 105251f250dc..5bd2b2c31342 100644
--- a/drivers/staging/r8188eu/os_dep/mlme_linux.c
+++ b/drivers/staging/r8188eu/os_dep/mlme_linux.c
@@ -37,8 +37,3 @@ void rtw_init_mlme_timer(struct adapter *padapter)
 	timer_setup(&pmlmepriv->scan_to_timer, _rtw_scan_timeout_handler, 0);
 	timer_setup(&pmlmepriv->dynamic_chk_timer, _dynamic_check_timer_handlder, 0);
 }
-
-void rtw_os_indicate_scan_done(struct adapter *padapter, bool aborted)
-{
-	indicate_wx_scan_complete_event(padapter);
-}
-- 
2.37.1

