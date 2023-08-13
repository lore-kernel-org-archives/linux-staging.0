Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B243C1CCDE
	for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 06:48:48 +0000 (UTC)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 3B8511A3DE0;
	Sun, 13 Aug 2023 02:48:47 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=zBOXxFlXhrf1RjPzF6+rmLd0Z
	MWFJ6+65TqlcGLISxU=; b=waL98kLdHD4orieR4iZLLjI7lIY14sEMQ4GlDUpAk
	jM5vDrtifKmh+TdiuZcxzTnKaujaJ4WlrLf9HFGouZ8XO5dorhoFEJzflQ0E3cHl
	WUcB03IH5DqGFoBxbA7EcTR3k9ToUDj9oPq5/m610ERXH6TmZxKRLwIX2ghMzpH8
	68=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 320C81A3DDF;
	Sun, 13 Aug 2023 02:48:47 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2019-09.pbsmtp; bh=JVaCb9tmu+WW/Fg7eZ3B/4jnnfkvF5WISQEbg+cV2B8=; b=opywYggZRdn+j8l+qc9+dKCAJFqCvZI8YXNsIzikDvz/69kIbJUt1MIPXslw8WyMoI5IdguL9QggQ1qOMa0VJ3J1ZSSKVdT3A3F6jZ8mltlb6Ay6vWN8oiOwrjcbBFHGwjtRZ6trXFJC++OAWiEztWIOUwAbbjYv78axXXekTf4=
Received: from basil.darkphysics (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 4C8461A3DDA;
	Sun, 13 Aug 2023 02:48:44 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 3/6] Staging: rtl8192e: Rename variable pRxTs in function rtllib_rx_DELBA()
Date: Sat, 12 Aug 2023 23:50:32 -0700
Message-ID: <20230813065035.95157-4-tdavies@darkphysics.net>
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
 7341B2B0-39A5-11EE-ABA0-307A8E0A682E-45285927!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Rename variable pRxTs in function rtllib_rx_DELBA() to rx_ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2:Resending in smaller patch series
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/=
rtl8192e/rtl819x_BAProc.c
index 2748ab59545c..39a5da44b8eb 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -430,9 +430,9 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struc=
t sk_buff *skb)
 	pDelBaParamSet =3D (union delba_param_set *)&delba->payload[2];
=20
 	if (pDelBaParamSet->field.initiator =3D=3D 1) {
-		struct rx_ts_record *pRxTs;
+		struct rx_ts_record *rx_ts;
=20
-		if (!GetTs(ieee, (struct ts_common_info **)&pRxTs, dst,
+		if (!GetTs(ieee, (struct ts_common_info **)&rx_ts, dst,
 			   (u8)pDelBaParamSet->field.tid, RX_DIR, false)) {
 			netdev_warn(ieee->dev,
 				    "%s(): can't get TS for RXTS. dst:%pM TID:%d\n",
@@ -441,7 +441,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struc=
t sk_buff *skb)
 			return -1;
 		}
=20
-		rx_ts_delete_ba(ieee, pRxTs);
+		rx_ts_delete_ba(ieee, rx_ts);
 	} else {
 		struct tx_ts_record *pTxTs;
=20
--=20
2.41.0

