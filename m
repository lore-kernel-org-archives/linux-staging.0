Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C8A72
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 16:50:05 +0000 (UTC)
Received: from dslb-178-004-175-162.178.004.pools.vodafone-ip.de ([178.4.175.162] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mHUC0-0002Ch-Ef; Sat, 21 Aug 2021 18:50:00 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/10] staging: r8188eu: remove unused members of struct _io_ops
Date: Sat, 21 Aug 2021 18:48:58 +0200
Message-Id: <20210821164859.4351-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210821164859.4351-1-martin@kaiser.cx>
References: <20210821164859.4351-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointers which are not used by the r8188eu driver.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_io.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index f1b3074fa075..4b41c7b03972 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -100,13 +100,10 @@ struct _io_ops {
 			  u8 *pmem);
 	void (*_write_mem)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt,
 			   u8 *pmem);
-	void (*_sync_irp_protocol_rw)(struct io_queue *pio_q);
-	u32 (*_read_interrupt)(struct intf_hdl *pintfhdl, u32 addr);
 	u32 (*_read_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt,
 			  u8 *pmem);
 	u32 (*_write_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt,
 			   u8 *pmem);
-	u32 (*_write_scsi)(struct intf_hdl *pintfhdl,u32 cnt, u8 *pmem);
 	void (*_read_port_cancel)(struct intf_hdl *pintfhdl);
 	void (*_write_port_cancel)(struct intf_hdl *pintfhdl);
 };
-- 
2.20.1

