Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B5B85626
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735209531; cv=none; b=mBqtngK3A+lvqIJscedahpS2b6SELk/SWfyF+HTVFrjiNE6aexri8AMtlTCrOSdbgiPOR0o2WMa6zUOtC9JXR4Z4F3f6OxGdlSeBOwRzbObpxFHVA2BqqgA7gBU7L5br3rJifwgKJblkyLNNaP/OmDlTNesgfjqhxXnBuG+6Teg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735209531; c=relaxed/simple;
	bh=eZAeiZqv605jzk1Iz0TLCeNIjFiA68r/U2bYYzd11BM=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=l7NjVuG2anshdp0JnhO7NUe9anpzDUgGYxtsqFyeT6EIIm4ReypCmI0hy4O1NzFdYtiJNEaVQmg+3DT169vCj9qTDKdi4xk5nJhfg5BAt11XF+Fiy+5GI2N57yEBweNpOrCEMbx2f3nsl13HFPmLrdlNDw1xciZUsFSl9WuiX0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ariccio.me; spf=pass smtp.mailfrom=ariccio.me; dkim=pass (2048-bit key) header.d=ariccio.me header.i=@ariccio.me header.b=WfQwfggJ; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ariccio.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ariccio.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ariccio.me header.i=@ariccio.me header.b="WfQwfggJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariccio.me;
	s=protonmail3; t=1735209515; x=1735468715;
	bh=eZAeiZqv605jzk1Iz0TLCeNIjFiA68r/U2bYYzd11BM=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=WfQwfggJXLU2RtZm+bz8yRlREM7aOplfbw4WBuFPSq2lSVX1A/Bqp/xnLHcpxYOUt
	 IxfWPd1w9aTuZQWjh5aaTxm8lMw5ziLqESmzAcut9KXAnNjRnF6ElAfHb+hpo2xlVX
	 y43P7dDUZmFyikll6oLb2Dj8Gk4KmJQIiwCZXV3hkUE4HA9OKrl5B2rzSiJEDyC6Mu
	 BLSvvQz/U1yplA4/aDWbUtgfY/cPMcI/OaW2RiuJ4KodZrOHEIhLZoFgjUJrN9VyGR
	 FzehHPpVxI/QRfjzjDeu/GctsU5vez9u+684sZ3NDXOYxd32WL3gs016V3NkIVrDLF
	 9sTivg1kX3t+g==
Date: Thu, 26 Dec 2024 10:38:31 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
From: Antonio Riccio <linux@ariccio.me>
Subject: [PATCH] staging: vme_user: vme_tsi148.c: avoid parenthesis line ending
Message-ID: <Z20yIvcQOGHMfufx@stream-circuit>
Feedback-ID: 117734652:user:proton
X-Pm-Message-ID: d9d2c9fee967e928d6e800ffd3fb57d8f8e128cb
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Adhere to Linux Kernel coding style.

Reported by checkpatch

CHECK: Lines should not end with a '('

Signed-off-by: Antonio Riccio <linux@ariccio.me>
---
 drivers/staging/vme_user/vme_tsi148.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_us=
er/vme_tsi148.c
index 31a44025e08f..733594dde9ae 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -761,8 +761,7 @@ static int tsi148_alloc_resource(struct vme_master_reso=
urce *image,
 =09=09goto err_resource;
 =09}
=20
-=09image->kern_base =3D ioremap(
-=09=09image->bus_resource.start, size);
+=09image->kern_base =3D ioremap(image->bus_resource.start, size);
 =09if (!image->kern_base) {
 =09=09dev_err(tsi148_bridge->parent, "Failed to remap resource\n");
 =09=09retval =3D -ENOMEM;
--=20
2.43.0


