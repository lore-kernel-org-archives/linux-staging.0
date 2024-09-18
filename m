Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC881CB316
	for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 19:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726687266; cv=none; b=B+dIYCXVQ5f4tV4i5b8T9JacIaj2/jxayfNd163M62wCaDFc1o4ck4uWD43W7QG3pADYlTMdjIq9XAbtS+dM2MCIl6KFstFfeLmnZe5Wa0DjIZ1/DkPAiCVvwNeWKmt1hP48kY4BB3o5Ra+mTyFbsC2LIIH+MZvfgkAdpjMRkr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726687266; c=relaxed/simple;
	bh=ig4J89f6O+menLvrJQ8LdWtnp02W64E8zxAYsKrjQ6Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VqncGMF0oeYvWUqikdqM0BkK5KdiyFLWMZg4kWSKiNePWm78JEp81KDfNjWTtglY7DcrMNmIiCGUG/hEzLFLN0YwvoOuxWQMhu8CqcMTRz09lrNDPRXwdeYwPocOBqh9GcyGy7BaAzKLKL6/ul1yoo71mESdl+ujJOuKr9shmnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=IXSFTcjk; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="IXSFTcjk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726687262; x=1726946462;
	bh=E1c8su5psVVJ96LYrQRPVdjK8oOLuE4e2mk0Bqp8mCI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IXSFTcjkvySwh8CEqPt1Cs9ume5rAzEMWq1mvICD/GkFrbMcIaOyx/724u68KLUYv
	 uv1EX32b3XOleLDSByvkU3/sjzhjpRBSMs8vNUYibMmroHiAijsh0th1aIKNbLrGeF
	 h7tlUWyJzWzIaHeQzRyFdH41PcG8h0QAqFsVXbwH7LgJff8wsc8P2LlkhKlOYVxpdT
	 71//++TfVvmNMfi4TA1n8/tQARvgCa1+fePzGSHePJk0Zz3UeTgtgFWps4LqKqdatO
	 mWxXvtInTZzpKWMos4vq7h4ihnKCuIavflrK49DEb3FiOFFlRWaQBvOB44jUHzZcuI
	 nQZWOgSPNJzRg==
Date: Wed, 18 Sep 2024 19:20:57 +0000
To: philipp.g.hortmann@gmail.com, gregkh@linuxfoundation.org
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH 02/14] staging: vt6655: s_uGetDataDuration: Rename byDurType parameter
Message-ID: <20240918191959.51539-3-dominik.karol.piatkowski@protonmail.com>
In-Reply-To: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
References: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: e7c451ec80058e33b81e8ec1d0f4fa13a5393551
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch renames byDurType to dur_type in s_uGetDataDuration function
in order to avoid using camel case.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---
 drivers/staging/vt6655/rxtx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index a1dadc3e8cb5..239fa4a1af66 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -230,7 +230,7 @@ static
 unsigned int
 s_uGetDataDuration(
 =09struct vnt_private *priv,
-=09unsigned char byDurType,
+=09unsigned char dur_type,
 =09unsigned int cbFrameLength,
 =09unsigned char byPktType,
 =09unsigned short wRate,
@@ -252,7 +252,7 @@ s_uGetDataDuration(
 =09else
 =09=09len =3D cbFrameLength;
=20
-=09switch (byDurType) {
+=09switch (dur_type) {
 =09case DATADUR_B:    /* DATADUR_B */
 =09=09if (bNeedAck) {
 =09=09=09uAckTime =3D bb_get_frame_time(priv->preamble_type,
--=20
2.34.1


