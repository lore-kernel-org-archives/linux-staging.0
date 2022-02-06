Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B7D2F33
	for <linux-staging@lists.linux.dev>; Sun,  6 Feb 2022 16:18:31 +0000 (UTC)
Received: from ipservice-092-217-075-184.092.217.pools.vodafone-ip.de ([92.217.75.184] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nGkFA-0001bS-Bu; Sun, 06 Feb 2022 17:18:28 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 14/14] staging: r8188eu: remove unused struct hostapd_priv
Date: Sun,  6 Feb 2022 17:18:09 +0100
Message-Id: <20220206161809.423031-15-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206161809.423031-1-martin@kaiser.cx>
References: <20220206161809.423031-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct hostapd_priv contains only a pointer to struct adapter.

Remove this struct and the unused phostapdpriv pointer in struct adapter.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/drv_types.h | 1 -
 drivers/staging/r8188eu/include/rtw_mlme.h  | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index b02940accc4e..987dae613d8b 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -174,7 +174,6 @@ struct adapter {
 	struct	pwrctrl_priv	pwrctrlpriv;
 	struct	eeprom_priv eeprompriv;
 	struct	led_priv	ledpriv;
-	struct	hostapd_priv	*phostapdpriv;
 	struct wifidirect_info	wdinfo;
 
 	struct hal_data_8188e haldata;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index 30ee46ccdb21..ed2a50bad66e 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -416,10 +416,6 @@ struct mlme_priv {
 	u8		update_bcn;
 };
 
-struct hostapd_priv {
-	struct adapter *padapter;
-};
-
 int hostapd_mode_init(struct adapter *padapter);
 void hostapd_mode_unload(struct adapter *padapter);
 
-- 
2.30.2

