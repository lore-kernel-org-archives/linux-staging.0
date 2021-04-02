Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3071B6D09
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:30:41 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso2680569wmi.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fb7aKRZia33F9MimRyqKtx0GJE/NU3HcWly69zkCQ40=;
        b=VYRjqcOu64KeZaDCf7m4jqYTM4EWIV7istNdRwPrQHnhW+8gpaoUJ8qY3ACtgrCaDV
         xW7dg+rY5uiXI71dmbxIwE4MIJ9uGPdFquakgZY5hJP+qFk4y3E+SJc3K5Bo/sfNZYNE
         gR29gmYTInPvqEeOxGB1Ctr8Efy4vxFt5jKr5G9i2Gg6aMV+VOGfEDb8MMQW55rl1vOH
         n2TierQfiVOBON6nzVduhh5I3+ozcIE/CZDKNEJvhYp8t+seEOuJ5VFDxlKVU1Cgu0aP
         q1fG1LmH4IfbSEEfp9udUrsXHY9g0i63IZU4vseRXleb8X4AX5UesaeeTBcEzhRlB/AB
         fYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fb7aKRZia33F9MimRyqKtx0GJE/NU3HcWly69zkCQ40=;
        b=XpB9/MMXSCZfLjMJzRYO6rGpopKk5wYRM8zm+mB58LGddKB6lpfg5b5uCbYN+uLth9
         OymoZ6YDsMPegQvP6A6Sd8cfR5t9OYNQKiC3wxNREHcm7p8cNhWWz1yA4SLvB166VYO2
         2nZ40L+Csn3vRxmAmXKhKdF2R5QyVk7AxhQV4vDlgOXl4NuMgE/WyJ9wHjBFLKUo8+U/
         4MfaaCx/c2puwiTFxJhcrIKTt1+N650vSom17KRNgOt7seRLtUpIORo7Tl5o/PbG5sVT
         54pdUGvwxY0xuC6Mu7nAUzFV786Wj2DBAcRDxpELY1wUF+FPrEOwsIYEW63T8c6zlDfm
         SQKQ==
X-Gm-Message-State: AOAM531HroXxwenq+uFnhZ7y1zBXUPLKyGZjJ5OXeZn9vd2lbGvjwUhx
	8tBXqvtGqqykQ/q9EPaPQB8=
X-Google-Smtp-Source: ABdhPJxRf8RPP05vPvtCyfS9OTXn5rOs0Jl+q6ZQUFNfdMZURqbCJAmt3pCGztq47NjwskB+5tVghA==
X-Received: by 2002:a05:600c:204f:: with SMTP id p15mr13752334wmg.165.1617384639794;
        Fri, 02 Apr 2021 10:30:39 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id b16sm13707346wmd.38.2021.04.02.10.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:30:39 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 14/30] staging: rtl8723bs: remove commented RT_TRACE calls in core/rtw_mlme.c
Date: Fri,  2 Apr 2021 19:29:56 +0200
Message-Id: <7f0542dbda31a2176b8d12465eb43ef056999dbc.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented RT_TRACE calls in core/rtw_mlme.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 29d4b7493784..4289bf40aa73 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -356,7 +356,6 @@ static struct	wlan_network *rtw_dequeue_network(struct __queue *queue)
 void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork);
 void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork)
 {
-	/* RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("rtw_free_network ==> ssid = %s\n\n" , pnetwork->network.Ssid.Ssid)); */
 	_rtw_free_network_nolock(&(padapter->mlmepriv), pnetwork);
 	rtw_cfg80211_unlink_bss(padapter, pnetwork);
 }
@@ -393,8 +392,6 @@ int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 
 inline int is_same_ess(struct wlan_bssid_ex *a, struct wlan_bssid_ex *b)
 {
-	/* RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("(%s,%d)(%s,%d)\n", */
-	/* 		a->Ssid.Ssid, a->Ssid.SsidLength, b->Ssid.Ssid, b->Ssid.SsidLength)); */
 	return (a->Ssid.SsidLength == b->Ssid.SsidLength)
 		&&  !memcmp(a->Ssid.Ssid, b->Ssid.Ssid, a->Ssid.SsidLength);
 }
@@ -551,8 +548,6 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 		&(pmlmepriv->cur_network.network));
 
 	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) && (is_same_network(&(pmlmepriv->cur_network.network), pnetwork, 0))) {
-		/* RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_,"Same Network\n"); */
-
 		/* if (pmlmepriv->cur_network.network.IELength<= pnetwork->IELength) */
 		{
 			update_network(&(pmlmepriv->cur_network.network), pnetwork, adapter, true);
@@ -778,7 +773,6 @@ void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 
 	/*  update IBSS_network 's timestamp */
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) == true) {
-		/* RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_,"rtw_survey_event_callback : WIFI_ADHOC_MASTER_STATE\n\n"); */
 		if (!memcmp(&(pmlmepriv->cur_network.network.MacAddress), pnetwork->MacAddress, ETH_ALEN)) {
 			struct wlan_network *ibss_wlan = NULL;
 
-- 
2.20.1

