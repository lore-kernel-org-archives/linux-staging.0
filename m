Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC1C2587
	for <linux-staging@lists.linux.dev>; Sat, 12 Feb 2022 16:17:57 +0000 (UTC)
Received: from dslb-188-097-215-215.188.097.pools.vodafone-ip.de ([188.97.215.215] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nIv5p-0007YM-1u; Sat, 12 Feb 2022 17:17:49 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 05/10] staging: r8188eu: clarify that bb_reg_dump uses only path a
Date: Sat, 12 Feb 2022 17:17:32 +0100
Message-Id: <20220212161737.381841-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220212161737.381841-1-martin@kaiser.cx>
References: <20220212161737.381841-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The path variable is always 0 in bb_reg_dump. Remove the path variable
and replace the constant 0 with RF_PATH_A to make it clearer that path
a is used.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 548ed6f965f8..e815ae223f53 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3538,13 +3538,13 @@ static void bb_reg_dump(struct adapter *padapter)
 
 static void rf_reg_dump(struct adapter *padapter)
 {
-	int i, j = 1, path = 0;
+	int i, j = 1;
 	u32 value;
 
 	pr_info("\n ======= RF REG =======\n");
-	pr_info("\nRF_Path(%x)\n", path);
+	pr_info("\nRF_Path(%x)\n", RF_PATH_A);
 	for (i = 0; i < 0x100; i++) {
-		value = rtl8188e_PHY_QueryRFReg(padapter, path, i, 0xffffffff);
+		value = rtl8188e_PHY_QueryRFReg(padapter, RF_PATH_A, i, 0xffffffff);
 		if (j % 4 == 1)
 			pr_info("0x%02x ", i);
 		pr_info(" 0x%08x ", value);
-- 
2.30.2

