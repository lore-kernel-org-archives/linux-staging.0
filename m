Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE073A1DB
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 02:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726108063; cv=none; b=XeAt23VCGbqAXIy1R2RJ+S5sH6SJECXBgcmH6QBqg+J/NGYZGEOJwAPCQvssrugTi288LMTbuMQy8CtTvpJCJGrdch/WZbslncsBFjGuNKM+6iQ8Ffo7p3kY+wkDFdVDLk1/wtYrm2wbf1s+EE3jSWMab2wMWPpTIcsQ3fXDC2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726108063; c=relaxed/simple;
	bh=BRfk7zFgR3wu6/oNSmdry1fv/yT5v+/oIh+FMZgwjvg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eKiTG/nTfPeEc4ozv39NKx+sI7FIw+1ziMIcdK7QyFt+atkdsOYg47uKnP7B9LOErKHjTgJamtGdTy4n2WprHjizWYnNTQMmZnAQqLOHgbIZBs6UwfloBIt35EiecOF5Y8xc+iPhicCscbC3meyKzzcGuBhQjp0hYJlMdpF0sQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=fK2nOmQ4; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="fK2nOmQ4"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48C2RcmE6521282, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1726108058; bh=BRfk7zFgR3wu6/oNSmdry1fv/yT5v+/oIh+FMZgwjvg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=fK2nOmQ4Wf969m8d548k9srAUNcpQ+bLNs4MlXj9j4KSv6TEtuKQW1UzYzj5H13jv
	 GNmrcoHd6axGserfv0S1dSBNNZyCtWQc4TYb0LB+XquJYc1bm6qB0WlvFbxv0pNqhW
	 1zWWD73EbUv35532XQmwYg58Y+GoNEb2m8KEujXimURimYril4jEHxp2oivGhZ0F6z
	 Eh0O3jyKr2sgc/ki+U2B2bienEa/J0WXNcl60OjZIdpYrQSzT+4NZ4PUhKuKKL/B9k
	 vjHja0AnvsFMVCOc9qfPRyM/pXN78aqRa09RPuTnhIqG8pUtQcvdXyeH2rkSVAypto
	 E0fPJEKsqCPoQ==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48C2RcmE6521282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Sep 2024 10:27:38 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 10:27:38 +0800
Received: from [127.0.1.1] (172.21.69.94) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 12 Sep
 2024 10:27:37 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>
Subject: [PATCH 3/4] staging: rtl8723bs: remove unused cnt from recv_func()
Date: Thu, 12 Sep 2024 10:25:21 +0800
Message-ID: <20240912022522.10715-4-pkshih@realtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912022522.10715-1-pkshih@realtek.com>
References: <20240912022522.10715-1-pkshih@realtek.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)

The 'cnt' is used to show how many pending frames are processed, and the
debug code has been removed, so removing 'cnt' is safe.

Otherwise, clang warns:

core/rtw_recv.c:2030:7: warning:
	 variable 'cnt' set but not used [-Wunused-but-set-variable]
 2030 |                 int cnt = 0;
      |                     ^

Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 0eadc23a7d54..915d63892c93 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -2027,12 +2027,9 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 	/* check if need to handle uc_swdec_pending_queue*/
 	if (check_fwstate(mlmepriv, WIFI_STATION_STATE) && psecuritypriv->busetkipkey) {
 		union recv_frame *pending_frame;
-		int cnt = 0;
 
-		while ((pending_frame = rtw_alloc_recvframe(&padapter->recvpriv.uc_swdec_pending_queue))) {
-			cnt++;
+		while ((pending_frame = rtw_alloc_recvframe(&padapter->recvpriv.uc_swdec_pending_queue)))
 			recv_func_posthandle(padapter, pending_frame);
-		}
 	}
 
 	ret = recv_func_prehandle(padapter, rframe);
-- 
2.25.1

