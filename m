Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE3B2FB1
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 10:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
	 s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=WqJgWuKxROlyMn6vaDKI+O0RG2Q6rkLpefx/nXUIcGs=; b=P7qtN8kjxGShz4+hdcg+rcH4w2
	emjx7b0DR/nFhCDB3ax0bC1RuQ5OsmP733p3ABO+nomuqlwWFPdkH3wg9xmmiVHqbJs7ZpgE3NnyS
	S25ymX3yJoMjbBEKsA56QnDrKJK3Tj7OXCvJ5Q5Ej7cihRp60BBBFRuGwTlSzBISfd9EevJeGvOdc
	n+QtBlSZqYveLjRzBsQDiFWkcYjj1JomWWx3YSTU0oVBWlaKrhwAA/8pPogkMxZSARsKyFFLQzipK
	6HPQoo01WKyqmowsErLX6A/wwgxOaWv0+rGahCTDQYnuSI+HFs9PMP1amKm0rcLkwRmAIc/aUkmGV
	x1c5RLeg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92.3)
	(envelope-from <lars@metafoo.de>)
	id 1lqC6U-00087i-Kw; Mon, 07 Jun 2021 12:03:30 +0200
Received: from [2001:a61:2bd3:3c01:9e5c:8eff:fe01:8578] (helo=lars-desktop.fritz.box)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <lars@metafoo.de>)
	id 1lqC6U-000TAb-Gv; Mon, 07 Jun 2021 12:03:30 +0200
From: Lars-Peter Clausen <lars@metafoo.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: John Crispin <john@phrozen.org>,
	linux-staging@lists.linux.dev,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] staging: ralink-gdma: Remove incorrect author information
Date: Mon,  7 Jun 2021 12:01:19 +0200
Message-Id: <20210607100119.26983-1-lars@metafoo.de>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.2/26193/Sun Jun  6 13:10:20 2021)

Lars did not write the ralink-gdma driver. Looks like his name just got
copy&pasted from another similar DMA driver. Remove his name from the
copyright and MODULE_AUTHOR.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/staging/ralink-gdma/ralink-gdma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/ralink-gdma/ralink-gdma.c b/drivers/staging/ralink-gdma/ralink-gdma.c
index 33e28ccf4d85..b5229bc6eae5 100644
--- a/drivers/staging/ralink-gdma/ralink-gdma.c
+++ b/drivers/staging/ralink-gdma/ralink-gdma.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- *  Copyright (C) 2013, Lars-Peter Clausen <lars@metafoo.de>
  *  GDMA4740 DMAC support
  */
 
@@ -914,6 +913,5 @@ static struct platform_driver gdma_dma_driver = {
 };
 module_platform_driver(gdma_dma_driver);
 
-MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
 MODULE_DESCRIPTION("Ralink/MTK DMA driver");
 MODULE_LICENSE("GPL v2");
-- 
2.20.1

