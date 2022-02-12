Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F9F2589
	for <linux-staging@lists.linux.dev>; Sat, 12 Feb 2022 16:17:55 +0000 (UTC)
Received: from dslb-188-097-215-215.188.097.pools.vodafone-ip.de ([188.97.215.215] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nIv5l-0007YM-Ko; Sat, 12 Feb 2022 17:17:45 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/10] staging: r8188eu: set path a explicitly
Date: Sat, 12 Feb 2022 17:17:28 +0100
Message-Id: <20220212161737.381841-2-martin@kaiser.cx>
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

We've already limited the rtw_wx_write_rf function to RF_PATH_A in commit
3b011b097c38 ("staging: r8188eu: limit rf register writes to path a").

Set RF_PATH_A explicitly when we call rtl8188e_PHY_SetRFReg. This will
make it easier later to verify that all callers of rtl8188e_PHY_SetRFReg
use path a.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index c41d75666568..8c49df724461 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2088,7 +2088,7 @@ static int rtw_wx_write_rf(struct net_device *dev,
 
 	addr = *((u32 *)extra + 1);
 	data32 = *((u32 *)extra + 2);
-	rtl8188e_PHY_SetRFReg(padapter, path, addr, 0xFFFFF, data32);
+	rtl8188e_PHY_SetRFReg(padapter, RF_PATH_A, addr, 0xFFFFF, data32);
 
 	return 0;
 }
-- 
2.30.2

