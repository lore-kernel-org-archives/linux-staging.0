Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BF872
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 17:12:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 273A261373;
	Tue, 19 Oct 2021 17:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634663570;
	bh=bc7KkLTUR0tpDMuwQRfNl+jOSo8UDFSrP47Qy8mmyVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PqlzLd0MjEgAu//QvYbJvsz9IpHHLljE2p9cBiPU1AeOeGsSM/FPgxQ6jNL+e4cpR
	 REAb5/0D0ulGrP2zsu+dfI5jDCjstLb+8iU8nYNelmK5DtftHxdTQis9KXqJMfJ9lB
	 WwJDl7m2xrGsdVZT1NGwkRo5kuNyuLQqyJuS9wJVe1gl2yVUVOXbEzBntJLQ41ILBU
	 u5SHQWFDycMfM2ZL8A6oVXcCPlR/Bfx4ugeoaF9+UnfjBcI4gU5bZU7PgqRxSMgjI3
	 +a6+o7ALbF4H7t6fN8u5K/FN0f1BSPZGXBtCNqvRef3oLy8qaqrKu1Oe3apzrm+fgR
	 3o8u+e5y+bMDw==
From: Jakub Kicinski <kuba@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 5/8] staging: rtl8712: prepare for const netdev->dev_addr
Date: Tue, 19 Oct 2021 10:12:40 -0700
Message-Id: <20211019171243.1412240-6-kuba@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211019171243.1412240-1-kuba@kernel.org>
References: <20211019171243.1412240-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

netdev->dev_addr will be const soon, make sure the qualifier
is respected by drivers.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/staging/rtl8712/os_intfs.c    | 3 ++-
 drivers/staging/rtl8712/rtl871x_cmd.c | 2 +-
 drivers/staging/rtl8712/rtl871x_cmd.h | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index beb9137c198c..d15d52c0d1a7 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -388,7 +388,8 @@ static int netdev_open(struct net_device *pnetdev)
 			 * address.
 			 */
 			msleep(200);
-			r8712_setMacAddr_cmd(padapter, (u8 *)pnetdev->dev_addr);
+			r8712_setMacAddr_cmd(padapter,
+					     (const u8 *)pnetdev->dev_addr);
 			/*
 			 * The "myid" function will get the wifi mac address
 			 * from eeprompriv structure instead of netdev
diff --git a/drivers/staging/rtl8712/rtl871x_cmd.c b/drivers/staging/rtl8712/rtl871x_cmd.c
index 75716f59044d..acda930722b2 100644
--- a/drivers/staging/rtl8712/rtl871x_cmd.c
+++ b/drivers/staging/rtl8712/rtl871x_cmd.c
@@ -554,7 +554,7 @@ void r8712_setstakey_cmd(struct _adapter *padapter, u8 *psta, u8 unicast_key)
 	r8712_enqueue_cmd(pcmdpriv, ph2c);
 }
 
-void r8712_setMacAddr_cmd(struct _adapter *padapter, u8 *mac_addr)
+void r8712_setMacAddr_cmd(struct _adapter *padapter, const u8 *mac_addr)
 {
 	struct cmd_priv	*pcmdpriv = &padapter->cmdpriv;
 	struct cmd_obj *ph2c;
diff --git a/drivers/staging/rtl8712/rtl871x_cmd.h b/drivers/staging/rtl8712/rtl871x_cmd.h
index bf6f0c6a86e5..ddd69c4ae208 100644
--- a/drivers/staging/rtl8712/rtl871x_cmd.h
+++ b/drivers/staging/rtl8712/rtl871x_cmd.h
@@ -718,7 +718,7 @@ struct DisconnectCtrlEx_param {
 #define H2C_CMD_OVERFLOW		0x06
 #define H2C_RESERVED			0x07
 
-void r8712_setMacAddr_cmd(struct _adapter *padapter, u8 *mac_addr);
+void r8712_setMacAddr_cmd(struct _adapter *padapter, const u8 *mac_addr);
 u8 r8712_sitesurvey_cmd(struct _adapter *padapter,
 			struct ndis_802_11_ssid *pssid);
 int r8712_createbss_cmd(struct _adapter *padapter);
-- 
2.31.1

