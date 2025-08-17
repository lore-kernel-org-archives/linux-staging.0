Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E93E19B5B1
	for <linux-staging@lists.linux.dev>; Sun, 17 Aug 2025 05:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755409335; cv=none; b=h7nxcyLV9HnE7oXNXGP+z+KvLauD4fAWeWgPFfZgsoRN6YuALd1IFW4TqYYWbYcqSIm+mzJ2bpRAexdn/oXWXQAQwz9AdZ1XY3/kkYavIhBZZx/3aRZYdrmYyIt0F3yhMq1tTw5wpiU3EAblXIVk46FRVpLdaHuN2PLS3ypOKdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755409335; c=relaxed/simple;
	bh=+Z/mYmkjlGyP67pyAOekkR7e7NjNa85sfzlsmC09o7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XnKrZ2C12GM2ApxvBh1D0wrpnqlkmbwoSKaxox9pfm9HvNrJZnM4WftuiEohLZWQLtwy3Fxx+HGN9u1HJQvjZ1+R4LMBjpCVMdpsL3Wy8jWV5jLV5NyVyS0I+Jh5fLGxWa1SLSs372BHAIYoWjlbfla0emhQXYxhRiJSCQ5jDjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8mrdYmn; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8mrdYmn"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e563b25c4so333242b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 16 Aug 2025 22:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755409333; x=1756014133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lztrOR28v6KPQTHH6JN0VDxNFUFZdX/DljHltjGKunA=;
        b=U8mrdYmn5T8KkseTaq09gAgHHErM38yvpwVqKTiCnwVRIUFcvmEI0Joab/JVc0Jyu/
         itlmqRuzzuTrK4TLEQnwKQbwR99Pj1Zf9z6tEeJkVZnxdpJ837HhVSB2r3MIXzki1hCW
         VJkneH7njO0iUKCoKDWBGLmVs39xEEzFlribAGPFVTLZkVSw4UlQWQBy/uOGUXAgbw5Q
         Hdogim8fX01hc+YnX5vtkQx9GSFwzEeWQ0ewDlEvg9PvyaI5usLl3fj47N0OuTQPmEMF
         9fFbYpYwu6LfY0cw5DEqgmukHkfxl3NsZ6hjXQCi9hsW4ReahUt0Z3V0F2ZyjEDwVDMA
         FcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755409333; x=1756014133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lztrOR28v6KPQTHH6JN0VDxNFUFZdX/DljHltjGKunA=;
        b=uhiBf0TYKMjDR5ve4yGW+MPgdvGiAkyAqUBLBABUtW85WfKpEZEnDyPLctsxmaE30T
         u5JQqsyYiJ/a22DFIOAFjb/u9Qga1E5VH7MCS+8S6i6t8R/SeBdqbD8J4rg5AkCPJxbg
         d+pj4aatSIcg9J34QEHrglUi91nPDjkYlfgyvgq5UowVFtipZMZDcIDoTpmAOr92KQm7
         y590A9KHL/1XxpUobYqw8uFRz8coiTcjEBzZkcEx3VFHByC2OHUrdXfPFuXpUplLw3kf
         UmQHelqZnU1qaZYpX+dHzChTILzg61Pi7pL28w1neStoAkeovRYCExH0e7sM19n6QXki
         KrTw==
X-Gm-Message-State: AOJu0Yx8oGZGumC5uwaxFvYqGDcHKEE2/kPW7Qz7F5+kLTZHltiNNmsy
	hRc4o+fMM86oFm9wOvfS4vdrndPzLbAAaW6+0YCfAZ0k+2CuSEpaXNe5
X-Gm-Gg: ASbGncuRXJp1t+5a9vHUtjg2jnQj2waorI/KlFZqKGfu43BdQlnRaI97vqSck1FCnNC
	JrT2L4shBekvsK+M2b9f0rYlu1EMH6EnoiF4EOdL/ZciA1L8V3EkmPdz4kOaGCR/uCplBYxcTdi
	BpPjgbFE4eNrqRLhZGeZH7WJj2jfQqVko13WAIniFvrWQNhlT6P/Ia4fNj9Fvbg87lfJtPGRlON
	7VVjJ6+hnxP1ouRB6aJ7hJz/KdAt7H484Ix0Z1pD4No2WHUW+WEraFFz2PddKELrAkEjQ9NtkRG
	/otZerRTUOVvBK1XGakhgL2mSMxIvQb40MRtMUn0GZx6JoSx56dx2redeGA0GFzNmWfX4pLFpMl
	1pmGvLFW/YtILmlOdAu9vT764dokw6nRw15qJbDhEYDaa5g==
X-Google-Smtp-Source: AGHT+IHEioWaeVG/U1soMmh47oMpljvSROQMIVcpZi5IAIHMOXfqp4999NtwZNER3LhvdbvVOZKztw==
X-Received: by 2002:a05:6a20:1594:b0:23d:ae11:e1e1 with SMTP id adf61e73a8af0-240d302fcb8mr10433573637.12.1755409333429;
        Sat, 16 Aug 2025 22:42:13 -0700 (PDT)
Received: from 100ask.localdomain ([116.234.47.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e452663f0sm4374848b3a.21.2025.08.16.22.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 22:42:13 -0700 (PDT)
From: Nino Zhang <ninozhang001@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	straube.linux@gmail.com,
	Nino Zhang <ninozhang001@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix coding style issues in core/rtw_mlme.c
Date: Sun, 17 Aug 2025 13:42:02 +0800
Message-ID: <20250817054202.31171-1-ninozhang001@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes coding style problems in rtw_mlme.c:
- Delete unnecessary blank lines.

Signed-off-by: Nino Zhang <ninozhang001@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 692d0c2b766d..8ec039d832e9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -170,7 +170,6 @@ void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 
 void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwork)
 {
-
 	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
 
 	if (!pnetwork)
@@ -225,7 +224,6 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
 
 	phead = get_list_head(scanned_queue);
 	list_for_each_safe(plist, tmp, phead) {
-
 		pnetwork = list_entry(plist, struct wlan_network, list);
 
 		_rtw_free_network(pmlmepriv, pnetwork, isfreeall);
@@ -380,7 +378,6 @@ struct	wlan_network	*rtw_get_oldest_wlan_network(struct __queue *scanned_queue)
 	phead = get_list_head(scanned_queue);
 
 	list_for_each(plist, phead) {
-
 		pwlan = list_entry(plist, struct wlan_network, list);
 
 		if (!pwlan->fixed) {
@@ -868,7 +865,6 @@ void rtw_indicate_connect(struct adapter *padapter)
 	pmlmepriv->to_join = false;
 
 	if (!check_fwstate(&padapter->mlmepriv, _FW_LINKED)) {
-
 		set_fwstate(pmlmepriv, _FW_LINKED);
 
 		rtw_os_indicate_connect(padapter);
@@ -929,7 +925,6 @@ void rtw_scan_abort(struct adapter *adapter)
 	pmlmeext->scan_abort = true;
 	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)
 		&& jiffies_to_msecs(start) <= 200) {
-
 		if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
 			break;
 
@@ -1397,7 +1392,6 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
 	      check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
-
 		rtw_free_stainfo(adapter,  psta);
 
 		if (adapter->stapriv.asoc_sta_count == 1) {/* a sta + bc/mc_stainfo (not Ibss_stainfo) */
@@ -1540,7 +1534,6 @@ static void rtw_auto_scan_handler(struct adapter *padapter)
 
 	if (pmlmepriv->auto_scan_int_ms != 0
 		&& jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv->auto_scan_int_ms) {
-
 		if (!padapter->registrypriv.wifi_spec) {
 			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING) == true)
 				goto exit;
@@ -1673,7 +1666,6 @@ int rtw_select_roaming_candidate(struct mlme_priv *mlme)
 	phead = get_list_head(queue);
 
 	list_for_each(mlme->pscanned, phead) {
-
 		pnetwork = list_entry(mlme->pscanned, struct wlan_network,
 				      list);
 
@@ -1770,7 +1762,6 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 
 	phead = get_list_head(queue);
 	list_for_each(pmlmepriv->pscanned, phead) {
-
 		pnetwork = list_entry(pmlmepriv->pscanned,
 				      struct wlan_network, list);
 
@@ -1863,7 +1854,6 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		adapter->securitypriv.key_mask |= BIT(psetkeyparm->keyid);
 
 	switch (psetkeyparm->algorithm) {
-
 	case _WEP40_:
 		keylen = 5;
 		memcpy(&psetkeyparm->key[0], &psecuritypriv->dot11DefKey[keyid].skey[0], keylen);
-- 
2.43.0

