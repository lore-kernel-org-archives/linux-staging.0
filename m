Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322EC5241
	for <linux-staging@lists.linux.dev>; Fri, 28 Jul 2023 05:46:25 +0000 (UTC)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id C59211A8A18;
	Fri, 28 Jul 2023 01:46:24 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=vuC+4twD3q5HakwgwCCXlBp17
	7Y5dq6cOm17Ks5zucA=; b=MROTE7Qao+/nAHEubaCmQz4BWVckdD35PWYTyrj1N
	nis6RJKMDgGite8An9s7DVD58qQ5umvapkh2sAbMfBZ+TMvGukZcHN+P5lqnG+Xs
	1AqWqbyGfMzh4oVOWzl+d9sYlam9ceJs5zqW8/okAIKJJ9oOuJ70dPoVCLawjFhE
	bY=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id BEEAF1A8A17;
	Fri, 28 Jul 2023 01:46:24 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2019-09.pbsmtp; bh=kUiQhzWGu8tDVz0ciDkAb8X23tdlX5LrBDYAXPzU9oQ=; b=BvVvo8Uh+lZLTgMyuLILadE3m+Rs+KXEQIbG+dPGRG7ULLuQvuV6ouM93kZbqvnyJkPJ/6Uc+/+SfsYzh7yXk2P6jmkyOoaksxboiirk2AQAkjGdwcoNA4rKtKRtsuGHVrYjsKuOkpEqtmQGHJgZtEB8/Uj64CzOs38EAon8kYQ=
Received: from basil.darkphysics (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 62C931A8A12;
	Fri, 28 Jul 2023 01:46:22 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca,
	error27@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v3 3/5] Staging: rtl8192e: Rename function TxTsDeleteBA
Date: Thu, 27 Jul 2023 22:47:40 -0700
Message-ID: <20230728054742.622297-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728054742.622297-1-tdavies@darkphysics.net>
References: <20230728054742.622297-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 162A1FD8-2D0A-11EE-9DC1-C65BE52EC81B-45285927!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Rename function TxTsDeleteBA to tx_ts_delete_ba in order to Fix checkpatc=
h
warning: Avoid CamelCase

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v3: Changed patch #5, Rename global function ResetBaEntry to rtllib_reset=
_ba_entry
v2: Sent to mailing list via git send-email, patches are the same.       =
 =20
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/=
rtl8192e/rtl819x_BAProc.c
index 50362bbbc8dd..6538343ea44d 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -23,7 +23,7 @@ static void deactivate_ba_entry(struct rtllib_device *i=
eee, struct ba_record *pB
 	del_timer_sync(&pBA->timer);
 }
=20
-static u8 TxTsDeleteBA(struct rtllib_device *ieee, struct tx_ts_record *=
pTxTs)
+static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_recor=
d *pTxTs)
 {
 	struct ba_record *pAdmittedBa =3D &pTxTs->TxAdmittedBARecord;
 	struct ba_record *pPendingBa =3D &pTxTs->TxPendingBARecord;
@@ -456,7 +456,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struc=
t sk_buff *skb)
 		pTxTs->bAddBaReqInProgress =3D false;
 		pTxTs->bAddBaReqDelayed =3D false;
 		del_timer_sync(&pTxTs->TsAddBaTimer);
-		TxTsDeleteBA(ieee, pTxTs);
+		tx_ts_delete_ba(ieee, pTxTs);
 	}
 	return 0;
 }
@@ -492,7 +492,7 @@ void TsInitDelBA(struct rtllib_device *ieee,
 		struct tx_ts_record *pTxTs =3D
 			 (struct tx_ts_record *)pTsCommonInfo;
=20
-		if (TxTsDeleteBA(ieee, pTxTs))
+		if (tx_ts_delete_ba(ieee, pTxTs))
 			rtllib_send_DELBA(ieee, pTsCommonInfo->Addr,
 					  (pTxTs->TxAdmittedBARecord.b_valid) ?
 					 (&pTxTs->TxAdmittedBARecord) :
@@ -524,7 +524,7 @@ void TxBaInactTimeout(struct timer_list *t)
 					      TxAdmittedBARecord.timer);
 	struct rtllib_device *ieee =3D container_of(pTxTs, struct rtllib_device=
,
 				     TxTsRecord[pTxTs->num]);
-	TxTsDeleteBA(ieee, pTxTs);
+	tx_ts_delete_ba(ieee, pTxTs);
 	rtllib_send_DELBA(ieee, pTxTs->TsCommonInfo.Addr,
 			  &pTxTs->TxAdmittedBARecord, TX_DIR,
 			  DELBA_REASON_TIMEOUT);
--=20
2.41.0

