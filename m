Received: from out199-13.us.a.mail.aliyun.com (out199-13.us.a.mail.aliyun.com [47.90.199.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D857C
	for <linux-staging@lists.linux.dev>; Tue, 24 May 2022 10:40:50 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0VEHDH-Y_1653381556;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VEHDH-Y_1653381556)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 24 May 2022 16:39:28 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] staging: r8188eu: Fix kernel-doc
Date: Tue, 24 May 2022 16:39:14 +0800
Message-Id: <20220524083914.68736-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following W=1 kernel warnings:

drivers/staging/r8188eu/hal/rtl8188e_phycfg.c:291: warning: expecting
prototype for Function(). Prototype was for rtl8188e_PHY_SetRFReg()
instead.

drivers/staging/r8188eu/hal/rtl8188e_phycfg.c:257: warning: expecting
prototype for Function(). Prototype was for rtl8188e_PHY_QueryRFReg()
instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 4864dafd887b..6342befec5e0 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -239,7 +239,7 @@ phy_RFSerialWrite(
 }
 
 /**
-* Function:	PHY_QueryRFReg
+* Function:	rtl8188e_PHY_QueryRFReg()
 *
 * OverView:	Query "Specific bits" to RF register (page 8~)
 *
@@ -265,7 +265,7 @@ u32 rtl8188e_PHY_QueryRFReg(struct adapter *Adapter, u32 RegAddr, u32 BitMask)
 }
 
 /**
-* Function:	PHY_SetRFReg
+* Function:	rtl8188e_PHY_SetRFReg()
 *
 * OverView:	Write "Specific bits" to RF register (page 8~)
 *
-- 
2.20.1.7.g153144c

