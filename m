Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A53A930
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 19:56:58 +0000 (UTC)
Received: from dslb-188-096-145-172.188.096.pools.vodafone-ip.de ([188.96.145.172] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pFhDR-0005F2-DZ; Wed, 11 Jan 2023 20:56:53 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/20] staging: r8188eu: remove io function prototypes
Date: Wed, 11 Jan 2023 20:56:22 +0100
Message-Id: <20230111195640.306748-3-martin@kaiser.cx>
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

Remove some prototypes for io functions which are not present in the
r8188eu driver.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_io.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index c15b2e873fd5..18e95bccda49 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -203,12 +203,6 @@ struct io_queue {
 	struct	intf_hdl	intf;
 };
 
-uint ioreq_flush(struct adapter *adapter, struct io_queue *ioqueue);
-void sync_ioreq_enqueue(struct io_req *preq, struct io_queue *ioqueue);
-uint sync_ioreq_flush(struct adapter *adapter, struct io_queue *ioqueue);
-uint free_ioreq(struct io_req *preq, struct io_queue *pio_queue);
-struct io_req *alloc_ioreq(struct io_queue *pio_q);
-
 uint register_intf_hdl(u8 *dev, struct intf_hdl *pintfhdl);
 void unregister_intf_hdl(struct intf_hdl *pintfhdl);
 
@@ -273,11 +267,6 @@ void async_write32(struct adapter *adapter, u32 addr, u32 val,
 void async_write_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 void async_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 
-uint alloc_io_queue(struct adapter *adapter);
-void free_io_queue(struct adapter *adapter);
-void async_bus_io(struct io_queue *pio_q);
-void bus_sync_io(struct io_queue *pio_q);
-u32 _ioreq2rwmem(struct io_queue *pio_q);
 void dev_power_down(struct adapter *Adapter, u8 bpwrup);
 
 #endif	/* _RTL8711_IO_H_ */
-- 
2.30.2

