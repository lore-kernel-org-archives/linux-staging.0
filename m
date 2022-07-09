Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA20B1C15
	for <linux-staging@lists.linux.dev>; Sat,  9 Jul 2022 17:10:24 +0000 (UTC)
Received: from dslb-188-096-144-007.188.096.pools.vodafone-ip.de ([188.96.144.7] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oADyA-0005n0-Vs; Sat, 09 Jul 2022 19:10:15 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 03/14] staging: r8188eu: remove eeprom function prototypes
Date: Sat,  9 Jul 2022 19:09:49 +0200
Message-Id: <20220709171000.180481-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220709171000.180481-1-martin@kaiser.cx>
References: <20220709171000.180481-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove prototypes for non-existing eeprom functions. It seems that r8188eu
has efuses but no eeprom.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_eeprom.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_eeprom.h b/drivers/staging/r8188eu/include/rtw_eeprom.h
index 40c61f7a03be..0a8792428927 100644
--- a/drivers/staging/r8188eu/include/rtw_eeprom.h
+++ b/drivers/staging/r8188eu/include/rtw_eeprom.h
@@ -15,10 +15,4 @@ struct eeprom_priv {
 	u8		efuse_eeprom_data[HWSET_MAX_SIZE_512] __aligned(4);
 };
 
-void eeprom_write16(struct adapter *padapter, u16 reg, u16 data);
-u16 eeprom_read16(struct adapter *padapter, u16 reg);
-void read_eeprom_content(struct adapter *padapter);
-void eeprom_read_sz(struct adapter *adapt, u16 reg, u8 *data, u32 sz);
-void read_eeprom_content_by_attrib(struct adapter *padapter);
-
 #endif  /* __RTL871X_EEPROM_H__ */
-- 
2.30.2

