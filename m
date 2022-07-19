Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E10A3C28
	for <linux-staging@lists.linux.dev>; Tue, 19 Jul 2022 15:53:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [83.149.199.65])
	by mail.ispras.ru (Postfix) with ESMTPS id 5CEC44076251;
	Tue, 19 Jul 2022 15:53:14 +0000 (UTC)
From: Andrey Strachuk <strochuk@ispras.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Strachuk <strochuk@ispras.ru>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ldv-project@linuxtesting.org
Subject: [PATCH] staging: rtl8723bs: remove useless comparison in _rtw_reg_apply_flags()
Date: Tue, 19 Jul 2022 18:53:09 +0300
Message-Id: <20220719155309.463286-1-strochuk@ispras.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Local variable 'ch' is initialized by an address
of field of ieee80211_supported_band structure, so it does
not make sense to compare 'ch' with NULL.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Andrey Strachuk <strochuk@ispras.ru>
Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
---
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
index 5eef1d68c6f0..62fbf9e1b849 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -74,8 +74,7 @@ static void _rtw_reg_apply_flags(struct wiphy *wiphy)
 			for (j = 0; j < sband->n_channels; j++) {
 				ch = &sband->channels[j];
 
-				if (ch)
-					ch->flags = IEEE80211_CHAN_DISABLED;
+				ch->flags = IEEE80211_CHAN_DISABLED;
 			}
 		}
 	}
-- 
2.25.1

