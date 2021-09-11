Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDBA3FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 14:16:11 +0000 (UTC)
Received: from dslb-084-059-243-091.084.059.pools.vodafone-ip.de ([84.59.243.91] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mP3nc-0006bt-5X; Sat, 11 Sep 2021 16:16:08 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 11/12] staging: r8188eu: remove unused variable cpwm_tog
Date: Sat, 11 Sep 2021 16:15:20 +0200
Message-Id: <20210911141521.24901-12-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210911141521.24901-1-martin@kaiser.cx>
References: <20210911141521.24901-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpwm_tog in struct pwrctrl_priv is not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 54a3e6461f47..db049fdd1bdb 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -61,7 +61,6 @@ enum { /*  for ips_mode */
 
 struct pwrctrl_priv {
 	struct semaphore lock;
-	volatile u8 cpwm_tog; /*  toggling */
 
 	u8	pwr_mode;
 	u8	smart_ps;
-- 
2.20.1

