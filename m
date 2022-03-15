Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32472914
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 20:51:07 +0000 (UTC)
Received: from ipservice-092-217-079-029.092.217.pools.vodafone-ip.de ([92.217.79.29] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nUE8B-00084h-0d; Tue, 15 Mar 2022 21:50:59 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 4/6] staging: r8188eu: make rtl8188e_process_phy_info static
Date: Tue, 15 Mar 2022 21:50:39 +0100
Message-Id: <20220315205041.2714168-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315205041.2714168-1-martin@kaiser.cx>
References: <20220315205041.2714168-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtl8188e_process_phy_info is used only in rtl8188e_rxdesc.c. Make the
function static and remove its prototype from rtl8188e_recv.h.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c   | 2 +-
 drivers/staging/r8188eu/include/rtl8188e_recv.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
index 387af789797d..9bf7a9248026 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
@@ -45,7 +45,7 @@ static void process_link_qual(struct adapter *padapter, struct recv_frame *prfra
 	signal_stat->avg_val = signal_stat->total_val / signal_stat->total_num;
 }
 
-void rtl8188e_process_phy_info(struct adapter *padapter, void *prframe)
+static void rtl8188e_process_phy_info(struct adapter *padapter, void *prframe)
 {
 	struct recv_frame *precvframe = (struct recv_frame *)prframe;
 
diff --git a/drivers/staging/r8188eu/include/rtl8188e_recv.h b/drivers/staging/r8188eu/include/rtl8188e_recv.h
index 8d06815d0374..b752c5c06309 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_recv.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_recv.h
@@ -36,7 +36,6 @@ enum rx_packet_type {
 s32 rtl8188eu_init_recv_priv(struct adapter *padapter);
 void rtl8188eu_free_recv_priv(struct adapter * padapter);
 void rtl8188eu_recv_tasklet(unsigned long priv);
-void rtl8188e_process_phy_info(struct adapter * padapter, void *prframe);
 void update_recvframe_phyinfo_88e(struct recv_frame *fra, struct phy_stat *phy);
 void update_recvframe_attrib_88e(struct recv_frame *fra, struct recv_stat *stat);
 
-- 
2.30.2

