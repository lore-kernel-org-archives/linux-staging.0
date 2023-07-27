Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC01A941
	for <linux-staging@lists.linux.dev>; Thu, 27 Jul 2023 06:18:45 +0000 (UTC)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 3B3A72B78B;
	Thu, 27 Jul 2023 02:18:45 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=anF2Q/E3YliC1TJLo8573SGmv
	SXnXLFplvRBwi1kuZQ=; b=IzNx7yNdHpmu9IGROV8LXsHjgAsPmnfsEaNb2JAm/
	4QvOpZ4UurqqsWVEM9uinT1MsdIHCrBSNYXcFDBmls9sKg1sIXOBO665t7kJFl1a
	ayIma5NezUHwrcjFGBjRzRkIpp0nHwfzuYO+JSRp568GqqwV4YBO1H9cmBibbq7r
	/o=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 33DE82B78A;
	Thu, 27 Jul 2023 02:18:45 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2019-09.pbsmtp; bh=OYbg2N402MZIOZTWV80ogeQ3GrQ1F3pvilpeh4bbDy8=; b=N2cegFqcjaPW3lWRE7RywAJ4LwCQithMlx3yolAdl85W/Yb+RP5ofESPmSDEwS7SIKUe8K9py86HGLZCj2dYfDRhn+wr8jikgAR415PfepGkia/yKWMhNl0PMR925TiKM3wAo75r0tF4FU+YHgmFhNyBuvUjRMGZAOXsh8WjM6A=
Received: from basil.darkphysics (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 60A852B785;
	Thu, 27 Jul 2023 02:18:40 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca,
	error27@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 2/5] Staging: rtl8192e: Rename function DeActivateBAEntry
Date: Wed, 26 Jul 2023 23:19:45 -0700
Message-ID: <20230727061948.579480-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727061948.579480-1-tdavies@darkphysics.net>
References: <20230727061948.579480-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 6E97C26C-2C45-11EE-B009-B31D44D1D7AA-45285927!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Rename function DeActivateBAEntry to deactivate_ba_entry in order to Fix
checkpatch warning: Avoid CamelCase

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Sent with git send-email
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/=
rtl8192e/rtl819x_BAProc.c
index 965ffa8b78c2..50362bbbc8dd 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -17,7 +17,7 @@ static void activate_ba_entry(struct ba_record *pBA, u1=
6 Time)
 		mod_timer(&pBA->timer, jiffies + msecs_to_jiffies(Time));
 }
=20
-static void DeActivateBAEntry(struct rtllib_device *ieee, struct ba_reco=
rd *pBA)
+static void deactivate_ba_entry(struct rtllib_device *ieee, struct ba_re=
cord *pBA)
 {
 	pBA->b_valid =3D false;
 	del_timer_sync(&pBA->timer);
@@ -30,12 +30,12 @@ static u8 TxTsDeleteBA(struct rtllib_device *ieee, st=
ruct tx_ts_record *pTxTs)
 	u8 bSendDELBA =3D false;
=20
 	if (pPendingBa->b_valid) {
-		DeActivateBAEntry(ieee, pPendingBa);
+		deactivate_ba_entry(ieee, pPendingBa);
 		bSendDELBA =3D true;
 	}
=20
 	if (pAdmittedBa->b_valid) {
-		DeActivateBAEntry(ieee, pAdmittedBa);
+		deactivate_ba_entry(ieee, pAdmittedBa);
 		bSendDELBA =3D true;
 	}
 	return bSendDELBA;
@@ -47,7 +47,7 @@ static u8 RxTsDeleteBA(struct rtllib_device *ieee, stru=
ct rx_ts_record *pRxTs)
 	u8			bSendDELBA =3D false;
=20
 	if (pBa->b_valid) {
-		DeActivateBAEntry(ieee, pBa);
+		deactivate_ba_entry(ieee, pBa);
 		bSendDELBA =3D true;
 	}
=20
@@ -270,7 +270,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, st=
ruct sk_buff *skb)
=20
 	rtllib_FlushRxTsPendingPkts(ieee, pTS);
=20
-	DeActivateBAEntry(ieee, pBA);
+	deactivate_ba_entry(ieee, pBA);
 	pBA->dialog_token =3D *pDialogToken;
 	pBA->ba_param_set =3D *pBaParamSet;
 	pBA->ba_timeout_value =3D *pBaTimeoutVal;
@@ -363,13 +363,13 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, =
struct sk_buff *skb)
 		netdev_dbg(ieee->dev,
 			   "%s(): Recv ADDBA Rsp. BA is admitted! Status code:%X\n",
 			   __func__, *pStatusCode);
-		DeActivateBAEntry(ieee, pPendingBA);
+		deactivate_ba_entry(ieee, pPendingBA);
 	}
=20
 	if (*pStatusCode =3D=3D ADDBA_STATUS_SUCCESS) {
 		if (pBaParamSet->field.ba_policy =3D=3D BA_POLICY_DELAYED) {
 			pTS->bAddBaReqDelayed =3D true;
-			DeActivateBAEntry(ieee, pAdmittedBA);
+			deactivate_ba_entry(ieee, pAdmittedBA);
 			ReasonCode =3D DELBA_REASON_END_BA;
 			goto OnADDBARsp_Reject;
 		}
@@ -378,7 +378,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, st=
ruct sk_buff *skb)
 		pAdmittedBA->ba_timeout_value =3D *pBaTimeoutVal;
 		pAdmittedBA->ba_start_seq_ctrl =3D pPendingBA->ba_start_seq_ctrl;
 		pAdmittedBA->ba_param_set =3D *pBaParamSet;
-		DeActivateBAEntry(ieee, pAdmittedBA);
+		deactivate_ba_entry(ieee, pAdmittedBA);
 		activate_ba_entry(pAdmittedBA, *pBaTimeoutVal);
 	} else {
 		pTS->bAddBaReqDelayed =3D true;
@@ -469,7 +469,7 @@ void TsInitAddBA(struct rtllib_device *ieee, struct t=
x_ts_record *pTS,
 	if (pBA->b_valid && !bOverwritePending)
 		return;
=20
-	DeActivateBAEntry(ieee, pBA);
+	deactivate_ba_entry(ieee, pBA);
=20
 	pBA->dialog_token++;
 	pBA->ba_param_set.field.amsdu_support =3D 0;
--=20
2.41.0

