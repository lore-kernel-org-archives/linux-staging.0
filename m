Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415222585
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 12:49:15 +0000 (UTC)
Received: from ipservice-092-217-068-220.092.217.pools.vodafone-ip.de ([92.217.68.220] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1orf5M-0008Dj-PQ; Sun, 06 Nov 2022 13:49:12 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/9] staging: r8188eu: clean up rtw_hal_init
Date: Sun,  6 Nov 2022 13:48:58 +0100
Message-Id: <20221106124901.720785-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221106124901.720785-1-martin@kaiser.cx>
References: <20221106124901.720785-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the rtw_hal_init function.

Remove the status variable. Exit immediately for errors.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/hal_intf.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 37935aef71ea..13790e32f11c 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -6,24 +6,19 @@
 #include "../include/drv_types.h"
 #include "../include/hal_intf.h"
 
-uint	 rtw_hal_init(struct adapter *adapt)
+uint rtw_hal_init(struct adapter *adapt)
 {
-	uint	status = _SUCCESS;
-
 	adapt->hw_init_completed = false;
 
-	status = rtl8188eu_hal_init(adapt);
+	if (rtl8188eu_hal_init(adapt) != _SUCCESS)
+		return _FAIL;
 
-	if (status == _SUCCESS) {
-		adapt->hw_init_completed = true;
+	adapt->hw_init_completed = true;
 
-		if (adapt->registrypriv.notch_filter == 1)
-			hal_notch_filter_8188e(adapt, 1);
-	} else {
-		adapt->hw_init_completed = false;
-	}
+	if (adapt->registrypriv.notch_filter == 1)
+		hal_notch_filter_8188e(adapt, 1);
 
-	return status;
+	return _SUCCESS;
 }
 
 uint rtw_hal_deinit(struct adapter *adapt)
-- 
2.30.2

