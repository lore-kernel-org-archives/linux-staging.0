Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5022A5A10B
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162567; cv=none; b=e7BM3kISSvcSOC+V6hrwgUO7JRCwv4Fdg7rgy+PjqUv2nDUj6l4Lml8ZdQuYnv656ZPhw0weGfbV4QdsRDaJ0LXKCVsSJDwvak+fKFj+7ZGl0v9oIOmUUnU1V/87Oq/ygqE8r5MaUE8W1UVqMMzipMuBHnT8jyYC8MDFv0MEELE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162567; c=relaxed/simple;
	bh=zJhkNdPgm9Ule1PChKDhhPWqoRCFvb4zAD7FJ7GBYus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O5cVEO8gtoclM9V6cemNVv2fzjU3+QCb1WvqHQmyOtsdqzXATSP9640q01aycKE5ljAh/7GJqEo01Jilh2cRFMj1eejx/I9lGI9DLdQkZjPZRkMhb9wDCMOInbvQhbn1vAjmGE0dnNDUpTw41xvHe/sXEXs1/ivL50cVD/67P7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=UAYes3TU; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="UAYes3TU"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6f98178ceb3so1040490a34.0
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162564; x=1718767364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjAz9q75b4Ze8yKWVjcn/FNlgPRsBeKVRN/bGRj7ze4=;
        b=UAYes3TUobWYzryOH10U4yuXUeufBmTMK0wO4Y/NZVJTzLtO7gASq/zCAVqqvbQgL5
         N+x8bYhxlAo5ERtzB0sPykxjdmoy5UeHLh1YqTuwchQFZmUfHY2SwgDMqHMjBOLgl6rO
         IBK9+E3Q9xpVydaMMmvzaXfHAg7laeKBsilEYIgHZbtpsdv/MvnK0ByZr97dqFNRrZdU
         LMeybCzRo9N+K2HgGT4CFiIZXXuSgtF2gUEYY6sf7BK5WtIhuLo5EKrjuFNUdNJJIRsk
         yYl73bZl0g2i/jeu0MAb4y3+6wS+b2MbVWOkF0peVXTu6oFdewhHLICGdbadBFSnZRvB
         J88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162564; x=1718767364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjAz9q75b4Ze8yKWVjcn/FNlgPRsBeKVRN/bGRj7ze4=;
        b=fg2uHpheNoEuA+9LjQiSzIhBxYW5fduD7ne17M+DvyVaz3KESCnNnG0FhraX15OCtW
         hVM4w/svcs1syZFvteMUq096WGnyR2lfKq4dJBSWz7FjbFaL1CaoR/jIKrXVn2TYQXgC
         ektbckXTWjXrOfnHtKnwh5bYquVRtr7wdJsXDEzMXCkK3wQYGz8lrslUe8Zt6R06qwHK
         VwPNpuTpbv7U5lhkVXUfBb0bx2VKtmHAidsjB5D4Lx8X22OvxZY4EjxkoZfcH/pCyTYQ
         vrD7u/iYJ6iCphPsPMR/SRGxyXB/PMiHQmIYExpQ7yRri0hDk27JmhQIKIpXpGR6cV5v
         50OA==
X-Gm-Message-State: AOJu0YyilKxi/op3MnONW0dObJpXbtxq1y+EurM+Qg8cmHh5HgpQUzYa
	7J8i7G9NbuF7FNpqDriZmJNkt2MdWi8CbcHKK6B3ww75KLEgNBo3F8A+uhpIgRc=
X-Google-Smtp-Source: AGHT+IHXzsUbD3hiUa31hFAFrbYvZNr5A8pj4kxldfs2e7njUiR6drW5I4rub3AOvwcD+2ZqiMa4fQ==
X-Received: by 2002:a05:6830:14cc:b0:6f9:76e8:15c1 with SMTP id 46e09a7af769-6fa1bf7ed24mr569978a34.16.1718162564380;
        Tue, 11 Jun 2024 20:22:44 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:43 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 14/24] Staging: rtl8192e: Rename function TsStartAddBaProcess()
Date: Tue, 11 Jun 2024 20:22:20 -0700
Message-Id: <20240612032230.9738-15-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240612032230.9738-1-tdavies@darkphysics.net>
References: <20240612032230.9738-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable TsStartAddBaProcess to
rtllib_ts_start_add_ba_process to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Change
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 7cdeca7ed8c2..ed6a488bc7ac 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -431,7 +431,7 @@ void remove_all_ts(struct rtllib_device *ieee)
 	}
 }
 
-void TsStartAddBaProcess(struct rtllib_device *ieee, struct tx_ts_record *pTxTS)
+void rtllib_ts_start_add_ba_process(struct rtllib_device *ieee, struct tx_ts_record *pTxTS)
 {
 	if (pTxTS->add_ba_req_in_progress == false) {
 		pTxTS->add_ba_req_in_progress = true;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 54cf5ee628f0..a35079f6dc65 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1770,7 +1770,7 @@ void rtllib_reset_ba_entry(struct ba_record *ba);
 bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS, u8 *addr,
 	   u8 TID, enum tr_select tx_rx_select, bool bAddNewTs);
 void rtllib_ts_init(struct rtllib_device *ieee);
-void TsStartAddBaProcess(struct rtllib_device *ieee,
+void rtllib_ts_start_add_ba_process(struct rtllib_device *ieee,
 			 struct tx_ts_record *pTxTS);
 void remove_peer_ts(struct rtllib_device *ieee, u8 *addr);
 void remove_all_ts(struct rtllib_device *ieee);
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index d46963fe9bbc..6514d53c9679 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -301,7 +301,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 			} else if (tcb_desc->bdhcp == 1) {
 				;
 			} else if (!ts->disable_add_ba) {
-				TsStartAddBaProcess(ieee, ts);
+				rtllib_ts_start_add_ba_process(ieee, ts);
 			}
 			return;
 		} else if (!ts->using_ba) {
-- 
2.30.2

