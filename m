Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710916D15
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 18:12:29 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MTR6K-1l8Zoi3GkW-00Toty; Sun, 11 Apr 2021 20:12:24 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 07/10] staging: vchiq_core: use BITSET_WORD macro
Date: Sun, 11 Apr 2021 20:11:37 +0200
Message-Id: <1618164700-21150-8-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
References: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:RIQvgbePrBcrCydC1R634IhLCcpozBaHhIIdoS52+PJN06v46Ba
 hupZDRlPYwrLknHX801T/aaDhFKRpl303s8u37C3dwfFhZKn7/xOA53GIx7nRGpyg9mBspw
 rgzXuaAQj3x6fzrn6AmyM36Ybiv40Z1v0si31sra0QMxtGQGdYP4+v7hos8K/IwK5wD/UX+
 9NPkkWxVrv31cUtKy5VyQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vjBo+IIrGDM=:Tt04wOtLzem+JwobWmsDSv
 LPWCptr/Kml7KQCd+bPF0fJA8nBGBxrQuOElmgyRuhvfNYor0hy0l7w7Htx5qw9YQ/NlZ0kI7
 /+uhkJ8b30qdFAf3qBSY61stxHpbRKDiz3sdHFymFqR1LDcOMisHdU79HWLOOjdOpcHOapBsj
 mECQis6An5BHsUt/LtsCMKB8+z0ojaVC836pGy/aENDxOynmVdLmO9DqO0E8S0d31iRXOj/0X
 KWX3rScusdSBqUx66lKj1QJ7Izi1WCMTcFmYkTN6xlxaVDbGXO6sZU0lWqzOBaYz4bdMIR8PB
 VHxR1iPhTlupPUhBSFP8wJz1kKup+4G1/cuqkTzwu9lb/BULIT46800X7NECj/KhKpd1zoXO+
 Y5ctZUXWiy4vIHEUzNApAchPEbcmHD+QMdRLJzEfC4pfHO9m28Tv6U+zYNy8AlAQGHyDW15iW
 sTjzVqcivo8ISBDHaa15ttsB69FddO0heB1jPNvfK1+xhRdKu8uS
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Use this macro to make the index retrieval less opaque.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 22989866..2db2332 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -547,7 +547,7 @@ request_poll(struct vchiq_state *state, struct vchiq_service *service,
 	} while (atomic_cmpxchg(&service->poll_flags, value,
 		 value | BIT(poll_type)) != value);
 
-	index = service->localport >> 5;
+	index = BITSET_WORD(service->localport);
 	do {
 		value = atomic_read(&state->poll_services[index]);
 	} while (atomic_cmpxchg(&state->poll_services[index],
-- 
2.7.4

