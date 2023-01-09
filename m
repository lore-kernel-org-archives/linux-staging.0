Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2432B5234
	for <linux-staging@lists.linux.dev>; Mon,  9 Jan 2023 21:29:13 +0000 (UTC)
Received: from dslb-188-096-147-178.188.096.pools.vodafone-ip.de ([188.96.147.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pEzhc-0007iD-Ly; Mon, 09 Jan 2023 22:29:08 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 06/12] staging: r8188eu: dir_dev is unused
Date: Mon,  9 Jan 2023 22:28:46 +0100
Message-Id: <20230109212852.75612-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230109212852.75612-1-martin@kaiser.cx>
References: <20230108185738.597105-1-martin@kaiser.cx>
 <20230109212852.75612-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dir_dev in struct adapter is not used by the r8188eu driver. It can be
removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/drv_types.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 8fef5759c36a..4803d0c77d70 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -187,7 +187,6 @@ struct adapter {
 	int bup;
 	struct net_device_stats stats;
 	struct iw_statistics iwstats;
-	struct proc_dir_entry *dir_dev;/*  for proc directory */
 
 	int net_closed;
 	u8 bFWReady;
-- 
2.30.2

