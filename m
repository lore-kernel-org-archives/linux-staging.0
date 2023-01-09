Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866F45232
	for <linux-staging@lists.linux.dev>; Mon,  9 Jan 2023 21:29:16 +0000 (UTC)
Received: from dslb-188-096-147-178.188.096.pools.vodafone-ip.de ([188.96.147.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pEzhf-0007iD-Tj; Mon, 09 Jan 2023 22:29:11 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 10/12] staging: r8188eu: xmit_priv's vcs_type is not used
Date: Mon,  9 Jan 2023 22:28:50 +0100
Message-Id: <20230109212852.75612-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230109212852.75612-1-martin@kaiser.cx>
References: <20230108185738.597105-1-martin@kaiser.cx>
 <20230109212852.75612-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vcs_type component of struct xmit_priv is not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_xmit.h | 1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 50d9311d3e40..77d79c43209f 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -269,7 +269,6 @@ struct	xmit_priv {
 	struct adapter	*adapter;
 	u8   vcs_setting;
 	u8	vcs;
-	u8	vcs_type;
 	u64	tx_bytes;
 	u64	tx_pkts;
 	u64	tx_drop;
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 2f59bb994796..ae03d39de092 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -394,7 +394,6 @@ static void rtw_init_default_value(struct adapter *padapter)
 	/* xmit_priv */
 	pxmitpriv->vcs_setting = pregistrypriv->vrtl_carrier_sense;
 	pxmitpriv->vcs = pregistrypriv->vcs_type;
-	pxmitpriv->vcs_type = pregistrypriv->vcs_type;
 	pxmitpriv->frag_len = pregistrypriv->frag_thresh;
 
 	/* mlme_priv */
-- 
2.30.2

