Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B042D2CA8
	for <linux-staging@lists.linux.dev>; Sat, 22 Jan 2022 17:06:06 +0000 (UTC)
Received: from dslb-188-097-041-028.188.097.pools.vodafone-ip.de ([188.97.41.28] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nBJps-0002IN-Ne; Sat, 22 Jan 2022 18:05:56 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/4] staging: r8188eu: EntryMaxUndecoratedSmoothedPWDB is set but not used
Date: Sat, 22 Jan 2022 18:05:44 +0100
Message-Id: <20220122170547.68378-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220122170547.68378-1-martin@kaiser.cx>
References: <20220122170547.68378-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable EntryMaxUndecoratedSmoothedPWDB in struct dm_priv
is set but not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/odm.c             | 5 -----
 drivers/staging/r8188eu/include/rtl8188e_dm.h | 3 +--
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 8156e4acaa09..7de0f458d788 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -494,11 +494,6 @@ static void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm)
 		}
 	}
 
-	if (tmpEntryMaxPWDB != 0)	/*  If associated entry is found */
-		pdmpriv->EntryMaxUndecoratedSmoothedPWDB = tmpEntryMaxPWDB;
-	else
-		pdmpriv->EntryMaxUndecoratedSmoothedPWDB = 0;
-
 	if (tmpEntryMinPWDB != 0xff) /*  If associated entry is found */
 		pdmpriv->EntryMinUndecoratedSmoothedPWDB = tmpEntryMinPWDB;
 	else
diff --git a/drivers/staging/r8188eu/include/rtl8188e_dm.h b/drivers/staging/r8188eu/include/rtl8188e_dm.h
index 0b3a9a1a4e5c..d62cdfc2db20 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_dm.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_dm.h
@@ -12,9 +12,8 @@ enum{
 struct	dm_priv {
 	u32	InitODMFlag;
 
-	/*  Upper and Lower Signal threshold for Rate Adaptive*/
+	/* Lower Signal threshold for Rate Adaptive */
 	int	EntryMinUndecoratedSmoothedPWDB;
-	int	EntryMaxUndecoratedSmoothedPWDB;
 	int	MinUndecoratedPWDBForDM;
 };
 
-- 
2.30.2

