Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [178.154.239.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5D032E692
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 05:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779513332; cv=none; b=OFhA6zz6Ezd0LvcPdir5xJUqs//f5bhq5ncfqZPCWfrNBJvE+AQ4xiYd5cJrOssh/AxZB0u/Qcf2h3fRrM0BPM1z+koHx6Mv5ZZD01ciqlDd73DLWHNNumObNvnMqSABnCBmnEK96XyzeS0qBjAOI4HWC0NrN7jC9T5o7hl/V/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779513332; c=relaxed/simple;
	bh=tm+9vvsTReF3573YCo1i3Q/KWcCGV/4bLS6dafRlr9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tEZyNWgAn+PA/iplo+5T9qjIvw/w+u+rTDNlQy1+J4DsWufnXi7BhARGr0ehIKNl6XDgGZ90lad7pCDJFinYSuyqdB4qFK7xo+TGADV6eTszaH8ebxW9QJFPE3JzA5qMXqjcqrIFGo4Q76U0b4cvYpLKIFU0VFdvrc+ptVpgoLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=VspJ2Tlm; arc=none smtp.client-ip=178.154.239.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="VspJ2Tlm"
Received: from mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:27a5:0:640:93ca:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id E2682C006C;
	Sat, 23 May 2026 08:15:22 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (smtp) with ESMTPSA id DFNL0fJe2Ko0-oobSE2Ow;
	Sat, 23 May 2026 08:15:22 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779513322;
	bh=r+U23zr9A1yaCGijp+/mJG1U0f98IpdMdSvDaEN04Z0=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=VspJ2TlmqHEjF6POqpguLrlCnsBg8Hb14BejmeIKmjQvOmeDKPoOHlNM10te0kLk+
	 xMIsJrybf5WRUwpmHlj0/jRA6cuTAUdMHBP60UZPA9KhQJrGdP9IZXKyduLVDIgrCl
	 kIAlpz5jdXz7ld3bcXN1wP9ORZ2M39Zilt+/2wNE=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH 4/5] staging: sm750fb: use ARRAY_SIZE macro in fb_find_mode loop
Date: Sat, 23 May 2026 05:15:08 +0000
Message-ID: <20260523051509.166152-5-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523051509.166152-1-ahmet@sezginduran.net>
References: <20260523051509.166152-1-ahmet@sezginduran.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The loop in lynxfb_set_fbinfo() iterates over pdb[] and cdb[] using
a hardcoded bound of 3.

Replace it with ARRAY_SIZE(pdb) so the bound tracks the array.

Signed-off-by: Ahmet Sezgin Duran <ahmet@sezginduran.net>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fff9c35ee7b0..465615b528fd 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -764,7 +764,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 			g_fbmode[index] = g_fbmode[0];
 	}
 
-	for (i = 0; i < 3; i++) {
+	for (i = 0; i < ARRAY_SIZE(pdb); i++) {
 		ret = fb_find_mode(var, info, g_fbmode[index],
 				   pdb[i], cdb[i], NULL, 8);
 
-- 
2.53.0

