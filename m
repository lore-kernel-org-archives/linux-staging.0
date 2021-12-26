Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D169E2CA0
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 21:25:55 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1b1c-0000qQ-SD; Sun, 26 Dec 2021 22:25:52 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/10] staging: r8188eu: remove unused prototype
Date: Sun, 26 Dec 2021 22:25:35 +0100
Message-Id: <20211226212535.197989-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211226212535.197989-1-martin@kaiser.cx>
References: <20211226212535.197989-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the prototype for wifirate2_ratetbl_inx, it is not needed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index c08b60ec1e64..adc03862bc03 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -4176,8 +4176,6 @@ static int rtw_pm_set(struct net_device *dev,
 	return ret;
 }
 
-extern int wifirate2_ratetbl_inx(unsigned char rate);
-
 static iw_handler rtw_handlers[] = {
 	IW_HANDLER(SIOCGIWNAME, rtw_wx_get_name),
 	IW_HANDLER(SIOCGIWFREQ, rtw_wx_get_freq),
-- 
2.30.2

