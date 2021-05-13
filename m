Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F3F71
	for <linux-staging@lists.linux.dev>; Thu, 13 May 2021 22:08:35 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
	by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <colin.king@canonical.com>)
	id 1lhJVQ-0007RT-95; Thu, 13 May 2021 22:08:32 +0000
From: Colin King <colin.king@canonical.com>
To: David Kershner <david.kershner@unisys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: unisys: visorinput: remove redundant assignment of variable led
Date: Thu, 13 May 2021 23:08:32 +0100
Message-Id: <20210513220832.137336-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Colin Ian King <colin.king@canonical.com>

The variable led  is being assigned a value that is never used before
a return statement. The assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/unisys/visorinput/visorinput.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/unisys/visorinput/visorinput.c b/drivers/staging/unisys/visorinput/visorinput.c
index 6d202cba8575..426deab22d62 100644
--- a/drivers/staging/unisys/visorinput/visorinput.c
+++ b/drivers/staging/unisys/visorinput/visorinput.c
@@ -556,7 +556,6 @@ static void handle_locking_key(struct input_dev *visorinput_dev, int keycode,
 		led = LED_NUML;
 		break;
 	default:
-		led = -1;
 		return;
 	}
 	if (test_bit(led, visorinput_dev->led) != desired_state) {
-- 
2.30.2

