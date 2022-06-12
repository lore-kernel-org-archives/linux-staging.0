Received: from challenge-bot.com (ozzloy.lifeafterking.org [208.85.243.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B8EA2D
	for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 03:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=challenge-bot.com; s=20180430; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4wlotIig+xInDZZkGDa28VXMYDiOkNkcyV/9igu2vvI=; b=WNHtyGIOi9ykfn8JSpkGz1zokh
	VeZ8ck+MmoLYKNBkQwC3s5MLfVPntOXjWGa4DDffWLvooi5z6u0YYVrfpGQaE7ahR/saQRXEc4Nxz
	zCRVqLQL7rUN0RvEovj0LZJ3e0zCIm5WWkGIvFglBazdoZXNlgKtu7ti6am/FFigHuDM=;
Received: from ozzloy by challenge-bot.com with local (Exim 4.92)
	(envelope-from <ozzloy@challenge-bot.com>)
	id 1o0Dwt-0008Cd-Tm; Sat, 11 Jun 2022 20:07:35 -0700
From: daniel watson <ozzloy@challenge-bot.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: Daniel Watson <ozzloy@challenge-bot.com>
Subject: [PATCH] staging: rtl8723bs: uninitialize static variable
Date: Sat, 11 Jun 2022 20:07:34 -0700
Message-Id: <20220612030734.31469-1-ozzloy@challenge-bot.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Watson <ozzloy@challenge-bot.com>

ensure static variable is not initialized, per checkpatch

Signed-off-by: Daniel Watson <ozzloy@challenge-bot.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7240220cf6ae7..eed4be37d3928 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1256,7 +1256,7 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	}
 
 	if (pmlmepriv->LinkDetectInfo.bBusyTraffic == true) {
-		static unsigned long lastscantime = 0;
+		static unsigned long lastscantime;
 		unsigned long passtime;
 
 		passtime = jiffies_to_msecs(jiffies - lastscantime);
-- 
2.34.1

