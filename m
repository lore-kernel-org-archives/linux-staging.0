Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A1B2C9D
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 18:00:19 +0000 (UTC)
Received: from dslb-188-104-058-096.188.104.pools.vodafone-ip.de ([188.104.58.96] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n459U-0005Ye-FA; Sun, 02 Jan 2022 19:00:16 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/5] staging: r8188eu: fix_rate is set but not used.
Date: Sun,  2 Jan 2022 18:59:30 +0100
Message-Id: <20220102175932.89127-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220102175932.89127-1-martin@kaiser.cx>
References: <20220102175932.89127-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix_rate in struct adapter is set but not used. Remove the variable and
the private ioctl code to set it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_dm.c    | 1 -
 drivers/staging/r8188eu/include/drv_types.h  | 2 --
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 6 ------
 3 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index 685431034495..bd6eb3878060 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -84,7 +84,6 @@ void rtl8188e_InitHalDm(struct adapter *Adapter)
 	dm_InitGPIOSetting(Adapter);
 	Update_ODM_ComInfo_88E(Adapter);
 	ODM_DMInit(dm_odm);
-	Adapter->fix_rate = 0xFF;
 }
 
 void rtl8188e_HalDmWatchDog(struct adapter *Adapter)
diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index c586a35014d8..2dd5ebaaa921 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -264,8 +264,6 @@ struct adapter {
 	unsigned char			br_ip[4];
 	struct br_ext_info		ethBrExtInfo;
 
-	u8	fix_rate;
-
 	unsigned char     in_cta_test;
 };
 
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 9d277151a5ee..6e9a6d4db089 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3978,12 +3978,6 @@ static int rtw_dbg_port(struct net_device *dev,
 			DBG_88E("turn %s the bShowGetP2PState Variable\n", (extra_arg == 1) ? "on" : "off");
 			padapter->bShowGetP2PState = extra_arg;
 			break;
-		case 0xaa:
-			if (extra_arg > 0x13)
-				extra_arg = 0xFF;
-			DBG_88E("chang data rate to :0x%02x\n", extra_arg);
-			padapter->fix_rate = extra_arg;
-			break;
 		case 0xdd:/* registers dump, 0 for mac reg, 1 for bb reg, 2 for rf reg */
 			if (extra_arg == 0)
 				mac_reg_dump(padapter);
-- 
2.30.2

