Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B55F258A
	for <linux-staging@lists.linux.dev>; Sat, 12 Feb 2022 16:17:55 +0000 (UTC)
Received: from dslb-188-097-215-215.188.097.pools.vodafone-ip.de ([188.97.215.215] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nIv5m-0007YM-Et; Sat, 12 Feb 2022 17:17:46 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/10] staging: r8188eu: write only path a registers in rtw_dbg_port
Date: Sat, 12 Feb 2022 17:17:29 +0100
Message-Id: <20220212161737.381841-3-martin@kaiser.cx>
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

Commit 3b011b097c38 ("staging: r8188eu: limit rf register writes to
path a") limited the rtw_wx_write_rf function to write only rf registers
for path a.

The private ioctl 0x0B invokes the rtw_dbg_port function. This ioctl
can also be used for writing rf registers. We should limit these register
writes to rf path a as well.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 8c49df724461..9d3488c28048 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3621,7 +3621,11 @@ static int rtw_dbg_port(struct net_device *dev,
 		DBG_88E("read RF_reg path(0x%02x), offset(0x%x), value(0x%08x)\n", minor_cmd, arg, rtl8188e_PHY_QueryRFReg(padapter, minor_cmd, arg, 0xffffffff));
 		break;
 	case 0x75:/* write_rf */
-		rtl8188e_PHY_SetRFReg(padapter, minor_cmd, arg, 0xffffffff, extra_arg);
+		if (minor_cmd != RF_PATH_A) {
+			ret = -EINVAL;
+			break;
+		}
+		rtl8188e_PHY_SetRFReg(padapter, RF_PATH_A, arg, 0xffffffff, extra_arg);
 		DBG_88E("write RF_reg path(0x%02x), offset(0x%x), value(0x%08x)\n", minor_cmd, arg, rtl8188e_PHY_QueryRFReg(padapter, minor_cmd, arg, 0xffffffff));
 		break;
 
-- 
2.30.2

