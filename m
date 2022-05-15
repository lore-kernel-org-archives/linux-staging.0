Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243E9A59
	for <linux-staging@lists.linux.dev>; Sun, 15 May 2022 15:54:14 +0000 (UTC)
Received: from dslb-188-096-141-066.188.096.pools.vodafone-ip.de ([188.96.141.66] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nqGZO-0006NT-6Q; Sun, 15 May 2022 17:54:10 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/5] staging: r8188eu: last_rx_mgnt_pkts is set but not used
Date: Sun, 15 May 2022 17:54:00 +0200
Message-Id: <20220515155401.352742-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220515155401.352742-1-martin@kaiser.cx>
References: <20220515155401.352742-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

last_rx_mgnt_pkts in struct stainfo_stats is set but not used.
Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/sta_info.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/sta_info.h b/drivers/staging/r8188eu/include/sta_info.h
index b7e6b1f319a2..4112c837bcef 100644
--- a/drivers/staging/r8188eu/include/sta_info.h
+++ b/drivers/staging/r8188eu/include/sta_info.h
@@ -48,7 +48,6 @@ struct	stainfo_stats	{
 	u64 rx_ctrl_pkts;
 	u64 rx_data_pkts;
 
-	u64	last_rx_mgnt_pkts;
 	u64 last_rx_beacon_pkts;
 	u64 last_rx_probereq_pkts;
 	u64 last_rx_probersp_pkts;
@@ -230,7 +229,6 @@ struct sta_info {
 
 #define sta_update_last_rx_pkts(sta) \
 do { \
-	sta->sta_stats.last_rx_mgnt_pkts = sta->sta_stats.rx_mgnt_pkts; \
 	sta->sta_stats.last_rx_beacon_pkts = sta->sta_stats.rx_beacon_pkts; \
 	sta->sta_stats.last_rx_probereq_pkts = sta->sta_stats.rx_probereq_pkts; \
 	sta->sta_stats.last_rx_probersp_pkts = sta->sta_stats.rx_probersp_pkts; \
-- 
2.30.2

