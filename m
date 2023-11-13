Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A032376D
	for <linux-staging@lists.linux.dev>; Mon, 13 Nov 2023 19:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ZIMWZdOc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cc3c51f830so35786865ad.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Nov 2023 11:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1699905175; x=1700509975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AuVLb4fA3daVXSMcJTuwoKLmJRUAXractVm1EqtscQ=;
        b=ZIMWZdOctSNeQjps4lLgaWOb/GBS3IELa63rV08LJ+JkT++4hfcnoznfcxaMM+WtNo
         pFq4wtgJiwPbdKwCcSHeyMBC1D+E5XWNVxXzUZMERTNBh0+KmHwTHBQwQlEO/SsB04hH
         VKpfZX4HFZillGHEWieezzGNlzNP8+vox5A3GEyrM6sPrc5Qm4MlU5eJbYxGVFU/tUWf
         Mayh4NXTGHzgn9v8bq4quMO5cYX2aRPoqU3GyXi1xjK4KIyu102pwiMWyMcxDHnA97QU
         rUN3t86juZ90Au/D6zu7ClNNbI9HsLnAG6Qde9kvf2G8+2QvwAeglNn62MZ2opyqEjZI
         X+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905175; x=1700509975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AuVLb4fA3daVXSMcJTuwoKLmJRUAXractVm1EqtscQ=;
        b=piy0cTIEgNk3UeTmybu14wtY/iAmmcWhQ08SxgCSHTk4BwAEIPKxk59FuA5yYtRj19
         ZqOmpXu2zb+g/yMPKW6rR/hl1Ts6nmrZ+XInBTT93g1BY8EDAGCi+R0g/FJthIOsXci7
         RHwHdLNR/VaILFmG3BEs1rq2IAeyYdJFVoEo2xR0kAK0n+t/dYlrzxz6OXvwnZtXNX4S
         tTEeRSqV7XhVBGgifVPho1Wr/i5YKDm1PFhO5VogN5w+sCiRCBUcnqEQe123GLIJTNzl
         ctwAvJEGomDSfq0Qw5nmyBV+uo6ojdC5WSbhXK5vuMjJCuc29DhYZXbldNN477UvMw/Q
         yTFg==
X-Gm-Message-State: AOJu0YxvZk1dFBxyvbu7lP7SpVyepndAjuI9j3f6eZP8XQZWiubZM/+L
	KGY09S3O9bnnE5YnM0ZsQIF+Mg==
X-Google-Smtp-Source: AGHT+IEX2t6diMZLW5mAIvZMQeMy5O7jfoM9b9RwdqVVznjEancZ7bMrFmVO6bLFpvzVB+dS9sshrA==
X-Received: by 2002:a17:902:e744:b0:1cc:6e8f:c14d with SMTP id p4-20020a170902e74400b001cc6e8fc14dmr278510plf.50.1699905175120;
        Mon, 13 Nov 2023 11:52:55 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id t7-20020a170902bc4700b001c9d968563csm4395815plz.79.2023.11.13.11.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 11:52:54 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 6/7] Staging: rtl8192e: Rename variable bOverwritePending
Date: Mon, 13 Nov 2023 11:59:09 -0800
Message-ID: <20231113195910.8423-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113195910.8423-1-tdavies@darkphysics.net>
References: <20231113195910.8423-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bOverwritePending to overwrite_pending to fix
checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index cbf74cac0599..3502f27342e3 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -462,11 +462,11 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 }
 
 void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
-			   u8 policy, u8	bOverwritePending)
+			   u8 policy, u8	overwrite_pending)
 {
 	struct ba_record *ba = &ts->TxPendingBARecord;
 
-	if (ba->b_valid && !bOverwritePending)
+	if (ba->b_valid && !overwrite_pending)
 		return;
 
 	deactivate_ba_entry(ieee, ba);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index d2cf3cfaaaba..adaab56a9fb1 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1788,7 +1788,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
 void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
-			   u8 policy, u8 bOverwritePending);
+			   u8 policy, u8 overwrite_pending);
 void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
 			   struct ts_common_info *pTsCommonInfo,
 			   enum tr_select TxRxSelect);
-- 
2.39.2

