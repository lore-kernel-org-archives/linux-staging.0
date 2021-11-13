Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D109B2C85
	for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 18:55:57 +0000 (UTC)
Received: from dslb-188-096-147-224.188.096.pools.vodafone-ip.de ([188.96.147.224] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mlyBu-0002H8-Uc; Sat, 13 Nov 2021 19:55:55 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/15] staging: r8188eu: remove defines for efuse type
Date: Sat, 13 Nov 2021 19:55:13 +0100
Message-Id: <20211113185518.23941-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211113185518.23941-1-martin@kaiser.cx>
References: <20211113185518.23941-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We've removed all code to handle efuse types. The last step is to
remove the defines for bt and wifi efuse types.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_efuse.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_efuse.h b/drivers/staging/r8188eu/include/rtw_efuse.h
index fe421fff127a..825f880a71da 100644
--- a/drivers/staging/r8188eu/include/rtw_efuse.h
+++ b/drivers/staging/r8188eu/include/rtw_efuse.h
@@ -8,9 +8,6 @@
 
 #define	EFUSE_ERROE_HANDLE		1
 
-#define	EFUSE_WIFI				0
-#define	EFUSE_BT				1
-
 /* E-Fuse */
 #define EFUSE_MAP_SIZE      512
 #define EFUSE_MAX_SIZE      256
-- 
2.20.1

