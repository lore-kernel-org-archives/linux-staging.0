Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4421E3DE5
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 01:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949198; cv=none; b=hFeH1T2klJMx4HWCCwTQSQQZx2FHn6baT+7YjH36jbaOX6+1u+VCCxsNbWIT0yTO9azEzQAmYheLm52XqRk9RCKC4mHHjs/yplDdMpS8bMbrtpH0e//67MfDZHYFSCM6wKbwP+xMlrLqtmwUaFWfd9Nq3MpDTqhFf/2xW8Iq8fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949198; c=relaxed/simple;
	bh=WvsYf4htlmaRnQimGmB6zOdcA6l8TLaYGHRCyCVqilw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hy1VABNFyfIr4ascgRcNUKpd1mTa/U/EEiktS8qfBTggPYrQ6gkSZTRWrh2xbLeqxNXRJjlPMV1UuE3zj1ebCsR2+pEnIEElehffmcdyN2hEdVdri4lnenGSMATxh2zpU74o/ZreZ4uIbnUOLXtJ3FD7dfczb7ygmbYpmukE+Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wrq3a74z; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wrq3a74z"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-722d5d8fa11so3874216d6.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 18:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756949195; x=1757553995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgytSi7eWruZ4IgCQ9+woJWiBKve9B/1Gpbx5IGpnoY=;
        b=Wrq3a74zSc/iuFJwzIkbqkLNU2k6lEqv+QuhbzHC6RqKckEQxSlm/HQMJLK3njSe75
         YD4eSX3RYapzGrOSsorRmQzUYUUeIYdHa42S7oGG4Q7yrW0+7cIG+TY3sS8hJ+HHQwzQ
         7FQN8y/dJwyhlqPnhbNYRDROZJ6nuaSr5MlC/tok7DU4FFbq6JuydGNLNhnIpbgjTI/C
         3f2KID/PSgu35T+9uov3TchL8dwxln4b38Hu4eS/iGd8/QYY/jjrlTnOPJwSQVXkSYbz
         tQOerKxqr+hJiPw3zUN8vGw/08YPQ6sdUCNMUYEWhKLc8zGs/E81c+WCgtdVz4A9PW/U
         Nh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756949195; x=1757553995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgytSi7eWruZ4IgCQ9+woJWiBKve9B/1Gpbx5IGpnoY=;
        b=I0QtukijSaLEjHBtZg6WNEOsx6fthXciZbUc9JvlJ0kcJqpyyGAVX5m+E1uQ16VIcK
         msXNrr/VJVUYIOVDdn4//6/Wl4/rbLfNxPFv/IWFFF4XzvG8ddwY+heNWvCZHx9Eu4GT
         ItDb0O1uph+9fkkGxgkNcnbX1s/kGpihw1BPnQZPAQYjJk6FQl4/HNhAPq3deJRnMMkH
         JcuyP34l+KuOAOpu2rCN5Jfcqr4prPhupfFRjhVFo4F5ovshVW26+O7qBjZW0rPY04+9
         4PELpT6njqVAZEo0VDI2gFQZGoiV+/7UL1xeJHdYHe6OxfG8mQHW29GxKZjskvGw15ke
         5H7w==
X-Gm-Message-State: AOJu0YyDnJDVi7jwP0TNApQlcvMea1GKQFoMKLVjBkqqyEhei3jKF066
	NnT7fRbQoS2I4r4ped1+LORQB75+7mlbNgttruCkJoRZMHUKDWZlFxgADCP76A==
X-Gm-Gg: ASbGncsRXz8P3nfjDB7QnTis1SaiIt+ZLRMlPmcImwGpMNY+AexqpbcWFo6H2yNH9mY
	hWYxer5mXwdsnDoFkoUgw21N4FVFA4QO7HuFowtRZ7GOnZ3yMv+lQW+45veu+Eb/9FWdvNQ9khB
	FD/IkHoyyOp8clSl0ZW647qU6eW8xMQ4xdr1AmA/zQCtIDJWOCxUWGLbupCbjJYv++djaXYyjlQ
	vwzc0srP4UF0+nAki/ksyztPbPDU09wjprRtGXUqLLCB/mhnPyNAYQtf7A4aWFfzzghnDnEmFw4
	giFlXM2JRUi0zn47okJjxYlaphosAtm/wHNN26RCRM0ESj1NaLYfV61U1EyyXdrlQPQnjLIiKfd
	IebiWA757xnsYmvxfB2gWnJ8Tf1NFnL7HpMTl2NRyxpsf/VGUcKRdaVvBkO95aQ==
X-Google-Smtp-Source: AGHT+IHUfpDs915pAAEAG7aa0wvPmJUCO/l0dQ740JqmrtcMq3cL4s4Haa/dAQuVyhOuRDoReNLDsA==
X-Received: by 2002:a05:6214:493:b0:70d:ff6b:4299 with SMTP id 6a1803df08f44-70fac9656ebmr157787896d6.65.1756949194785;
        Wed, 03 Sep 2025 18:26:34 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b682faf5sm38423266d6.65.2025.09.03.18.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:26:34 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH 07/16] staging: rtl8723bs: adding asterisks in multi-line block comments
Date: Thu,  4 Sep 2025 01:25:27 +0000
Message-Id: <20250904012529.215521-8-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
References: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Format multi-line block comments with leading asterisks

Add leading asterisks (*) on each line of multi-line block comments,
in accordance with kernel coding style. This improves consistency
and readability of the comments.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 33 ++++++++++++-----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 19bf6bb360f9..ab626c88e7dd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -217,10 +217,10 @@ void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *
 }
 
 /*
-	return the wlan_network with the matching addr
-
-	Shall be called under atomic context... to avoid possible racing condition...
-*/
+ *	return the wlan_network with the matching addr
+ *
+ *	Shall be called under atomic context... to avoid possible racing condition...
+ */
 struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
 	struct list_head	*phead, *plist;
@@ -322,10 +322,10 @@ void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnet
 }
 
 /*
-	return the wlan_network with the matching addr
-
-	Shall be called under atomic context... to avoid possible racing condition...
-*/
+ *	return the wlan_network with the matching addr
+ *
+ *	Shall be called under atomic context... to avoid possible racing condition...
+ */
 struct	wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
 	struct	wlan_network *pnetwork = _rtw_find_network(scanned_queue, addr);
@@ -489,8 +489,8 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 }
 
 /*
-Caller must hold pmlmepriv->lock first.
-*/
+ * Caller must hold pmlmepriv->lock first.
+ */
 void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *target)
 {
 	struct list_head	*plist, *phead;
@@ -523,7 +523,8 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 	}
 
 	/* If we didn't find a match, then get a new network slot to initialize
-	 * with this beacon's information */
+	 * with this beacon's information
+	 */
 	if (!target_find) {
 		if (list_empty(&pmlmepriv->free_bss_pool.queue)) {
 			/* If there are no more slots, expire the oldest */
@@ -1891,11 +1892,11 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 }
 
 /*
-Calling context:
-The caller of the sub-routine will be in critical section...
-The caller must hold the following spinlock
-pmlmepriv->lock
-*/
+ * Calling context:
+ * The caller of the sub-routine will be in critical section...
+ * The caller must hold the following spinlock
+ * pmlmepriv->lock
+ */
 
 int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 {
-- 
2.39.5

