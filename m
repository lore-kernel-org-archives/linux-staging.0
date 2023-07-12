Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB211D2F6
	for <linux-staging@lists.linux.dev>; Wed, 12 Jul 2023 23:26:47 +0000 (UTC)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 80B26360BA;
	Wed, 12 Jul 2023 19:26:41 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:cc:subject:message-id:mime-version:content-type; s=sasl; bh=
	tRo1T0O8Jm/q/6nDZsghbfTn0IEKHnogc2dvBlJANZg=; b=LarbNlUap4TJpaB3
	0dj/bfrdwgKF2bzcBsY+OJh9hAkp1kGOA9a8z0l6ltbac90ktQtiNIq3V3ysu3Mp
	GWTgPSPlu+D6WYdLKESfeprnNYd3gY9MZ18npUHitZE1u/Q66GglTeYKC3W9KMEv
	NApxlet+FnCQY5f2xfgSgjjYFBM=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 7845A360B9;
	Wed, 12 Jul 2023 19:26:41 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=2019-09.pbsmtp; bh=tRo1T0O8Jm/q/6nDZsghbfTn0IEKHnogc2dvBlJANZg=;
 b=Arf9u0F8ZEdUqj9p3Jy28zlxHYZcVVV68tzoQOGwIvdePy/Tm1WIZqsUKDcbcQQNk9XcHBe9YqAeoi2wHHg3zMw5SegeZQB355WLOwqrwE+N6Qzjrm9GpdMk4B32HKW4ZioJuLOb33rBsVHcxrqW7la1YPFKPcmN7yjTtcaSjvY=
Received: from basil (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id AEC8E360B8;
	Wed, 12 Jul 2023 19:26:37 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
Date: Wed, 12 Jul 2023 16:27:26 -0700
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	error27@gmail.com
Cc: tdavies@darkphysics.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] Staging: rtl8192e: Rename function TxTsDeleteBA
Message-ID: <ZK823p82cj1D0xDq@basil>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Pobox-Relay-ID:
 8C5A61C8-210B-11EE-B070-B31D44D1D7AA-45285927!pb-smtp21.pobox.com

Rename function TxTsDeleteBA to tx_ts_delete_ba
in order to Fix checkpatch warning: Avoid CamelCase

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

