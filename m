Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277536116
	for <linux-staging@lists.linux.dev>; Mon,  6 Feb 2023 21:01:40 +0000 (UTC)
Received: from ipservice-092-217-084-033.092.217.pools.vodafone-ip.de ([92.217.84.33] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pP8cI-000876-HV; Mon, 06 Feb 2023 22:01:34 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/3] staging: r8188eu: make ips_enter static
Date: Mon,  6 Feb 2023 22:01:22 +0100
Message-Id: <20230206210124.150142-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230206210124.150142-1-martin@kaiser.cx>
References: <20230206210124.150142-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ips_enter function is used only in rtw_pwrctrl.c. We can make this
function static.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 2 +-
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 5290ac36f08c..e70d78357bcb 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -8,7 +8,7 @@
 #include "../include/osdep_intf.h"
 #include "../include/linux/usb.h"
 
-void ips_enter(struct adapter *padapter)
+static void ips_enter(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
 	struct xmit_priv *pxmit_priv = &padapter->xmitpriv;
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 6e9fdd66fad1..56492ab0f78d 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -99,7 +99,6 @@ void rtw_set_firmware_ps_mode(struct adapter *adapter, u8 mode);
 void rtw_set_ps_mode(struct adapter *adapter, u8 ps_mode, u8 smart_ps,
 		     u8 bcn_ant_mode);
 void LeaveAllPowerSaveMode(struct adapter *adapter);
-void ips_enter(struct adapter *padapter);
 int ips_leave(struct adapter *padapter);
 
 void rtw_ps_processor(struct adapter *padapter);
-- 
2.30.2

