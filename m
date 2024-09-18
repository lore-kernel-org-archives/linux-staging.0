Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AF113B797
	for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 16:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726678310; cv=none; b=ACD3XILaLy6DCmpjlleakd5fg8TDvTplmpszMx4+/Ge0lnNlL4F7ufThq4bi9ebqgtaFPzeXY1ibSyu0ndM4tGJRlIpxTr9uxUyYVhYbszVnTSzmy8Aa2adxlJHc2H0jXaomHuOEyr5FxGWt2lgJZWVEq00P9vVUZNhyqkdroUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726678310; c=relaxed/simple;
	bh=saqdPERl3pSpSVfQHE19jiKuKxFBbOQYkvI4MJit1vw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pLHurap6wBWBSs0bikPMZ80B2DkyeLvFxvL1DX3AkCFY9Tg1koo9cIrqeMY10RFulbFKk6r7nX869B9CShEveA+hT1cNMHbWr2sbNQZD3hdlblId3dJOchCwLh8B80USCMcEOsLmHifH+N8KSmwpnwHm+PgiJNSpkyNEzwsp/7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=hbqiIht8; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="hbqiIht8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726678306; x=1726937506;
	bh=fhuNG8zofIGaLi9EHs/Va7YSL8WAW0FXzVZiEsXHJZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hbqiIht8AJucWIk1p1fluO8SehCBixY2e2XBgDT+/tLMIktn2JLJdWQn3YYxhfzWJ
	 xF81AR7An6i9zrwptIvtDeW3L23VkbM4oVPZtsYQk+eA1QSBwoPY8acPhcj/5glYOt
	 stmVnuYvMmOlixzn/JA76dLTeIzu92rI5FxlHJulXO7k73366+IrX/Lu5sMQ3V5Iae
	 06Ann1l5sb/ltq6s1Jm+48KoHxA7DmPvqrvXv6TRihvM8XUB0bZANh02Lc3/unxcJY
	 j29N+AvvTuiGYAm2j90393dtFm4nO6sv+0jIoZbrNBnvHoWJYyr7bOoGveuFBIRPZx
	 34YvgWHosFSVw==
Date: Wed, 18 Sep 2024 16:51:40 +0000
To: philipp.g.hortmann@gmail.com, gregkh@linuxfoundation.org
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH] staging: vt6655: rxtx.c: Fix too long lines in get_rtscts_time
Message-ID: <20240918165052.30386-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 3b2a47204c0ee62749925f8167623ebe64cbf87b
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch fixes the lines exceeding 100 columns in get_rtscts_time
function.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---
 drivers/staging/vt6655/rxtx.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 3705cb1e87b6..1ea17e86e3ee 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -202,20 +202,29 @@ static __le16 get_rtscts_time(struct vnt_private *pri=
v,
=20
 =09data_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, frame_le=
ngth, current_rate);
 =09if (rts_rsvtype =3D=3D 0) { /* RTSTxRrvTime_bb */
-=09=09rts_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 20, pr=
iv->byTopCCKBasicRate);
-=09=09ack_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 14, pr=
iv->byTopCCKBasicRate);
+=09=09rts_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 20,
+=09=09=09=09=09     priv->byTopCCKBasicRate);
+=09=09ack_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 14,
+=09=09=09=09=09     priv->byTopCCKBasicRate);
 =09=09cts_time =3D ack_time;
 =09} else if (rts_rsvtype =3D=3D 1) { /* RTSTxRrvTime_ba, only in 2.4GHZ *=
/
-=09=09rts_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 20, pr=
iv->byTopCCKBasicRate);
-=09=09cts_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 14, pr=
iv->byTopCCKBasicRate);
-=09=09ack_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 14, pr=
iv->byTopOFDMBasicRate);
+=09=09rts_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 20,
+=09=09=09=09=09     priv->byTopCCKBasicRate);
+=09=09cts_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 14,
+=09=09=09=09=09     priv->byTopCCKBasicRate);
+=09=09ack_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 14,
+=09=09=09=09=09     priv->byTopOFDMBasicRate);
 =09} else if (rts_rsvtype =3D=3D 2) { /* RTSTxRrvTime_aa */
-=09=09rts_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 20, pr=
iv->byTopOFDMBasicRate);
-=09=09ack_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 14, pr=
iv->byTopOFDMBasicRate);
+=09=09rts_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 20,
+=09=09=09=09=09     priv->byTopOFDMBasicRate);
+=09=09ack_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 14,
+=09=09=09=09=09     priv->byTopOFDMBasicRate);
 =09=09cts_time =3D ack_time;
 =09} else if (rts_rsvtype =3D=3D 3) { /* CTSTxRrvTime_ba, only in 2.4GHZ *=
/
-=09=09cts_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 14, pr=
iv->byTopCCKBasicRate);
-=09=09ack_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 14, pr=
iv->byTopOFDMBasicRate);
+=09=09cts_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 14,
+=09=09=09=09=09     priv->byTopCCKBasicRate);
+=09=09ack_time =3D bb_get_frame_time(priv->preamble_type, pkt_type, 14,
+=09=09=09=09=09     priv->byTopOFDMBasicRate);
 =09=09rrv_time =3D cts_time + ack_time + data_time + 2 * priv->uSIFS;
 =09=09return cpu_to_le16((u16)rrv_time);
 =09}
--=20
2.34.1


