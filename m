Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE76A1C7B8B
	for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 19:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726687260; cv=none; b=DlmNJSSjJY9wMKycMyPep/VDsxlBdBzPPvcC6nnREXycabs1aeKZhrWo2U7hoJi108nZRtJlAO2YDcxEv73qmhbM699A9Px1qPe3v9mQNMvBdeVm6j5/t5yQJNp994OI0a+ENDdRTmH2XDQREjqKS28WRX4bAg78EA0yo0mcwc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726687260; c=relaxed/simple;
	bh=x9hFAta328ClIMgZNZA+WHiW6X/BprooQPYwdps2wmg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=izQ8XEpZKQeVmK8LHzWv4NHrEfx693XszNHCeK/nlEBNcz48XnpHNUWLElL2XrQTfm6c/7g8Z7sgdkm3mOlkG5EjjiTdp6TrJcCFHERu5w3kvO1zxV/3ThFtSd/FVAjPuaDeqfcU4IgpTktLbqaFnZ7/00/9Qe0I/47p0/m/hts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=gEmqGf07; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="gEmqGf07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726687256; x=1726946456;
	bh=KhZoZPKYCTCWJgjjSf9Lt9HbrP4/i0KAqvC1Qwk1GE0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gEmqGf07haB/bi5BmfFcAc7W34epY7i+/3+tOZZrMEwAdjaiJDXt/d0NmRHjzpxcY
	 3HJzvk3v4GwWtw9+3oEKVIyM8/u/dpoRsoJ7nOMM8L6g6emQLG2xxjNpiCjpqy5mN7
	 jIqhdWbrkGIBG0GSEiemeWBDvhZlzqCS01ty5pBUUpbjNc4bHkizEiv0cIPoWESTzZ
	 nqEYcRAk6BolGtOrtcgGgQlXiX0SrvNFSOpYeIXqk40gi4JExd5waWGeivn7WceeU3
	 X109YT0wq6tqP9+m3zXf6DR/xOWSZ0oRZYXjv31Z3LcPog8+xuqzWnBE1s7z+LP4yD
	 9sh7AOa8dompg==
Date: Wed, 18 Sep 2024 19:20:51 +0000
To: philipp.g.hortmann@gmail.com, gregkh@linuxfoundation.org
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH 01/14] staging: vt6655: s_uGetDataDuration: Rename pDevice parameter
Message-ID: <20240918191959.51539-2-dominik.karol.piatkowski@protonmail.com>
In-Reply-To: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
References: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: b1c6673bbcf88c07ea482bdb7a4474d3e7684ee3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch renames pDevice to priv in s_uGetDataDuration function in
order to avoid using camel case.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---
 drivers/staging/vt6655/rxtx.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 3705cb1e87b6..a1dadc3e8cb5 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -229,7 +229,7 @@ static __le16 get_rtscts_time(struct vnt_private *priv,
 static
 unsigned int
 s_uGetDataDuration(
-=09struct vnt_private *pDevice,
+=09struct vnt_private *priv,
 =09unsigned char byDurType,
 =09unsigned int cbFrameLength,
 =09unsigned char byPktType,
@@ -255,9 +255,9 @@ s_uGetDataDuration(
 =09switch (byDurType) {
 =09case DATADUR_B:    /* DATADUR_B */
 =09=09if (bNeedAck) {
-=09=09=09uAckTime =3D bb_get_frame_time(pDevice->preamble_type,
+=09=09=09uAckTime =3D bb_get_frame_time(priv->preamble_type,
 =09=09=09=09=09=09     byPktType, 14,
-=09=09=09=09=09=09     pDevice->byTopCCKBasicRate);
+=09=09=09=09=09=09     priv->byTopCCKBasicRate);
 =09=09}
 =09=09/* Non Frag or Last Frag */
 =09=09if ((uMACfragNum =3D=3D 1) || bLastFrag) {
@@ -265,17 +265,17 @@ s_uGetDataDuration(
 =09=09=09=09return 0;
 =09=09} else {
 =09=09=09/* First Frag or Mid Frag */
-=09=09=09uNextPktTime =3D s_uGetTxRsvTime(pDevice, byPktType,
+=09=09=09uNextPktTime =3D s_uGetTxRsvTime(priv, byPktType,
 =09=09=09=09=09=09       len, wRate, bNeedAck);
 =09=09}
=20
-=09=09return pDevice->uSIFS + uAckTime + uNextPktTime;
+=09=09return priv->uSIFS + uAckTime + uNextPktTime;
=20
 =09case DATADUR_A:    /* DATADUR_A */
 =09=09if (bNeedAck) {
-=09=09=09uAckTime =3D bb_get_frame_time(pDevice->preamble_type,
+=09=09=09uAckTime =3D bb_get_frame_time(priv->preamble_type,
 =09=09=09=09=09=09     byPktType, 14,
-=09=09=09=09=09=09     pDevice->byTopOFDMBasicRate);
+=09=09=09=09=09=09     priv->byTopOFDMBasicRate);
 =09=09}
 =09=09/* Non Frag or Last Frag */
 =09=09if ((uMACfragNum =3D=3D 1) || bLastFrag) {
@@ -283,18 +283,18 @@ s_uGetDataDuration(
 =09=09=09=09return 0;
 =09=09} else {
 =09=09=09/* First Frag or Mid Frag */
-=09=09=09uNextPktTime =3D s_uGetTxRsvTime(pDevice, byPktType,
+=09=09=09uNextPktTime =3D s_uGetTxRsvTime(priv, byPktType,
 =09=09=09=09=09=09       len, wRate, bNeedAck);
 =09=09}
=20
-=09=09return pDevice->uSIFS + uAckTime + uNextPktTime;
+=09=09return priv->uSIFS + uAckTime + uNextPktTime;
=20
 =09case DATADUR_A_F0:    /* DATADUR_A_F0 */
 =09case DATADUR_A_F1:    /* DATADUR_A_F1 */
 =09=09if (bNeedAck) {
-=09=09=09uAckTime =3D bb_get_frame_time(pDevice->preamble_type,
+=09=09=09uAckTime =3D bb_get_frame_time(priv->preamble_type,
 =09=09=09=09=09=09     byPktType, 14,
-=09=09=09=09=09=09     pDevice->byTopOFDMBasicRate);
+=09=09=09=09=09=09     priv->byTopOFDMBasicRate);
 =09=09}
 =09=09/* Non Frag or Last Frag */
 =09=09if ((uMACfragNum =3D=3D 1) || bLastFrag) {
@@ -314,11 +314,11 @@ s_uGetDataDuration(
 =09=09=09else
 =09=09=09=09wRate =3D fb_opt1[FB_RATE0][wRate];
=20
-=09=09=09uNextPktTime =3D s_uGetTxRsvTime(pDevice, byPktType,
+=09=09=09uNextPktTime =3D s_uGetTxRsvTime(priv, byPktType,
 =09=09=09=09=09=09       len, wRate, bNeedAck);
 =09=09}
=20
-=09=09return pDevice->uSIFS + uAckTime + uNextPktTime;
+=09=09return priv->uSIFS + uAckTime + uNextPktTime;
=20
 =09default:
 =09=09break;
--=20
2.34.1


