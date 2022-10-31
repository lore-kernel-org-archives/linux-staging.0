Received: from mail.draketalley.com (mail.draketalley.com [3.213.214.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE4A28E1
	for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 14:32:55 +0000 (UTC)
Received: from pop-os.lan (cpe-74-72-139-32.nyc.res.rr.com [74.72.139.32])
	by mail.draketalley.com (Postfix) with ESMTPSA id 5EC0D55DD6;
	Mon, 31 Oct 2022 14:25:31 +0000 (UTC)
From: drake@draketalley.com
To: Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Drake Talley <drake@draketalley.com>
Subject: [PATCH 3/3] staging: qlge: add comment explaining memory barrier
Date: Mon, 31 Oct 2022 10:25:16 -0400
Message-Id: <20221031142516.266704-4-drake@draketalley.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031142516.266704-1-drake@draketalley.com>
References: <20221031142516.266704-1-drake@draketalley.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Drake Talley <drake@draketalley.com>

codestyle change that fixes the following report from checkpatch:

> WARNING: memory barrier without comment
> #2101: FILE: drivers/staging/qlge/qlge_main.c:2101:

The added comment identifies the next item from the circular
buffer (rx_ring->curr_entry) and its handling/unmapping as the two
operations that must not be reordered.  Based on the kernel
documentation for memory barriers in circular buffers
(https://www.kernel.org/doc/Documentation/circular-buffers.txt) and
the presence of atomic operations in the current context I'm assuming
this usage of the memory barrier is akin to what is explained in the
linked doc.

There are a couple of other uncommented usages of memory barriers in
the current file.  If this comment is adequate I can add similar
comments to the others.

Signed-off-by: Drake Talley <drake@draketalley.com>
---
 drivers/staging/qlge/qlge_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index c8403dbb5bad..f70390bce6d8 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -2098,6 +2098,12 @@ static int qlge_clean_outbound_rx_ring(struct rx_ring *rx_ring)
 			     rx_ring->cq_id, prod, rx_ring->cnsmr_idx);
 
 		net_rsp = (struct qlge_ob_mac_iocb_rsp *)rx_ring->curr_entry;
+		/*
+		 * Ensure that the next item from the ring buffer is loaded
+		 * before being processed.
+		 * Adding rmb() prevents the compiler from reordering the read
+		 * and subsequent handling of the outbound completion pointer.
+		 */
 		rmb();
 		switch (net_rsp->opcode) {
 		case OPCODE_OB_MAC_TSO_IOCB:
-- 
2.34.1

