Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1956E2FB7
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 15:37:21 +0000 (UTC)
Received: from dslb-084-059-249-202.084.059.pools.vodafone-ip.de ([84.59.249.202] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mCONw-0003Y3-Vk; Sat, 07 Aug 2021 17:37:17 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 07/12] staging: r8188eu: remove an RT_TRACE print from osdep_service.c
Date: Sat,  7 Aug 2021 17:36:31 +0200
Message-Id: <20210807153636.11712-8-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210807153636.11712-1-martin@kaiser.cx>
References: <20210807153636.11712-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should use the standard mechanism for debug prints. Remove a print that
uses a driver-specific macro.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/osdep_service.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 9f097f2b3ddd..36bb3813c677 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -235,11 +235,9 @@ int rtw_change_ifname(struct adapter *padapter, const char *ifname)
 		ret = register_netdev(pnetdev);
 	else
 		ret = register_netdevice(pnetdev);
-	if (ret != 0) {
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_,
-			 ("register_netdev() failed\n"));
+	if (ret != 0)
 		goto error;
-	}
+
 	rtw_proc_init_one(pnetdev);
 	return 0;
 error:
-- 
2.20.1

