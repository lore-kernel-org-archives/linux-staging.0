Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE96E364A1
	for <linux-staging@lists.linux.dev>; Fri,  5 Jul 2024 20:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.34.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720212540; cv=none; b=p9MR9XEjmnCUzS/uRc31xn8z8K/nUjERm83uL5vHuSmH4dzbdBDu/ar0wbcWeQxB10+IqMOOLTvNnRFDal8sRWzMtWwzTvoNeKa43cuoLlkNxwRTv7O2+E3beu8d6Rz/z279ToxmPaffTASWYBH44+BSEHfR3R77Co2xQCiCf/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720212540; c=relaxed/simple;
	bh=SuvnL/H4+TlZn0kt0QsUBsLm72ME11Kl/+jE6usH8og=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LA6qURHLgJlxrqlMiBOFn7B9x/KgWDV9B4HRkhb7jqfREYtHepnZAgUPSRF8soIF0/1/wNMRteM/K/hcRutzONDxO39of4x36vTI+rW5dHO+I7texTnA4zdmQxMhhEA12SR8Sw/LRy+JqZOdqepuLX7XlXhXwSosGVVRlO8pRho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=t-argos.ru; spf=pass smtp.mailfrom=t-argos.ru; dkim=pass (2048-bit key) header.d=t-argos.ru header.i=@t-argos.ru header.b=ueGVbsCq; arc=none smtp.client-ip=109.73.34.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=t-argos.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-argos.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=t-argos.ru header.i=@t-argos.ru header.b="ueGVbsCq"
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
	by mx1.t-argos.ru (Postfix) with ESMTP id 14E9E100002;
	Fri,  5 Jul 2024 23:45:59 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
	t=1720212359; bh=NbODFl+buakqA8pBykYDl2OyRct9Z6uXLhovbWPeYvM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ueGVbsCqXDRgL4t4Mo413850k9tXho3Woyw862swHmYbAaOKCGJtxztnxGThqGIJq
	 +sVGFgg4MI2KpMZSY4gRFrXut0GUd5lj22o4k55OlSqXij1I6bMaZr4devXczK5Mte
	 fM5t2rKpkwbuIl8CLpIztKZpgt42lSELrfi8hhVnOVyL0g4O4bGlXhkDxzqBCE3K6G
	 0oqjET1cwx8TjsRoGjKHS9k4Ie59XeXmgOCdT/zcTBxDMcaXksZJ3E3zUSwrpfB6Ib
	 VvBuqmmeodP4sQFEHX2wjHTZEc3yRk4eeipctSr84OnUaS7C2QyKj9h6H38lAh7FDl
	 leSpUWtU6qY1Q==
Received: from mx1.t-argos.ru.ru (ta-mail-02.ta.t-argos.ru [172.17.13.212])
	by mx1.t-argos.ru (Postfix) with ESMTP;
	Fri,  5 Jul 2024 23:45:11 +0300 (MSK)
Received: from localhost.localdomain (172.17.215.5) by ta-mail-02
 (172.17.13.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 5 Jul 2024
 23:44:51 +0300
From: Aleksandr Mishin <amishin@t-argos.ru>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Aleksandr Mishin <amishin@t-argos.ru>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, Zhang
 Shurong <zhang_shurong@foxmail.com>, <linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] staging: ks7010: Remove unneeded check in ks_wlan_get_range()
Date: Fri, 5 Jul 2024 23:44:34 +0300
Message-ID: <20240705204434.10541-1-amishin@t-argos.ru>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ta-mail-02.ta.t-argos.ru (172.17.13.212) To ta-mail-02
 (172.17.13.212)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186343 [Jul 05 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 21 0.3.21 ebee5449fc125b2da45f1a6a6bc2c5c0c3ad0e05, {Tracking_from_domain_doesnt_match_to}, t-argos.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;mx1.t-argos.ru.ru:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/05 18:39:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2024/07/05 17:28:00 #25862371
X-KSMG-AntiVirus-Status: Clean, skipped

In ks_wlan_get_range() variable 'i' which value is always 12, is compared
to 2. This check is unneeded and should be removed.

Remove unneeded check to clean up the code.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 13a9930d15b4 ("staging: ks7010: add driver from Nanonote extra-repository")
Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
---
 drivers/staging/ks7010/ks_wlan_net.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
index 0fb97a79ad0b..d56dae73e7ed 100644
--- a/drivers/staging/ks7010/ks_wlan_net.c
+++ b/drivers/staging/ks7010/ks_wlan_net.c
@@ -972,10 +972,7 @@ static int ks_wlan_get_range(struct net_device *dev,
 	 * in bit/s that we can expect using this interface.
 	 * May be use for QoS stuff... Jean II
 	 */
-	if (i > 2)
-		range->throughput = 5000 * 1000;
-	else
-		range->throughput = 1500 * 1000;
+	range->throughput = 5000 * 1000;
 
 	range->min_rts = 0;
 	range->max_rts = 2347;
-- 
2.30.2

