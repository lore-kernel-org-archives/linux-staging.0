Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F96E6D0E
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 00:15:49 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id k11so38694591qkk.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 17:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t6ykaOl2SV5hC/WjmHjpxXukVtJto/xf+MPn+lpAaJ4=;
        b=Vguo5TTsqBmeZHwCReiF8UMlGvaDf1kVs8TIEpxQ868oArLK1FUbH76dbw+1Iw+9ds
         lt13zYwiUg3qSqaA1cyNDr5MuKrS0RGo4dmC50ZHHYwseXuXVo3ZoPVCzgTV86fzNqJQ
         yePA97ou12+n+ycZh6tkJgYFKJ57hxErAkLzY63RoWDgp1rjhSaKDsa6xz3Xs1uMazwx
         jykZBNleCfAnHYtBGcDVoV53bg5U4aIAhcecUN7L+sp5O/A2+xCJJM3Zt8mghwazic0l
         nIhwwAYErJ4XlX0YALwu4EJYLFk4yPOl5Tu3uEc6s9NvjAj6uXbyUovp8MhZzTb8ml2G
         cidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t6ykaOl2SV5hC/WjmHjpxXukVtJto/xf+MPn+lpAaJ4=;
        b=OfnEWkSO14C40VlyLFWDbBXh6/By1aHMgwkOWGMNJ5LTu4P/JqynlQhn9ML/R6DxWW
         z0S1aLeajyZ4Wt6T6m/iIKbu0u3I4w4J9hDtAMrVHSxRatBk/lBaMJZW//cNI+S9NA5F
         CmyXGP4WbbPDGETWs2xhNSQC6ImOtFetTLCriurFa7cShOsqStNcJGqp1gfotBf/tKbh
         CxlVAGO6RMc2jz/eyLwwzIxDazp0n/JCu71WEnYOanmJOfaxfuqsZw45zljkLrwkOHOc
         He5jbpZMEa7d0/Jhf3Ma10cKaXQfqXo6+8vnfLWVM1RWPGBUAZo1KyMZqaGgOYgzNwPk
         nmjg==
X-Gm-Message-State: AOAM533w8eFv+UUPiyYdbuyDxM7yKgWLH9ezx+b9tsbceB5WLcd6HZDc
	hNBbsjfqZCvnOEGS/lk140xtVw==
X-Google-Smtp-Source: ABdhPJyeIJAJs7B70tsSe63rrzcMZOnnB816pYkffsPASqf1VDXxqbCGe/CiCJoLX4kmd3IDp60y6g==
X-Received: by 2002:a37:4392:: with SMTP id q140mr19287782qka.49.1623716148815;
        Mon, 14 Jun 2021 17:15:48 -0700 (PDT)
Received: from localhost.localdomain (5.d.e.a.c.b.a.1.5.0.9.4.d.7.7.d.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:d77d:4905:1abc:aed5])
        by smtp.gmail.com with ESMTPSA id m199sm11244248qke.71.2021.06.14.17.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 17:15:48 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 09/28] staging: rtl8188eu: remove all DBG_88E calls from core/rtw_ioctl_set.c
Date: Tue, 15 Jun 2021 01:14:48 +0100
Message-Id: <20210615001507.1171-10-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615001507.1171-1-phil@philpotter.co.uk>
References: <20210615001507.1171-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all DBG_88E calls from core/rtw_ioctl_set.c as this macro is
unnecessary, and many of these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/core/rtw_ioctl_set.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c b/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
index 76dcaffea0fc..c8b8346adbee 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
@@ -143,7 +143,6 @@ u8 rtw_set_802_11_bssid(struct adapter *padapter, u8 *bssid)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	DBG_88E("Set BSSID under fw_state = 0x%08x\n", get_fwstate(pmlmepriv));
 	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		goto handle_tkip_countermeasure;
 	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
@@ -227,7 +226,6 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	DBG_88E("Set SSID under fw_state = 0x%08x\n", get_fwstate(pmlmepriv));
 	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		goto handle_tkip_countermeasure;
 	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
@@ -328,7 +326,6 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 		spin_lock_bh(&pmlmepriv->lock);
 
 		RT_TRACE(_module_rtl871x_ioctl_set_c_, _drv_info_, (" change mode!"));
-		/* DBG_88E("change mode, old_mode =%d, new_mode =%d, fw_state = 0x%x\n", *pold_state, networktype, get_fwstate(pmlmepriv)); */
 
 		if (*pold_state == Ndis802_11APMode) {
 			/* change to other mode from Ndis802_11APMode */
@@ -432,7 +429,6 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 
 	} else {
 		if (rtw_is_scan_deny(padapter)) {
-			DBG_88E(FUNC_ADPT_FMT": scan deny\n", FUNC_ADPT_ARG(padapter));
 			indicate_wx_scan_complete_event(padapter);
 			return _SUCCESS;
 		}
@@ -595,7 +591,6 @@ int rtw_set_country(struct adapter *adapter, const char *country_code)
 	int i;
 	int channel_plan = RT_CHANNEL_DOMAIN_WORLD_WIDE_5G;
 
-	DBG_88E("%s country_code:%s\n", __func__, country_code);
 	for (i = 0; i < ARRAY_SIZE(channel_table); i++) {
 		if (strcmp(channel_table[i].name, country_code) == 0) {
 			channel_plan = channel_table[i].channel_plan;
@@ -603,8 +598,5 @@ int rtw_set_country(struct adapter *adapter, const char *country_code)
 		}
 	}
 
-	if (i == ARRAY_SIZE(channel_table))
-		DBG_88E("%s unknown country_code:%s\n", __func__, country_code);
-
 	return rtw_set_chplan_cmd(adapter, channel_plan, 1);
 }
-- 
2.30.2

