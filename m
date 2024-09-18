Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7540B1CB327
	for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 19:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726687295; cv=none; b=RxC9gkb5N4lyr7FHgpzRdwkNKxUaTAbr+oc067WFJUzYkM72eMzgxj24kZOgIGsQldWfUS+X64QLvIs4rXP93L6EwUq76rtyCR3VYgrljeQTX2hNodBK0cIdjGKKLtZSH5ErYIPXNZXFf1C2d7AjvcYcuVO+PhASwdWlSoJ6rEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726687295; c=relaxed/simple;
	bh=W+zVSXjAOcG0MACVhz4X7u9EOeuZwAb+lVR6/aAjToE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OgtwVO1CDVL0wNCn1C79hQ8KMdyB80/Rbw+Gt/LC+H2M4UleYmEp0m0NJ3AW+I+MYdTPo6FqwK13cgsiuGeI4UsQqnLNf7QBaHvb1f3c8IsHeXv9LulVXhNT1djQQEGgHluDWdH+MQcd3EQinj5EdwaDbdFJzSlNZiCyRjrU+10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=e4uarnh1; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="e4uarnh1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726687291; x=1726946491;
	bh=W+zVSXjAOcG0MACVhz4X7u9EOeuZwAb+lVR6/aAjToE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=e4uarnh1+gM504UIcJ2A4OoyVkMJPqdlb58OHbU4SPc8TBpWqTdJHNyrjfHRbYzhy
	 yeO6iLv5X3BdFQeo5Q05vIepoT67NixJ14aWYzKnDeipJ2VxT48QIcs09ArFzgwbAL
	 hwWnhJ9YFpAXAKCBUIvXskY5N0diraDXKfy8Jc77mzMpKJ1vyRL4QmQiz4khI7z88v
	 VpxbZO2U8BardbevgnXkLMZIZS0aXcJC5i7u+maCeJ/c3zMlc6KscQssVras2hxjkV
	 B1paWCHhYvHkhcZbBOkMZ7BKdpMi+OUdXt0S6xLGKQVUBjM9ByUTBVqMcZ1AHYdDNe
	 6CfGgnvZx/z/g==
Date: Wed, 18 Sep 2024 19:21:26 +0000
To: philipp.g.hortmann@gmail.com, gregkh@linuxfoundation.org
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH 08/14] staging: vt6655: s_uGetDataDuration: Rename cbLastFragmentSize parameter
Message-ID: <20240918191959.51539-9-dominik.karol.piatkowski@protonmail.com>
In-Reply-To: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
References: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: d295879f42ca70281d623ebce352966a90f441fc
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch renames cbLastFragmentSize to last_fragment_size in
s_uGetDataDuration function in order to avoid using camel case.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---
 drivers/staging/vt6655/rxtx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 3d7bdcba83a9..1d0b5b8f09c2 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -236,7 +236,7 @@ s_uGetDataDuration(
 =09unsigned short rate,
 =09bool need_ack,
 =09unsigned int frag_idx,
-=09unsigned int cbLastFragmentSize,
+=09unsigned int last_fragment_size,
 =09unsigned int uMACfragNum,
 =09unsigned char byFBOption
 )
@@ -248,7 +248,7 @@ s_uGetDataDuration(
 =09=09bLastFrag =3D true;
=20
 =09if (frag_idx =3D=3D (uMACfragNum - 2))
-=09=09len =3D cbLastFragmentSize;
+=09=09len =3D last_fragment_size;
 =09else
 =09=09len =3D frame_length;
=20
--=20
2.34.1


