Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8042F2E
	for <linux-staging@lists.linux.dev>; Sun,  6 Feb 2022 16:18:30 +0000 (UTC)
Received: from ipservice-092-217-075-184.092.217.pools.vodafone-ip.de ([92.217.75.184] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nGkF9-0001bS-Gx; Sun, 06 Feb 2022 17:18:27 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 13/14] staging: r8188eu: not_indic_disco is unused
Date: Sun,  6 Feb 2022 17:18:08 +0100
Message-Id: <20220206161809.423031-14-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206161809.423031-1-martin@kaiser.cx>
References: <20220206161809.423031-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

not_indic_disco in struct mlme_priv is not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_mlme.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index 77169c15080a..30ee46ccdb21 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -316,7 +316,6 @@ struct mlme_priv {
 
 	u8 *nic_hdl;
 
-	u8 not_indic_disco;
 	struct list_head *pscanned;
 	struct __queue free_bss_pool;
 	struct __queue scanned_queue;
-- 
2.30.2

