Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AC0A31
	for <linux-staging@lists.linux.dev>; Sat,  9 Apr 2022 16:32:22 +0000 (UTC)
Received: from ipservice-092-217-091-111.092.217.pools.vodafone-ip.de ([92.217.91.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ndE0Y-0006Rg-Tn; Sat, 09 Apr 2022 18:32:19 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/10] staging: r8188eu: remove unnecessary rtw_get_passing_time_ms call
Date: Sat,  9 Apr 2022 18:32:04 +0200
Message-Id: <20220409163212.241122-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409163212.241122-1-martin@kaiser.cx>
References: <20220409163212.241122-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the rtw_get_passing_time_ms call in send_beacon.

Calling rtw_get_passing_time_ms makes no sense if we discard the result.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index babadfc279bc..d85f2182b816 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5751,8 +5751,6 @@ unsigned int send_beacon(struct adapter *padapter)
 	int	issue = 0;
 	int poll = 0;
 
-	u32 start = jiffies;
-
 	clear_beacon_valid_bit(padapter);
 
 	do {
@@ -5770,7 +5768,6 @@ unsigned int send_beacon(struct adapter *padapter)
 	if (!bxmitok)
 		return _FAIL;
 
-	rtw_get_passing_time_ms(start);
 	return _SUCCESS;
 }
 
-- 
2.30.2

