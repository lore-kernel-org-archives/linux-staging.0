Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937FE2C9D
	for <linux-staging@lists.linux.dev>; Sat, 18 Dec 2021 12:04:45 +0000 (UTC)
Received: from dslb-178-004-169-039.178.004.pools.vodafone-ip.de ([178.4.169.39] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1myYS4-0008I6-SR; Sat, 18 Dec 2021 13:04:36 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/9] staging: r8188: make rx signal strength function static
Date: Sat, 18 Dec 2021 13:04:15 +0100
Message-Id: <20211218120423.29906-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211218120423.29906-1-martin@kaiser.cx>
References: <20211218120423.29906-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The _linked_rx_signal_strength_display function is used only in
rtw_mlme_ext.c. Make the function static and remove the prototype.

While at it, fix a typo in the function name.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 8e04238fb5fc..0aa958f20cd6 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -7124,8 +7124,7 @@ void mlmeext_sta_del_event_callback(struct adapter *padapter)
 Following are the functions for the timer handlers
 
 *****************************************************************************/
-void _linked_rx_signal_strehgth_display(struct adapter *padapter);
-void _linked_rx_signal_strehgth_display(struct adapter *padapter)
+static void _linked_rx_signal_strength_display(struct adapter *padapter)
 {
 	struct mlme_ext_priv    *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info    *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -7186,7 +7185,7 @@ void linked_status_chk(struct adapter *padapter)
 	struct sta_priv		*pstapriv = &padapter->stapriv;
 
 	if (padapter->bRxRSSIDisplay)
-		_linked_rx_signal_strehgth_display(padapter);
+		_linked_rx_signal_strength_display(padapter);
 
 	rtl8188e_sreset_linked_status_check(padapter);
 
-- 
2.20.1

