Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4F62CA2
	for <linux-staging@lists.linux.dev>; Sat,  5 Feb 2022 11:37:57 +0000 (UTC)
Received: from dslb-188-104-059-100.188.104.pools.vodafone-ip.de ([188.104.59.100] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nGJO6-0005c9-H4; Sat, 05 Feb 2022 12:37:54 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 8/8] staging: r8188eu: limit rf register writes to path a
Date: Sat,  5 Feb 2022 12:37:41 +0100
Message-Id: <20220205113741.379070-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220205113741.379070-1-martin@kaiser.cx>
References: <20220205113741.379070-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The r8188eu driver uses only RF_PATH_A.

At the moment, the only exception are private ioctls. It does not make
sense if these ioctls set registers that are not used anywhere else in
the driver.

This patch limits the private ioctl 0x0C, i.e. the rtw_wx_write_rf
function, to RF_PATH_A. For any other setting, we return an error
saying the parameter is invalid.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index c54ec5602ddf..c41d75666568 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2083,6 +2083,9 @@ static int rtw_wx_write_rf(struct net_device *dev,
 	u32 path, addr, data32;
 
 	path = *(u32 *)extra;
+	if (path != RF_PATH_A)
+		return -EINVAL;
+
 	addr = *((u32 *)extra + 1);
 	data32 = *((u32 *)extra + 2);
 	rtl8188e_PHY_SetRFReg(padapter, path, addr, 0xFFFFF, data32);
-- 
2.30.2

