Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5044438DF9
	for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 07:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755501456; cv=none; b=FPFKTaBxPbbIThOyRaoPfDkcVIVze39UNfqoL2ArAcPyiXeWWvKf0njEOfaXVnxDdiRHbpgXXreDwIB6ec9USwwik7D49VBzAD5Ihe7wgOtP8/Nn8w657/avCZeGEFB3NWKlIR7KIJzte2kGgCeqv1b9Hd3zDrHBe3gOyhH883I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755501456; c=relaxed/simple;
	bh=wYVUt8KOyGWOZdkUNpunXsCZ0A9yFPuL+kWAC+HLcXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HTcQvmgZDY4JH3iOk69qrFSUb4DXFukbgFH98L4R1+R+IU9T0b8/ZH0BdSCXz1XCIoqBlmigcl4qwVJzcDGTg/MB2bRAS3A7UyIz10FpEkHf3bcIgygGbwAyyhsqLvag1H37rh9hc9irZMJhkQIsb4N1/NznjYo2CXfBlMzZjS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIUq5zGN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIUq5zGN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2430c5b1b32so29292305ad.1
        for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 00:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755501454; x=1756106254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pj3iAGQDBfnjGM61+iuWSfRjrdsa8vv7fkvRwb3+f9I=;
        b=AIUq5zGNyo4uORdRI0lJAlUyw++WwsMxMPuvFMh9itEQQHdoFE0lXBQ0DtqGnicKGz
         AhBwjK8Tosf5CPrAVFHgF03KvByiIUffGlswXOjt/Mxz1KjMAdXuHaG1gIbCNI4BYHa2
         hGEMuCbKiy1pOfCkWvXtd78Tacjot+4Jd9jyHOhy81yFOFYHADha6BF7PZLjTdbYtXDE
         Hu3oQidnHghExOgjGpNSJgYmEk44mcV24WzTBDX0b8B8NcP2b2ExwuKjKqGARTDc56H/
         sCzwzdQbJ27nVggZ/8XJZcktLqCu5RPK7psM45UixqhlwTENRjgAyVVro/SscAHM7nBJ
         PAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755501454; x=1756106254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pj3iAGQDBfnjGM61+iuWSfRjrdsa8vv7fkvRwb3+f9I=;
        b=svIeJTnCmM9g4AIEaXMdoaOb9zYEymwivbsS0B2OIGmvwSjd3DG3OeO67hVVB+ZJun
         mHfKVvqpuhiJzYODdlKhlr6i/KFUVwAktrhYXAFsADRBkcNxewzpINFR7UIvzMwyo6Mz
         0ZWILTRYdgrd0eW4NXSpuVAKK7LfW/tdiQp9HnRHji+qTrfXNWBqyHxkc4D6djEAq1pq
         Pkk70SJaC37gJWIWzzbzldaAvLmQY/m8tCqNEb0zS+bD1CeaXGGjSDw0wjVSrlA4cW7n
         IfrDKJr/etE1TkL1LpztSATZugacTYoCJ9Ms5XUp996zqCpwQ+zXWthsgakFqzhrQlGM
         MjcQ==
X-Gm-Message-State: AOJu0Yx8gujg3+eG5wjKthtwF+5I9wqliLWMqczCfGMFgfpC3Nxshy4g
	aEqSpPna/kQUEiaPlhHhgNKIs0JKrSfUJYwR3dVY5fTgxT3WM25MhTpK
X-Gm-Gg: ASbGnctn3au4Vo0r2UFZG78Y54EwVPpc0LcQ/5EGXCLhYGEat5LGlqUTt/aG6xJw4vF
	KWuqp3uiIehIixC1CPtbxSUQElUmhxaIvOZ6oZRJXRVb+vvubHa4FpYFh5NszKOljTtVav2zuBw
	Gddb3VhS26VKrxSSsYmbRkdXpfns57VAIcfBmldAjDRsUz6gs6qrNe18raaRcEe8ahoLGwQtMx3
	JCJ8E4Hg24a+mcSOzgQ1lEMSzvjd2FzLqg0pyzogS1Eg8CtPypw4dsUzo338R6dpqSiQURGGM5T
	Nbuwl04BskM8jo+VOeCPj+fyvuq8CXx9tanlLNrI+me3vocikVh4RLyQdjwStflBtAJZ1c9Hv3q
	ZP/FM+R8Ce+pGwNvmrRisIUdAnOqaL4wvu33AaMq4AJZ5Yw0XI2Ql1A==
X-Google-Smtp-Source: AGHT+IEFJNnZ6FrR2en17sXo73X9DuK1LxZNjQHgizccIJ9SYRNb5ZvWineSqQtBSA3ZtHqil12tnw==
X-Received: by 2002:a17:903:11c6:b0:234:325:500b with SMTP id d9443c01a7336-2446bdd77damr167814615ad.22.1755501454480;
        Mon, 18 Aug 2025 00:17:34 -0700 (PDT)
Received: from 100ask.localdomain ([116.234.47.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446caa4139sm71934025ad.17.2025.08.18.00.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 00:17:33 -0700 (PDT)
From: Nino Zhang <ninozhang001@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	straube.linux@gmail.com,
	Nino Zhang <ninozhang001@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix coding style issues in core/rtw_mlme.c
Date: Mon, 18 Aug 2025 15:14:11 +0800
Message-ID: <20250818071411.90159-2-ninozhang001@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817054202.31171-1-ninozhang001@gmail.com>
References: <20250817054202.31171-1-ninozhang001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes blank line issues in coding style:
- Remove unnecessary blank lines after an open brace '{'.
- Remove unnecessary blank lines before a closing brace '}'.
- Add missing blank lines after variable declarations.
- Add blank lines after function, struct, union, and enum declarations.

Signed-off-by: Nino Zhang <ninozhang001@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 29 ++---------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index fdf06b5253a7..c06d990350e6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -200,7 +200,6 @@ void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 
 void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwork)
 {
-
 	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
 
 	if (!pnetwork)
@@ -255,11 +254,9 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
 
 	phead = get_list_head(scanned_queue);
 	list_for_each_safe(plist, tmp, phead) {
-
 		pnetwork = list_entry(plist, struct wlan_network, list);
 
 		_rtw_free_network(pmlmepriv, pnetwork, isfreeall);
-
 	}
 
 	spin_unlock_bh(&scanned_queue->lock);
@@ -348,7 +345,6 @@ int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 		ret = true;
 
 	return ret;
-
 }
 
 inline int is_same_ess(struct wlan_bssid_ex *a, struct wlan_bssid_ex *b)
@@ -378,7 +374,6 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
 			(d_cap & WLAN_CAPABILITY_IBSS)) &&
 			((s_cap & WLAN_CAPABILITY_ESS) ==
 			(d_cap & WLAN_CAPABILITY_ESS));
-
 }
 
 struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue, struct wlan_network *network)
@@ -410,7 +405,6 @@ struct	wlan_network	*rtw_get_oldest_wlan_network(struct __queue *scanned_queue)
 	phead = get_list_head(scanned_queue);
 
 	list_for_each(plist, phead) {
-
 		pwlan = list_entry(plist, struct wlan_network, list);
 
 		if (!pwlan->fixed) {
@@ -419,7 +413,6 @@ struct	wlan_network	*rtw_get_oldest_wlan_network(struct __queue *scanned_queue)
 		}
 	}
 	return oldest;
-
 }
 
 void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
@@ -454,7 +447,6 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 			sq_final = dst->phy_info.signal_quality;
 			rssi_final = dst->rssi;
 		}
-
 	}
 
 	if (update_ie) {
@@ -516,7 +508,6 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 
 		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
 			oldest = pnetwork;
-
 	}
 
 	/* If we didn't find a match, then get a new network slot to initialize
@@ -560,7 +551,6 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 				pnetwork->network.phy_info.signal_quality = 0;
 
 			list_add_tail(&pnetwork->list, &queue->queue);
-
 		}
 	} else {
 		/* we have an entry and we are going to update it. But this entry may
@@ -623,7 +613,6 @@ int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwor
 			return true;
 		else
 			return false;
-
 	}
 	if (adapter->registrypriv.wifi_spec == 1) { /* for  correct flow of 8021X  to do.... */
 		u8 *p = NULL;
@@ -900,7 +889,6 @@ void rtw_indicate_connect(struct adapter *padapter)
 	pmlmepriv->to_join = false;
 
 	if (!check_fwstate(&padapter->mlmepriv, _FW_LINKED)) {
-
 		set_fwstate(pmlmepriv, _FW_LINKED);
 
 		if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
@@ -974,7 +962,6 @@ void rtw_scan_abort(struct adapter *adapter)
 	pmlmeext->scan_abort = true;
 	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)
 		&& jiffies_to_msecs(start) <= 200) {
-
 		if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
 			break;
 
@@ -1067,7 +1054,6 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 	}
 
 	return psta;
-
 }
 
 /* pnetwork : returns from rtw_joinbss_event_callback */
@@ -1502,11 +1488,11 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
 	      check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
-
 		rtw_free_stainfo(adapter,  psta);
 
 		if (adapter->stapriv.asoc_sta_count == 1) {/* a sta + bc/mc_stainfo (not Ibss_stainfo) */
 			u8 ret = _SUCCESS;
+
 			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 			/* free old ibss network */
 			pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.mac_address);
@@ -1536,7 +1522,6 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 			if (ret != _SUCCESS)
 				goto unlock;
 		}
-
 	}
 
 unlock:
@@ -1595,7 +1580,6 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 
 		/* indicate disconnect for the case that join_timeout and check_fwstate != FW_LINKED */
 		rtw_cfg80211_indicate_disconnect(adapter);
-
 	}
 
 	spin_unlock_bh(&pmlmepriv->lock);
@@ -1645,7 +1629,6 @@ static void rtw_auto_scan_handler(struct adapter *padapter)
 
 	if (pmlmepriv->auto_scan_int_ms != 0
 		&& jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv->auto_scan_int_ms) {
-
 		if (!padapter->registrypriv.wifi_spec) {
 			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING) == true)
 				goto exit;
@@ -1778,12 +1761,10 @@ int rtw_select_roaming_candidate(struct mlme_priv *mlme)
 	phead = get_list_head(queue);
 
 	list_for_each(mlme->pscanned, phead) {
-
 		pnetwork = list_entry(mlme->pscanned, struct wlan_network,
 				      list);
 
 		rtw_check_roaming_candidate(mlme, &candidate, pnetwork);
-
 	}
 
 	if (!candidate) {
@@ -1875,12 +1856,10 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 
 	phead = get_list_head(queue);
 	list_for_each(pmlmepriv->pscanned, phead) {
-
 		pnetwork = list_entry(pmlmepriv->pscanned,
 				      struct wlan_network, list);
 
 		rtw_check_join_candidate(pmlmepriv, &candidate, pnetwork);
-
 	}
 
 	if (!candidate) {
@@ -1968,7 +1947,6 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		adapter->securitypriv.key_mask |= BIT(psetkeyparm->keyid);
 
 	switch (psetkeyparm->algorithm) {
-
 	case _WEP40_:
 		keylen = 5;
 		memcpy(&psetkeyparm->key[0], &psecuritypriv->dot11DefKey[keyid].skey[0], keylen);
@@ -2044,7 +2022,6 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	}
 
 	return ielength;
-
 }
 
 /* Ported from 8185: IsInPreAuthKeyList(). 
@@ -2449,7 +2426,6 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	}
 
 	return phtpriv->ht_option;
-
 }
 
 /* the function is > passive_level (in critical_section) */
@@ -2484,7 +2460,6 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 		max_ampdu_sz = 1 << (max_ampdu_sz+3); /*  max_ampdu_sz (kbytes); */
 
 		phtpriv->rx_ampdu_maxlen = max_ampdu_sz;
-
 	}
 
 	len = 0;
@@ -2575,7 +2550,6 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 			rtw_addbareq_cmd(padapter, (u8) priority, pattrib->ra);
 		}
 	}
-
 }
 
 void rtw_append_exented_cap(struct adapter *padapter, u8 *out_ie, uint *pout_len)
@@ -2616,6 +2590,7 @@ void rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	_rtw_roaming(padapter, tgt_network);
 	spin_unlock_bh(&pmlmepriv->lock);
 }
+
 void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-- 
2.43.0

Changes since v1:
- Make modifications based on the staging-next branch.
- Resolved the previous code conflicts.
