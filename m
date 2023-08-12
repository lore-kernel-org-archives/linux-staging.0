Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272388BF7
	for <linux-staging@lists.linux.dev>; Sat, 12 Aug 2023 20:15:20 +0000 (UTC)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id D48891BE9A;
	Sat, 12 Aug 2023 16:15:19 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=L0ynV+/O/P8DNs7oaVJa22cif
	MQ2JHSMMJl7QFT+FOA=; b=Q/zf30500h7OgHg5+AhGbxGfv+iqoKobuUaeGIrL5
	NTM8tr1eDQ1/Q8wI5Mn7BxZYsv3v4C012YmUcfZPudSw2VValH7SG7pdiOUlfsXM
	jq7j2yXzpGcCl1xGQHbYBXhB3VKx+btgVTiqN9bszkZ2ClDxwpnx8T3p5jlcfn5i
	2Q=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id CD3781BE99;
	Sat, 12 Aug 2023 16:15:19 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2019-09.pbsmtp; bh=7fRIKL4dtBHmZrSNQprTlvPVhAs8lnxzdECjsTF2G0g=; b=cfWjmrTdaql0/ESoNzP9hbeCCpXccJVJPr1sGKv6N/gcLoAmkzGF/x+zLCD6xlXUcxEXrB1OCnELkE7s4vuKYfUfUJAe0WO8kV9m7FeE/YLeWzT5kOP6/rIbImLxq530TpFYWugtwIDUb3kTt+3MHVKLWrvpXL40GXl09sWHJVw=
Received: from basil.darkphysics (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 0D58A1BE95;
	Sat, 12 Aug 2023 16:15:15 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca,
	error27@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 06/16] Staging: rtl8192e: Rename variable pRxTs in function RxPktPendingTimeout()
Date: Sat, 12 Aug 2023 13:16:52 -0700
Message-ID: <20230812201702.83421-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230812201702.83421-1-tdavies@darkphysics.net>
References: <20230812201702.83421-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 F39BBCCA-394C-11EE-82C8-C2DA088D43B2-45285927!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Rename variable pRxTs in function RxPktPendingTimeout() to rx_ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 32 +++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/=
rtl8192e/rtl819x_TSProc.c
index 24a8b9fc0168..1c78134fc625 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -10,10 +10,10 @@
=20
 static void RxPktPendingTimeout(struct timer_list *t)
 {
-	struct rx_ts_record *pRxTs =3D from_timer(pRxTs, t,
+	struct rx_ts_record *rx_ts =3D from_timer(rx_ts, t,
 						     rx_pkt_pending_timer);
-	struct rtllib_device *ieee =3D container_of(pRxTs, struct rtllib_device=
,
-						  RxTsRecord[pRxTs->num]);
+	struct rtllib_device *ieee =3D container_of(rx_ts, struct rtllib_device=
,
+						  RxTsRecord[rx_ts->num]);
=20
 	struct rx_reorder_entry *pReorderEntry =3D NULL;
=20
@@ -22,24 +22,24 @@ static void RxPktPendingTimeout(struct timer_list *t)
 	bool bPktInBuf =3D false;
=20
 	spin_lock_irqsave(&(ieee->reorder_spinlock), flags);
-	if (pRxTs->rx_timeout_indicate_seq !=3D 0xffff) {
-		while (!list_empty(&pRxTs->rx_pending_pkt_list)) {
+	if (rx_ts->rx_timeout_indicate_seq !=3D 0xffff) {
+		while (!list_empty(&rx_ts->rx_pending_pkt_list)) {
 			pReorderEntry =3D (struct rx_reorder_entry *)
-					list_entry(pRxTs->rx_pending_pkt_list.prev,
+					list_entry(rx_ts->rx_pending_pkt_list.prev,
 					struct rx_reorder_entry, List);
 			if (index =3D=3D 0)
-				pRxTs->rx_indicate_seq =3D pReorderEntry->SeqNum;
+				rx_ts->rx_indicate_seq =3D pReorderEntry->SeqNum;
=20
 			if (SN_LESS(pReorderEntry->SeqNum,
-				    pRxTs->rx_indicate_seq) ||
+				    rx_ts->rx_indicate_seq) ||
 			    SN_EQUAL(pReorderEntry->SeqNum,
-				     pRxTs->rx_indicate_seq)) {
+				     rx_ts->rx_indicate_seq)) {
 				list_del_init(&pReorderEntry->List);
=20
 				if (SN_EQUAL(pReorderEntry->SeqNum,
-				    pRxTs->rx_indicate_seq))
-					pRxTs->rx_indicate_seq =3D
-					      (pRxTs->rx_indicate_seq + 1) % 4096;
+				    rx_ts->rx_indicate_seq))
+					rx_ts->rx_indicate_seq =3D
+					      (rx_ts->rx_indicate_seq + 1) % 4096;
=20
 				netdev_dbg(ieee->dev,
 					   "%s(): Indicate SeqNum: %d\n",
@@ -58,7 +58,7 @@ static void RxPktPendingTimeout(struct timer_list *t)
 	}
=20
 	if (index > 0) {
-		pRxTs->rx_timeout_indicate_seq =3D 0xffff;
+		rx_ts->rx_timeout_indicate_seq =3D 0xffff;
=20
 		if (index > REORDER_WIN_SIZE) {
 			netdev_warn(ieee->dev,
@@ -72,9 +72,9 @@ static void RxPktPendingTimeout(struct timer_list *t)
 		bPktInBuf =3D false;
 	}
=20
-	if (bPktInBuf && (pRxTs->rx_timeout_indicate_seq =3D=3D 0xffff)) {
-		pRxTs->rx_timeout_indicate_seq =3D pRxTs->rx_indicate_seq;
-		mod_timer(&pRxTs->rx_pkt_pending_timer,  jiffies +
+	if (bPktInBuf && (rx_ts->rx_timeout_indicate_seq =3D=3D 0xffff)) {
+		rx_ts->rx_timeout_indicate_seq =3D rx_ts->rx_indicate_seq;
+		mod_timer(&rx_ts->rx_pkt_pending_timer,  jiffies +
 			  msecs_to_jiffies(ieee->ht_info->rx_reorder_pending_time)
 			  );
 	}
--=20
2.41.0

