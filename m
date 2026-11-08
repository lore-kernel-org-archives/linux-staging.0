Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.32.148.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794100296;
	b=oyZP6h3a7a67F+2qwjV0G0bAUk31m5mzjKlANPvVEeZKZ+daO8h/NUcd5nTiZxrMr/lH
	 8vYs+w9OYxPSZakrcJaTGHgyCtEDc5KnzPESCjgP5BATusvyG9r5wh7e3R9lNfMjoenW8
	 j3vQx18SFzQ9r70QX/IN9cw27hOZ0OdB2RJSIaGUdsvpq6qQ+/V3y5Lmd2/hyG3PPy4Us
	 6/13v+tlmluZn7XfFtRo1mZNmNRtFxpLdLjapIZby4x9qFuspCoLI8pG5oFvituabMIs4
	 Qgudz6qSekxK/ydmVd8kMV+9hQDNtqSG9FiY75XIILvMpZ0RkWCrNalW6w064Ut9Jdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794100296;
	h=DMARC-Filter:DKIM-Signature:Subject:X-sib-id:Origin-messageId:From:
	 Date:Cc:Message-Id:List-Unsubscribe-Post:Feedback-ID:List-Unsubscribe:
	 X-CSA-Complaints:X-Mailin-EID:To:Mime-Version:X-Mailer:
	 Content-Transfer-Encoding;
	bh=sZfzNXh4BND9cCS6sfS5q9SmaLVYUprSC4+0dzXm2Xo=;
	b=YlHh/PLipYLRj5jt7MIrTAuWi33e9I0pyO1+smDRVwuO4ZsJEYDfXACOFmJ7uv9ulwce
	 UJfjItWfWZE23WTgbNEcPnIvkEXuhneMqDOl01RpqX50Fj6Xp6Uj+7ALbfPdW1/K7wz8w
	 cCFpAgCgWcAA8n/FzLzGRqZJYlBVLRdwjEnC7oEmo235GHNPEXGVGorU5JpQ6ygftUxTu
	 zCHVKFqoq/JKN/e8iZcp6Lm3qyEDHRNGKuZreaSCADe2DMS2RS2tr5nRMkhzaROnApMm4
	 pDnvgEWuuh2ZVy9lcrX4gYHoQZBhCs9iJG9BmJd1NKX8iWUEYCeiLcUjt5pomUcNfDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tubot.lat;
	spf=pass smtp.mailfrom=gx.d.sender-sib.com;
	dkim=pass header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=k60BzePF;
	arc=none smtp.remote-ip=77.32.148.24
Received: from gx.d.sender-sib.com (gx.d.sender-sib.com [77.32.148.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C870606A326
	for <linux-staging@lists.linux.dev>; Sun,  8 Nov 2026 01:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C870606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tubot.lat
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gx.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=k60BzePF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tubot.lat;
 q=dns/txt; s=brevo1; bh=sZfzNXh4BND9cCS6sfS5q9SmaLVYUprSC4+0dzXm2Xo=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=k60BzePF9M1s3+5gWxQjMM69tloGzZ6YciE3vmmhyH05+Vx+wHfGy9tzunUwJ5zmoo9D75TXEb+A
        yvbbEZimBw8dIvKyOW4Z6sqWRO85Q6Oev2vnytkxlfPg2C4n4DhP87tvrKShcFisyH0vwvjELFRK
        ImydluAupIteRvFjSer6RdLcmM5wDl31W37vtwtq+XdmEpeLMnEjZJO+JA8eqGW1af/w1EBtBIYs
        9wOkCTu8NjBykO7ZMO93n5yU+9L+xG0tzfyjZWioYS2+cmRJeA/93tjkkiWwJoBxkFJWvkSOUxBI
        rD1y3zLLnkSfoc1qg9kCyOD77zSOpZlEZ9L7hg==
Subject: [PATCH v2] staging: sm750fb: fix remaining spelling mistakes in readme
X-sib-id: aN3w1nBwXx1KQJMfnR2FQekITOco47tc9-VZrcZCRa-W-fY9Hros_9xA2B2_s72kMjuaJCUTs74KDybnaP00y6pUNzY0HEa9Ggak5lyTrBuqpoyfv04uzB4dNMvO2XeSzmtPMOUnYiVtaX1Wd_IVzoA0HKFvA4XHVvVvZroMCYCjyTdppAZoNRfQTDU
Origin-messageId: <20261108011131.1124831-1-DelaySystem@tubot.lat>
From: "DelaySystem" <DelaySystem@tubot.lat>
Date: Sat,  7 Nov 2026 17:11:31 -0800
Cc: <linux-fbdev@vger.kernel.org>,  <linux-staging@lists.linux.dev>,  <linux-kernel@vger.kernel.org>,  "DelaySystem" <delaysystem@tubot.lat>
Message-Id: <20261108011131.1124831-1-DelaySystem@tubot.lat>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.24:11287567_-1:11287567:Sendinblue
X-CSA-Complaints: csa-complaints@eco.de
X-Mailin-EID: NDczOTMwODc4fmxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2fjwyMDI2MTEwODAxMTEzMS4xMTI0ODMxLTEtRGVsYXlTeXN0ZW1AdHVib3QubGF0Pn5neC5kLnNlbmRlci1zaWIuY29t
To: <sudipm.mukherjee@gmail.com>,<teddy.wang@siliconmotion.com>,<gregkh@linuxfoundation.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable


Fix two spelling mistakes in the driver readme:

"Silicon MOtion" -> "Silicon Motion"
"otherparm" -> "otherparam" (matching the example above it)

Signed-off-by: DelaySystem <DelaySystem@tubot.lat>
---
v2: resend in plain text via git send-email; v1 was corrupted by the
webmail send path (HTML part, whitespace mangled).

Note: this complements Hussain Sitamouwala's unmerged patch
<20261104112629.180890-1-husainsitamuwala21@gmail.com>, which fixes
"defaulty" and "althernative" in this same file. The two patches touch
different lines and do not conflict.

 drivers/staging/sm750fb/readme | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/readme b/drivers/staging/sm750fb/readm=
e
index cfa45958b9d2..dd8ba1a85695 100644
--- a/drivers/staging/sm750fb/readme
+++ b/drivers/staging/sm750fb/readme
@@ -1,5 +1,5 @@
 Introduction:
-	SM750 of Silicon MOtion is pci express display controller device.
+	SM750 of Silicon Motion is pci express display controller device.
 	The SM750 embedded graphics features include:
 	- dual display
 	- 2D acceleration
@@ -27,7 +27,7 @@ About the kernel module parameter of driver:
 		ahead of parameters,so,it looks like:
 		video=3Dsm750fb:noaccel,1280x1024@60,otherparam,etc...
 		it equal to modular method with below command:
-		insmod ./sm750fb.ko g_option=3D"noaccel:1280x1024@60:otherparm:etc..."
+		insmod ./sm750fb.ko g_option=3D"noaccel:1280x1024@60:otherparam:etc..."
=20
 	2) if you put 800x600 into the parameter without bpp and
 		refresh rate, kernel driver will defaulty use 16bpp and 60hz
--=20
2.34.1


