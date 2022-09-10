Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7D81C02
	for <linux-staging@lists.linux.dev>; Sat, 10 Sep 2022 18:02:58 +0000 (UTC)
Received: from ipservice-092-217-076-063.092.217.pools.vodafone-ip.de ([92.217.76.63] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oX4oZ-0000f7-SX; Sat, 10 Sep 2022 20:02:47 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/4] staging: r8188eu: remove empty rtw_set_scan_deny macro
Date: Sat, 10 Sep 2022 20:02:33 +0200
Message-Id: <20220910180236.489808-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220910180236.489808-1-martin@kaiser.cx>
References: <20220910180236.489808-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtw_set_scan_deny macro does nothing. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme.c    | 2 --
 drivers/staging/r8188eu/core/rtw_xmit.c    | 3 ---
 drivers/staging/r8188eu/include/rtw_mlme.h | 1 -
 3 files changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 2c80635b6478..596bb03b6ee3 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -904,8 +904,6 @@ void rtw_indicate_connect(struct adapter *padapter)
 	}
 
 	pmlmepriv->to_roaming = 0;
-
-	rtw_set_scan_deny(padapter, 3000);
 }
 
 /*
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index d41d1d09d8ae..98864fc55b25 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -550,9 +550,6 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		}
 	}
 
-	if ((pattrib->ether_type == 0x888e) || (pattrib->dhcp_pkt == 1))
-		rtw_set_scan_deny(padapter, 3000);
-
 	/*  If EAPOL , ARP , OR DHCP packet, driver must be in active mode. */
 	if ((pattrib->ether_type == 0x0806) || (pattrib->ether_type == 0x888e) || (pattrib->dhcp_pkt == 1))
 		rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_SPECIAL_PACKET, 1);
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index a959e2100c3f..30fb9b7d7ad2 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -540,7 +540,6 @@ void rtw_scan_timeout_handler(struct adapter *adapter);
 #define rtw_is_scan_deny(adapter) false
 #define rtw_clear_scan_deny(adapter) do {} while (0)
 #define rtw_set_scan_deny_timer_hdl(adapter) do {} while (0)
-#define rtw_set_scan_deny(adapter, ms) do {} while (0)
 
 void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv);
 
-- 
2.30.2

