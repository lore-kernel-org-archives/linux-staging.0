Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7638BE1
	for <linux-staging@lists.linux.dev>; Tue, 25 Jul 2023 06:36:56 +0000 (UTC)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id CF7241896C4;
	Tue, 25 Jul 2023 02:36:55 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:cc:subject:message-id:mime-version:content-type; s=sasl; bh=
	4ifpopfsPEbuguZHPOneJiNiH/D5ZRPZeKyy8QviyPA=; b=EF0osaC0Cl0qhYKD
	7FaWNNMuWjTU3iSIrEFnv4CPghfiMid2dHTIG3Uv4yRQpprEKbVW2Fswu/fiIMTB
	dDopSi5ER9HfPiQxDaVKja7Ol4dy0Tai6FRew6DqWtU/LcqvT+Q5TQUUtSb/5jzg
	yO8gj11GKpx/hnSb/moCbJnf9FU=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id C75A71896C3;
	Tue, 25 Jul 2023 02:36:55 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=2019-09.pbsmtp; bh=4ifpopfsPEbuguZHPOneJiNiH/D5ZRPZeKyy8QviyPA=;
 b=fx7UH30dcEa+7G9DdAqslpwervs0CBRYjGOqQAaqYTLp4QWdxB5m89CdOFeBJ7hB732UvUUaK1927iddlbt5RfizoNudExs5IW2+AUMA4hDoGH82GXuFnjpkGwmldZ44lqhyS/+Tqsl1npBRhPeR/Is70SDn2A7axow97Ae44VY=
Received: from basil (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 11BDC1896C2;
	Tue, 25 Jul 2023 02:36:53 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
Date: Mon, 24 Jul 2023 23:38:18 -0700
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	error27@gmail.com
Cc: tdavies@darkphysics.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] Staging: rtl8192e: Rename function ResetBaEntry
Message-ID: <ZL9t2idD6wqni7Pf@basil>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Pobox-Relay-ID:
 A557BF32-2AB5-11EE-A909-C65BE52EC81B-45285927!pb-smtp1.pobox.com

Rename function ResetBaEntry to reset_ba_entry in order to Fix checkpatch
warning: Avoid CamelCase

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 6 +++---
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 9662d75257ce..cb6450206763 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -54,7 +54,7 @@ static u8 rx_ts_delete_ba(struct rtllib_device *ieee, struct rx_ts_record *pRxTs
 	return bSendDELBA;
 }
 
-void ResetBaEntry(struct ba_record *pBA)
+void reset_ba_entry(struct ba_record *pBA)
 {
 	pBA->b_valid			  = false;
 	pBA->ba_param_set.short_data	  = 0;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index c61fdf73c572..21ffbb6b231f 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -117,8 +117,8 @@ static void ResetTxTsEntry(struct tx_ts_record *pTS)
 	pTS->bAddBaReqDelayed = false;
 	pTS->bUsingBa = false;
 	pTS->bDisable_AddBa = false;
-	ResetBaEntry(&pTS->TxAdmittedBARecord);
-	ResetBaEntry(&pTS->TxPendingBARecord);
+	reset_ba_entry(&pTS->TxAdmittedBARecord);
+	reset_ba_entry(&pTS->TxPendingBARecord);
 }
 
 static void ResetRxTsEntry(struct rx_ts_record *pTS)
@@ -126,7 +126,7 @@ static void ResetRxTsEntry(struct rx_ts_record *pTS)
 	ResetTsCommonInfo(&pTS->ts_common_info);
 	pTS->rx_indicate_seq = 0xffff;
 	pTS->rx_timeout_indicate_seq = 0xffff;
-	ResetBaEntry(&pTS->rx_admitted_ba_record);
+	reset_ba_entry(&pTS->rx_admitted_ba_record);
 }
 
 void TSInitialize(struct rtllib_device *ieee)
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index e3ce4431d460..ccc9e7bbbcbb 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -2016,7 +2016,7 @@ void TsInitDelBA(struct rtllib_device *ieee,
 void BaSetupTimeOut(struct timer_list *t);
 void TxBaInactTimeout(struct timer_list *t);
 void RxBaInactTimeout(struct timer_list *t);
-void ResetBaEntry(struct ba_record *pBA);
+void reset_ba_entry(struct ba_record *pBA);
 bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS, u8 *Addr,
 	   u8 TID, enum tr_select TxRxSelect, bool bAddNewTs);
 void TSInitialize(struct rtllib_device *ieee);
-- 
2.41.0

