Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C685242BD
	for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 20:24:53 +0000 (UTC)
Received: from dslb-178-004-174-067.178.004.pools.vodafone-ip.de ([178.4.174.67] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nWl3c-0006W7-RL; Tue, 22 Mar 2022 21:24:44 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/4] staging: r8188eu: make _rtw_init_mlme_priv static
Date: Tue, 22 Mar 2022 21:24:36 +0100
Message-Id: <20220322202439.157999-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220322202439.157999-1-martin@kaiser.cx>
References: <20220322202439.157999-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The _rtw_init_mlme_priv function is used only in rtw_mlme.c.
It can be declared as static.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme.c    | 2 +-
 drivers/staging/r8188eu/include/rtw_mlme.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 6f0bff186477..a98712e85d6d 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -31,7 +31,7 @@ u8 rtw_to_roaming(struct adapter *adapter)
 	return adapter->mlmepriv.to_roaming;
 }
 
-int _rtw_init_mlme_priv(struct adapter *padapter)
+static int _rtw_init_mlme_priv(struct adapter *padapter)
 {
 	int	i;
 	u8	*pbuf;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index 42d850f9d777..01de253c0376 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -558,8 +558,6 @@ void rtw_scan_timeout_handler(struct adapter *adapter);
 #define rtw_set_scan_deny_timer_hdl(adapter) do {} while (0)
 #define rtw_set_scan_deny(adapter, ms) do {} while (0)
 
-int _rtw_init_mlme_priv(struct adapter *padapter);
-
 void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv);
 
 void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv);
-- 
2.30.2

