Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BD771
	for <linux-staging@lists.linux.dev>; Sat, 17 Apr 2021 18:01:07 +0000 (UTC)
Received: from ipservice-092-217-095-235.092.217.pools.vodafone-ip.de ([92.217.95.235] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lXpFh-0002pi-3x; Sat, 17 Apr 2021 20:01:05 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/4] staging: rtl8188eu: cmdThread is a task_struct
Date: Sat, 17 Apr 2021 20:00:36 +0200
Message-Id: <20210417180037.17806-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210417180037.17806-1-martin@kaiser.cx>
References: <20210417180037.17806-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cmdThread is the return value of kthread_run, i.e. a struct task_struct.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/include/drv_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/include/drv_types.h b/drivers/staging/rtl8188eu/include/drv_types.h
index 0a3acb378d6d..4116051a9a65 100644
--- a/drivers/staging/rtl8188eu/include/drv_types.h
+++ b/drivers/staging/rtl8188eu/include/drv_types.h
@@ -150,7 +150,7 @@ struct adapter {
 
 	u8	hw_init_completed;
 
-	void *cmdThread;
+	struct task_struct *cmdThread;
 	struct  net_device *pnetdev;
 	struct  net_device *pmondev;
 
-- 
2.20.1

