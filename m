Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CA97B;
	Thu, 20 Oct 2022 21:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666301271; bh=osZn+6l7ZcamOnQm1Kj8TWDodwur+Vk/CJgdHGyMLV4=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=JDK6sXJHHZPm1X1JTA/3n1F0TgXNsvYRopXGLFEr5mI1yLZZ1dz6m4AqcEvcbQYBY
	 evKOVFQUCHJRFrGEfqcp8HQPKUS5emEfNRaIJOHzyLoZLOhy2Jhaifsq2zeW29Pfmb
	 X2gfsMsaAzSo685ocId1avlE15cNXTK52QEj3Ya8=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via [213.182.55.206]
	Thu, 20 Oct 2022 23:27:51 +0200 (CEST)
X-EA-Auth: 0SzVPJnUCFVymnvhYnT+ZBDlwrBjoO0BYlm5VbZ1Sfr7f4NihbYSY1U9y0GZvCNK20pdPkmZbPno2jP9oXOwF2kaZfor+WOo
Date: Fri, 21 Oct 2022 02:57:47 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumarpraveen@linux.microsoft.com,
	saurabh.truth@gmail.com
Subject: [PATCH v4 03/11] staging: r8188eu: remove {} for single statement
 blocks
Message-ID: <a50460e1507621b29a7901cc4ff9501b172417db.1666299151.git.drv@mailo.com>
References: <cover.1666299151.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666299151.git.drv@mailo.com>

As per the Linux kernel coding-style guidelines, there is no need to
use {} for single statement blocks. Issue flagged by checkpatch script.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v4:
   -- None.

Changes in v3:
   -- None.

Changes in v1 [actually v2]:
   1. Improve patch description language to make it simpler. Feedback received
      from julia.lawall@inria.fr


 drivers/staging/r8188eu/core/rtw_br_ext.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index d4059f0fc362..b418cbc307b3 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -649,9 +649,8 @@ void *scdb_findEntry(struct adapter *priv, unsigned char *ip_addr)
 	hash = __nat25_network_hash(addr);
 	db = priv->nethash[hash];
 	while (db) {
-		if (!memcmp(db->networkAddr, addr, MAX_NETWORK_ADDR_LEN)) {
+		if (!memcmp(db->networkAddr, addr, MAX_NETWORK_ADDR_LEN))
 			return (void *)db;
-		}

 		db = db->next_hash;
 	}
--
2.30.2



