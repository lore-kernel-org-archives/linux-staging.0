Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079E736215A
	for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 20:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777579942; cv=none; b=rtG5JFVsbkU6eBvHk5sK1M8a+45SGKZHoM0tiSOQeb/5WGbMazscAs+eptsjooiLB5P3xIciNgl3x/Kx7boyQeP+X1ZrSIh7KfnS25fJok3sChN4KCPJFOvWxBtBRt+r1qkOfJCH9S4Y+OjuYPLBiKZMl/ASzS4mXreeHQDRrzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777579942; c=relaxed/simple;
	bh=kqphYdCl1OP7F5tp2UHRgojd3ByJSZFZKnRF8ZeTE5Q=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MwAVBinPaGeAISOo2F5utAAKo3MHCHrEoRPOQ2Jhh97qCiPg845lrM/6MUaJZ2qe57J0qeeaU9ygHsbQwb0yva35zWO7tWNL3Zjp+9G+AG4sk3Sgu1ShSm8QamiZgvDdPFv/QncDFd6nQCkXOvVf6kzGskhRGSt/AXDjP9Vcq8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=G6E5ro4g; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="G6E5ro4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1777579931; x=1777839131;
	bh=oRUj4ZG0WqphSBbo7ZbV/hvZ3xNgWjk1VlRmVM5aDj4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=G6E5ro4gfTNx0j4iyuK1wi/4obhjg4Ofs4tEAPeyUwM010VvkswmwaU1E+wbLeM0j
	 2FyKUkUqyWOeuHMvGddOhH9JWhlosxryZQ7Ab/d4NagrZR69tkjL0UsRbbtMBpzEj+
	 nljXkRjUF3NLWS295selhGVSldeITHfna3CE7oPy2Q+bbR1Z0llOOGA8v7iG3y3NIS
	 maLWs8k8+Q+/HuJYeiKBACwHKw+m+Ux8ClosVY/hBYG6fnwrvXld3Kywf+kE0SMYAs
	 t/tN14rSE4L1JhD10HdLsaDD2chcIaKPsDAMhzi4DkmWkbL6zFWdIO2BTfDsIRGvGd
	 fwexnv2ZETcmg==
Date: Thu, 30 Apr 2026 20:12:06 +0000
To: gregkh@linuxfoundation.org
From: Abhai Kollara <abhai@protonmail.com>
Cc: hansg@kernel.org, straube.linux@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Abhai Kollara <abhai@protonmail.com>
Subject: [PATCH] staging: rtl8723bs: simplify NULL pointer comparisons in rtw_recv.h
Message-ID: <20260430201158.2807823-1-abhai@protonmail.com>
Feedback-ID: 8137229:user:proton
X-Pm-Message-ID: 32d61b719effc31b1967de9640ba95b283cd297e
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix checkpatch.pl warnings regarding explicit comparisons to NULL.
The kernel coding style prefers the shorter if (!ptr) idiom over
if (ptr =3D=3D NULL). Clean up the inline functions in rtw_recv.h to
match this standard.

Signed-off-by: Abhai Kollara <abhai@protonmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_recv.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging=
/rtl8723bs/include/rtw_recv.h
index 8e45871f07f0..9c32d480a20a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -349,7 +349,7 @@ s32  rtw_recv_entry(union recv_frame *precv_frame);
 static inline u8 *get_rxmem(union recv_frame *precvframe)
 {
 =09/* always return rx_head... */
-=09if (precvframe =3D=3D NULL)
+=09if (!precvframe)
 =09=09return NULL;
=20
 =09return precvframe->u.hdr.rx_head;
@@ -362,7 +362,7 @@ static inline u8 *recvframe_pull(union recv_frame *prec=
vframe, signed int sz)
 =09/* used for extract sz bytes from rx_data, update rx_data and return th=
e updated rx_data to the caller */
=20
=20
-=09if (precvframe =3D=3D NULL)
+=09if (!precvframe)
 =09=09return NULL;
=20
=20
@@ -387,7 +387,7 @@ static inline u8 *recvframe_put(union recv_frame *precv=
frame, signed int sz)
 =09/* after putting, rx_tail must be still larger than rx_end. */
 =09unsigned char *prev_rx_tail;
=20
-=09if (precvframe =3D=3D NULL)
+=09if (!precvframe)
 =09=09return NULL;
=20
 =09prev_rx_tail =3D precvframe->u.hdr.rx_tail;
@@ -414,7 +414,7 @@ static inline u8 *recvframe_pull_tail(union recv_frame =
*precvframe, signed int s
 =09/* used for extract sz bytes from rx_end, update rx_end and return the =
updated rx_end to the caller */
 =09/* after pulling, rx_end must be still larger than rx_data. */
=20
-=09if (precvframe =3D=3D NULL)
+=09if (!precvframe)
 =09=09return NULL;
=20
 =09precvframe->u.hdr.rx_tail -=3D sz;
--=20
2.43.0


