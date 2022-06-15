Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C1E3FDD
	for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 20:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655326278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4PPvPz6YgG9+YP9CBYHzHqE3eLgaAkIIYmHYxABEPJc=;
	b=F5JOYJcQe/nY/mG7hl3A94+c9cU2TFXjfkInpK+rQlzPlcM5ZWhDfJ+nQhuPJmWfJCKMZf
	3DJFPj3o9naN1oK4EzAlSc2YfpOHayQKB0Mwppr7Uz4Ww6Y4GAmnaow4dZOvY13Z4CPH/4
	tyScsrQPCbMeDS5NDDoNQgSjI0jvKRc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-XVwuayc1MC6OYYG8nsOwuw-1; Wed, 15 Jun 2022 16:51:12 -0400
X-MC-Unique: XVwuayc1MC6OYYG8nsOwuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4734C3C10227;
	Wed, 15 Jun 2022 20:51:11 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A61BC1131D;
	Wed, 15 Jun 2022 20:51:09 +0000 (UTC)
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
	linux-staging@lists.linux.dev,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 17/40] media: atomisp: remove bogus comment above hmm_bo_allocated() prototype
Date: Wed, 15 Jun 2022 22:50:14 +0200
Message-Id: <20220615205037.16549-18-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5

The comment documenting hmm_bo_allocated() was copied (and not modified)
from the comment documenting hmm_bo_alloc(), so there are 2 copies
of the hmm_bo_alloc() documentation.

Remove the copy of the comment above the hmm_bo_allocated() prototype.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index eba1ddcb7e64..654e329b7a6b 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -211,13 +211,6 @@ void hmm_bo_ref(struct hmm_buffer_object *bo);
  */
 void hmm_bo_unref(struct hmm_buffer_object *bo);
 
-/*
- * allocate/free physical pages for the bo. will try to alloc mem
- * from highmem if from_highmem is set, and type indicate that the
- * pages will be allocated by using video driver (for share buffer)
- * or by ISP driver itself.
- */
-
 int hmm_bo_allocated(struct hmm_buffer_object *bo);
 
 /*
-- 
2.36.0

