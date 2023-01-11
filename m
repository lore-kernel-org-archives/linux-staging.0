Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E37A92A
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 19:57:01 +0000 (UTC)
Received: from dslb-188-096-145-172.188.096.pools.vodafone-ip.de ([188.96.145.172] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pFhDV-0005F2-3Z; Wed, 11 Jan 2023 20:56:57 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 05/20] staging: r8188eu: remove async write function prototypes
Date: Wed, 11 Jan 2023 20:56:25 +0100
Message-Id: <20230111195640.306748-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111195640.306748-1-martin@kaiser.cx>
References: <20230111195640.306748-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some prototypes for async write functions which are not present in
the r8188eu driver.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_io.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index f9394329b674..6ce099e91e20 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -227,22 +227,6 @@ void rtw_write_port_cancel(struct adapter *adapter);
 
 void rtw_write_scsi(struct adapter *adapter, u32 cnt, u8 *pmem);
 
-void async_write8(struct adapter *adapter, u32 addr, u8 val,
-		  void (*_async_io_callback)(struct adapter *padater,
-					     struct io_req *pio_req,
-					     u8 *cnxt), u8 *cnxt);
-void async_write16(struct adapter *adapter, u32 addr, u16 val,
-		   void (*_async_io_callback)(struct adapter *padater,
-					      struct io_req *pio_req,
-					      u8 *cnxt), u8 *cnxt);
-void async_write32(struct adapter *adapter, u32 addr, u32 val,
-		   void (*_async_io_callback)(struct adapter *padater,
-					      struct io_req *pio_req,
-					      u8 *cnxt), u8 *cnxt);
-
-void async_write_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
-void async_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
-
 void dev_power_down(struct adapter *Adapter, u8 bpwrup);
 
 #endif	/* _RTL8711_IO_H_ */
-- 
2.30.2

