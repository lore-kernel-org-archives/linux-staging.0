Received: from forward200a.mail.yandex.net (forward200a.mail.yandex.net [178.154.239.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABBB31AF31
	for <linux-staging@lists.linux.dev>; Fri, 12 Sep 2025 16:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757694836; cv=none; b=LANm/Axp07wZg1C/PRgvO65BbI6ng2QoKGVH2SV5DYenKKvrjTMNlPfXfiPwQKvQcakjEAX5KL18dnie/++4PNQJEmW3PJ1Amw0SckZpp/gtFlNADvuIhB2wgmMASfQ10h6pC2MRAaV1rZGRsOHqucdX6RPFro8g/PzWrvWxBTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757694836; c=relaxed/simple;
	bh=zCkNOJymvoBu1SpL3OWeIa0g3zh1RhZ+FgOJutrMNfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AZUILntuP0aQANR7d301HWGDHt/sPAr1H39v06Xz2wWB8XovwmbxxrNnbfhjWAnllF+skdA9zI65X2Gk2iUJJRCqr6K8nd7B5S+ElzNY98zOApdyig8Q/hO/1nedytsZGc16+kRVJaHcq6+leAXBJrChLkL97xep92YfAeSe+oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=HcmDPXTj; arc=none smtp.client-ip=178.154.239.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="HcmDPXTj"
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d102])
	by forward200a.mail.yandex.net (Yandex) with ESMTPS id E66208394E
	for <linux-staging@lists.linux.dev>; Fri, 12 Sep 2025 19:27:29 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:93:0:640:a6b9:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id 12F29C0051;
	Fri, 12 Sep 2025 19:27:22 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id IRPNrLDM2Os0-SJ2475Cl;
	Fri, 12 Sep 2025 19:27:21 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1757694441;
	bh=PCaAlaWp8LVECg4JwoFxljnvY13wEesqETHXhJjF7wM=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=HcmDPXTj7mdMZ3aUvzzI6eG4675bsfXPe4+kXTqi7d1E5yqh3x4h0X4ajzB7+BpQs
	 5SnRzPU7GTIhQduizKtM9GsUk7MHm0HDzjxMZ7WKxscEtw67ZubdwsSK0pxpaw/vXc
	 s2HwUvJB1dTaiI06s0Qv7dbf5tHSgBvBk5OXvySA=
Authentication-Results: mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH] staging: sm750fb: rename camel case variable
Date: Fri, 12 Sep 2025 16:26:27 +0000
Message-ID: <20250912162627.95010-1-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename regValue to reg_value to follow kernel coding style.

Signed-off-by: Ahmet Sezgin Duran <ahmet@sezginduran.net>
---
 drivers/staging/sm750fb/sm750_accel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 7ac2e7b6ea0f..b07c1aa68621 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -17,9 +17,9 @@
 
 #include "sm750.h"
 #include "sm750_accel.h"
-static inline void write_dpr(struct lynx_accel *accel, int offset, u32 regValue)
+static inline void write_dpr(struct lynx_accel *accel, int offset, u32 reg_value)
 {
-	writel(regValue, accel->dpr_base + offset);
+	writel(reg_value, accel->dpr_base + offset);
 }
 
 static inline u32 read_dpr(struct lynx_accel *accel, int offset)
-- 
2.47.3

