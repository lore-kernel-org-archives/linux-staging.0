Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DD1111B;
	Sun, 16 Oct 2022 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1665929957; bh=eGiDjkHU2H18+UPJbCBnMLwPn0ooEAda11HpwCTW7NE=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=Jr7gAm6Ms40j66UKi9lALGQDZMf4kYHTU3PElDk+o5p3llOSr+G5X5a+Ubi6+7Y2v
	 wb0sLR1w7WpmjPJdZxHX2Ov+Wcpb8mgAcUK0BqGOaFe0mxx8coqzEgfLiLaQFFtyFI
	 h7fFNPbqcSX5sDcs8XHR4BMkGSYnFvnSCFT9/RLM=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Sun, 16 Oct 2022 16:19:16 +0200 (CEST)
X-EA-Auth: ZlYqw7q+n9bWm0E6M2C4cko2RDVMvIgADjfKHRVLOR30Cm/e+LuD7Xdw2nHPPvVfc+puoJzaiDklCQrDpRBLDd7molkJY2vr
Date: Sun, 16 Oct 2022 10:19:12 -0400
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, pure.logic@nexus-software.ie,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: loopback: enclose macro statements in
 do-while loop
Message-ID: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Include multiple statements of macro definition inside do-while{0} loop
to avoid possible partial program execution. Issue reported by
checkpatch script:

ERROR: Macros with multiple statements should be enclosed in a do - while loop

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/greybus/loopback.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 1a61fce98056..37214cb43937 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
 static DEVICE_ATTR_RO(name##_avg)

 #define gb_loopback_stats_attrs(field)				\
+do {								\
 	gb_loopback_ro_stats_attr(field, min, u);		\
 	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+	gb_loopback_ro_avg_attr(field);				\
+} while (0)

 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
--
2.30.2



