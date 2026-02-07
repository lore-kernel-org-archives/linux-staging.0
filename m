Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587822E8B80
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 18:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770488735; cv=none; b=LYsmYxooZNM3LRQoq8gi6h3hKkzc0BIbFUR6BC82QBwK4f9Omzjj+Wysf8+OtWphZwxi0NEezpdloAyDyhZXXMWcb0yE2EotL90tn5jNpmdPBb2TpYULPYyg4QoA/L4wiZHd4bNtM0Yy+UqIbQBUPhyKaTvjIjYPD1J8Z5eciFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770488735; c=relaxed/simple;
	bh=TqQRQAgLpnoeJnjEfRZrwOfRbA/IQ515u7PNWyLtlS8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IMts5g3v4YMbAIMqamH3PomQlgdv9La8E+4XBoa64z9KhMQhQOm5zIP++WDwJiO1RZojY5Bwz9iPUao9vubJAKMG2wYFZfehdLlhsJJzvKL0kWcaZ5P3xBxQsrdwehr1gb81oMzXm2s9ahaS3N1gXU+xVmBkm86eyoKtI14vI68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=FTwebr73; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="FTwebr73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1770488730; x=1770747930;
	bh=56V8dwyNUY7+H844g2WOVkL54+urY9E+cEQzwEqJUXc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FTwebr73AAI/UlvuzHMGugoEFKx6Aum0HFzupoVuNiG+wtETKrYcStq0NDesrZkj0
	 qLV5GVytcrz5dPpTiRf+yIi7ticOg81rPR5F3Sk+Ga3sYNO03WBC8BxlFr+q3DSXbi
	 hGB6NCQMCFzBixbqFMKznsZn7iWynQDXRF54sLoQRRjeIyLmAEyH95ovQEA4BKhWVF
	 qo1SgXVvOl1jOTxZGCxDx1mb/V/I1BJoCZYnyGWhxLNHKSzH5lEjxoQPazcupF0K/x
	 HBu8g9WDQYH50kZJwWwrfXDF97ZvtvD6x0ET1Pow0zwbEl/ShEBsexupcoPVMuCnp+
	 tdgEYfkzi+Sgw==
Date: Sat, 07 Feb 2026 18:25:23 +0000
To: Marc Dietrich <marvin24@gmx.de>
From: claude-bot <andrz2-claude@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: nvec: fix block comment style
Message-ID: <20260207182513.764195-1-andrz2-claude@proton.me>
Feedback-ID: 180211986:user:proton
X-Pm-Message-ID: cf5bce4738f203e914fc53d57df2f51ba3f2ad68
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix multi-line block comment to follow kernel coding style.
Block comments should use * on subsequent lines and have the
trailing */ on a separate line.

Signed-off-by: claude-bot <andrz2-claude@proton.me>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08..62013019a 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,10 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 =09=09=09nvec_tx_set(nvec);
 =09=09=09to_send =3D nvec->tx->data[0];
 =09=09=09nvec->tx->pos =3D 1;
-=09=09=09/* delay ACK due to AP20 HW Bug
-=09=09=09   do not replace by usleep_range */
+=09=09=09/*
+=09=09=09 * delay ACK due to AP20 HW Bug
+=09=09=09 * do not replace by usleep_range
+=09=09=09 */
 =09=09=09udelay(33);
 =09=09} else if (status =3D=3D (I2C_SL_IRQ)) {
 =09=09=09nvec->rx->data[1] =3D received;
--=20
2.53.0


