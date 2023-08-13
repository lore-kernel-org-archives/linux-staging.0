Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BDA17EE
	for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 06:48:50 +0000 (UTC)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 48F671A3DE4;
	Sun, 13 Aug 2023 02:48:49 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=eO/NOpIAtsuXdLOfyuhKn+JVw
	HizoSxfuLXc+Rpr+gQ=; b=Ewh8aaOVC+jyTA4oyngGCHr93m6nD8g2E5qFmz+xv
	YZBCaSV1P2HJuIlqbfTDqsHO28hhjTqm/UyG7XRtbpjS2aCcJIHiC8mQYD5UHQL8
	bbpR7OfHFrywCI68p0qMEtHasi24gTwjcWnexYZFvKM613JexS38p1A6l5OPRb8a
	uc=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 405C21A3DE3;
	Sun, 13 Aug 2023 02:48:49 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2019-09.pbsmtp; bh=zvHdIDtwCi7U1BtS4goJCQxphQHyORE9FWpNPBUkOeg=; b=sfugEIkBLLSeEWy/r2vauoh1yQPuEOVqaG824IQxTVr6Z+g/kGEKRGJ2Fo//fhx5sqPMFayh48V8C+oTujKTStwuZdXiYuk5QshF21xzYpRa6ivsReLRatyx0wZYF5Ad65ZE4SddCWWp7nfGI5X56VwKQiS5atw6W8Aev/EwIII=
Received: from basil.darkphysics (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 27E701A3DDE;
	Sun, 13 Aug 2023 02:48:47 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 4/6] Staging: rtl8192e: Rename variable pRxTs in function rtllib_ts_init_del_ba()
Date: Sat, 12 Aug 2023 23:50:33 -0700
Message-ID: <20230813065035.95157-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230813065035.95157-1-tdavies@darkphysics.net>
References: <20230813065035.95157-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 74BADC02-39A5-11EE-AFCA-307A8E0A682E-45285927!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Rename variable pRxTs in function rtllib_ts_init_del_ba() to rx_ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2:Resending in smaller patch series
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/=
rtl8192e/rtl819x_BAProc.c
index 39a5da44b8eb..da2e53dea8e0 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -499,11 +499,11 @@ void rtllib_ts_init_del_ba(struct rtllib_device *ie=
ee,
 					(&pTxTs->TxPendingBARecord),
 					 TxRxSelect, DELBA_REASON_END_BA);
 	} else if (TxRxSelect =3D=3D RX_DIR) {
-		struct rx_ts_record *pRxTs =3D
+		struct rx_ts_record *rx_ts =3D
 				 (struct rx_ts_record *)pTsCommonInfo;
-		if (rx_ts_delete_ba(ieee, pRxTs))
+		if (rx_ts_delete_ba(ieee, rx_ts))
 			rtllib_send_DELBA(ieee, pTsCommonInfo->Addr,
-					  &pRxTs->rx_admitted_ba_record,
+					  &rx_ts->rx_admitted_ba_record,
 					  TxRxSelect, DELBA_REASON_END_BA);
 	}
 }
--=20
2.41.0

