Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8560F5F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:21:40 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id l4so1809457ejc.10
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fb7aKRZia33F9MimRyqKtx0GJE/NU3HcWly69zkCQ40=;
        b=ZrgESLFsAK/I5YdTjFJcN6S1sL7ga1/Ju5srZpT4TDi30/8vhYpnqHmPtk0dtVlq1K
         Xtx9zGWO7fBc3LeZSUn7slsTRoCrykjS3YLHAOGONcJO7PKuyJfR9ea/jhIahnK1Vdr5
         Gu9ePH2JRZPoS/gZBCJkRpbXWYLxd1V3ARhi3qrC7GmbzlG7el0BqDYXgIMKtDbF+ZvT
         8IlvKOSDCD9tslZtypNzAsRJmt7qRlmzCT2hBzDD4XS9mSrShwqKEo5u6aHdrQHcuUYQ
         MphBLaAq/PVOdlG8BHid2KWquPdqLDHpqzronUljhraAk3iB1dOSUnjRGjUAEkteyPNq
         nI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fb7aKRZia33F9MimRyqKtx0GJE/NU3HcWly69zkCQ40=;
        b=aa5FiyYES1GG0nVigOITr9mQkWDDGQzdDBIjvMwT5pDHE0OpKRhHpvTgBNFchotpfM
         i4X9WtJzB6z7VFpAA9rq4bMzeTqeE/b0UyOQre4xztWqNKPEupAsdE2Im3zrXiBw2vWf
         3bcWalTr9VNNE/suP0Sexc2Kp4qzWmawozftSoujHl7sT1LZ0RbocNqU59S+j8hSIwJg
         89FQnmt57mYKnU8QrdxCrP87pZmo4MU1zJ5Wm6LACNuR0VrfKdmXqrTEbDqNJdkITIL2
         dwKchcSJtIQxWB5sJm1On1g9dedf3FUKCIOmETnZ2Abl4lDE1HK3+NlIE+J+HmRFBEgh
         PfGA==
X-Gm-Message-State: AOAM532aOt0Mq43SsR8dvfJmsg0H7wz/Y2tuKW6ndkt7psSmYrp4YLGb
	NOq3Dhof2EFfKgctC+ryWzU=
X-Google-Smtp-Source: ABdhPJxzUFzf3LuBwbenlOXntUDj1cuDkgWfZjolSKCRPSOvmk8Su+hxZ80VLMl5wsTwgw6z0VLlsw==
X-Received: by 2002:a17:907:9858:: with SMTP id jj24mr8013624ejc.212.1617268899096;
        Thu, 01 Apr 2021 02:21:39 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id q19sm2466141ejy.50.2021.04.01.02.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:21:38 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 10/49] staging: rtl8723bs: remove commented RT_TRACE calls in core/rtw_mlme.c
Date: Thu,  1 Apr 2021 11:20:40 +0200
Message-Id: <46befb76185ddf72644aadba920e7f8e8c6dce6b.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
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

