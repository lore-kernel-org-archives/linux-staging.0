Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33212377B
	for <linux-staging@lists.linux.dev>; Mon, 13 Nov 2023 19:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="L1HrCzZN"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6c4ed8eef16so3207514b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Nov 2023 11:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1699905174; x=1700509974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3ZFbRf5QF8emwC/w3WYuA83Bws9qICliBA0TogsMdo=;
        b=L1HrCzZNtvqaYhZ3Da86Z+XfGBCq0HXcaodC0TiadZCZ1i2Zi9jOQW/Dn1pSA8VAK7
         L/KD2qowpEccN3ZYmLXRwEoO7onTlx6N3vSZzP/alHOGcfYOscYbO8YMfbZMpoIPEqsh
         19GASLEeOKiWwUqyWdeGnmgGSuqU91eUoy7VU7ZMS7VDQ+Nhtp77PIgcI7i/FTs5fiGY
         Yxq4xX7/sGwsGoSK0fWUENWWbx/Cn5tYvJk7nj0GP4EbSXAws63j0SwDPoMO+kq0cirn
         etFPxjvr1RLgXZVsMGZ3dYeTO+PTBJlUSxp04QLYNwtmMX1LirNpqwDCcIR9PojGN6zk
         t4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905174; x=1700509974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3ZFbRf5QF8emwC/w3WYuA83Bws9qICliBA0TogsMdo=;
        b=Oj0nxpnxpSC3xn0UmL+R+/NT6xNc2YFU0xqCeQzxycxSoLUe9K07JEWVzwTQfzaPnS
         Qu8WnMgBa2vhRaqQI2O5tMYt0cjJ32N8O2K7PIDl2hEMSsEx8VTujwg1dKV7vqop9qn+
         UmT+F5uWaOb8iCF9AvJ7aJBgqlDstQZaIWG7nomQram1goN2u3rRccMbs4zGvsOgeUE/
         bLopo66tUWFIXOkQwy9234pYh/15tlVNXzqk2dkktccoB1B4zL73dsMXQuyNuJ1KlHeu
         JmZBDSml10IBE0eR7/so0U4y0+Ars2foK8wBj06ROPDnCq1+FnwENnDRtcDD9/eULz4E
         VLow==
X-Gm-Message-State: AOJu0YwjC64fPQq9aEE1nCpvEj/hvfzkBkbK8PY0x6lzjMLP9ulWz6/x
	FG6VoGBVqMXwyjbTrdqAFXjn6Q==
X-Google-Smtp-Source: AGHT+IEtWbSm/kFvgs2GDyN6Y4UoiO3YT99eZWrDpnzlkY9UbFzF0XU7r+hqJe3A6AfSDkL2UQDGcA==
X-Received: by 2002:a05:6a20:8e26:b0:17b:9d92:7d0 with SMTP id y38-20020a056a208e2600b0017b9d9207d0mr9292514pzj.52.1699905173900;
        Mon, 13 Nov 2023 11:52:53 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id t7-20020a170902bc4700b001c9d968563csm4395815plz.79.2023.11.13.11.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 11:52:53 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 5/7] Staging: rtl8192e: Rename variable bUsingBa
Date: Mon, 13 Nov 2023 11:59:08 -0800
Message-ID: <20231113195910.8423-6-tdavies@darkphysics.net>
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

Rename variable bUsingBa to using_ba to fix
checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
 drivers/staging/rtl8192e/rtl819x_TS.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c      | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 631c857c508f..cbf74cac0599 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -452,7 +452,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 			return -1;
 		}
 
-		pTxTs->bUsingBa = false;
+		pTxTs->using_ba = false;
 		pTxTs->add_ba_req_in_progress = false;
 		pTxTs->add_ba_req_delayed = false;
 		del_timer_sync(&pTxTs->TsAddBaTimer);
diff --git a/drivers/staging/rtl8192e/rtl819x_TS.h b/drivers/staging/rtl8192e/rtl819x_TS.h
index 0bf73b625708..289314de1193 100644
--- a/drivers/staging/rtl8192e/rtl819x_TS.h
+++ b/drivers/staging/rtl8192e/rtl819x_TS.h
@@ -29,7 +29,7 @@ struct tx_ts_record {
 	struct ba_record TxAdmittedBARecord;
 	u8				add_ba_req_in_progress;
 	u8				add_ba_req_delayed;
-	u8				bUsingBa;
+	u8				using_ba;
 	u8				bDisable_AddBa;
 	struct timer_list		TsAddBaTimer;
 	u8				num;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 3a1bb512ca69..867889dc4fb6 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -103,7 +103,7 @@ static void ResetTxTsEntry(struct tx_ts_record *ts)
 	ts->TxCurSeq = 0;
 	ts->add_ba_req_in_progress = false;
 	ts->add_ba_req_delayed = false;
-	ts->bUsingBa = false;
+	ts->using_ba = false;
 	ts->bDisable_AddBa = false;
 	rtllib_reset_ba_entry(&ts->TxAdmittedBARecord);
 	rtllib_reset_ba_entry(&ts->TxPendingBARecord);
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index a99c3b3f867c..cee3b8855c0e 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -304,10 +304,10 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 				TsStartAddBaProcess(ieee, pTxTs);
 			}
 			goto FORCED_AGG_SETTING;
-		} else if (!pTxTs->bUsingBa) {
+		} else if (!pTxTs->using_ba) {
 			if (SN_LESS(pTxTs->TxAdmittedBARecord.ba_start_seq_ctrl.field.seq_num,
 				    (pTxTs->TxCurSeq + 1) % 4096))
-				pTxTs->bUsingBa = true;
+				pTxTs->using_ba = true;
 			else
 				goto FORCED_AGG_SETTING;
 		}
-- 
2.39.2

