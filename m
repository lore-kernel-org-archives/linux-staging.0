Received: from cvsmtppost08.nm.naver.com (cvsmtppost08.nm.naver.com [114.111.35.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A64F34CFB8
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 17:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880137; cv=none; b=NVrgt1u1SmqDHjIchHP9PUOeZYE8uQ//RQNjbhKSkAOav1Q4PhtJ1WuApSJgHrXqP4eglHY/p56I9dkBFQ6ILWEg/oGPLDPnUDYKU39BEr3BjOuqikLnC+JVo+RwdHZz2fXtNU4bznOaQ+oyanjR6rmneLlUcOCS8AHSxZ4G4Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880137; c=relaxed/simple;
	bh=ALlKgeM5yLEghKw6alIbAIXkwAcKOKlJAW85df0Q1Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y5DYL9qHYFLWQTLbXfBUVacpsm9oS6pvrYAK84TGtuAXULAI3DxGHbYpmdrM17x5Dw9IC08ffkF8bEtIDcJCvSJjhapL7pLFskq3EyHjhoVvTFolSlx/F3WeR1CtF7kYBvdAcyoSQRzjNSOtFzb0Cp3AwKOU2CHZISucArR3d4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=IBazIniI; arc=none smtp.client-ip=114.111.35.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="IBazIniI"
Received: from cvsendbo023.nm ([10.112.22.35])
  by cvsmtppost08.nm.naver.com with ESMTP id eEeFcj94Tyy2b1pq4fHbxw
  for <linux-staging@lists.linux.dev>;
  Sat, 31 Jan 2026 17:11:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769879519; bh=ALlKgeM5yLEghKw6alIbAIXkwAcKOKlJAW85df0Q1Hw=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=IBazIniI5RclRicJx/6uk6FNx+60PuObysdW5218Go3onrn+hCGXNG2JKwTAoWuD0
	 O54GKeFsWQ/o1oPbsBDaiVvyPFaCGS1s/ERMf493P8f7GEFU/liitL36sjPFmkAaSP
	 6UO7KX3SS6+zCwVzVIKkxW4rlDvuO3n42o1UQf3S72gsXXVeNX3CHil7dFzngtKB/J
	 IQfAGJK2I27Ketc6cFcRpbOK8R3mXc4Xw4G1LPecezGCUXXBWxnB2R87DjDTUhFl1u
	 97C0asXh8dt6cNF0ufkzlzw9Wx3ewjRP7PkUU9T9331w7dZYiV9gNZARix9HtvAQpK
	 6ULWTH6VLpMFw==
X-Session-ID: p2irDHkpQyW7pFZT-IBvtg
X-Works-Send-Opt: 1/YljAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: AqndaAvrFqJZ+HmlKxuX+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp002.nm.naver.com with ESMTP id p2irDHkpQyW7pFZT-IBvtg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 31 Jan 2026 17:11:59 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	bqn9090@gmail.com,
	abrahamadekunle50@gmail.com,
	straube.linux@gmail.com,
	bryant.boatright@proton.me,
	davidzalman.101@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v4] staging: rtl8723bs: fix potential race in expire_timeout_chk
Date: Sun,  1 Feb 2026 02:11:53 +0900
Message-ID: <20260131171153.3729458-1-s9430939@naver.com>
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
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Changes in v4:
    - Add Reviewed-by tag from Dan Carpenter

Changes in v3:
    Suggested-by Dan Carpenter
    - Use list_for_each_entry_safe() only for the new code.
    - Remove blank line in the declaration block.
    - Keep existing code unchanged

Changes in v2:
    - Use LIST_HEAD for init list (suggested by Dan Carpenter)
    - Replace list_for_each_safe with list_for_each_entry_safe
    - Clean up unused variable 'plist' and fix type of 'tmp' iterator.
    - Remove redundant "free free_list" comment.

 drivers/staging/rtl8723bs/core/rtw_ap.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4a4d..2ee7cc0ebaf6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -178,6 +178,8 @@ void expire_timeout_chk(struct adapter *padapter)
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 chk_alive_num = 0;
 	char chk_alive_list[NUM_STA];
+	struct sta_info *psta_tmp;
+	LIST_HEAD(free_list);
 	int i;
 
 	spin_lock_bh(&pstapriv->auth_list_lock);
@@ -190,19 +192,19 @@ void expire_timeout_chk(struct adapter *padapter)
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
+	list_for_each_entry_safe(psta, psta_tmp, &free_list, auth_list) {
+		list_del_init(&psta->auth_list);
+		rtw_free_stainfo(padapter, psta);
+	}
+
 	psta = NULL;
 
 	spin_lock_bh(&pstapriv->asoc_list_lock);
-- 
2.43.0

