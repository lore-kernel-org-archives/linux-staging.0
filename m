Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6211D2E9
	for <linux-staging@lists.linux.dev>; Wed, 12 Jul 2023 23:28:00 +0000 (UTC)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 481DA1A32BB;
	Wed, 12 Jul 2023 19:27:59 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:cc:subject:message-id:mime-version:content-type; s=sasl; bh=
	m6menqUncA4a2eg0m4MFOVZboBdtfZm1e6YBGnLHfFA=; b=wPXHzVDa8p8qyZoL
	xKUW2WXd5OK1vO2OJsZ/xOZ/ba/rDVi+JbSAdmjYPTfWbqOwmL5F6LN2ergXbJxH
	HdHgrQUMtWvAt4DHI84JC0+BzPvLwUMi6i3xdKw7MwDX4sJhDoag2WWKrypPNRKo
	pg1c+AKjW5KveZV2Lcf2q6qEIsc=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 4034B1A32BA;
	Wed, 12 Jul 2023 19:27:59 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=2019-09.pbsmtp; bh=m6menqUncA4a2eg0m4MFOVZboBdtfZm1e6YBGnLHfFA=;
 b=i7ACQJJHqnAlO4UUPIOn6uVwKthfqSUHk7SiuX82nqoBhPJvB1EOzKlKFnFVU/EXCxbVM4U+a86JBmSR7iN3XXQVGOrFAjzgjc03LTiXx9asL/57k7VIOwputk/xDjs3uMQQACpxXtAeyN5F7LTqWn5QpZpN57GDb+DWOIjS464=
Received: from basil (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 0820A1A32B9;
	Wed, 12 Jul 2023 19:27:57 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
Date: Wed, 12 Jul 2023 16:28:42 -0700
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	error27@gmail.com
Cc: tdavies@darkphysics.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/12] Staging: rtl8192e: Rename function TsInitAddBA
Message-ID: <ZK83Kswaq6jxyGcb@basil>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Pobox-Relay-ID:
 BC80BDC0-210B-11EE-B801-307A8E0A682E-45285927!pb-smtp2.pobox.com

Rename function TsInitAddBA to ts_init_add_ba
in order to Fix checkpatch warning: Avoid CamelCase

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 6538343ea44d..2e37f1e949ec 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -461,7 +461,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 	return 0;
 }
 
-void TsInitAddBA(struct rtllib_device *ieee, struct tx_ts_record *pTS,
+void ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *pTS,
 		 u8 Policy, u8	bOverwritePending)
 {
 	struct ba_record *pBA = &pTS->TxPendingBARecord;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index c61fdf73c572..7841d9ce1a7f 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -96,7 +96,7 @@ static void TsAddBaProcess(struct timer_list *t)
 	struct rtllib_device *ieee = container_of(pTxTs, struct rtllib_device,
 				     TxTsRecord[num]);
 
-	TsInitAddBA(ieee, pTxTs, BA_POLICY_IMMEDIATE, false);
+	ts_init_add_ba(ieee, pTxTs, BA_POLICY_IMMEDIATE, false);
 	netdev_dbg(ieee->dev, "%s(): ADDBA Req is started\n", __func__);
 }
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index e3ce4431d460..de0dd48d0646 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -2008,7 +2008,7 @@ u16  TxCountToDataRate(struct rtllib_device *ieee, u8 nDataRate);
 int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
-void TsInitAddBA(struct rtllib_device *ieee, struct tx_ts_record *pTS,
+void ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *pTS,
 		 u8 Policy, u8 bOverwritePending);
 void TsInitDelBA(struct rtllib_device *ieee,
 		 struct ts_common_info *pTsCommonInfo,
-- 
2.41.0

