Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD95D2CAB
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 12:54:44 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id w3so5563889edc.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zaChLvpV1bYStSPvXlAV7o8JyBUldM/i5tXZW+WmTms=;
        b=TBuicHKOVm9hxTifLARJZFxZzXDCeuQBvDoE1++0EH5GujtpKT1kgZZsgpesvggLok
         7JG61cCw7kNuPb0k9/rP+6n5hyMXuJB2wG3SwrrgB2i6MMpKRg7GRPbbFj1QNWZJmNt+
         fxfdv49V+pcMpNjAhUihezyuNYRWTImjuFM4BNhWqJXHhuGqxeXcHQc0fikX6Tk72PR5
         CvLyhmjR2CqrVEi8t8ANJPTki+XxeXXzbTQ7Bui9BevwElOi4qTy3dvLjufnB9j/wfA/
         EtsUul/N5KmfSmLmD8UGbIkRE6FgUQ4yfPAXrBm+lCzyh02mKmpWCfLePmqZLxah2fOS
         Djug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zaChLvpV1bYStSPvXlAV7o8JyBUldM/i5tXZW+WmTms=;
        b=T+QSvhYWy5GgXqnkG3PoHIkD5O+phUxtJiyEdXqqIEhp1DkNjoObXPj6UnE74LG9Kx
         pY07YfQxNvdw6q3vRYPpaSrCcZ/lZryFEVBI5uBzmwr6Om+MUlH4cuQxxl57eS5/CvvS
         H2bNgzte+c8VIONibO1E0w4+My0PeaRPS5fZASvQTUgzAgtUWaHy8m+jrRKMJgtykPRQ
         oip+sWPSHWBDFq9q+EFKgppB7t5OZQSNUwZIwJ00jqnWWgLE0y8IYJZ/sW0UOHkrAOng
         oNNjfqCA/eQbxsU0rkV9fx7Ban/OMv7xeUld6/BzL3F31IslliCEtF7ZbVh9U3iELSyf
         mnxA==
X-Gm-Message-State: ACgBeo1eKYVMy9ELXlnrQEO8KJgOEjYmo2Qukvlfcby9Ca+vKB8WZBo3
	ZE/LX7UMxM6imvV31uWS2pA=
X-Google-Smtp-Source: AA6agR7OprjbhDKxGLyattb47jG+WINF2cy81gni7eGMLHh4O0iL2ao/Rl3jOP8NNApcyyhdkhhcGg==
X-Received: by 2002:a05:6402:3892:b0:43b:d872:a66 with SMTP id fd18-20020a056402389200b0043bd8720a66mr6075765edb.139.1660913684340;
        Fri, 19 Aug 2022 05:54:44 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id b12-20020a056402138c00b0043d6ece495asm3000955edv.55.2022.08.19.05.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 05:54:44 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 09/11] staging: r8188eu: merge rtw_{os,}_indicate_connect()
Date: Fri, 19 Aug 2022 14:54:26 +0200
Message-Id: <20220819125428.8412-10-straube.linux@gmail.com>
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

Merge rtw_os_indicate_connect() into rtw_indicate_connect().
It looks like the driver was originaly written to support different
operating systems. We do not need this wrapping into an extra _os_
function obviously.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c      |  5 ++++-
 drivers/staging/r8188eu/include/mlme_osdep.h |  1 -
 drivers/staging/r8188eu/os_dep/mlme_linux.c  | 10 ----------
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 3050c85dec2c..bd86fb679d63 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -851,7 +851,10 @@ void rtw_indicate_connect(struct adapter *padapter)
 
 		rtw_led_control(padapter, LED_CTL_LINK);
 
-		rtw_os_indicate_connect(padapter);
+		rtw_indicate_wx_assoc_event(padapter);
+		netif_carrier_on(padapter->pnetdev);
+		if (padapter->pid[2] != 0)
+			rtw_signal_process(padapter->pid[2], SIGALRM);
 	}
 
 	pmlmepriv->to_roaming = 0;
diff --git a/drivers/staging/r8188eu/include/mlme_osdep.h b/drivers/staging/r8188eu/include/mlme_osdep.h
index 9cee84acff6b..5f63e2051419 100644
--- a/drivers/staging/r8188eu/include/mlme_osdep.h
+++ b/drivers/staging/r8188eu/include/mlme_osdep.h
@@ -8,7 +8,6 @@
 #include "drv_types.h"
 
 void rtw_init_mlme_timer(struct adapter *padapter);
-void rtw_os_indicate_connect(struct adapter *adapter);
 void rtw_os_indicate_scan_done(struct adapter *padapter, bool aborted);
 
 void indicate_wx_scan_complete_event(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/os_dep/mlme_linux.c b/drivers/staging/r8188eu/os_dep/mlme_linux.c
index d439ffaf9797..105251f250dc 100644
--- a/drivers/staging/r8188eu/os_dep/mlme_linux.c
+++ b/drivers/staging/r8188eu/os_dep/mlme_linux.c
@@ -38,16 +38,6 @@ void rtw_init_mlme_timer(struct adapter *padapter)
 	timer_setup(&pmlmepriv->dynamic_chk_timer, _dynamic_check_timer_handlder, 0);
 }
 
-void rtw_os_indicate_connect(struct adapter *adapter)
-{
-
-	rtw_indicate_wx_assoc_event(adapter);
-	netif_carrier_on(adapter->pnetdev);
-	if (adapter->pid[2] != 0)
-		rtw_signal_process(adapter->pid[2], SIGALRM);
-
-}
-
 void rtw_os_indicate_scan_done(struct adapter *padapter, bool aborted)
 {
 	indicate_wx_scan_complete_event(padapter);
-- 
2.37.1

