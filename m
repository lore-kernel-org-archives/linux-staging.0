Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB5A17EE
	for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 06:48:52 +0000 (UTC)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id CC30E1A3DE9;
	Sun, 13 Aug 2023 02:48:51 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=BMC/7IaF/sjtsTG58vcmOhUis
	BsZGg5Sf4mHcj7JsNA=; b=qloEyjdNwRN7PA1HvEdxV8ZJbqKQKz0PRMG5yhHQr
	WzrUVrzvmfnySF/3mEHxQ7dVZFQ5vKQH0iEJ+4vxQDwmH1jRz9ae2EszRpkY2Tcf
	Sa2af+tegLcytJqd1MSpQMDzpQL8ijkfsqI+PBSBoRd7TaGqALihotFpYRegLKMF
	V8=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id C32C91A3DE8;
	Sun, 13 Aug 2023 02:48:51 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2019-09.pbsmtp; bh=YQtKiC9IL+ckvaRqHHraV72+xa+y/exxqYNagOVGscc=; b=m1U9KJhV9eHYH6APom/joc+yX7DORMY5+BuCpV2RWXKEw/h5wT4YufQ9jDcKPNtzm+7iJ/reiJWCfLUTdUInSnqT8vbTfrMNtZIk1aWCgg+Lhp0dzeNrUznkoyUjy4rona1e0eqLatHbbgO8phlpxjac8uQn2JQ4Zxkk2A9rlR0=
Received: from basil.darkphysics (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 35D721A3DE2;
	Sun, 13 Aug 2023 02:48:49 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 5/6] Staging: rtl8192e: Rename variable pRxTs in function rtllib_rx_ba_inact_timeout()
Date: Sat, 12 Aug 2023 23:50:34 -0700
Message-ID: <20230813065035.95157-6-tdavies@darkphysics.net>
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
 75F3E974-39A5-11EE-AC99-307A8E0A682E-45285927!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Rename varialbe pRxTs in function rtllib_rx_ba_inact_timeout() to rx_ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2:Resending in smaller patch series
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/=
rtl8192e/rtl819x_BAProc.c
index da2e53dea8e0..d3f1454ba5b0 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -532,13 +532,13 @@ void rtllib_tx_ba_inact_timeout(struct timer_list *=
t)
=20
 void rtllib_rx_ba_inact_timeout(struct timer_list *t)
 {
-	struct rx_ts_record *pRxTs =3D from_timer(pRxTs, t,
+	struct rx_ts_record *rx_ts =3D from_timer(rx_ts, t,
 					      rx_admitted_ba_record.timer);
-	struct rtllib_device *ieee =3D container_of(pRxTs, struct rtllib_device=
,
-				     RxTsRecord[pRxTs->num]);
+	struct rtllib_device *ieee =3D container_of(rx_ts, struct rtllib_device=
,
+				     RxTsRecord[rx_ts->num]);
=20
-	rx_ts_delete_ba(ieee, pRxTs);
-	rtllib_send_DELBA(ieee, pRxTs->ts_common_info.Addr,
-			  &pRxTs->rx_admitted_ba_record, RX_DIR,
+	rx_ts_delete_ba(ieee, rx_ts);
+	rtllib_send_DELBA(ieee, rx_ts->ts_common_info.Addr,
+			  &rx_ts->rx_admitted_ba_record, RX_DIR,
 			  DELBA_REASON_TIMEOUT);
 }
--=20
2.41.0

