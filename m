Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8030D1C03
	for <linux-staging@lists.linux.dev>; Sat, 10 Sep 2022 18:02:58 +0000 (UTC)
Received: from ipservice-092-217-076-063.092.217.pools.vodafone-ip.de ([92.217.76.63] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oX4oa-0000f7-QL; Sat, 10 Sep 2022 20:02:48 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/4] staging: r8188eu: remove rtw_set_scan_deny_timer_hdl
Date: Sat, 10 Sep 2022 20:02:34 +0200
Message-Id: <20220910180236.489808-3-martin@kaiser.cx>
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

Remove the rtw_set_scan_deny_timer_hdl macro, it's not used.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_mlme.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index 30fb9b7d7ad2..e000f0565458 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -539,7 +539,6 @@ void rtw_scan_timeout_handler(struct adapter *adapter);
  void rtw_dynamic_check_timer_handlder(struct adapter *adapter);
 #define rtw_is_scan_deny(adapter) false
 #define rtw_clear_scan_deny(adapter) do {} while (0)
-#define rtw_set_scan_deny_timer_hdl(adapter) do {} while (0)
 
 void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv);
 
-- 
2.30.2

