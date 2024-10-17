Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E47227380
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 19:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729192922; cv=none; b=NAWkRd7l8T/p3d8R6yVbsUbVo3Y1DiaYbXo9nDWlWHgqQ+2n+ftqy1iEnt7NSrgC/1poes+FoVEa+3nVBibnybeC/wLvgXPPOJZWcyzgfy48XJHlKR+k442drFoXq1qCWoU/EQMj9Ju1Db1D8b+ZIN2tmQ5kXek3cCs8fv8nzEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729192922; c=relaxed/simple;
	bh=/z9HErCqbN6LERvLOh2Nm4UGnk95lCR5bbQzAQdrsEk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=W+xI1B8+vPvj9Z7RxqKHRmInfKTliC0eXFUE5AK4ijQnNZRrl7B0uYTVdvG+MFv3QnPKdwWgsVZVB0fJOnau2yxI59kolmQknigrRelImRrcLhw+wUmhGyYuATVcZPYS4vTHHBD+Sk2iBM6PnZjqGPWTZgvXsTpFHdY5nfBN+cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=SiuHkyWX; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="SiuHkyWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1729192908; x=1729452108;
	bh=H0InSCB+CfqK+rj6bDo24dP6Vi+PoMRT+qRrc39g6lw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=SiuHkyWXTjzXnCO5WJSPY8YJYa/1+dfuZrRDKEy8sbPh0VuBqYnuP/tEuAeXleYlD
	 qxdjt1IRSaiXMg1jnFPz5ruVu4ZL42P64/hjv5bflyHBUsTX+74TOxzzBZSCz1coR/
	 aQSR2+UbEpK+N1Sxf1s6C2MQ84L6SPx1txxUDpj/ADsoRGhKbt1smvOlOFQm4yYWGx
	 XoXa4SMWPmUCjFtrGcgZAkEoMnj5yy6mTXMsMX4+++tzdHpgaRinzkgTh0xOCVtYDK
	 g1iyV/kTrU+OwV05TP67jLvEdMgCqkU79O4g3NoCktZ4GFgJmMQGfpEy9ep/Gnp8Gu
	 AD4fkDjOwYnLA==
Date: Thu, 17 Oct 2024 19:21:45 +0000
To: dpenkler@gmail.com, gregkh@linuxfoundation.org
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH] staging: gpib: fmh_gpib: Fix typo
Message-ID: <20241017192056.85570-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: d44cd90e117c8557c9e6e329ed9c703b23a4562f
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch fixes a typo: scenerio -> scenario.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpi=
b/fmh_gpib/fmh_gpib.c
index 0e27b3ef1a1d..9a081aae913a 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -528,7 +528,7 @@ static int fmh_gpib_accel_write(gpib_board_t *board, ui=
nt8_t *buffer,
=20
 =09=09/* wait until we are sure we will be able to write the data byte
 =09=09 * into the chip before we send AUX_SEOI.  This prevents a timeout
-=09=09 * scenerio where we send AUX_SEOI but then timeout without getting
+=09=09 * scenario where we send AUX_SEOI but then timeout without getting
 =09=09 * any bytes into the gpib chip.  This will result in the first byte
 =09=09 * of the next write having a spurious EOI set on the first byte.
 =09=09 */
--=20
2.34.1


