Received: from cvsmtppost21.nm.naver.com (cvsmtppost21.nm.naver.com [114.111.35.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6B042EED3
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 16:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307365; cv=none; b=bXQG6DzudoZFVgT14MolxKw7qHXIdaeNVXatMEZUsKtLxt5WpiijGv3KYH+I9AWfSWp/mAqdDWrKz6qPdy3SHW33ucp4Tyn58dRwj9bywzzzaCqlXbxoJ5zkHizyfyEGeQRt6Cvw0TzJ6kQM9DVUgVVD/04aqmvwVo3Xy3gxvaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307365; c=relaxed/simple;
	bh=cjLWZtH5VZDv+V2x5VUEzeZMVMU0ZgE0myUUKmsVRrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zr6lRvUYk4q3Fd51tRSi3HvSwhfsFVc5/zYvAODvibqOM+lI4IVwHjUSCS7whYVgCyScD9RjnWHzI428QB2u9FQIkOqQyOKalHfDmxn/A6Ycw5DbM+cTchuMYUJoCDL72iho7hfWxBguixV6tYcrjGkcSJ3LRdqJUAeLW5hc4hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=PQX/oqDa; arc=none smtp.client-ip=114.111.35.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="PQX/oqDa"
Received: from cvsendbo018.nm ([10.112.20.46])
  by cvsmtppost21.nm.naver.com with ESMTP id cqPMbPEPTm++fgurwC-j3w
  for <linux-staging@lists.linux.dev>;
  Thu, 05 Feb 2026 16:02:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1770307356; bh=cjLWZtH5VZDv+V2x5VUEzeZMVMU0ZgE0myUUKmsVRrE=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=PQX/oqDa+XHTAsZ6sRNX0HLwpsx+EeGwsexE9hc5B4w/M3nOEGG8AfWy/z8ggc7YC
	 P+eFXj/ps+Bc1mpbjvrwktCGPb7y+bKwh6BvdlLjQWU7Jv872rAZ99OuWaHB/6oOK7
	 xvP7Y8iC4T6Zjm8MZhb8BGhCXZUuHv501PlfuwFuJewZwgRtuOEgAxY2PFUYe55aAa
	 qJU/McTmzhhmrBoGYJP6P0vElolHRjQWGrmTkl1JM3Nrokk2UWFYKR+NR/NUXbfA/j
	 EXEO/IJoQyreEWFFfFIqbqksR1l2WoV6YXAgDxbVbqOSjc/02cirTJJCFqULxNz8hm
	 /7A8E6IDIyvjQ==
X-Session-ID: dMFsQFcMS4Sdj+Lh+KfdPw
X-Works-Send-Opt: B/YrjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: /9KXKogXFqJZ+HmrFxvd+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp002.nm.naver.com with ESMTP id dMFsQFcMS4Sdj+Lh+KfdPw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 05 Feb 2026 16:02:36 -0000
From: Minu Jin <s9430939@naver.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH] staging: most: dim2: fix a race condition in complete_all_mbos()
Date: Fri,  6 Feb 2026 01:02:31 +0900
Message-ID: <20260205160231.1543828-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation of complete_all_mbos() repeatedly acquires
and releases the spinlock in loop. This causes lock contention.

This patch refactors the function to use list_replace_init(), moving all
entries to a local list. This removes the loop-based locking approach
and significantly reduces lock contention.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/most/dim2/dim2.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 80af965356d0..fb54bb1a803f 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -415,20 +415,16 @@ static irqreturn_t dim2_ahb_isr(int irq, void *_dev)
  */
 static void complete_all_mbos(struct list_head *head)
 {
+	struct mbo *mbo, *mbo_tmp;
 	unsigned long flags;
-	struct mbo *mbo;
-
-	for (;;) {
-		spin_lock_irqsave(&dim_lock, flags);
-		if (list_empty(head)) {
-			spin_unlock_irqrestore(&dim_lock, flags);
-			break;
-		}
+	LIST_HEAD(del_list);
 
-		mbo = list_first_entry(head, struct mbo, list);
-		list_del(head->next);
-		spin_unlock_irqrestore(&dim_lock, flags);
+	spin_lock_irqsave(&dim_lock, flags);
+	list_replace_init(head, &del_list);
+	spin_unlock_irqrestore(&dim_lock, flags);
 
+	list_for_each_entry_safe(mbo, mbo_tmp, &del_list, list) {
+		list_del(&mbo->list);
 		mbo->processed_length = 0;
 		mbo->status = MBO_E_CLOSE;
 		mbo->complete(mbo);
-- 
2.43.0

