Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751541CC15D
	for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 19:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726687323; cv=none; b=pOa8KbHelD/FV4pv0/M0Zb0i03VoUlOWMw6e+U1W7Iucv4K7G5bWMlSHoPmo5uylHHyyceWTEba1SEGn1kC5Lj5Dv/ZAmikpvfPEKe3iijB4USQ2BxJKUHtlv6YI+EIdCjAVj70zIIlerinX/JLG53iU5Ly9jGD/KUw+wa6DQ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726687323; c=relaxed/simple;
	bh=BtZO/Dn9OOU/+FesLiovjQkEUe2uRE46lW/xdGr68mg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ir6rEXOQCLcb5fJ1N8KCBqeO9lwo6Sd2d1wkZNFsYp9fkC89qlkxdnvuC2tN0Jqv1Q8MwVcZUGMULcUxwxKcRqPtd3KvGs7W9KK8G7lkdvAXe1jlYXLuh9GaM0EkXPFWA3Uyd/9a6FUJpk2Ywk78cgOgrKEhVVyiKwYcuh7B9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=b/ciog9a; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="b/ciog9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726687319; x=1726946519;
	bh=B2INdXcYa4ziBQUCJlCJHSGTOSgy7OTqjYfv7rPmVXs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=b/ciog9aTpAv6FgNByhDWWfiuC3d6bxp9s0S3rCFrmyAlezWGiPkYHsEDC75L0AS1
	 Me+dgeFtTm8I9a/xvMDrx0BgM0R5Nj8UcvmRNWp3COf9ij3iJJMD6rDwNacPC9etOT
	 gUNKL4bGunyv5HIRGyhdA+tukpPPtQf/UQvEtJFybu4GOPt/my01lz8Dbj/knv31c6
	 m0uWG8uBZAmlNbenDbbWcyfrOetH1uueB2qp6FdIetDQJS9+Fd9ZAnQnVco/MyVpSO
	 9HFmxn/ukNdXgJ+xvcacTT7CqMNbpWAXvKaJgwRXswdUWyPjXg5RY5a7eIi2EKG8gG
	 5o3GLEwLQPh4w==
Date: Wed, 18 Sep 2024 19:21:56 +0000
To: philipp.g.hortmann@gmail.com, gregkh@linuxfoundation.org
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH 13/14] staging: vt6655: s_uGetDataDuration: Rename uNextPktTime variable
Message-ID: <20240918191959.51539-14-dominik.karol.piatkowski@protonmail.com>
In-Reply-To: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
References: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 340005476fa96df63754fd91b23346e05b4c8091
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch renames uNextPktTime to next_pkt_time in s_uGetDataDuration
function in order to avoid using camel case.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---
 drivers/staging/vt6655/rxtx.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 8f28fd1465d4..5e93ca38008e 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -242,7 +242,7 @@ s_uGetDataDuration(
 )
 {
 =09bool last_frag =3D false;
-=09unsigned int ack_time =3D 0, uNextPktTime =3D 0, len;
+=09unsigned int ack_time =3D 0, next_pkt_time =3D 0, len;
=20
 =09if (frag_idx =3D=3D (mac_frag_num - 1))
 =09=09last_frag =3D true;
@@ -265,11 +265,11 @@ s_uGetDataDuration(
 =09=09=09=09return 0;
 =09=09} else {
 =09=09=09/* First Frag or Mid Frag */
-=09=09=09uNextPktTime =3D s_uGetTxRsvTime(priv, pkt_type,
-=09=09=09=09=09=09       len, rate, need_ack);
+=09=09=09next_pkt_time =3D s_uGetTxRsvTime(priv, pkt_type,
+=09=09=09=09=09=09=09len, rate, need_ack);
 =09=09}
=20
-=09=09return priv->uSIFS + ack_time + uNextPktTime;
+=09=09return priv->uSIFS + ack_time + next_pkt_time;
=20
 =09case DATADUR_A:    /* DATADUR_A */
 =09=09if (need_ack) {
@@ -283,11 +283,11 @@ s_uGetDataDuration(
 =09=09=09=09return 0;
 =09=09} else {
 =09=09=09/* First Frag or Mid Frag */
-=09=09=09uNextPktTime =3D s_uGetTxRsvTime(priv, pkt_type,
-=09=09=09=09=09=09       len, rate, need_ack);
+=09=09=09next_pkt_time =3D s_uGetTxRsvTime(priv, pkt_type,
+=09=09=09=09=09=09=09len, rate, need_ack);
 =09=09}
=20
-=09=09return priv->uSIFS + ack_time + uNextPktTime;
+=09=09return priv->uSIFS + ack_time + next_pkt_time;
=20
 =09case DATADUR_A_F0:    /* DATADUR_A_F0 */
 =09case DATADUR_A_F1:    /* DATADUR_A_F1 */
@@ -314,11 +314,11 @@ s_uGetDataDuration(
 =09=09=09else
 =09=09=09=09rate =3D fb_opt1[FB_RATE0][rate];
=20
-=09=09=09uNextPktTime =3D s_uGetTxRsvTime(priv, pkt_type,
-=09=09=09=09=09=09       len, rate, need_ack);
+=09=09=09next_pkt_time =3D s_uGetTxRsvTime(priv, pkt_type,
+=09=09=09=09=09=09=09len, rate, need_ack);
 =09=09}
=20
-=09=09return priv->uSIFS + ack_time + uNextPktTime;
+=09=09return priv->uSIFS + ack_time + next_pkt_time;
=20
 =09default:
 =09=09break;
--=20
2.34.1


