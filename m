Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2552472
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 15:37:44 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 140so11204627wma.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 08:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DYzK0av1B+bTJZIOX9KF9ReEi3WLK2A6GBcuFXUyJpU=;
        b=HgKZPg0PbpAs9xdoUdE8ZhSTGfuCrCKgm07OZitcGfVbFVTAvC2LJSvcqdujKAgLLt
         dzLUdpgWxgvS/0zUdPttLOngPuYWUTOueYHXFCIQ47/hhOnJUR3Z61MKVQNB23rcbHU5
         TrLpOL3JQ/XH9svxxxl5h6JnmyhFNKOyode7PwU9GFaEZbSpgqoZIjpHPtLsYStvBpH2
         W4aVor2axUI2YFMUmJYD7N9tPaRPhfTuwtz2/ueoaKCetCc0lWOkA/wUvgUZVKt7FG69
         Xd13+kOuOZMZbtfnmaYZbdQS6WEhtalpiLFEvtp727/h/JFAYyUHM9xvg21AIQ1GPxit
         NQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DYzK0av1B+bTJZIOX9KF9ReEi3WLK2A6GBcuFXUyJpU=;
        b=iMBwtao6hO5wl6WhbECt8AEBTykpCDQWtKWM1rsr7VZfa15Cez64A8mcjmEjlXB9dF
         fdinmutL3bCjzZ7YwSc/fubikgE2jV0bWJm4VQfS/weH7MiTL93776S1UKabCWimR73z
         VzRELcycPlwqBwO+7bKJQ0XV1l5cNVTe0/ygl0XUa0ocJ17YEzDiONEjbJqDV1HvTbmp
         oyYeisrWYFiP2LDPiNrqcVALf0xkffV+9rA2hTrzmkszbZaxSPZMPnSd5ZIyZsvWbdru
         qpEw65Z2o4vpsD9/QRivabf5479imFP3AiXmM9kynVCsbFcbAuXtaaEXRG6I1BPTxapC
         CSBg==
X-Gm-Message-State: AOAM530sq+OX8tftr1vorszSsLS8WqCqkf4Xo+iKe6y2I5UgyUdkPKOF
	VoLsaG9fn95FSRByUuFoqKc=
X-Google-Smtp-Source: ABdhPJxlEG1btintB5Hyd74gdIoc8Rs5f5vtYOz1FDHRndyOPtS7ZHSDGsAFuO2qeciS2OWDYckLFw==
X-Received: by 2002:a1c:7ed3:: with SMTP id z202mr14963643wmc.152.1632065862571;
        Sun, 19 Sep 2021 08:37:42 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id l15sm16614501wme.42.2021.09.19.08.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 08:37:42 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/6] staging: r8188eu: remove rtw_set_macaddr_acl()
Date: Sun, 19 Sep 2021 17:36:59 +0200
Message-Id: <20210919153659.20826-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919153659.20826-1-straube.linux@gmail.com>
References: <20210919153659.20826-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_set_macaddr_acl() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c    | 10 ----------
 drivers/staging/r8188eu/include/rtw_ap.h |  1 -
 2 files changed, 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index 49858adf486e..94e02aad96b7 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -557,16 +557,6 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 	spin_unlock_bh(&psta->lock);
 }
 
-void rtw_set_macaddr_acl(struct adapter *padapter, int mode)
-{
-	struct sta_priv *pstapriv = &padapter->stapriv;
-	struct wlan_acl_pool *pacl_list = &pstapriv->acl_list;
-
-	DBG_88E("%s, mode =%d\n", __func__, mode);
-
-	pacl_list->mode = mode;
-}
-
 static void update_bcn_fixed_ie(struct adapter *padapter)
 {
 	DBG_88E("%s\n", __func__);
diff --git a/drivers/staging/r8188eu/include/rtw_ap.h b/drivers/staging/r8188eu/include/rtw_ap.h
index 134a9a8143b2..724229fe84aa 100644
--- a/drivers/staging/r8188eu/include/rtw_ap.h
+++ b/drivers/staging/r8188eu/include/rtw_ap.h
@@ -21,7 +21,6 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta,
 void expire_timeout_chk(struct adapter *padapter);
 void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta);
 void rtw_ap_restore_network(struct adapter *padapter);
-void rtw_set_macaddr_acl(struct adapter *padapter, int mode);
 
 void associated_clients_update(struct adapter *padapter, u8 updated);
 void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta);
-- 
2.33.0

