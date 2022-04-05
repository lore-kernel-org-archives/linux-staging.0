Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B660F15A7;
	Tue,  5 Apr 2022 03:16:34 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id b189so9326254qkf.11;
        Mon, 04 Apr 2022 20:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XjUcUC0xOAdui6NRMH4KwBLjOAvQDzyoui4/sjnCQaM=;
        b=N53uVDUY8COgraNQHjrQJHOUIcgtsCa4P8pedtYOeZX5/d9GNy0+4iXkWAqM+skfJq
         dGcTCjiQoTyemeVHYzuQNB3BskQhN3MBpvvxbTj1R2nJwj/+5Hmv3Ffxev/gDUbVdnI0
         Q7wWbYoH1T/PzyZQV2D8vtkMiODDh5/WbzwAmMnuSmSyznRlgB0BrKzt9zON7BEp/uMB
         UIrCY5f8SF6BDfqzagSQqENsZpSQ4Ts+359QCroNSqWs50MHgHJmGNusr1QyGvGBjQny
         pSkYtYzQexlIITr8iL+6BY2mjeUtIIhSNVpRqEpQtaCVxuzotZkl+D+kuJrTxfwld8xM
         m0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XjUcUC0xOAdui6NRMH4KwBLjOAvQDzyoui4/sjnCQaM=;
        b=6vmnMcJin32n6fTqvQt5mk5s6EMerUMcOAUSj0eZSdl7iUVJcgUitom/zyY7DJX+GM
         OZ4JsU0S8RGSVIkvgRW5Mny5DGnCrJ99PKPXREy8tjQvzTe74iXj0MxRdkr1miLvFT/3
         v/QSEAJlUCraZWjEckyopQMuPQovsm0HcLkzSV71ag4ryNOQmEYyKcNTpkcAhM3nQlIs
         6Om58knLv8SOVCUDX9sx56IdFn6QXL1hCRLqCM9QbhLniKst75hVvPVILbKwUgrX6BZd
         8tmWMe2lNaYmcTrv8eNliVFJwnksXCT091yqwIiV7hJLxM0i+YA6M+kQ/YNWKLF5ctkR
         nHvA==
X-Gm-Message-State: AOAM532YMf5LFIKsQ8oCZKiWDfwyKBLQeBFyp/at+jyvKp2vPE7ZxFe6
	8pI5fJihhGgdZfUcAXV0Ds0=
X-Google-Smtp-Source: ABdhPJy/WJY97qySPgIVZQbadBmodc+zwK5xhPaDAjPx0aAMvNNW6fiV2ST1WjRh1VY9kDJxJzyAAA==
X-Received: by 2002:a05:620a:4508:b0:67d:c137:68df with SMTP id t8-20020a05620a450800b0067dc13768dfmr942184qkp.337.1649128593636;
        Mon, 04 Apr 2022 20:16:33 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id 22-20020ac85756000000b002e1cabad999sm10352280qtx.89.2022.04.04.20.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 20:16:33 -0700 (PDT)
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Subject: [PATCH 4/5] staging: rtl8723bs: fix indentation
Date: Mon,  4 Apr 2022 23:16:11 -0400
Message-Id: <3bb9687a1057619334d95832f803c9b8d7e7fa63.1649128267.git.sevinj.aghayeva@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649128267.git.sevinj.aghayeva@gmail.com>
References: <cover.1649128267.git.sevinj.aghayeva@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch:

WARNING: suspect code indent for conditional statements

Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index c06be65b45cf..5eddff488f27 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5145,9 +5145,9 @@ void link_timer_hdl(struct timer_list *t)
 		if (++pmlmeinfo->reauth_count > REAUTH_LIMIT) {
 			/* if (pmlmeinfo->auth_algo != dot11AuthAlgrthm_Auto) */
 			/*  */
-				pmlmeinfo->state = 0;
-				report_join_res(padapter, -1);
-				return;
+			pmlmeinfo->state = 0;
+			report_join_res(padapter, -1);
+			return;
 			/*  */
 			/* else */
 			/*  */
@@ -5455,7 +5455,7 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 	u8 val8;
 
 	if (is_client_associated_to_ap(padapter))
-			issue_deauth_ex(padapter, pnetwork->mac_address, WLAN_REASON_DEAUTH_LEAVING, param->deauth_timeout_ms/100, 100);
+		issue_deauth_ex(padapter, pnetwork->mac_address, WLAN_REASON_DEAUTH_LEAVING, param->deauth_timeout_ms/100, 100);
 
 	if (((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) || ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)) {
 		/* Stop BCN */
-- 
2.25.1

