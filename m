Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923B51871
	for <linux-staging@lists.linux.dev>; Mon, 13 Jun 2022 19:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655149910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DF+aUvsP0RfGoRSS1+D5HKXx//qp4oxG+d2xGfAvm9k=;
	b=Ah/qh6wpRcwTR/XNSuXvxCCf4nQiovu/0ANHS83+0urSPtD9YW5qBnu+VaDY3HrVyVWB/y
	yPuRmn3AuThKSqkNuU7ZWy743NDH7GmbipKnynIl87XjrdXIa+bM/yRQL5II0dHvV58HHP
	5xnDN+/bF1Op1DKZj9lltj4xN/SI9hU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-2h3qVJmiOd-r8oRr33gFTg-1; Mon, 13 Jun 2022 15:51:47 -0400
X-MC-Unique: 2h3qVJmiOd-r8oRr33gFTg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8164985A580;
	Mon, 13 Jun 2022 19:51:46 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 04C042166B26;
	Mon, 13 Jun 2022 19:51:44 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 04/40] media: atomisp: drop contiguous argument from frame_allocate_with_data()
Date: Mon, 13 Jun 2022 21:51:01 +0200
Message-Id: <20220613195137.8117-5-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6

Drop the contiguous argument from frame_allocate_with_data()
its only caller always passes false.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/runtime/frame/src/frame.c        | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 7a119d2c9256..4f9c8b839da2 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -77,8 +77,7 @@ static int frame_allocate_with_data(struct ia_css_frame **frame,
 	unsigned int height,
 	enum ia_css_frame_format format,
 	unsigned int padded_width,
-	unsigned int raw_bit_depth,
-	bool contiguous);
+	unsigned int raw_bit_depth);
 
 static struct ia_css_frame *frame_create(unsigned int width,
 	unsigned int height,
@@ -137,7 +136,7 @@ int ia_css_frame_allocate(struct ia_css_frame **frame,
 			    width, height, format, padded_width, raw_bit_depth);
 
 	err = frame_allocate_with_data(frame, width, height, format,
-				       padded_width, raw_bit_depth, false);
+				       padded_width, raw_bit_depth);
 
 	if ((*frame) && err == 0)
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
@@ -773,8 +772,7 @@ static int frame_allocate_with_data(struct ia_css_frame **frame,
 	unsigned int height,
 	enum ia_css_frame_format format,
 	unsigned int padded_width,
-	unsigned int raw_bit_depth,
-	bool contiguous)
+	unsigned int raw_bit_depth)
 {
 	int err;
 	struct ia_css_frame *me = frame_create(width,
@@ -782,7 +780,7 @@ static int frame_allocate_with_data(struct ia_css_frame **frame,
 					       format,
 					       padded_width,
 					       raw_bit_depth,
-					       contiguous,
+					       false,
 					       true);
 
 	if (!me)
-- 
2.36.0

