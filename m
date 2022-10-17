Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7091C12;
	Mon, 17 Oct 2022 13:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666014783; bh=HybS8E0BeM5WMbvxAEhVcL9Zbg+CAlIyM/FdRQVadmA=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=V0nd46kDfvvNQW9/BYUiNaqzLisfmayMxJ32LVhGkuWQME6HvaNwszkOY5nGfFnex
	 2R3rf7efqsVrSIei9H0jq6xG/cyJdtFG/RbBo+tmtLDGPUnJQHHeyD/NM2ktWD5qDs
	 W/e50RHb6p11MoZPOxUvaHPKOGKE2L2ONJsswbfc=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via [213.182.55.206]
	Mon, 17 Oct 2022 15:53:03 +0200 (CEST)
X-EA-Auth: WOVB4/nXVafQco/5wnIstFlXmW1pUWZgMbaqWNF0+qTbWPxDQEIECV7poO8kLqFZnvP2ycwsxNtRR8tRYgDBxGafyGWWdKHT
Date: Mon, 17 Oct 2022 18:53:30 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: [PATCH 3/4] staging: r8188eu: remove {} for single statement blocks
Message-ID: <478d652b9f467d47685c1af72a876f34dd92710f.1666011479.git.drv@mailo.com>
References: <cover.1666011479.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666011479.git.drv@mailo.com>

As per the Linux kernel coding-style guidelines, there is no need to
use {} for single statement blocks. Address following checkpatch script
complaint:
	WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 427da7e8ba4c..290affe50d0b 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -655,9 +655,8 @@ void *scdb_findEntry(struct adapter *priv, unsigned char *ip_addr)
 	hash = __nat25_network_hash(network_addr);
 	db = priv->nethash[hash];
 	while (db) {
-		if (!memcmp(db->networkAddr, network_addr, MAX_NETWORK_ADDR_LEN)) {
+		if (!memcmp(db->networkAddr, network_addr, MAX_NETWORK_ADDR_LEN))
 			return (void *)db;
-		}

 		db = db->next_hash;
 	}
--
2.30.2



