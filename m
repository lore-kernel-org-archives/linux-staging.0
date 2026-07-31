Received: from red-soft.ru (red-soft.ru [188.246.186.2])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E86A330652
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 07:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.246.186.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481292; cv=none; b=PTfrFqcHq3Jp0/pdfTJWEziVIi3mZiHrHvVkBcX5VHBgBPrnC/pMB6NE7S3Aacp9n3QBUftLQCfXI+eu7jeUQJiueFVC5IDPktIxANMN3GB7nQRaX7DkN9BnbMR0YRRJOCiWFaVpILYLWJAK31KCxN41woADcNDGrjyvBBpffcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481292; c=relaxed/simple;
	bh=94NxW6S6rgTFntzcX1zBAoMm0RpW+nrszNYRfBBOXlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sT1MffGyR0LOZwGBxM0u8hCYZQWPj0w7WqJNrZ/8TSRQu1WixhbDpWpY4ra80l/fE2UUzsVaeXhNjjWpCJRD4rN7nApRvSAHWZDRGl0vK44IFL/TTQOizT9t6DGuNt1vcgcyWP5ln/G/Hkt01MhZrcQxjGnD2nMdxmb0o8npaLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=red-soft.ru; spf=pass smtp.mailfrom=red-soft.ru; arc=none smtp.client-ip=188.246.186.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=red-soft.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red-soft.ru
Received: from localhost.localdomain (unknown [10.81.7.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by red-soft.ru (Postfix) with ESMTPSA id B6F99262E69;
	Fri, 31 Jul 2026 10:01:33 +0300 (MSK)
From: Roman Demidov <roman.demidov@red-soft.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov@red-soft.ru>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Archit Anant <architanant5@gmail.com>,
	Ayushman Rout <ayushmanrout27@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	artem.chernyshev@red-soft.ru
Subject: [PATCH] staging: rtl8723bs: Fix NULL pointer dereference in c2h_wk_callback
Date: Fri, 31 Jul 2026 10:00:50 +0300
Message-ID: <20260731070052.6582-1-roman.demidov@red-soft.ru>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: roman.demidov@red-soft.ru
X-KSMG-AntiSpam-Info: LuaCore: 113 0.3.113 b83a27b0bdff87150e3aba5d24ea90b4a220db99, {Tracking_ml_letters}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 204910 [Jul 31 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.22
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2026/07/31 03:38:00 #28597279
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1

If the kmalloc function fails to allocate memory, the c2h_evt variable
will be NULL. Its subsequent use in the rtw_hal_c2h_valid() function
will result in a NULL pointer dereference.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Roman Demidov <roman.demidov@red-soft.ru>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b932670f5d63..3c1149828718 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1716,6 +1716,8 @@ static void c2h_wk_callback(struct work_struct *work)
 					kfree(c2h_evt);
 					continue;
 				}
+			} else {
+				continue;
 			}
 		}
 
-- 
2.53.0

