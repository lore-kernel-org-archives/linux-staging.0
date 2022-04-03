Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3E01FDA
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:38:38 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3FB-00080j-4e; Sun, 03 Apr 2022 18:38:25 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/2] staging: r8188eu: make validate_recv_mgnt_frame return void
Date: Sun,  3 Apr 2022 18:38:17 +0200
Message-Id: <20220403163818.357173-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220403163818.357173-1-martin@kaiser.cx>
References: <20220403163818.357173-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the validate_recv_mgnt_frame function to not return a status.

It always returns _SUCCESS, its only caller does not check the
return value.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 476bd4f22528..8fa07d37d07b 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -911,14 +911,14 @@ static int validate_recv_ctrl_frame(struct adapter *padapter,
 
 struct recv_frame *recvframe_chk_defrag(struct adapter *padapter, struct recv_frame *precv_frame);
 
-static int validate_recv_mgnt_frame(struct adapter *padapter,
-				    struct recv_frame *precv_frame)
+static void validate_recv_mgnt_frame(struct adapter *padapter,
+				     struct recv_frame *precv_frame)
 {
 	struct sta_info *psta;
 
 	precv_frame = recvframe_chk_defrag(padapter, precv_frame);
 	if (!precv_frame)
-		return _SUCCESS;
+		return;
 
 	/* for rx pkt statistics */
 	psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(precv_frame->rx_data));
@@ -940,8 +940,6 @@ static int validate_recv_mgnt_frame(struct adapter *padapter,
 	}
 
 	mgt_dispatcher(padapter, precv_frame);
-
-	return _SUCCESS;
 }
 
 static int validate_recv_data_frame(struct adapter *adapter,
-- 
2.30.2

