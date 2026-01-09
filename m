Received: from forward203d.mail.yandex.net (forward203d.mail.yandex.net [178.154.239.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DBF50095F
	for <linux-staging@lists.linux.dev>; Fri,  9 Jan 2026 16:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977344; cv=none; b=fay1OLR/qkSQsobkoMTsp2SrNbcSWa2OkiY0At+gdIqtPE5UV4mwZiOmHzjgN+U626X9MsDbbA8e6gbOtDK37im1etmZUJWMRg55i12xYcNva/vTxA3O5cwzWD6TgokIdQ9kBnco8/ge4HdiS5c2maQ11k3AbJsBLJAI4mRcYKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977344; c=relaxed/simple;
	bh=A6grb+OppQKZApEkJ24y1QGD9fggvhGrH2JHgEOxGD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZFl4QUggaxQGPAP3B4T5htDLjBiIp1pBxPrri383dH7LLf8pRpce/dSmrZ7z55VJM1HsWVwzx1P6cTqSdHx1Q8vOot87tPwN444HB+mgeBt6nq9C21Qa7BlCA6pmUXxcoInNfRuBZMvHsyhuCEUSXUsjyIXblgA9QOhyM2nVp0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=ejRUiJ5G; arc=none smtp.client-ip=178.154.239.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="ejRUiJ5G"
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d101])
	by forward203d.mail.yandex.net (Yandex) with ESMTPS id 8CC1687C9D
	for <linux-staging@lists.linux.dev>; Fri, 09 Jan 2026 19:42:46 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:2828:0:640:b833:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id BFD86C0043;
	Fri, 09 Jan 2026 19:42:37 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id VgSRCHvG6W20-wodTwsf8;
	Fri, 09 Jan 2026 19:42:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1767976957;
	bh=NoJ07FTzRbvZ06/7cTUJi0/LrdZFibGjMHnKgQTcMgU=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=ejRUiJ5GoFhCAzhT14dZBe8PKMJ4rZmzVjiCgTFSc2OaqtPTAJbKTwSDj8lMIgBFo
	 8+1x5hzZme6Llj/wRETAwLqEcVK2fbIiAzR9al+FJFNCMEzBa0yrjg4Srf17N5TtqH
	 nmHgU5CBNqg+5RlZSjNto6EWnAsTfooBD5UhZ19Q=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ahmet@sezginduran.net
Subject: [PATCH] staging: sm750fb: make g_fbmode a fixed-size mutable array
Date: Fri,  9 Jan 2026 16:41:40 +0000
Message-ID: <20260109164140.11350-1-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

g_fbmode is modified at runtime. Use an explicit fixed-size array to
avoid a misleading checkpatch warning.

No functional changes.

Signed-off-by: Ahmet Sezgin Duran <ahmet@sezginduran.net>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index d100b9e1d3d5..8f8feb73f61b 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char *g_fbmode[2] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.47.3

