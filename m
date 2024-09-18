Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AE81CA691
	for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 19:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726687271; cv=none; b=X1VafLeHkP7hK6GhtH5+cXukJiMh9bHxyZEKz+dr2seOHsexdoJTKWMv/dZFixHb8QJIJL2LR4rZWA6p9DhfjY2zBApwNmOW5PHh5GyxSmdh7Ros2mS/SrHdKUdssWcpWzBJFo6mgkAoHIv5MD5Diqh2WuOHMmp4/BgLXFrHbMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726687271; c=relaxed/simple;
	bh=2Dxavvxr5+ncqT15+4pRoatg/np2Ek4Qc8vHc3juzO8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=htbYKvXio9jS21WG7cfxJrWScNYZgO3UEGYCcTOQfX0cyxhmpKBE4cceuzlK6wN4wbCgoEty69U1o8w2SoKaaGJO9eaCaIyBu459VZ5KeNOcw8rJuSXcmqrB2OZQFJImsNRLDRPwoZjsPGEUvSgDLqznu9QhPHBPdydOWHkGdpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=ZsuUDRwv; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ZsuUDRwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726687267; x=1726946467;
	bh=X3N0GMPfcosg7WiMChayJ0RW/yEtBAZL9uGRXzt6OnQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZsuUDRwv1/TTM7nvEz3UQ2Q5t6hY760vtFdZ2r5QdRaWdbpoDy8mXjiczXUaLiNYM
	 KBFv4U0KTnVmnHGi2Zdnq7hoc1VtWp2fJEsiN9F1IXhp52WGkDbOzYr/sbmCW2LQQ3
	 V9pu4V/Vdd2ywAb2oCzNLa7y9Y76yLji1xI3a7K6LrMd1TUXyNMrIliZ6wsEX0SuYp
	 d2Qqz0fUgVqR7Vf9MB7OwKKYD/W/VKhq7bTSlZWZ6JDXVOD3IwZSXQ2Q9++SspjJCB
	 PcNHz9iVegi2w6L1p+kx6XsBn51XEp0lUpRy45bwBZHyDTL+hAYbJ9BUWkiZMmosAD
	 EC3I2wmpOdadw==
Date: Wed, 18 Sep 2024 19:21:03 +0000
To: philipp.g.hortmann@gmail.com, gregkh@linuxfoundation.org
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH 03/14] staging: vt6655: s_uGetDataDuration: Rename cbFrameLength parameter
Message-ID: <20240918191959.51539-4-dominik.karol.piatkowski@protonmail.com>
In-Reply-To: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
References: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 50c0c3d2e8a1ac7262012103bce268fc02819bfa
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch renames cbFrameLength to frame_length in s_uGetDataDuration
function in order to avoid using camel case.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---
 drivers/staging/vt6655/rxtx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 239fa4a1af66..1747018e747a 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -231,7 +231,7 @@ unsigned int
 s_uGetDataDuration(
 =09struct vnt_private *priv,
 =09unsigned char dur_type,
-=09unsigned int cbFrameLength,
+=09unsigned int frame_length,
 =09unsigned char byPktType,
 =09unsigned short wRate,
 =09bool bNeedAck,
@@ -250,7 +250,7 @@ s_uGetDataDuration(
 =09if (uFragIdx =3D=3D (uMACfragNum - 2))
 =09=09len =3D cbLastFragmentSize;
 =09else
-=09=09len =3D cbFrameLength;
+=09=09len =3D frame_length;
=20
 =09switch (dur_type) {
 =09case DATADUR_B:    /* DATADUR_B */
--=20
2.34.1


