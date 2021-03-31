Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1850A70
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:40:24 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id ap14so15935866ejc.0
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fb7aKRZia33F9MimRyqKtx0GJE/NU3HcWly69zkCQ40=;
        b=u7wAQrJR0vR3GX0WKFRbLtw+0k9eHs2FnODFp/pzxrrOKJaar950OdfqMDLJZDfiUd
         10IgVyhMI4DqXGvJowArj/OEceC9qZtgd9I5+/XVx+DFoC7vtHVEB07wjWRXCy4U82J/
         EMT9EvijMak7zMu7pROBNWl7QGqqxDF8q0ZkieKWKX389Ya4z96mb+5eT3MGOQbnUoFQ
         nCFasAye8FTQcdKn+6B6Oe6faMH0ID/lhk4wELyq3MQ6BQBheLNmH4q3iJ3BcPcBcFx+
         RWBXfR3fciICfUZuhdR7G7/gtlc1ag3ESeU5WB0yCX03q4fpFY/bncm2X1DH5rSxdE+C
         kQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fb7aKRZia33F9MimRyqKtx0GJE/NU3HcWly69zkCQ40=;
        b=hfGDV4GCxRlXJgSRMvrdYaeAeg4+BSwIFmMJeJDyI4PHaDt5e5ImQ4Dzh1pbcloq6z
         xd2MOmhykX8fsyd3spyitRcK4Z8ke5eWgB26Vhjf/DsubR8lj87c42/kAw+lMPSrnDq6
         uEB5cRAZzhNAX674rGzuWPwJdgFMl5dDXRbmPv7f1lPDVhHhj5XAAWB5rfuHc7iyNqYH
         gU6prGnJ5SGExrSaA0KV497XPqTj97dps9ZftVcUmwfwybfgtXbabeM9hs1qSBLA6C3e
         Ow80388TOq7a6d0w9ia2xw1CQENz/py/M+XC7Dju1SJr+99wozI3HGc2ppw0vLGuYOoF
         GGsw==
X-Gm-Message-State: AOAM530RiPO+hJOawMgAXYZn+ddVdxjeG4S6JOhzMDAbZqZGjr3bwp8j
	45FAJu8wJajV0UlsdYGdsPM=
X-Google-Smtp-Source: ABdhPJzx1jCR3o94rU/Lo10hxJ17Tcr4nhJOMLnBVYgqTdjh2MaXhI0Wwaf/Adis5DZXACapUyrLdA==
X-Received: by 2002:a17:906:7842:: with SMTP id p2mr2670846ejm.87.1617183622667;
        Wed, 31 Mar 2021 02:40:22 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id qo25sm820163ejb.93.2021.03.31.02.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:40:22 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 06/40] staging: rtl8723bs: remove commented RT_TRACE calls in core/rtw_mlme.c
Date: Wed, 31 Mar 2021 11:39:34 +0200
Message-Id: <b2905e279a4d9232a7b5994c7b09303234343b55.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
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

