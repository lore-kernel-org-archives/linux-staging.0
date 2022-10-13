Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1751B7B
	for <linux-staging@lists.linux.dev>; Thu, 13 Oct 2022 00:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA21C433C1;
	Thu, 13 Oct 2022 00:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665620325;
	bh=vJu1Y7GbKIjXmmyKAwbmFglhJbzjORDEqYMQcVUSLbM=;
	h=From:To:Cc:Subject:Date:From;
	b=jQtEcWLLvJSuF4fHsyME+ogJgsZEO76ar4J6vQxSuzyg/vnJk2OiEMOtO6uorMKAS
	 z/L2en4kbWUXNOBOaPEG9y+mJDMD/6sEyNjzeZiuxnFcamRfRoO1ztUCo4XlzHM+Z1
	 dRHbzSEX7wCWUoXkk2pQqdAllXo0zuGHFLOAJXrRL4yiaccQjgIv7YJizOe1aufto9
	 /T4P25zbjSESmZxdLp9Peu4hjQIYzsiSFjcfBZcMct5s23tT3ZqHap5c3AAXW6JTo4
	 PMb/q40KpR3XhihsA0KXpg31Xb3uRpSLzENnnYBwY8Yn+Yw/ZyfiRJWGiDomQ6YfGc
	 kJN7dunHRC/iQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	paskripkin@gmail.com,
	gszymaszek@short.pl,
	fmdefrancesco@gmail.com,
	makvihas@gmail.com,
	saurav.girepunje@gmail.com,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.19 01/63] staging: r8188eu: do not spam the kernel log
Date: Wed, 12 Oct 2022 20:17:35 -0400
Message-Id: <20221013001842.1893243-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Michael Straube <straube.linux@gmail.com>

[ Upstream commit 9a4d0d1c21b974454926c3b832b4728679d818eb ]

Drivers should not spam the kernel log if they work properly. Convert
the functions Hal_EfuseParseIDCode88E() and _netdev_open() to use
netdev_dbg() instead of pr_info() so that developers can still enable
it if they want to see this information.

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
Signed-off-by: Michael Straube <straube.linux@gmail.com>
Link: https://lore.kernel.org/r/20220808065023.3175-1-straube.linux@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 3 ++-
 drivers/staging/r8188eu/os_dep/os_intfs.c       | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 5549e7be334a..859acea58d35 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -676,6 +676,7 @@ Hal_EfuseParseIDCode88E(
 	)
 {
 	struct eeprom_priv *pEEPROM = &padapter->eeprompriv;
+	struct net_device *netdev = padapter->pnetdev;
 	u16			EEPROMId;
 
 	/*  Check 0x8129 again for making sure autoload status!! */
@@ -687,7 +688,7 @@ Hal_EfuseParseIDCode88E(
 		pEEPROM->bautoload_fail_flag = false;
 	}
 
-	pr_info("EEPROM ID = 0x%04x\n", EEPROMId);
+	netdev_dbg(netdev, "EEPROM ID = 0x%04x\n", EEPROMId);
 }
 
 static void Hal_ReadPowerValueFromPROM_8188E(struct txpowerinfo24g *pwrInfo24G, u8 *PROMContent, bool AutoLoadFail)
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index aa100b5141e1..f5e3660555a1 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -636,7 +636,7 @@ int _netdev_open(struct net_device *pnetdev)
 		if (status == _FAIL)
 			goto netdev_open_error;
 
-		pr_info("MAC Address = %pM\n", pnetdev->dev_addr);
+		netdev_dbg(pnetdev, "MAC Address = %pM\n", pnetdev->dev_addr);
 
 		status = rtw_start_drv_threads(padapter);
 		if (status == _FAIL) {
-- 
2.35.1

