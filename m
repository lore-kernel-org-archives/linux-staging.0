Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCE828F9
	for <linux-staging@lists.linux.dev>; Sun,  8 Jan 2023 18:58:06 +0000 (UTC)
Received: from dslb-188-096-147-053.188.096.pools.vodafone-ip.de ([188.96.147.53] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pEarp-0003b8-Ep; Sun, 08 Jan 2023 19:58:01 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 13/13] staging: r8188eu: xmit_priv's vcs_setting is not used
Date: Sun,  8 Jan 2023 19:57:38 +0100
Message-Id: <20230108185738.597105-14-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230108185738.597105-1-martin@kaiser.cx>
References: <20230108185738.597105-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vcs_setting in struct xmit_priv is not used any more. We can remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_xmit.h | 1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index abac0103b53a..cc32167fb4dc 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -267,7 +267,6 @@ struct	xmit_priv {
 	struct __queue free_xmit_queue;
 	uint	frag_len;
 	struct adapter	*adapter;
-	u8   vcs_setting;
 	u64	tx_bytes;
 	u64	tx_pkts;
 	u64	tx_drop;
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index f022f6b1cf3e..cfc24420e70c 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -392,7 +392,6 @@ static void rtw_init_default_value(struct adapter *padapter)
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 
 	/* xmit_priv */
-	pxmitpriv->vcs_setting = pregistrypriv->vrtl_carrier_sense;
 	pxmitpriv->frag_len = pregistrypriv->frag_thresh;
 
 	/* mlme_priv */
-- 
2.30.2

