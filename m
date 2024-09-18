Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D5B1CB50C
	for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 19:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726687278; cv=none; b=EideK2qeX7EpZywPJl/6c8qrYa7AkhOa9DaG4QlJMKLXtXaCvjjai/xvgh5h/Jn39yCYc3GwvUckuel9Y7zaqSiV+33zf8odzH0F9ug466BVeVi8dC3Qmc0yYHd3obCOofHNDpDhM5ybGKExHUzXT0yetZHx3zUCgUw7f38LaIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726687278; c=relaxed/simple;
	bh=iBUdUcuyFy3PwDpZpP+AQIisDPez0XyKVtQTnXifhZY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kygcS7PvzLTUFhK/BSr6rLRmndfnEJ1BL2c6beN9c9kA+9/kqkq2wPW9Xoh+urP7wCpeVGZdUgfH7FPo1F7lsJYkfyuHhxr4V0yGOQn4ZjSY8N/BgieRRhzw7wYgUBq3XcAd7Uv/Eeoci2wEucsauWWf78EFUUZVPvrpHJysk7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=YAIlwGjf; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="YAIlwGjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726687275; x=1726946475;
	bh=k+UTPxJmdwp6BXX9W14I0NBgGNiPwpjEDV7rUDT0Cns=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YAIlwGjfmPXMERKB7XC+FrLjBwMgUqDpQk5aCgUGrLTmPwQxyXEK4jSRn9bBAGBNi
	 pXCO95Ml6VzsgHZ8dIHEAw8IyE64SBqoGqlJ8eneRg8Ib1mGzY5AcWH1CS8/wT05fz
	 hRVA7/xyOQAUR0YOdIyGm/6qwpekkH6k90G6Kxfnht+gzUHcl7jmLBXUytN3FgXwgz
	 XEpBtihmEQpx3uzBSbp0nVS22z2dusLa1RSwwAmoE31qKHMqfrlRtvasm3CLL6SX62
	 o6X3yBV+yEmlkdVtUBmjhQmRf6Sl3/7IFbRHwqizG6+ib/0p/nsZ1I+JqFFJpZg79C
	 JJLB8ivSlxVoQ==
Date: Wed, 18 Sep 2024 19:21:11 +0000
To: philipp.g.hortmann@gmail.com, gregkh@linuxfoundation.org
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH 05/14] staging: vt6655: s_uGetDataDuration: Rename wRate parameter
Message-ID: <20240918191959.51539-6-dominik.karol.piatkowski@protonmail.com>
In-Reply-To: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
References: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 2684ebcb0ad610bf925f3f794fd161098a326aa8
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch renames wRate to rate in s_uGetDataDuration function in order
to avoid using camel case.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---
 drivers/staging/vt6655/rxtx.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index dd228962dd77..7dd57d2e2831 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -233,7 +233,7 @@ s_uGetDataDuration(
 =09unsigned char dur_type,
 =09unsigned int frame_length,
 =09unsigned char pkt_type,
-=09unsigned short wRate,
+=09unsigned short rate,
 =09bool bNeedAck,
 =09unsigned int uFragIdx,
 =09unsigned int cbLastFragmentSize,
@@ -266,7 +266,7 @@ s_uGetDataDuration(
 =09=09} else {
 =09=09=09/* First Frag or Mid Frag */
 =09=09=09uNextPktTime =3D s_uGetTxRsvTime(priv, pkt_type,
-=09=09=09=09=09=09       len, wRate, bNeedAck);
+=09=09=09=09=09=09       len, rate, bNeedAck);
 =09=09}
=20
 =09=09return priv->uSIFS + uAckTime + uNextPktTime;
@@ -284,7 +284,7 @@ s_uGetDataDuration(
 =09=09} else {
 =09=09=09/* First Frag or Mid Frag */
 =09=09=09uNextPktTime =3D s_uGetTxRsvTime(priv, pkt_type,
-=09=09=09=09=09=09       len, wRate, bNeedAck);
+=09=09=09=09=09=09       len, rate, bNeedAck);
 =09=09}
=20
 =09=09return priv->uSIFS + uAckTime + uNextPktTime;
@@ -302,20 +302,20 @@ s_uGetDataDuration(
 =09=09=09=09return 0;
 =09=09} else {
 =09=09=09/* First Frag or Mid Frag */
-=09=09=09if (wRate < RATE_18M)
-=09=09=09=09wRate =3D RATE_18M;
-=09=09=09else if (wRate > RATE_54M)
-=09=09=09=09wRate =3D RATE_54M;
+=09=09=09if (rate < RATE_18M)
+=09=09=09=09rate =3D RATE_18M;
+=09=09=09else if (rate > RATE_54M)
+=09=09=09=09rate =3D RATE_54M;
=20
-=09=09=09wRate -=3D RATE_18M;
+=09=09=09rate -=3D RATE_18M;
=20
 =09=09=09if (byFBOption =3D=3D AUTO_FB_0)
-=09=09=09=09wRate =3D fb_opt0[FB_RATE0][wRate];
+=09=09=09=09rate =3D fb_opt0[FB_RATE0][rate];
 =09=09=09else
-=09=09=09=09wRate =3D fb_opt1[FB_RATE0][wRate];
+=09=09=09=09rate =3D fb_opt1[FB_RATE0][rate];
=20
 =09=09=09uNextPktTime =3D s_uGetTxRsvTime(priv, pkt_type,
-=09=09=09=09=09=09       len, wRate, bNeedAck);
+=09=09=09=09=09=09       len, rate, bNeedAck);
 =09=09}
=20
 =09=09return priv->uSIFS + uAckTime + uNextPktTime;
--=20
2.34.1


