Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA54405
	for <linux-staging@lists.linux.dev>; Mon,  8 Aug 2022 20:14:42 +0000 (UTC)
Received: from dslb-188-096-136-209.188.096.pools.vodafone-ip.de ([188.96.136.209] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oL98y-0000V9-7E; Mon, 08 Aug 2022 22:14:32 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/5] staging: r8188eu: remove two unused defines
Date: Mon,  8 Aug 2022 22:14:04 +0200
Message-Id: <20220808201405.68966-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808201405.68966-1-martin@kaiser.cx>
References: <20220808201405.68966-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HPQ_PUBLIC_DIS and LPQ_PUBLIC_DIS are not used by the r8188eu driver.
Remove them.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtl8188e_spec.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_spec.h b/drivers/staging/r8188eu/include/rtl8188e_spec.h
index 011da538df5f..5d12ba46e205 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_spec.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_spec.h
@@ -925,8 +925,6 @@ Current IOREG MAP
 
 /* 	0x0200h ~ 0x027Fh	TXDMA Configuration */
 
-#define HPQ_PUBLIC_DIS			BIT(24)
-#define LPQ_PUBLIC_DIS			BIT(25)
 #define LD_RQPN				BIT(31)
 
 /* 2TDECTRL */
-- 
2.30.2

