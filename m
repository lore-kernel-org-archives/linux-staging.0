Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8AC2EAE5
	for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 18:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726077745; cv=none; b=eBN1Kr4keVMvolx/EOZmoav8+KoJe1JbcxWQlsp0NdHVbcCwsul3iBDEz+TkdSgupuw8uFN8JXEFOQ3T7P72f75M/44FZecOF10pmUVwZA9/VeP5L5G2CkWunUNOWzGtKfBvKbU3HUXyteo3ynyLOEepAPVbtLuOhaOYyKRHGcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726077745; c=relaxed/simple;
	bh=JsC3UbeAOry4i3hZKqF5bCpco4jHXbR/yYpwAHNRCcM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RovX0Fu8zk/U5QdX5ghD5CczNDn4RYO+uJzMaVtdhdHwOYxS+fy5AYeYoInztIKMrLKzqE9uZB5bJ4s1E7W2wLSyBgoo3lNEj82NGYt8Pe6Ya26A2W1FQGGO8H+2yY3yLFJuWFiS3sd1I1M+PxTe5M6wNBSUdVM0+f5N8lHnN9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=kPkR1XrZ; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="kPkR1XrZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726077741; x=1726336941;
	bh=EUollz0ynXHjxBi/lGQvIBbGGBRXwy/+cd/CajGyCVY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kPkR1XrZYDPyClyayXqRmyxrExtO610pQV3++3KqhbDHZ48t8Voxw/3oXAvRN3OVe
	 9Rwx+sB97NHfhUO3UCqSUbw3W8tn0QxWUgMo+q8g0oSc6zzw8Cq6kkR1zremGMwchg
	 su+z4epJqZ794gBfJnImQqBPJCImGxo/xtzwafNzziGjsf2yq+Zw1MwAhr80dZ3mQ7
	 5koBQ4eH5EOHntqc9NgPrPHigzTlT4gjaQncdNsoXDjvE5mQ+9u9sMkNuMzNs8R53R
	 hJQdofnO9T/EaevuLlBA7zEwzpclKmQs0VO075XU5S509II04FR7UuAtQoBKkfD1KY
	 7vU6lrwgiZqQQ==
Date: Wed, 11 Sep 2024 18:02:19 +0000
To: philipp.g.hortmann@gmail.com, gregkh@linuxfoundation.org
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH] staging: vt6655: mac.h: Fix possible precedence issue in macros
Message-ID: <20240911180149.14474-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 5f41f40d95e98f84cc4a94f7f6ff930cd5557798
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

It is safer to put macro arguments in parentheses. This way, accidental
operator precedence issues can be avoided.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---
 drivers/staging/vt6655/mac.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index acf931c3f5fd..a33af2852227 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,9 +537,9 @@
=20
 /*---------------------  Export Macros ------------------------------*/
=20
-#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, iobase + MAC_REG_PAGE1=
SEL)
+#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, (iobase) + MAC_REG_PAG=
E1SEL)
=20
-#define VT6655_MAC_SELECT_PAGE1(iobase) iowrite8(1, iobase + MAC_REG_PAGE1=
SEL)
+#define VT6655_MAC_SELECT_PAGE1(iobase) iowrite8(1, (iobase) + MAC_REG_PAG=
E1SEL)
=20
 #define MAKEWORD(lb, hb) \
 =09((unsigned short)(((unsigned char)(lb)) | (((unsigned short)((unsigned =
char)(hb))) << 8)))
--=20
2.34.1


