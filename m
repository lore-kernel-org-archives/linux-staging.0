Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E939D1C08
	for <linux-staging@lists.linux.dev>; Sat,  9 Jul 2022 17:10:22 +0000 (UTC)
Received: from dslb-188-096-144-007.188.096.pools.vodafone-ip.de ([188.96.144.7] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oADy9-0005n0-6Z; Sat, 09 Jul 2022 19:10:13 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/14] staging: r8188eu: remove unused eeprom defines
Date: Sat,  9 Jul 2022 19:09:47 +0200
Message-Id: <20220709171000.180481-2-martin@kaiser.cx>
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

Remove some eeprom-related defines which are not used by the r8188eu
driver. This driver uses BOOT_FROM_EEPROM and EEPROM_EN instead of the
defines that this patch removes.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtl8188e_spec.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_spec.h b/drivers/staging/r8188eu/include/rtl8188e_spec.h
index ce5dd2e5b72a..9e7b1f89037c 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_spec.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_spec.h
@@ -426,12 +426,6 @@
 #define	MAX_MSS_DENSITY_2T		0x13
 #define	MAX_MSS_DENSITY_1T		0x0A
 
-/*  EEPROM enable when set 1 */
-#define	CmdEEPROM_En			BIT(5)
-/*  System EEPROM select, 0: boot from E-FUSE, 1: The EEPROM used is 9346 */
-#define	CmdEERPOMSEL			BIT(4)
-#define	Cmd9346CR_9356SEL		BIT(4)
-
 /*        8192C GPIO MUX Configuration Register (offset 0x40, 4 byte) */
 #define	GPIOSEL_GPIO			0
 #define	GPIOSEL_ENBT			BIT(5)
-- 
2.30.2

