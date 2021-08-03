Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E5C2FB3
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 20:15:26 +0000 (UTC)
Received: from dslb-188-104-062-095.188.104.pools.vodafone-ip.de ([188.104.62.95] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mB0ou-0007wl-6C; Tue, 03 Aug 2021 22:15:24 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/6] staging: r8188eu: remove RT_TRACE and DBG_88E prints from osdep_service.c
Date: Tue,  3 Aug 2021 22:15:08 +0200
Message-Id: <20210803201511.29000-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803201511.29000-1-martin@kaiser.cx>
References: <20210803201511.29000-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should use the standard mechanism for debug prints. Remove the prints
that use driver-specific macros.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/osdep_service.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 99ddc535e5ea..e00775730bad 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -366,11 +366,9 @@ int rtw_change_ifname(struct adapter *padapter, const char *ifname)
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
@@ -455,8 +453,6 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf)
 	if (rtw_cbuf_full(cbuf))
 		return _FAIL;
 
-	if (0)
-		DBG_88E("%s on %u\n", __func__, cbuf->write);
 	cbuf->bufs[cbuf->write] = buf;
 	cbuf->write = (cbuf->write+1)%cbuf->size;
 
@@ -476,8 +472,6 @@ void *rtw_cbuf_pop(struct rtw_cbuf *cbuf)
 	if (rtw_cbuf_empty(cbuf))
 		return NULL;
 
-	if (0)
-		DBG_88E("%s on %u\n", __func__, cbuf->read);
 	buf = cbuf->bufs[cbuf->read];
 	cbuf->read = (cbuf->read+1)%cbuf->size;
 
-- 
2.20.1

