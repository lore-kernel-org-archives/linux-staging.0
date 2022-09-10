Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2091C01
	for <linux-staging@lists.linux.dev>; Sat, 10 Sep 2022 18:02:58 +0000 (UTC)
Received: from ipservice-092-217-076-063.092.217.pools.vodafone-ip.de ([92.217.76.63] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oX4ob-0000f7-O2; Sat, 10 Sep 2022 20:02:49 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/4] staging: r8188eu: remove rtw_clear_scan_deny
Date: Sat, 10 Sep 2022 20:02:35 +0200
Message-Id: <20220910180236.489808-4-martin@kaiser.cx>
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

The rtw_clear_scan_deny macro is empty. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme.c    | 3 ---
 drivers/staging/r8188eu/include/rtw_mlme.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 596bb03b6ee3..de722c199cce 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -264,8 +264,6 @@ int rtw_init_mlme_priv(struct adapter *padapter)/* struct	mlme_priv *pmlmepriv)
 
 	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
 
-	rtw_clear_scan_deny(padapter);
-
 	rtw_init_mlme_timer(padapter);
 
 exit:
@@ -928,7 +926,6 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 
 		_clr_fwstate_(pmlmepriv, _FW_LINKED);
 		rtw_led_control(padapter, LED_CTL_NO_LINK);
-		rtw_clear_scan_deny(padapter);
 	}
 	p2p_ps_wk_cmd(padapter, P2P_PS_DISABLE, 1);
 
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index e000f0565458..47bf7ce228aa 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -538,7 +538,6 @@ void rtw_scan_timeout_handler(struct adapter *adapter);
 
  void rtw_dynamic_check_timer_handlder(struct adapter *adapter);
 #define rtw_is_scan_deny(adapter) false
-#define rtw_clear_scan_deny(adapter) do {} while (0)
 
 void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv);
 
-- 
2.30.2

