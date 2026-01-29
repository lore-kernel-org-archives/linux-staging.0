Received: from mvsmtppost05.nm.naver.com (mvsmtppost05.nm.naver.com [61.247.196.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE493803CD
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 12:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.247.196.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769690639; cv=none; b=FdEFJCO3hdFWJnptYvqUxrtst38qtKTplqW/pInKQLb+cuPxlr/COypzHn1ZV5DRy2V4EcnXuTXgGuSzZmDhPmi7K63WSbLv8SyTiczAhHynSphwav+RlG6JgLBCqMI1gj24eOgLqdcPI1COURA3y55vFRmPThdSmJ4oI4pJqqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769690639; c=relaxed/simple;
	bh=k8XmcGinUMlxz2qsIow0zRaI8HrYh1o8/wq1z1EnCK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mfYrUSFCeGpHRZp325wEAmcAtI811fdAGBzTzsWonajF06/OCuuju1fPkyVLEMkR7E35IJWCzM/Vrz8x/egiBtxC0pIIp6nVJv8FVebtYQur/j2l0Q5WwTC/tFYYSO5+lBdR//dGRkEiSgIxgiIA9jj0jIM4/hVdH/iy1rBR5FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=rgN3/re8; arc=none smtp.client-ip=61.247.196.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="rgN3/re8"
Received: from cvsendbo024.nm ([10.112.24.41])
  by mvsmtppost05.nm.naver.com with ESMTP id AoQCFUbdR-ubFMCSlRTMlw
  for <linux-staging@lists.linux.dev>;
  Thu, 29 Jan 2026 12:33:48 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769690028; bh=k8XmcGinUMlxz2qsIow0zRaI8HrYh1o8/wq1z1EnCK4=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=rgN3/re8YiupMz4bS526EaZtCscj//+1hWrfz6qBbZOrnUxR/D+YElbaayslNfLg5
	 8SkQRV7fnVQi/SZsDBW/nCvgW65Tr3vpdKhp+wuOCDPLkNSjIcFFkRlESe0s0B1QeG
	 gkzv67uHIPWRMXj6scS9rARZh4Jb51IMlMcPfZnpY1sg8jShVqG+c7tuSm4xKjuv8Y
	 Ol5s1T93mpiOJ3ziEGT2g4yHeGHH/w4Q1PaNgK/LtuEbTXl785kkDjep/+hBWcwiGV
	 fO3uzNkt3vikItMzH+uHxv6amk+LQYz+zd4IQ3t4fo5bgsqstd7O/5AlJIPIhfuxS4
	 rlKOnYJr5a23A==
X-Session-ID: TfW5r8y4TDqW5tJHRLfVmw
X-Works-Send-Opt: 1/YljAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: Vdn9FovrFqJZ+HmXKoMX+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by mvnsmtp01.nm.naver.com with ESMTP id TfW5r8y4TDqW5tJHRLfVmw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 29 Jan 2026 12:33:47 -0000
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
Subject: [PATCH v3] staging: rtl8723bs: fix potential race in expire_timeout_chk
Date: Thu, 29 Jan 2026 21:33:42 +0900
Message-ID: <20260129123342.309946-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129023214.1149822-1-s9430939@naver.com>
References: <20260129023214.1149822-1-s9430939@naver.com>
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
Changes in v3:
    Suggested-by Dan Carpenter
    - Use list_for_each_entry_safe() only for the new code.
    - Remove blank line in the declaration block.
    - Keep existing code unchanged

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

