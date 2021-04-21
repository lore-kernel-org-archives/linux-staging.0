Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch [185.70.41.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FAB2F83
	for <linux-staging@lists.linux.dev>; Wed, 21 Apr 2021 12:16:15 +0000 (UTC)
Received: from mail-02.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4FQK7X4zRwz4x6KH
	for <linux-staging@lists.linux.dev>; Wed, 21 Apr 2021 12:07:52 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
	dkim=pass (1024-bit key) header.d=amosgross.com header.i=@amosgross.com header.b="B0thos7b"
Date: Wed, 21 Apr 2021 12:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amosgross.com;
	s=protonmail; t=1619006856;
	bh=Xx9IEn7gagQgz9r0X5viRZ2vzsROlaqThetPF971BWQ=;
	h=Date:To:From:Cc:Reply-To:Subject:From;
	b=B0thos7b17zRftuaND0+Slz9gTfxDibcePr0onqVFK07BomAHwUqmaB0CRI22QBp5
	 xo7bMUsiXSzqH4dqOlZqZy8kZVZiGZyoJwLGb1xLg7GxOKTQy84BXQWvQXajL9pKgV
	 kPHJ+8nlvH2tupdFimb66lnocWN36fstfpr5GKDI=
To: gregkh@linuxfoundation.org
From: Amos Gross <email@amosgross.com>
Cc: linux-staging@lists.linux.dev
Reply-To: Amos Gross <email@amosgross.com>
Subject: [PATCH] Staging: rtl8723bs: rtw_xmit: fixed tabbing issue
Message-ID: <YIAVfRxQ+XmKEf47@arch.localdomain>
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

Fixed warning from checkpatch for code block not being indented
correctly.

Signed-off-by: Amos Gross <email@amosgross.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rt=
l8723bs/core/rtw_xmit.c
index 1ffd2ce68974..d53052e0696e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -790,7 +790,7 @@ static s32 xmitframe_addmic(struct adapter *padapter, s=
truct xmit_frame *pxmitfr
 =09=09=09=09if (pframe[1]&2)  /* From Ds =3D=3D 1 */
 =09=09=09=09=09rtw_secmicappend(&micdata, &pframe[24], 6);
 =09=09=09=09else
-=09=09=09=09rtw_secmicappend(&micdata, &pframe[10], 6);
+=09=09=09=09=09rtw_secmicappend(&micdata, &pframe[10], 6);
 =09=09=09} else {=09/* ToDS =3D=3D 0 */
 =09=09=09=09rtw_secmicappend(&micdata, &pframe[4], 6);   /* DA */
 =09=09=09=09if (pframe[1]&2)  /* From Ds =3D=3D 1 */
--=20
2.31.1


