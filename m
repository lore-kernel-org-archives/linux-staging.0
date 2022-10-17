Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D594699;
	Mon, 17 Oct 2022 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666024192; bh=fganXA/Ib74G11n9cn4dTun4KYkeNaJm90T7a6DzvNM=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=X3GBj/hsJoB5GrLxm6Q6RVSbtFWYQLofETxY8xZc55VjXJAQjZ6zKopNe3boxq9Bw
	 GO6G68gyx9ncBv2GfhkLgBRzPxB+IDgGVvlApPbdyGjvC1ZEBb88VB/sIfKzqpom5h
	 O1nCPDaHlVEx7JV/QVBcijmh+8cX6HG9V2REU4a0=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Mon, 17 Oct 2022 18:29:51 +0200 (CEST)
X-EA-Auth: YWyD0nVSL0P3+zGMZFq0atI3dki1uT2baqE//vLDdgL2ZSqEGNhsT4WpiLpZP9dmU5qdMr8CKLjjH122aYGJpVO+QctXlddP
Date: Mon, 17 Oct 2022 21:30:18 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: [PATCH v1 3/4] staging: r8188eu: remove {} for single statement
 blocks
Message-ID: <0e18149144533a749e30d97b0051cff384016cf1.1666021212.git.drv@mailo.com>
References: <cover.1666021212.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666021212.git.drv@mailo.com>

As per the Linux kernel coding-style guidelines, there is no need to
use {} for single statement blocks. Issue flagged by checkpatch script.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v1:
   1. Improve patch description language to make it simpler. Feedback received
      from julia.lawall@inria.fr


 drivers/staging/r8188eu/core/rtw_br_ext.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 8b1c9fdf6ed2..14797c2d6d76 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -652,9 +652,8 @@ void *scdb_findEntry(struct adapter *priv, unsigned char *ip_addr)
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



