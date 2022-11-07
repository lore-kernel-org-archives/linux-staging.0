Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568E3122BB
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 20:28:43 +0000 (UTC)
Received: from ipservice-092-217-067-198.092.217.pools.vodafone-ip.de ([92.217.67.198] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1os8jX-0004bP-Ri; Mon, 07 Nov 2022 21:28:39 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 2/3] staging: r8188eu: drop another removal/stop check
Date: Mon,  7 Nov 2022 21:28:23 +0100
Message-Id: <20221107202824.61431-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107202824.61431-1-martin@kaiser.cx>
References: <20221107202824.61431-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no need to check bDriverStopped and bSurpriseRemoved in
issue_probereq_ex.

The code path looks like

issue_probereq_ex
   _issue_probereq
      dump_mgntframe
      or
      dump_mgntframe_and_wait_ack

All paths from dump_mgntframe check the two variables.
dump_mgntframe_and_wait_ack contains a check as well.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 17803aca83c8..bfd6afd7266e 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -4496,9 +4496,6 @@ int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
 
 		i++;
 
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
-			break;
-
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
 			msleep(wait_ms);
 
-- 
2.30.2

