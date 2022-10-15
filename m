Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF1620E4
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 15:11:40 +0000 (UTC)
Received: from ipservice-092-217-066-135.092.217.pools.vodafone-ip.de ([92.217.66.135] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ojip7-0006sp-4g; Sat, 15 Oct 2022 17:11:37 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 07/10] staging: r8188eu: don't include rtw_led.h from rtw_cmd.h
Date: Sat, 15 Oct 2022 17:11:12 +0200
Message-Id: <20221015151115.232095-8-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221015151115.232095-1-martin@kaiser.cx>
References: <20221015151115.232095-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtw_cmd.h does not need any definitions from the led layer, there's
no reason to include rtw_led.h.

When I tried to remove this component

struct led_priv {
   struct adapter *padapter;
   ...

I saw compiler errors because of this chain of include files:
drv_types.h -> rtw_cmd.h -> rtw_led.h

rtw_led.h uses struct adapter before it sees the definiton near the end
of drv_types.h. (It seems that a simple struct adapter * prevents this
problem.)

The best option for fixing this issue is to not include rtw_led.h in
rtw_cmd.h.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_cmd.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 20a65beed166..2f4595f13e86 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -6,7 +6,6 @@
 
 #include "wlan_bssdef.h"
 #include "rtw_rf.h"
-#include "rtw_led.h"
 
 #include "osdep_service.h"
 #include "ieee80211.h" /*  <ieee80211/ieee80211.h> */
-- 
2.30.2

