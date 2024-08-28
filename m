Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CC438DE9
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857225; cv=none; b=Tf9fbeC4TgmugmU4tBaix/SNFsIUp4Y8AfhE2WLM0tulhMu/z1sfQxgi5QBIjWCD4jZ5vW0kjmLjQENpKgpkfgHxAX0QgKgomVa2eFTCkiTCfjdSumw8odFzcRgklCFdEB4eAlVCaAffTuFmfRgmTljAeof7qNDhRavhbX7UKVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857225; c=relaxed/simple;
	bh=ZI3ok/Ft3dEPaxX4NiPk0idPDUuLGhOCw4LvZAl9vxs=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KLceLPbNWtfftuUlELfYNAHsNpZoRKoErGlTUZRruUDukwcI92xqimaqikXFzwODXDWhQoajxC3rIDbMnxYSys0aFf7Q8HOzEWZjXFMxSgMZwBp4aAGHzsGxAcdeMN7u2i7L7kitQts/znYJPU963EjDgHxszbq7SWjbOFGR73Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=sTzl4voK; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="sTzl4voK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1724857215; x=1725116415;
	bh=OYnRYZfiQGbZuUfggtTPiuuF9e2wOkKxuCADJii1nhU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=sTzl4voKPxdPn9DkGFhyLsW6i+pMee+bOzBRwNf0ku6l+wOhQzkp4gyV97hrdAfCX
	 ZBDHTwUmLv47iZevXxuO1rFpH8ziJpBoFN0Av/hU34AwQpwsgpaQPwZfBeAfSXJ19J
	 O4SqEM+Lv01JWkNux09YT0g62ZavnLTmaolSQQKcDPvGK6jVuHMzBz3Hq6ZI7bLnv3
	 l49LiDfztr10U7Om+PAWeflr8FlM5exs2FJA9JB8HVDyx2lZvuiMNMEzkzKXTiweB5
	 lRCw75Z/z7q0M279Jm6Vpx7VlvU8Ne9L2z6ATmZxW3C/30R5vTsA8qHL0INr/E00kN
	 Bdu+77wFRM7lQ==
Date: Wed, 28 Aug 2024 15:00:09 +0000
To: philipp.g.hortmann@gmail.com, gregkh@linuxfoundation.org
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH] staging: vt6655: Fix block comment alignment
Message-ID: <20240828145923.78004-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 5f187baa5fc401923a81fddce07d7aeaf7322c44
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch fixes the "Block comments should align the * on each line"
warning detected by checkpatch.pl.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---
 drivers/staging/vt6655/device.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/devic=
e.h
index 0212240ba23f..32d9cbd55222 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -189,10 +189,10 @@ struct vnt_private {
=20
 =09u8=09=09byBBType; /* 0:11A, 1:11B, 2:11G */
 =09u8=09=09packet_type; /*
-=09=09=09=09       * 0:11a,1:11b,2:11gb (only CCK
-=09=09=09=09       * in BasicRate), 3:11ga (OFDM in
-=09=09=09=09       * Basic Rate)
-=09=09=09=09       */
+=09=09=09=09      * 0:11a,1:11b,2:11gb (only CCK
+=09=09=09=09      * in BasicRate), 3:11ga (OFDM in
+=09=09=09=09      * Basic Rate)
+=09=09=09=09      */
 =09unsigned short wBasicRate;
 =09unsigned char byACKRate;
 =09unsigned char byTopOFDMBasicRate;
--=20
2.34.1


