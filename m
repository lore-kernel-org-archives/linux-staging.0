Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA752C9D
	for <linux-staging@lists.linux.dev>; Sun, 19 Dec 2021 18:39:53 +0000 (UTC)
Received: from dslb-188-097-041-189.188.097.pools.vodafone-ip.de ([188.97.41.189] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mz165-0000Iw-U5; Sun, 19 Dec 2021 19:39:49 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 7/9] staging: r8188: remove unused power command
Date: Sun, 19 Dec 2021 19:39:24 +0100
Message-Id: <20211219183926.4746-8-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211219183926.4746-1-martin@kaiser.cx>
References: <20211219183926.4746-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

None of the remaining power transition steps used PWR_CMD_READ.
It can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/HalPwrSeqCmd.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/HalPwrSeqCmd.h b/drivers/staging/r8188eu/include/HalPwrSeqCmd.h
index 1667a22f0ac4..49c02cce569e 100644
--- a/drivers/staging/r8188eu/include/HalPwrSeqCmd.h
+++ b/drivers/staging/r8188eu/include/HalPwrSeqCmd.h
@@ -9,11 +9,6 @@
 /*---------------------------------------------*/
 /* 3 The value of cmd: 4 bits */
 /*---------------------------------------------*/
-#define PWR_CMD_READ			0x00
-     /*  offset: the read register offset */
-     /*  msk: the mask of the read value */
-     /*  value: N/A, left by 0 */
-     /*  note: dirver shall implement this function by read & msk */
 
 #define PWR_CMD_WRITE			0x01
      /*  offset: the read register offset */
-- 
2.20.1

