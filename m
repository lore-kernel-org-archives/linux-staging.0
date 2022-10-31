Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136F98F46
	for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 20:54:59 +0000 (UTC)
Received: from dslb-084-059-234-234.084.059.pools.vodafone-ip.de ([84.59.234.234] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1opbo8-0006z9-8f; Mon, 31 Oct 2022 21:54:56 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/3] staging: r8188eu: use ieee80211_get_SA
Date: Mon, 31 Oct 2022 21:54:12 +0100
Message-Id: <20221031205412.124871-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031205412.124871-1-martin@kaiser.cx>
References: <20221031205412.124871-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use ieee80211_get_SA in update_recvframe_phyinfo_88e instead of the
driver-specific get_sa function.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
index 4e9d8c8285c4..9a61eef8550b 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
@@ -135,7 +135,7 @@ void update_recvframe_phyinfo_88e(struct recv_frame *precvframe, struct phy_stat
 			sa = padapter->mlmepriv.cur_network.network.MacAddress;
 		/* to do Ad-hoc */
 	} else {
-		sa = get_sa(wlanhdr);
+		sa = ieee80211_get_SA(hdr);
 	}
 
 	pstapriv = &padapter->stapriv;
-- 
2.30.2

