Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B6A6D11
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 17:06:00 +0000 (UTC)
Received: from ipservice-092-217-079-185.092.217.pools.vodafone-ip.de ([92.217.79.185] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lUBcs-0001Q6-Hj; Wed, 07 Apr 2021 19:05:58 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 06/10] staging: rtl8188eu: clean up rtw_recv_entry
Date: Wed,  7 Apr 2021 19:05:27 +0200
Message-Id: <20210407170531.29356-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407170531.29356-1-martin@kaiser.cx>
References: <20210407170531.29356-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the return type to int, the function returns 0 or 1.
Remove the goto statement, we're not doing any cleanup on exit.
Summarize variable declarations and assignments.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/core/rtw_recv.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_recv.c b/drivers/staging/rtl8188eu/core/rtw_recv.c
index b9b4bc435037..b2fe448d999d 100644
--- a/drivers/staging/rtl8188eu/core/rtw_recv.c
+++ b/drivers/staging/rtl8188eu/core/rtw_recv.c
@@ -1962,27 +1962,18 @@ static int recv_func(struct adapter *padapter, struct recv_frame *rframe)
 	return ret;
 }
 
-s32 rtw_recv_entry(struct recv_frame *precvframe)
+int rtw_recv_entry(struct recv_frame *precvframe)
 {
-	struct adapter *padapter;
-	struct recv_priv *precvpriv;
-	s32 ret = _SUCCESS;
-
-	padapter = precvframe->adapter;
-
-	precvpriv = &padapter->recvpriv;
+	struct adapter *padapter = precvframe->adapter;
+	struct recv_priv *precvpriv = &padapter->recvpriv;
+	int ret;
 
 	ret = recv_func(padapter, precvframe);
-	if (ret == _FAIL) {
+	if (ret == _SUCCESS)
+		precvpriv->rx_pkts++;
+	else
 		RT_TRACE(_module_rtl871x_recv_c_, _drv_info_, ("%s: recv_func return fail!!!\n", __func__));
-		goto _recv_entry_drop;
-	}
-
-	precvpriv->rx_pkts++;
-
-	return ret;
 
-_recv_entry_drop:
 	return ret;
 }
 
-- 
2.20.1

