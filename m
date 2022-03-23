Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A403138B
	for <linux-staging@lists.linux.dev>; Wed, 23 Mar 2022 07:49:15 +0000 (UTC)
Received: from dslb-178-004-173-157.178.004.pools.vodafone-ip.de ([178.4.173.157] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nWvk0-0003JV-Hz; Wed, 23 Mar 2022 08:49:12 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/7] staging: r8188eu: remove unused data frame subtypes
Date: Wed, 23 Mar 2022 08:48:58 +0100
Message-Id: <20220323074859.177425-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220323074859.177425-1-martin@kaiser.cx>
References: <20220323074859.177425-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused defines for data frame subtypes.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/wifi.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 2e42b4b48c25..79a2675c6cc1 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -41,9 +41,6 @@ enum WIFI_FRAME_SUBTYPE {
 	WIFI_DATA_CFPOLL    = (BIT(5) | IEEE80211_FTYPE_DATA),
 	WIFI_DATA_CFACKPOLL = (BIT(5) | BIT(4) | IEEE80211_FTYPE_DATA),
 	WIFI_DATA_NULL      = (BIT(6) | IEEE80211_FTYPE_DATA),
-	WIFI_CF_ACK         = (BIT(6) | BIT(4) | IEEE80211_FTYPE_DATA),
-	WIFI_CF_POLL        = (BIT(6) | BIT(5) | IEEE80211_FTYPE_DATA),
-	WIFI_CF_ACKPOLL     = (BIT(6) | BIT(5) | BIT(4) | IEEE80211_FTYPE_DATA),
 	WIFI_QOS_DATA_NULL	= (BIT(6) | IEEE80211_STYPE_QOS_DATA | IEEE80211_FTYPE_DATA),
 };
 
-- 
2.30.2

