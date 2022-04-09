Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFFEA34
	for <linux-staging@lists.linux.dev>; Sat,  9 Apr 2022 16:32:25 +0000 (UTC)
Received: from ipservice-092-217-091-111.092.217.pools.vodafone-ip.de ([92.217.91.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ndE0b-0006Rg-TY; Sat, 09 Apr 2022 18:32:22 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 05/10] staging: r8188eu: improve timeout handling in rtw_check_join_candidate
Date: Sat,  9 Apr 2022 18:32:07 +0200
Message-Id: <20220409163212.241122-6-martin@kaiser.cx>
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

Use the standard kernel functions to define and check the timeout in
rtw_check_join_candidate.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index c90f36dee1ea..aa39f07847c2 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1419,6 +1419,7 @@ static int rtw_check_join_candidate(struct mlme_priv *pmlmepriv
 {
 	int updated = false;
 	struct adapter *adapter = container_of(pmlmepriv, struct adapter, mlmepriv);
+	unsigned long scan_res_expire;
 
 	/* check bssid, if needed */
 	if (pmlmepriv->assoc_by_bssid) {
@@ -1436,8 +1437,9 @@ static int rtw_check_join_candidate(struct mlme_priv *pmlmepriv
 	if (!rtw_is_desired_network(adapter, competitor))
 		goto exit;
 
+	scan_res_expire = competitor->last_scanned + msecs_to_jiffies(RTW_SCAN_RESULT_EXPIRE);
 	if (rtw_to_roaming(adapter) > 0) {
-		if (rtw_get_passing_time_ms((u32)competitor->last_scanned) >= RTW_SCAN_RESULT_EXPIRE ||
+		if (time_after(jiffies, scan_res_expire) ||
 		    !is_same_ess(&competitor->network, &pmlmepriv->cur_network.network))
 			goto exit;
 	}
-- 
2.30.2

