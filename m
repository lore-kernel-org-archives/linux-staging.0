Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265F48BE1
	for <linux-staging@lists.linux.dev>; Tue, 25 Jul 2023 06:38:17 +0000 (UTC)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id DCF9D1896BD;
	Tue, 25 Jul 2023 02:36:29 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:cc:subject:message-id:mime-version:content-type; s=sasl; bh=
	JTAmyjtLppvdqM2joKEvgN8jNCYYgnmj0cj7wDrhWiY=; b=mSRqWWO5lus57JnD
	xeBgeadwBD463rS1tnr7lXKF5Mlw1CCAMXk7g9IPoSpNOHI383qr02o3fPqc6Hd5
	4DUM5VT62cBOfQYs1GMVDHmjAL/o1IigjxYy2WjiYEIguFRXRlIDfU83hDewHUMc
	DBSLiUdajwUvm0WwEpjzn20BsSw=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id D62C91896BB;
	Tue, 25 Jul 2023 02:36:29 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=2019-09.pbsmtp; bh=JTAmyjtLppvdqM2joKEvgN8jNCYYgnmj0cj7wDrhWiY=;
 b=BdHPNx8Zm7E1e2das2QcU9iKvPd5sWPM2+hqQ5Y1k05Y2dC8aUn++ZhsUIvbBLb84QEaTYOAGKMw4cqPe5PnpT4x4xOcvFP5TBHMLQoK4/60OdDg1l4wGhcPxUV5CW3Fz3TCH6hEXOlsZcXVJWlsLiBJ1VB2aFZCDFNxf6OgNEk=
Received: from basil (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 9FD781896B9;
	Tue, 25 Jul 2023 02:36:28 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
Date: Mon, 24 Jul 2023 23:37:52 -0700
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	error27@gmail.com
Cc: tdavies@darkphysics.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] Staging: rtl8192e: Rename function TxTsDeleteBA
Message-ID: <ZL9twJYtcOTzejCo@basil>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Pobox-Relay-ID:
 9632860E-2AB5-11EE-BBFB-C65BE52EC81B-45285927!pb-smtp1.pobox.com

Rename function TxTsDeleteBA to tx_ts_delete_ba in order to Fix checkpatch
warning: Avoid CamelCase

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 50362bbbc8dd..6538343ea44d 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -23,7 +23,7 @@ static void deactivate_ba_entry(struct rtllib_device *ieee, struct ba_record *pB
 	del_timer_sync(&pBA->timer);
 }
 
-static u8 TxTsDeleteBA(struct rtllib_device *ieee, struct tx_ts_record *pTxTs)
+static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_record *pTxTs)
 {
 	struct ba_record *pAdmittedBa = &pTxTs->TxAdmittedBARecord;
 	struct ba_record *pPendingBa = &pTxTs->TxPendingBARecord;
@@ -456,7 +456,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 		pTxTs->bAddBaReqInProgress = false;
 		pTxTs->bAddBaReqDelayed = false;
 		del_timer_sync(&pTxTs->TsAddBaTimer);
-		TxTsDeleteBA(ieee, pTxTs);
+		tx_ts_delete_ba(ieee, pTxTs);
 	}
 	return 0;
 }
@@ -492,7 +492,7 @@ void TsInitDelBA(struct rtllib_device *ieee,
 		struct tx_ts_record *pTxTs =
 			 (struct tx_ts_record *)pTsCommonInfo;
 
-		if (TxTsDeleteBA(ieee, pTxTs))
+		if (tx_ts_delete_ba(ieee, pTxTs))
 			rtllib_send_DELBA(ieee, pTsCommonInfo->Addr,
 					  (pTxTs->TxAdmittedBARecord.b_valid) ?
 					 (&pTxTs->TxAdmittedBARecord) :
@@ -524,7 +524,7 @@ void TxBaInactTimeout(struct timer_list *t)
 					      TxAdmittedBARecord.timer);
 	struct rtllib_device *ieee = container_of(pTxTs, struct rtllib_device,
 				     TxTsRecord[pTxTs->num]);
-	TxTsDeleteBA(ieee, pTxTs);
+	tx_ts_delete_ba(ieee, pTxTs);
 	rtllib_send_DELBA(ieee, pTxTs->TsCommonInfo.Addr,
 			  &pTxTs->TxAdmittedBARecord, TX_DIR,
 			  DELBA_REASON_TIMEOUT);
-- 
2.41.0

