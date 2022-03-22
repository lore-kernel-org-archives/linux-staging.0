Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ADF614B
	for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 20:24:56 +0000 (UTC)
Received: from dslb-178-004-174-067.178.004.pools.vodafone-ip.de ([178.4.174.67] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nWl3f-0006W7-Hj; Tue, 22 Mar 2022 21:24:47 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/4] staging: r8188eu: remove empty rtw_fwdbg_event_callback
Date: Tue, 22 Mar 2022 21:24:39 +0100
Message-Id: <20220322202439.157999-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220322202439.157999-1-martin@kaiser.cx>
References: <20220322202439.157999-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the empty function rtw_fwdbg_event_callback.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme.c        | 4 ----
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 4 +---
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 4ef50224c775..f1e1627641cb 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -747,10 +747,6 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	rtw_os_xmit_schedule(adapter);
 }
 
-void rtw_fwdbg_event_callback(struct adapter *adapter, u8 *pbuf)
-{
-}
-
 static void free_scanqueue(struct	mlme_priv *pmlmepriv)
 {
 	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 3da7b93ba5e9..bab6eeae6fc9 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -744,8 +744,6 @@ struct C2HEvent_Header {
 	unsigned int rsvd;
 };
 
-void rtw_fwdbg_event_callback(struct adapter *adapter, u8 *pbuf);
-
 enum rtw_c2h_event {
 	GEN_EVT_CODE(_Read_MACREG) = 0, /*0*/
 	GEN_EVT_CODE(_Read_BBREG),
@@ -799,7 +797,7 @@ static struct fwevent wlanevents[] = {
 	{0, NULL},
 	{0, NULL},
 	{0, NULL},
-	{0, rtw_fwdbg_event_callback},
+	{0, NULL},
 	{0, NULL},	 /*20*/
 	{0, NULL},
 	{0, NULL},
-- 
2.30.2

