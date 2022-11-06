Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF5923A9
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 10:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667730122; bh=ISjlC7Zy+nyFdyGUXO1A3JhMcsFjRxDUI5qhIuaQEww=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=BXnanERqeXpxhMkZZL6hWqf/Fk5eUEbmtImWn+m5Uc0A7KF7Um6w7Sf7M5NRAftzy
	 7zjFea4uFUItTNNSm/9W2ir0fpmkcjNfxOYmIeQ94A+40HhyZ40GzqBx5vdRIANQMg
	 sIIJrSz1Upm30NdtKDdjHZYe29nb5EdsGmCeTauU=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Sun,  6 Nov 2022 11:22:02 +0100 (CET)
X-EA-Auth: a+kvvG//INTDj2l+ci+g/2Ip90DYBs8/Wx6kRlgV1YlG+PWrT+xXkgxFT4PzrWnEJ9En91A+4LGBwibu1KVBfatWZZiw29ER
Date: Sun, 6 Nov 2022 15:51:58 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: emxx_udc: use min helper macro for variable
 comparison
Message-ID: <Y2eKxoUWtbPY/88b@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Simplify code by using min helper macros in place of lengthy if/else
block oriented logical evaluation and value assignment. This issue is
identified by coccicheck using the minmax.cocci file.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/emxx_udc/emxx_udc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index b6abd3770e81..b4e19174bef2 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -1004,10 +1004,7 @@ static int _nbu2ss_in_dma(struct nbu2ss_udc *udc, struct nbu2ss_ep *ep,
 	/* MAX Packet Size */
 	mpkt = _nbu2ss_readl(&preg->EP_REGS[num].EP_PCKT_ADRS) & EPN_MPKT;

-	if ((DMA_MAX_COUNT * mpkt) < length)
-		i_write_length = DMA_MAX_COUNT * mpkt;
-	else
-		i_write_length = length;
+	i_write_length = min(DMA_MAX_COUNT * mpkt, length);

 	/*------------------------------------------------------------*/
 	/* Number of transmission packets */
--
2.34.1



