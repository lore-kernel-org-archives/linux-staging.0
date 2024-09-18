Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF501CB53E
	for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 19:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726687284; cv=none; b=R0iNRgkynu9SP+TUpbGXD1/RJX15juA1KCzGJlZmOU3crEtyVHEozGHMb4TET4kpaHIZmbX2jacZpOX5tbXm77f5uop9d2fFc61k8nJw0Ydnseo397uqqtZgrLXne+WdUcwEOhbcQRkSPjZYfhoAnTQIvL/tedhTsFEenwtU2NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726687284; c=relaxed/simple;
	bh=JECJLvnhio78zZxE3FL4gNGIfj9yWbrkXe9N/pkvkAU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TBN65bDX+bWkz7/WO39981j1swpk4h14aypAD2NUw7iBW2gqldp+Zb/fFRzuTuHwD9bmfVCyHT6u2rxv3lXV9oHLdJuFR/CBQJWO/kGr9SM+mQjrBxFVzZc5A9SWytru1FKeT3l8vSh0BLKFI4l+LfIN/HBSmK+84Z69OWBkVDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=KhKBdJTl; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="KhKBdJTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726687280; x=1726946480;
	bh=n+iho082T7gTlh0cvK2vzkCqMr12X2d6EyFsyy1wuzo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KhKBdJTloYNb/v9VXyPvU8MFGLIm7QWXuYZeCxNdZ3Pu71AoUvPe0/wJoIV1TUmYF
	 w3E0ScujO8qMWMJfOMEdV2JmaFcS2vO7kGSUp0xQ9xx/frw302a8p0GKwWqRiPWGvf
	 kQBFWTC455J2F1XVPFvhFYIX0kDRATJP1q8InTb3uBu4QsDZV4Lo+oexO53ohQug4+
	 YpK3yVLwHkqP4/+NDe71kRdZHu3/6oSx9+cWULTViZrjA6ftwBDi1HDaPL0sVnrEkR
	 47wCCopq3o88pDWsSo84Pujt/a29pLiy8JrNpJ6YVTCX/ZaQ341K2RnAfnVzaVGZBp
	 zyErRq4/Nz5+g==
Date: Wed, 18 Sep 2024 19:21:15 +0000
To: philipp.g.hortmann@gmail.com, gregkh@linuxfoundation.org
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH 06/14] staging: vt6655: s_uGetDataDuration: Rename bNeedAck parameter
Message-ID: <20240918191959.51539-7-dominik.karol.piatkowski@protonmail.com>
In-Reply-To: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
References: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 10ac2baaf174f0bd80ce457defa0a67e2c071d2a
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch renames bNeedAck to need_ack in s_uGetDataDuration function
in order to avoid using camel case.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---
 drivers/staging/vt6655/rxtx.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 7dd57d2e2831..72837898ea29 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -234,7 +234,7 @@ s_uGetDataDuration(
 =09unsigned int frame_length,
 =09unsigned char pkt_type,
 =09unsigned short rate,
-=09bool bNeedAck,
+=09bool need_ack,
 =09unsigned int uFragIdx,
 =09unsigned int cbLastFragmentSize,
 =09unsigned int uMACfragNum,
@@ -254,51 +254,51 @@ s_uGetDataDuration(
=20
 =09switch (dur_type) {
 =09case DATADUR_B:    /* DATADUR_B */
-=09=09if (bNeedAck) {
+=09=09if (need_ack) {
 =09=09=09uAckTime =3D bb_get_frame_time(priv->preamble_type,
 =09=09=09=09=09=09     pkt_type, 14,
 =09=09=09=09=09=09     priv->byTopCCKBasicRate);
 =09=09}
 =09=09/* Non Frag or Last Frag */
 =09=09if ((uMACfragNum =3D=3D 1) || bLastFrag) {
-=09=09=09if (!bNeedAck)
+=09=09=09if (!need_ack)
 =09=09=09=09return 0;
 =09=09} else {
 =09=09=09/* First Frag or Mid Frag */
 =09=09=09uNextPktTime =3D s_uGetTxRsvTime(priv, pkt_type,
-=09=09=09=09=09=09       len, rate, bNeedAck);
+=09=09=09=09=09=09       len, rate, need_ack);
 =09=09}
=20
 =09=09return priv->uSIFS + uAckTime + uNextPktTime;
=20
 =09case DATADUR_A:    /* DATADUR_A */
-=09=09if (bNeedAck) {
+=09=09if (need_ack) {
 =09=09=09uAckTime =3D bb_get_frame_time(priv->preamble_type,
 =09=09=09=09=09=09     pkt_type, 14,
 =09=09=09=09=09=09     priv->byTopOFDMBasicRate);
 =09=09}
 =09=09/* Non Frag or Last Frag */
 =09=09if ((uMACfragNum =3D=3D 1) || bLastFrag) {
-=09=09=09if (!bNeedAck)
+=09=09=09if (!need_ack)
 =09=09=09=09return 0;
 =09=09} else {
 =09=09=09/* First Frag or Mid Frag */
 =09=09=09uNextPktTime =3D s_uGetTxRsvTime(priv, pkt_type,
-=09=09=09=09=09=09       len, rate, bNeedAck);
+=09=09=09=09=09=09       len, rate, need_ack);
 =09=09}
=20
 =09=09return priv->uSIFS + uAckTime + uNextPktTime;
=20
 =09case DATADUR_A_F0:    /* DATADUR_A_F0 */
 =09case DATADUR_A_F1:    /* DATADUR_A_F1 */
-=09=09if (bNeedAck) {
+=09=09if (need_ack) {
 =09=09=09uAckTime =3D bb_get_frame_time(priv->preamble_type,
 =09=09=09=09=09=09     pkt_type, 14,
 =09=09=09=09=09=09     priv->byTopOFDMBasicRate);
 =09=09}
 =09=09/* Non Frag or Last Frag */
 =09=09if ((uMACfragNum =3D=3D 1) || bLastFrag) {
-=09=09=09if (!bNeedAck)
+=09=09=09if (!need_ack)
 =09=09=09=09return 0;
 =09=09} else {
 =09=09=09/* First Frag or Mid Frag */
@@ -315,7 +315,7 @@ s_uGetDataDuration(
 =09=09=09=09rate =3D fb_opt1[FB_RATE0][rate];
=20
 =09=09=09uNextPktTime =3D s_uGetTxRsvTime(priv, pkt_type,
-=09=09=09=09=09=09       len, rate, bNeedAck);
+=09=09=09=09=09=09       len, rate, need_ack);
 =09=09}
=20
 =09=09return priv->uSIFS + uAckTime + uNextPktTime;
--=20
2.34.1


