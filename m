Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED0C1369
	for <linux-staging@lists.linux.dev>; Mon,  7 Aug 2023 05:48:16 +0000 (UTC)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 2C78E1A0BDD;
	Mon,  7 Aug 2023 01:45:54 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=UZbkO1SU4qK1pWNPMd9kB5tXF
	apRGywmOww4Osqu2oE=; b=uWyzkXg+nVVyVSowRbAnX2oFtvXhQMgCNyseakM/G
	gPD3LvdwaFnOKyYY8H0bwFAOOL4g6uQeGtt4dcmXxh71wiIKZaQJhIwYYve0ft1r
	jCIcDgRng2HD7/ORf/4ERd4LkOW4mJjfZGg6Z8/sbItzTQ4ZddF0wyEgmSdI1lyD
	iQ=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 2141B1A0BDA;
	Mon,  7 Aug 2023 01:45:54 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2019-09.pbsmtp; bh=Y5vB0QwQ4fhrd6EOGcRc1kIxKkCS3zdjGWu89cF5rkc=; b=vBjwvw9bGweC2prD4vn7fD9TZry/VbTwoYhWsCKZz32FsvuHTm4Z+v66fIEXTdXegi1cYHBVHlYT0w/eQ93BZh06eMxgjcg7EaNhDBmmdqDlUdefmtKiy9F3dqiXXFte4k2X1H8dJiSxe6SluciHSsV/aGkAlolUUju3NwZDgUo=
Received: from basil.darkphysics (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 8B3BD1A0BD7;
	Mon,  7 Aug 2023 01:45:51 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca,
	error27@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 2/5] Staging: rtl8192e: Rename function TsInitDelBA
Date: Sun,  6 Aug 2023 22:47:29 -0700
Message-ID: <20230807054732.1864827-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807054732.1864827-1-tdavies@darkphysics.net>
References: <20230807054732.1864827-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 ABE88900-34E5-11EE-A236-C65BE52EC81B-45285927!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Rename function TsInitDelBA to rtllib_ts_init_del_ba in order to Fix
checkpatch warning: Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/=
rtl8192e/rtl819x_BAProc.c
index 9605d21bbf40..19c845ec863c 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -484,9 +484,9 @@ void rtllib_ts_init_add_ba(struct rtllib_device *ieee=
, struct tx_ts_record *pTS,
 	rtllib_send_ADDBAReq(ieee, pTS->TsCommonInfo.Addr, pBA);
 }
=20
-void TsInitDelBA(struct rtllib_device *ieee,
-		 struct ts_common_info *pTsCommonInfo,
-		 enum tr_select TxRxSelect)
+void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
+			   struct ts_common_info *pTsCommonInfo,
+			   enum tr_select TxRxSelect)
 {
 	if (TxRxSelect =3D=3D TX_DIR) {
 		struct tx_ts_record *pTxTs =3D
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/=
rtl8192e/rtl819x_TSProc.c
index a36f175ba230..759778787afa 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -361,7 +361,7 @@ bool GetTs(struct rtllib_device *ieee, struct ts_comm=
on_info **ppTS,
 static void RemoveTsEntry(struct rtllib_device *ieee,
 			  struct ts_common_info *pTs, enum tr_select TxRxSelect)
 {
-	TsInitDelBA(ieee, pTs, TxRxSelect);
+	rtllib_ts_init_del_ba(ieee, pTs, TxRxSelect);
=20
 	if (TxRxSelect =3D=3D RX_DIR) {
 		struct rx_reorder_entry *pRxReorderEntry;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e=
/rtllib.h
index c38dc5ae0b72..a4238db2fd56 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -2004,9 +2004,9 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, =
struct sk_buff *skb);
 int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
 void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_reco=
rd *pTS,
 			   u8 Policy, u8 bOverwritePending);
-void TsInitDelBA(struct rtllib_device *ieee,
-		 struct ts_common_info *pTsCommonInfo,
-		 enum tr_select TxRxSelect);
+void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
+			   struct ts_common_info *pTsCommonInfo,
+			   enum tr_select TxRxSelect);
 void BaSetupTimeOut(struct timer_list *t);
 void TxBaInactTimeout(struct timer_list *t);
 void RxBaInactTimeout(struct timer_list *t);
--=20
2.41.0

