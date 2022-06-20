Received: from challenge-bot.com (ozzloy.lifeafterking.org [208.85.243.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5250658
	for <linux-staging@lists.linux.dev>; Mon, 20 Jun 2022 05:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=challenge-bot.com; s=20180430; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k/JE7khECPHeL4KbK8eILNTPXaqQJUz1cfs0FJ5Axo8=; b=g3j8sXg0JyTR8b48IJoGtSROiI
	oTa912LyGyTSHe9CdK/DvHMTqRdzScwWiRT19uBmud7nBPSgV5B79QS9g5yNF3ZFU+l3dU8vzA9yv
	0Iuw3ZNmHV0KAgjUogEBq2/d4Qz1peMV+WKoOlUtIhy/SGqeAguMIfrD/VZNT28mtGRg=;
Received: from ozzloy by challenge-bot.com with local (Exim 4.92)
	(envelope-from <ozzloy@challenge-bot.com>)
	id 1o3AE9-00014D-00; Sun, 19 Jun 2022 22:45:33 -0700
From: daniel watson <ozzloy@challenge-bot.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Daniel Watson <ozzloy@challenge-bot.com>
Subject: [PATCH] staging: rtl8723bs: remove trailing whitespace
Date: Sun, 19 Jun 2022 22:45:29 -0700
Message-Id: <20220620054529.4019-1-ozzloy@challenge-bot.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Watson <ozzloy@challenge-bot.com>

remove trailing whitespace found by checkpatch

Signed-off-by: Daniel Watson <ozzloy@challenge-bot.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 1bdbd0971f731..f878b04076d86 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -960,7 +960,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		return _FAIL;
 
 	frame_type = GetFrameSubType(pframe);
-	if (frame_type == WIFI_ASSOCREQ) 
+	if (frame_type == WIFI_ASSOCREQ)
 		ie_offset = _ASOCREQ_IE_OFFSET_;
 	else /*  WIFI_REASSOCREQ */
 		ie_offset = _REASOCREQ_IE_OFFSET_;
-- 
2.34.1

