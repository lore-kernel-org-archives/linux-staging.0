Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70F3A941
	for <linux-staging@lists.linux.dev>; Thu, 27 Jul 2023 06:18:56 +0000 (UTC)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 7913F2B793;
	Thu, 27 Jul 2023 02:18:56 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=IU8A8PZ9W+A0JO3G16mxqG6cS
	ypU2mpJz2SkBXof0YY=; b=BKybc7cvhy9d1fH/5vPwJfBOO/LfdjeDQEH6M8Tgk
	pvvYAB1bhDEcWaGbI4x6GwVGgMOt+bMycsPl8Y+tr16LMlaa7t7/RIiUt8gVusE5
	1j830fa1to5oMjoZ9QDBpmT9RTnoO5hvPGLcl77/mHp+oi7e2mhmW6Xna7DkB/2A
	qg=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 72BC82B792;
	Thu, 27 Jul 2023 02:18:56 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2019-09.pbsmtp; bh=FwbRkTmD760tFABw6uBxFVmbVS/mye61TkAt1MYiwFo=; b=HB9FsdwUowv5zuoMVe5GUhlOn1ele4ZTBkiwcj6DZgxW7o3hXZ9KqJBPrPEjwRx/vAy6Wo031hTK7GSXDPDtc2waHaR06322nM5NqaTg81BkznKk4pkgYeGvITErD7uZQExcAZ23yBREpui7oed53nDcSQUWwgckwQrfN62R3q0=
Received: from basil.darkphysics (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 805F32B78F;
	Thu, 27 Jul 2023 02:18:51 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca,
	error27@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 5/5] Staging: rtl8192e: Rename function ResetBaEntry
Date: Wed, 26 Jul 2023 23:19:48 -0700
Message-ID: <20230727061948.579480-6-tdavies@darkphysics.net>
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
 753A2560-2C45-11EE-8C62-B31D44D1D7AA-45285927!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Rename function ResetBaEntry to reset_ba_entry in order to Fix checkpatch
warning: Avoid CamelCase

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Sent with git send-email
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 6 +++---
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/=
rtl8192e/rtl819x_BAProc.c
index 9662d75257ce..cb6450206763 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -54,7 +54,7 @@ static u8 rx_ts_delete_ba(struct rtllib_device *ieee, s=
truct rx_ts_record *pRxTs
 	return bSendDELBA;
 }
=20
-void ResetBaEntry(struct ba_record *pBA)
+void reset_ba_entry(struct ba_record *pBA)
 {
 	pBA->b_valid			  =3D false;
 	pBA->ba_param_set.short_data	  =3D 0;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/=
rtl8192e/rtl819x_TSProc.c
index c61fdf73c572..21ffbb6b231f 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -117,8 +117,8 @@ static void ResetTxTsEntry(struct tx_ts_record *pTS)
 	pTS->bAddBaReqDelayed =3D false;
 	pTS->bUsingBa =3D false;
 	pTS->bDisable_AddBa =3D false;
-	ResetBaEntry(&pTS->TxAdmittedBARecord);
-	ResetBaEntry(&pTS->TxPendingBARecord);
+	reset_ba_entry(&pTS->TxAdmittedBARecord);
+	reset_ba_entry(&pTS->TxPendingBARecord);
 }
=20
 static void ResetRxTsEntry(struct rx_ts_record *pTS)
@@ -126,7 +126,7 @@ static void ResetRxTsEntry(struct rx_ts_record *pTS)
 	ResetTsCommonInfo(&pTS->ts_common_info);
 	pTS->rx_indicate_seq =3D 0xffff;
 	pTS->rx_timeout_indicate_seq =3D 0xffff;
-	ResetBaEntry(&pTS->rx_admitted_ba_record);
+	reset_ba_entry(&pTS->rx_admitted_ba_record);
 }
=20
 void TSInitialize(struct rtllib_device *ieee)
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e=
/rtllib.h
index e3ce4431d460..ccc9e7bbbcbb 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -2016,7 +2016,7 @@ void TsInitDelBA(struct rtllib_device *ieee,
 void BaSetupTimeOut(struct timer_list *t);
 void TxBaInactTimeout(struct timer_list *t);
 void RxBaInactTimeout(struct timer_list *t);
-void ResetBaEntry(struct ba_record *pBA);
+void reset_ba_entry(struct ba_record *pBA);
 bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS, u8 =
*Addr,
 	   u8 TID, enum tr_select TxRxSelect, bool bAddNewTs);
 void TSInitialize(struct rtllib_device *ieee);
--=20
2.41.0

