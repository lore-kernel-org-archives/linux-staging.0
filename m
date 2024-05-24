Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F0C23776
	for <linux-staging@lists.linux.dev>; Fri, 24 May 2024 04:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716523986; cv=none; b=BB/saPtsrhaYeyYwHUeZCq1N99+uEOEhMVEbOaYDP6E2j4hTvzR9XLiOlzUPlh+XwGKDjNYse69xbdekrzmaM/CArNy2Awes9l3njJn7Y8KhSgxHAnhSY08njKQ3gQX/VHRs80LvK2oSMF30bgcmWlWSoZ1/T2P80JRUNoBuJM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716523986; c=relaxed/simple;
	bh=53mu7GskWyswzq0Kb3LOlSpj/CqOCHQ55Wc/IXh0bBk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kL+8tEwnPqr1S783X3IGe0+vDP90s3GPa5K+N8C9ZRl5UqrzV1wW20+yMzcOsBMpqEHx0E/7lxbCWRMHK56Axh9dkae8Nuly851O2sbt6hiFaOlIeAUaj57caQCFKdT/YFMraNEeO42wTnx9L6EIMg8T4vRQtfwv7rblQpSn5Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgfnwNYi; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgfnwNYi"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-65c5a29f7f0so3612559a12.1
        for <linux-staging@lists.linux.dev>; Thu, 23 May 2024 21:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716523984; x=1717128784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0R2/6bH5nk9ey66bu5PVH9neSHOwxY1qpJG51e+k3+g=;
        b=GgfnwNYilfIrDiCuN8vV0NfQgm+qkgfEzIebfLth4xKPtDyNaGEXqUwmFf9/FPvdTE
         EHWV6NmuMBst6AJCDRzGDYFf2Hs3tnVlTjpK+41EEYozJjUW/9jxiwz8Tj19vcIZklmy
         KMETRh4fnPa8xjYaq3LSBO6Zrg5TLMbuH/ogH2LJsTnwk1zitHrctH1pxZFlrR55SBH8
         K68+uPEH/FURp+IHYn7/yLpuUS/zrZJc/q95suAFlaX4dw/YLfbYOfApA42Uzizc5+wC
         Lotql+FVQQ3OpdDmV2W3yrKuS+bx5sy/+QTfUy4QmeiVbhPABMKBlhsEK6K2QNkdBNqj
         SIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716523984; x=1717128784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0R2/6bH5nk9ey66bu5PVH9neSHOwxY1qpJG51e+k3+g=;
        b=Lw0nn43Jv3nVXcjYayChps9KW/DI3gbkJFJxntUo2pwFb330x7ZmCGX60wUGA+q/ie
         6rH4RV7XAtsZDPMiVmagFlkZOFQrJ83WCbWDz6UNsDxZeNih8SK8i6/cmmwRlnba/m7l
         FH3M31Pb/sH/5mxz9hrcYbfoECnMDaW8nw5fYe2OFGOSNszToRRym9QFEw2fAEzL2P8J
         ZpYayugHJHT4ZlcxQMBzLeNTVYhx3ZxGyzmP1gkc1Fy6KZ9j7ZarMHbrUSOfLKx3QDq9
         uVd41AqPiiX09qAN6Vb4leuMCgjcd3BQCE6QSzkTv6gmUd5w226NFC3mjUqLYqry0Wi3
         ZZJA==
X-Forwarded-Encrypted: i=1; AJvYcCWm7nS4Kz2JCJD+GLQ1oxjxo8G916tj9AONZhXqCZ0+pTIjrN3PqiElNt7WF6LzcGl89r/tL8+Ds77Kk/uBf4N3bKfQX4KMkTYvYrUfGQ==
X-Gm-Message-State: AOJu0YzGcONGRzr7v+BYcHS00DQJX8Sk/JAE6hEdP0BT2WSxDY4FJMZb
	gqG0rqIIL/YgoTxLWpDtA+k6p3vjTzHeGi801xTgwne7U751M+Lq
X-Google-Smtp-Source: AGHT+IEJqkWJXe3XaeNyx5KpqAXQnWNZWzL4yOtZJduvM9zfdNfyWSrNd46LXkj6ZdsUXSWSec2bzw==
X-Received: by 2002:a05:6a20:c706:b0:1af:f640:13fd with SMTP id adf61e73a8af0-1b212e73158mr1431489637.62.1716523984205;
        Thu, 23 May 2024 21:13:04 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fbe3487asm353555b3a.40.2024.05.23.21.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 21:13:03 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com,
	garyrookard@fastmail.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: rtl8192e: Fix spelling mistakes in rtllib_softmac.c
Date: Fri, 24 May 2024 09:57:35 +0545
Message-Id: <20240524041235.61184-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch corrects some misspellings to increase code readability and
searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
v3: 
 - Added the missing patch history on v2 patch
v2:
 - Updated the patch description as suggested by Phillips
 - https://lore.kernel.org/all/1aefa708-b1fe-4246-bb67-36f25919c766@gmail.com/
v1: https://lore.kernel.org/all/20240523035952.59724-1-topofeverest8848@gmail.com/

 drivers/staging/rtl8192e/rtllib_softmac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 97fdca828da7..0fc97c868f81 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -421,7 +421,7 @@ static void rtllib_softmac_scan_syncro(struct rtllib_device *ieee)
 		 *    So we switch to MAC80211_LINKED_SCANNING to remember
 		 *    that we are still logically linked (not interested in
 		 *    new network events, despite for updating the net list,
-		 *    but we are temporarly 'unlinked' as the driver shall
+		 *    but we are temporarily 'unlinked' as the driver shall
 		 *    not filter RX frames and the channel is changing.
 		 * So the only situation in which are interested is to check
 		 * if the state become LINKED because of the #1 situation
@@ -934,7 +934,7 @@ static void rtllib_associate_abort(struct rtllib_device *ieee)
 
 	ieee->associate_seq++;
 
-	/* don't scan, and avoid to have the RX path possibily
+	/* don't scan, and avoid to have the RX path possibly
 	 * try again to associate. Even do not react to AUTH or
 	 * ASSOC response. Just wait for the retry wq to be scheduled.
 	 * Here we will check if there are good nets to associate
@@ -1359,7 +1359,7 @@ static short rtllib_sta_ps_sleep(struct rtllib_device *ieee, u64 *time)
 		return 0;
 	timeout = ieee->current_network.beacon_interval;
 	ieee->current_network.dtim_data = RTLLIB_DTIM_INVALID;
-	/* there's no need to nofity AP that I find you buffered
+	/* there's no need to notify AP that I find you buffered
 	 * with broadcast packet
 	 */
 	if (dtim & (RTLLIB_DTIM_UCAST & ieee->ps))
@@ -1806,7 +1806,7 @@ void rtllib_softmac_xmit(struct rtllib_txb *txb, struct rtllib_device *ieee)
 
 	spin_lock_irqsave(&ieee->lock, flags);
 
-	/* called with 2nd parm 0, no tx mgmt lock required */
+	/* called with 2nd param 0, no tx mgmt lock required */
 	rtllib_sta_wakeup(ieee, 0);
 
 	/* update the tx status */
-- 
2.34.1

