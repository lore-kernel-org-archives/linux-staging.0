Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch [185.70.41.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1051970
	for <linux-staging@lists.linux.dev>; Wed, 16 Jun 2021 21:26:33 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4G4yt91DxMz4xLbP
	for <linux-staging@lists.linux.dev>; Wed, 16 Jun 2021 21:26:25 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="asPDH5pF"
Date: Wed, 16 Jun 2021 21:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1623878769;
	bh=/1nRiRUX9axadqDnig3IJyEGOizd/7oBJbG9RUFxBfE=;
	h=Date:To:From:Cc:Reply-To:Subject:From;
	b=asPDH5pF0zcGtWP3tfIQDKCKQ/T96uBt/xYxkbdpYlBaiuzZgUtj4qZynsaFAf1D6
	 5rljawhcKHEQR6m5LHke7cAazHgfnRiz0BdkmGl4ArKjAWDvYQ+7b9k5bk7uTXaJOf
	 9uIoM6v68jsTKYxzkguZQrDEyusgfDnNhqRiznWY=
To: gregkh@linuxfoundation.org
From: "Caleb D.S. Brzezinski" <calebdsb@protonmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, "Caleb D.S. Brzezinski" <calebdsb@protonmail.com>
Reply-To: "Caleb D.S. Brzezinski" <calebdsb@protonmail.com>
Subject: [PATCH] staging: ks7010: Wrap macro definitions in parenthesis
Message-ID: <20210616212552.117604-1-calebdsb@protonmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

Wrap the definition of TX_RATE_* constants in parenthesis to prevent
incorrect casting during expansion, as recommended by checkpatch.pl.

Signed-off-by: Caleb D.S. Brzezinski <calebdsb@protonmail.com>
---
 drivers/staging/ks7010/ks_hostif.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/ks7010/ks_hostif.h b/drivers/staging/ks7010/ks=
_hostif.h
index 39138191a..c62a494ed 100644
--- a/drivers/staging/ks7010/ks_hostif.h
+++ b/drivers/staging/ks7010/ks_hostif.h
@@ -498,20 +498,20 @@ struct hostif_mic_failure_request {
 #define TX_RATE_FIXED=09=095
=20
 /* 11b rate */
-#define TX_RATE_1M=09(u8)(10 / 5)=09/* 11b 11g basic rate */
-#define TX_RATE_2M=09(u8)(20 / 5)=09/* 11b 11g basic rate */
-#define TX_RATE_5M=09(u8)(55 / 5)=09/* 11g basic rate */
-#define TX_RATE_11M=09(u8)(110 / 5)=09/* 11g basic rate */
+#define TX_RATE_1M=09((u8)(10 / 5))=09/* 11b 11g basic rate */
+#define TX_RATE_2M=09((u8)(20 / 5))=09/* 11b 11g basic rate */
+#define TX_RATE_5M=09((u8)(55 / 5))=09/* 11g basic rate */
+#define TX_RATE_11M=09((u8)(110 / 5))=09/* 11g basic rate */
=20
 /* 11g rate */
-#define TX_RATE_6M=09(u8)(60 / 5)=09/* 11g basic rate */
-#define TX_RATE_12M=09(u8)(120 / 5)=09/* 11g basic rate */
-#define TX_RATE_24M=09(u8)(240 / 5)=09/* 11g basic rate */
-#define TX_RATE_9M=09(u8)(90 / 5)
-#define TX_RATE_18M=09(u8)(180 / 5)
-#define TX_RATE_36M=09(u8)(360 / 5)
-#define TX_RATE_48M=09(u8)(480 / 5)
-#define TX_RATE_54M=09(u8)(540 / 5)
+#define TX_RATE_6M=09((u8)(60 / 5))=09/* 11g basic rate */
+#define TX_RATE_12M=09((u8)(120 / 5))=09/* 11g basic rate */
+#define TX_RATE_24M=09((u8)(240 / 5))=09/* 11g basic rate */
+#define TX_RATE_9M=09((u8)(90 / 5))
+#define TX_RATE_18M=09((u8)(180 / 5))
+#define TX_RATE_36M=09((u8)(360 / 5))
+#define TX_RATE_48M=09((u8)(480 / 5))
+#define TX_RATE_54M=09((u8)(540 / 5))
=20
 static inline bool is_11b_rate(u8 rate)
 {
--=20
2.31.0


