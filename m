Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06CA7C
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 13:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650893477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vRkFZZ+bpHCqYl5M+UHtMrybHZdURp3ea7MDvTxPK6I=;
	b=CVD5AsLpMo1ttd04hLfMwed7dYn4v+x/AUD7KD0MBgF5p5h2ygtFiv708MGDZm5sfYLV39
	Gcy90ayg4mlHvPYM2DaznExji0K3mAEUWM+sGYl3f1ZKIDJ8AjY1JeFWvpXqBKcec8UHfa
	Ucbrzm7+aiYd/YSOS4Y/iHSwQR8DcW0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-6m0Yp1bkP2SlnB40Z61Srw-1; Mon, 25 Apr 2022 09:31:14 -0400
X-MC-Unique: 6m0Yp1bkP2SlnB40Z61Srw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47F7C380050C;
	Mon, 25 Apr 2022 13:31:13 +0000 (UTC)
Received: from localhost (unknown [10.76.0.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB71F404E4A6;
	Mon, 25 Apr 2022 13:31:12 +0000 (UTC)
From: Vaibhav Nagare <vnagare@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-staging@lists.linux.dev,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	vnagare@redhat.com
Subject: [PATCH] staging: greybus: tools: fix spelling
Date: Mon, 25 Apr 2022 19:01:11 +0530
Message-Id: <20220425133111.118257-1-vnagare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2

Fixed the spelling mistake of appendation to appending.

Signed-off-by: Vaibhav Nagare <vnagare@redhat.com>
---
 drivers/staging/greybus/tools/loopback_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/tools/loopback_test.c b/drivers/staging/greybus/tools/loopback_test.c
index 867bf289df2e..4c42e393cd3d 100644
--- a/drivers/staging/greybus/tools/loopback_test.c
+++ b/drivers/staging/greybus/tools/loopback_test.c
@@ -533,7 +533,7 @@ static int log_results(struct loopback_test *t)
 
 		fd = open(file_name, O_WRONLY | O_CREAT | O_APPEND, 0644);
 		if (fd < 0) {
-			fprintf(stderr, "unable to open %s for appendation\n", file_name);
+			fprintf(stderr, "unable to open %s for appending\n", file_name);
 			abort();
 		}
 
-- 
2.27.0

