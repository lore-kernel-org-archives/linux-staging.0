Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2900B10E0
	for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655049974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R24OZyQrcyRhkFauw7Kvxld/7xBF8Aox8sK8q+KrwDE=;
	b=AGnVtL2Jcqvrto5pAjKN337ejQsbBaxlzbddziM+QNndLB8uYMHDGwidKxZacl8VrgG69w
	IufkwSEiwU1HLTcplN1Tu9AwYJKDXIyFSMltDfcQaOwG2ZzaO0UN4B8OHPntPgZKVh97LA
	NnJYdvEX8OKJz/9il8awICJjYDwVths=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-cS-ftVLbP0CtG_BAQxVgzA-1; Sun, 12 Jun 2022 12:06:10 -0400
X-MC-Unique: cS-ftVLbP0CtG_BAQxVgzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC87D803B22;
	Sun, 12 Jun 2022 16:06:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62CDB2166B26;
	Sun, 12 Jun 2022 16:06:08 +0000 (UTC)
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
Subject: [PATCH 2/3] media: atomisp: fix uninitialized stack mem usage in ia_css_rmgr_acq_vbuf()
Date: Sun, 12 Jun 2022 18:05:55 +0200
Message-Id: <20220612160556.108264-3-hdegoede@redhat.com>
In-Reply-To: <20220612160556.108264-1-hdegoede@redhat.com>
References: <20220612160556.108264-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6

When ia_css_rmgr_acq_vbuf() enters the code path where it uses the local
"struct ia_css_rmgr_vbuf_handle v" on the stack it relies on v.count==0
so that ia_css_rmgr_refcount_retain_vbuf allocates a new handle.

Explicitly set v.count to 0 rather then it being whatever was on the stack.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index d96aaa4bc75d..afe2d22c603f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -254,7 +254,7 @@ void rmgr_pop_handle(struct ia_css_rmgr_vbuf_pool *pool,
 void ia_css_rmgr_acq_vbuf(struct ia_css_rmgr_vbuf_pool *pool,
 			  struct ia_css_rmgr_vbuf_handle **handle)
 {
-	struct ia_css_rmgr_vbuf_handle h;
+	struct ia_css_rmgr_vbuf_handle h = { 0 };
 
 	if ((!pool) || (!handle) || (!*handle)) {
 		IA_CSS_LOG("Invalid inputs");
-- 
2.36.0

