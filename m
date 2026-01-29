Received: from cvsmtppost15.nm.naver.com (cvsmtppost15.nm.naver.com [114.111.35.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0784B1E1A33
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 02:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769653949; cv=none; b=Ogq4h/nsvKLLKH7ACBAMvRD+nXjxt+crU2zGRwYT7+kizxowhQAHKn6tOb+bz57qZSnj2SIy333RP9FB9W7cVq/0Tndc0QjSaLk0CB01YPVSw/wYuh6r6opMvVgUKH9XnpohObd+6ddj8ieornKhR/NLfFUlzzZaoJDqT+b/NVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769653949; c=relaxed/simple;
	bh=osynHQrpHr5vo97va5iZTACnriFJXmw4qgwu62aCHo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lFNZDE+Or3gzvswQ1XvKWL81rHmFK9kZ9P2nlAPStt41QFkNahEp5b5t9Q/Kd6qV2IU7FsA7+4nGeVzU0rlHejX4xYw6Wjn3OhSj8VTHMDXEGk4nxpvTIzV/yk0xrOrwFP2F3QOt8c9DLl/go3aQ5bMuCeHJLD0ISzOr/rfj/+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=kIbCaGZ5; arc=none smtp.client-ip=114.111.35.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="kIbCaGZ5"
Received: from cvsendbo033.nm ([10.112.18.61])
  by cvsmtppost15.nm.naver.com with ESMTP id e40m-GF3SjOhUnNA7gJeQA
  for <linux-staging@lists.linux.dev>;
  Thu, 29 Jan 2026 02:32:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769653938; bh=osynHQrpHr5vo97va5iZTACnriFJXmw4qgwu62aCHo0=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=kIbCaGZ5ugEx+Ih1rYVDq9Ngn7I5hPz1r1VtC5/mA3gjhlns+lyOA3XZhkfQuPNYi
	 wVGxS1b8Rid7ANTlDSoKZUi9H8lsV5wVyD9Xy/GUF3AqyUpOmuQurooJ9NAUBmSogX
	 uRqk3cK+l1cX1tbGt/VJWXlkK0R2AC6nveHjfaDPMskbYoXPddHOkQc+iuNTuh6TI3
	 PiwNlH1e3mLBScKIchDEjRpKqjxqvZT4VAhgDwtWgkqBshMyPNf8LQ5Bbmwchz8Pzv
	 c9WLVXvuX74ofEJeyi8WwpGcRXbCFIpqD548+/tvqKE5k9W9XPdHaIeEPtSWvdbaLk
	 abjj1x8pGziZQ==
X-Session-ID: WBiMObqFSAK61Tfc9+Op3w
X-Works-Send-Opt: 1/YljAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: fqbZFovrFqJZ+Hm/KqEw+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp007.nm.naver.com with ESMTP id WBiMObqFSAK61Tfc9+Op3w
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 29 Jan 2026 02:32:18 -0000
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
Subject: [PATCH v2] staging: rtl8723bs: Fix potential race in expire_timeout_chk
Date: Thu, 29 Jan 2026 11:32:14 +0900
Message-ID: <20260129023214.1149822-1-s9430939@naver.com>
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
Changes in v2:
    - Use LIST_HEAD for init list (suggested by Dan Carpenter)
    - Replace list_for_each_safe with list_for_each_entry_safe
    - Clean up unused variable 'plist' and fix type of 'tmp' iterator.
    - Remove redundant "free free_list" comment.

 drivers/staging/rtl8723bs/core/rtw_ap.c | 27 ++++++++++++-------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4a4d..d0a26134b67d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -172,45 +172,44 @@ static u8 chk_sta_is_alive(struct sta_info *psta)
 
 void expire_timeout_chk(struct adapter *padapter)
 {
-	struct list_head *phead, *plist, *tmp;
+	struct list_head *phead;
 	u8 updated = false;
-	struct sta_info *psta = NULL;
+	struct sta_info *psta = NULL, *tmp;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 chk_alive_num = 0;
 	char chk_alive_list[NUM_STA];
 	int i;
 
+	LIST_HEAD(free_list);
+
 	spin_lock_bh(&pstapriv->auth_list_lock);
 
 	phead = &pstapriv->auth_list;
 	/* check auth_queue */
-	list_for_each_safe(plist, tmp, phead) {
-		psta = list_entry(plist, struct sta_info, auth_list);
-
+	list_for_each_entry_safe(psta, tmp, phead, auth_list) {
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
+	list_for_each_entry_safe(psta, tmp, &free_list, auth_list) {
+		list_del_init(&psta->auth_list);
+		rtw_free_stainfo(padapter, psta);
+	}
+
 	psta = NULL;
 
 	spin_lock_bh(&pstapriv->asoc_list_lock);
 
 	phead = &pstapriv->asoc_list;
 	/* check asoc_queue */
-	list_for_each_safe(plist, tmp, phead) {
-		psta = list_entry(plist, struct sta_info, asoc_list);
+	list_for_each_entry_safe(psta, tmp, phead, asoc_list) {
 		if (chk_sta_is_alive(psta) || !psta->expire_to) {
 			psta->expire_to = pstapriv->expire_to;
 			psta->keep_alive_trycnt = 0;
-- 
2.43.0

