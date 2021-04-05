Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch [185.70.41.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B355F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 11:35:58 +0000 (UTC)
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com [51.89.119.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4FDT295cG9z5XGKh
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 11:29:05 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
	dkim=pass (1024-bit key) header.d=amosgross.com header.i=@amosgross.com header.b="HPJyceqx"
Date: Mon, 05 Apr 2021 11:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amosgross.com;
	s=protonmail; t=1617622130;
	bh=pQbHTjWrJxuyRaq3HP9yEEBF8xmAEkBOWPX0zmDGVzI=;
	h=Date:To:From:Cc:Reply-To:Subject:From;
	b=HPJyceqxBpThIAJ30a6qEEL6mmkJ2mVup30KrODtGFD3VjrNHkOTwKXpN6WuBIsY4
	 hSNcfsQ8AIneYljgH4aImBOaDH7qhovLtakbFoM8O2BLoMWc78pePR3KsmbL1JtB65
	 AcVE7aSH3fdoa+83fHlYTOS6dzCJPsPoHbuK6UnY=
To: gregkh@linuxfoundation.org
From: Amos Gross <email@amosgross.com>
Cc: linux-staging@lists.linux.dev
Reply-To: Amos Gross <email@amosgross.com>
Subject: [PATCH] Staging: rtl8188eu: rtw_security: fixed coding style issue with spaces
Message-ID: <20210405112841.GA26479@elementaryos>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

Fixed spacing for a number of lines starting with spaces.

Signed-off-by: Amos Gross <email@amosgross.com>
---
 drivers/staging/rtl8188eu/core/rtw_security.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_security.c b/drivers/stagin=
g/rtl8188eu/core/rtw_security.c
index da26a3c705f8..a7cc7593c5fd 100644
--- a/drivers/staging/rtl8188eu/core/rtw_security.c
+++ b/drivers/staging/rtl8188eu/core/rtw_security.c
@@ -425,9 +425,9 @@ static const unsigned short Sbox1[2][256] =3D {  /* Sbo=
x for hash (can be in ROM)
 =090x2DB6, 0x3C22, 0x1592, 0xC920, 0x8749, 0xAAFF, 0x5078, 0xA57A,
 =090x038F, 0x59F8, 0x0980, 0x1A17, 0x65DA, 0xD731, 0x84C6, 0xD0B8,
 =090x82C3, 0x29B0, 0x5A77, 0x1E11, 0x7BCB, 0xA8FC, 0x6DD6, 0x2C3A,
-  },
+},

-  {  /* second half of table is unsigned char-reversed version of first! *=
/
+{  /* second half of table is unsigned char-reversed version of first! */
 =090xA5C6, 0x84F8, 0x99EE, 0x8DF6, 0x0DFF, 0xBDD6, 0xB1DE, 0x5491,
 =090x5060, 0x0302, 0xA9CE, 0x7D56, 0x19E7, 0x62B5, 0xE64D, 0x9AEC,
 =090x458F, 0x9D1F, 0x4089, 0x87FA, 0x15EF, 0xEBB2, 0xC98E, 0x0BFB,
@@ -460,7 +460,7 @@ static const unsigned short Sbox1[2][256] =3D {  /* Sbo=
x for hash (can be in ROM)
 =090xB62D, 0x223C, 0x9215, 0x20C9, 0x4987, 0xFFAA, 0x7850, 0x7AA5,
 =090x8F03, 0xF859, 0x8009, 0x171A, 0xDA65, 0x31D7, 0xC684, 0xB8D0,
 =090xC382, 0xB029, 0x775A, 0x111E, 0xCB7B, 0xFCA8, 0xD66D, 0x3A2C,
-  }
+}
 };

 /**
--
2.17.1


