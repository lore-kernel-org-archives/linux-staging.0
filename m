Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A857B
	for <linux-staging@lists.linux.dev>; Thu, 27 Oct 2022 13:56:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1666879003; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bdq8jPhSQIsJWMxI4ng2jPj/PKMqqkcH1re7jdg1QBgCyboVwS0DeLST7Rw3w8mMYL+ELDLwAFE2nBYH54+t2S7QexuRf5j4HTChQVw00jWAq5UAZs2olmBrsSK0GsbHVAAsoA+BbvRvrsw1R0tGt6BxoUlLAkM0CS38KuPJM50=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1666879003; h=Content-Type:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=GovURUzTYW0B0CpcAXUDLRwwLt9nM36i1qpfsHPFVa4=; 
	b=koltOXjGMRmWBSxS/ydzvEZGAqpASHwRwh3jdlfmbbrmS+UHuPSFr+NgK3+CC/9z0BJu73QQpYRFmSTNTVADTz5+7kTCNsBt+p0947GOyxcN9VqADO0KBQlGsoS9zhef2Y9RoeFcpD7Qp1lR75vB3yToUKXG7G4UfUn7SHSbO4Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=t4rmin@zohomail.com;
	dmarc=pass header.from=<t4rmin@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1666879003;
	s=zm2022; d=zohomail.com; i=t4rmin@zohomail.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To;
	bh=GovURUzTYW0B0CpcAXUDLRwwLt9nM36i1qpfsHPFVa4=;
	b=ear0Ly3cCRT7lMMdP5m4wGXfybpC8DRF/bQMoivfr1XwFvwcbgfK+aemmAeza4mf
	gpYozFkaLfO+hHREIwF3xSNOdAmjSWribZ4RPV3GFdbqiQ5ABewl9cNiUfYCJL0wa7t
	NpqXq9XdFuDvcArnj5MVpmOXaRSz5hNc3geWlszw=
Received: from plymouth (103.47.132.38 [103.47.132.38]) by mx.zohomail.com
	with SMTPS id 1666879002063679.8011510916507; Thu, 27 Oct 2022 06:56:42 -0700 (PDT)
Date: Thu, 27 Oct 2022 20:56:27 +0700
From: Aaron Lawrence <t4rmin@zohomail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: rtllib_module: remove unnecessary
 parentheses
Message-ID: <20221027135627.vzc3woeuhrivozqz@plymouth>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ZohoMailClient: External

This patch is intended to remove unnecessary parentheses in the
rtllib_module.c file following the Linux kernel coding-style
regulations. The modification is recommended by the checkpatch script.

Signed-off-by: Aaron Lawrence <t4rmin@zohomail.com>
---
 drivers/staging/rtl8192e/rtllib_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_module.c b/drivers/staging/rtl8192e/rtllib_module.c
index 41697ef55dbd..ce8b73f437a3 100644
--- a/drivers/staging/rtl8192e/rtllib_module.c
+++ b/drivers/staging/rtl8192e/rtllib_module.c
@@ -107,7 +107,7 @@ struct net_device *alloc_rtllib(int sizeof_priv)
 	spin_lock_init(&ieee->lock);
 	spin_lock_init(&ieee->wpax_suitlist_lock);
 	spin_lock_init(&ieee->reorder_spinlock);
-	atomic_set(&(ieee->atm_swbw), 0);
+	atomic_set(&ieee->atm_swbw, 0);
 
 	/* SAM FIXME */
 	lib80211_crypt_info_init(&ieee->crypt_info, "RTLLIB", &ieee->lock);
-- 
2.38.1

