Received: from h04.kommunity.net (h04.kommunity.net [138.201.86.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F653FC1
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 22:57:58 +0000 (UTC)
Received: from notebook.fritz.box (p4fc646df.dip0.t-ipconnect.de [79.198.70.223])
	by h04.kommunity.net (Postfix) with ESMTPSA id 51D1BF86E5D;
	Sat, 21 Aug 2021 00:49:31 +0200 (CEST)
Authentication-Results: h04.kommunity.net;
	spf=pass (sender IP is 79.198.70.223) smtp.mailfrom=alec@vc-celle.de smtp.helo=notebook.fritz.box
Received-SPF: pass (h04.kommunity.net: connection is authenticated)
From: Alexander Vorwerk <alec@vc-celle.de>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexander Vorwerk <alec@vc-celle.de>
Subject: [PATCH] staging: iio: cdc: remove braces from single line if blocks
Date: Sat, 21 Aug 2021 00:49:14 +0200
Message-Id: <20210820224914.1260-1-alec@vc-celle.de>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Remove braces from single line if blocks to clear checkpatch warnings.
WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Alexander Vorwerk <alec@vc-celle.de>
---
 drivers/staging/iio/cdc/ad7746.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/iio/cdc/ad7746.c b/drivers/staging/iio/cdc/ad7746.c
index 78ac720266e6..71c709771676 100644
--- a/drivers/staging/iio/cdc/ad7746.c
+++ b/drivers/staging/iio/cdc/ad7746.c
@@ -241,10 +241,8 @@ static int ad7746_select_channel(struct iio_dev *indio_dev,
 		if (ret < 0)
 			return ret;
 
-		if (chip->capdac_set != chan->channel) {
-
+		if (chip->capdac_set != chan->channel)
 			chip->capdac_set = chan->channel;
-		}
 		break;
 	case IIO_VOLTAGE:
 	case IIO_TEMP:
-- 
2.17.1

