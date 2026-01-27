Received: from cvsmtppost05.nm.naver.com (cvsmtppost05.nm.naver.com [114.111.35.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427283242AA
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 13:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769520054; cv=none; b=bQL++VK41hHcM29meF3XIAbM3r/4b2FaCuLx+rt5FB2LmWPxELaULkiculkOTqHlc3+bcXoSMBU1pNFpR5NZ3QAZAfp5mZ71TVnhWmeFelHCIw4WxOcJ5f79mkdgvkAUQn/iVgOWOi0M8MUPZpL6HFwmvkja1P78BWxH47f9TAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769520054; c=relaxed/simple;
	bh=0kDkLbs7IWeTLdnS59pHWK1fl6G0QtTDVuov0ZI+cfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k3yF1u30o7N+6IhugK57OVcFUzlvIxvebGJRP/HpAWj6AmrhxAtusygP19j/myMf5B5kLfQaqgkOrr8ZdcO28TBame/e3C2sW/p4CJu90L2CSxydsL+MoH4vXlTCxkb00Yl+8yWR+jNqteLf5T7wMxQ5ft7zkeiYxtfXC+grzwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=IwSRqqFE; arc=none smtp.client-ip=114.111.35.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="IwSRqqFE"
Received: from cvsendbo020.nm ([10.112.24.40])
  by cvsmtppost05.nm.naver.com with ESMTP id rzITOhZSSY2e80MA1OiWBA
  for <linux-staging@lists.linux.dev>;
  Tue, 27 Jan 2026 13:10:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769519443; bh=0kDkLbs7IWeTLdnS59pHWK1fl6G0QtTDVuov0ZI+cfw=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=IwSRqqFEEARu0zPSDxp3EM1gxSCZFDtBn5jKDQkFctrafEpUvm3zHr3I1LO6+/7+C
	 GFp/+xtU8tXRuT+QXfK1LBdXauHEPheL7VLQupgW92po1l5Vr7l5FkZwhjD+kWXUky
	 M02cpFbXMLk8sNI+9G7ye0kZiEWhNQX5U4zBqp2C4hBagXNgK4BgmHvEphG6zMHWFk
	 L53UPkRMHfGcPpzn7u0fc60aqQTSXpg42jrwBPgI8+Vz4ltXFhluQTlqzSVvOLklvH
	 YfOq/A3V4B9MSiATLJ2r88UdvztLQSwTommsjnSlXx/stnRXEnUZXVKCrVULdhEIWg
	 ew+NEO8Vxw20w==
X-Session-ID: v1YxRlwGTaCDWHPxFMhhQQ
X-Works-Send-Opt: 1/YljAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: AZb/FAvrFqJZ+HmZFAgX+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp012.nm.naver.com with ESMTP id v1YxRlwGTaCDWHPxFMhhQQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 27 Jan 2026 13:10:42 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: bqn9090@gmail.com,
	dan.carpenter@linaro.org,
	abrahamadekunle50@gmail.com,
	straube.linux@gmail.com,
	bryant.boatright@proton.me,
	davidzalman.101@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [RFC PATCH] staging: rtl8723bs: fix potential race in expire_timeout_chk
Date: Tue, 27 Jan 2026 22:10:35 +0900
Message-ID: <20260127131035.731607-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The expire_timeout_chk function currently do lock and unlock inside the
loop before calling rtw_free_stainfo().

This can be risky as the list might be changed
when the lock is briefly released.

To fix this, move expired sta_info entries into a local free_list while
holding the lock, and then perform the actual freeing after the lock is
released.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
Hi,

I noticed this lock-unlock pattern in expire_timeout_chk() while
studying the code and it looked like a potential race condition.

I've refactored the code to use a local list so we can handle the
cleanup after releasing the lock. What do you think about this approach?

Any feedback is appreciated.

 drivers/staging/rtl8723bs/core/rtw_ap.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4a4d..5947f6363ab0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -179,6 +179,9 @@ void expire_timeout_chk(struct adapter *padapter)
 	u8 chk_alive_num = 0;
 	char chk_alive_list[NUM_STA];
 	int i;
+	struct list_head free_list;
+
+	INIT_LIST_HEAD(&free_list);
 
 	spin_lock_bh(&pstapriv->auth_list_lock);
 
@@ -190,19 +193,21 @@ void expire_timeout_chk(struct adapter *padapter)
 		if (psta->expire_to > 0) {
 			psta->expire_to--;
 			if (psta->expire_to == 0) {
-				list_del_init(&psta->auth_list);
+				list_move(&psta->auth_list, &free_list);
 				pstapriv->auth_list_cnt--;
-
-				spin_unlock_bh(&pstapriv->auth_list_lock);
-
-				rtw_free_stainfo(padapter, psta);
-
-				spin_lock_bh(&pstapriv->auth_list_lock);
 			}
 		}
 	}
 
 	spin_unlock_bh(&pstapriv->auth_list_lock);
+
+	/* free free_list */
+	list_for_each_safe(plist, tmp, &free_list) {
+		psta = list_entry(plist, struct sta_info, auth_list);
+		list_del_init(&psta->auth_list);
+		rtw_free_stainfo(padapter, psta);
+	}
+
 	psta = NULL;
 
 	spin_lock_bh(&pstapriv->asoc_list_lock);
-- 
2.43.0

