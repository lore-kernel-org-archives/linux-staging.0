Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A0D7E
	for <linux-staging@lists.linux.dev>; Mon,  8 May 2023 06:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683527227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U+ABazByYYEE1aBhF1lrPof1pKklDT9al9wZ2j39mUo=;
	b=Nd1BnAT8CTamNIW0vBEmaXjeyvObuUhTpBgCIC1vtpvpGO4CIqypcEf9u797/xDzBY3sbU
	ET6oUHzg1KKOLbQk/0/aJdzvz74Ake2BIFjPUl7VrpG0vOEn/izzH5774k/pSHTdzoTBDQ
	fK/OF7zPO8pK2x+SdAi9Yyvs6qrxL0Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-yeZTWH5yNe6C-jXORGSfKQ-1; Mon, 08 May 2023 02:27:04 -0400
X-MC-Unique: yeZTWH5yNe6C-jXORGSfKQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5FFB3C0F370;
	Mon,  8 May 2023 06:27:03 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97B56492C13;
	Mon,  8 May 2023 06:27:00 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 2/5] staging: media: atomisp: runtime: frame: remove #ifdef ISP2401
Date: Mon,  8 May 2023 14:26:29 +0800
Message-Id: <20230508062632.34537-2-hpa@redhat.com>
In-Reply-To: <20230508062632.34537-1-hpa@redhat.com>
References: <20230508062632.34537-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

The actions of ISP2401 and 2400 are determined at the runtime.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../media/atomisp/pci/runtime/frame/src/frame.c     | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 83bb42e05421..1e374ae848e3 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -601,9 +601,6 @@ static void frame_init_qplane6_planes(struct ia_css_frame *frame)
 
 static int frame_allocate_buffer_data(struct ia_css_frame *frame)
 {
-#ifdef ISP2401
-	IA_CSS_ENTER_LEAVE_PRIVATE("frame->data_bytes=%d\n", frame->data_bytes);
-#endif
 	frame->data = hmm_alloc(frame->data_bytes);
 	if (frame->data == mmgr_NULL)
 		return -ENOMEM;
@@ -635,15 +632,11 @@ static int frame_allocate_with_data(struct ia_css_frame **frame,
 
 	if (err) {
 		kvfree(me);
-#ifndef ISP2401
-		return err;
-#else
-		me = NULL;
-#endif
+		*frame = NULL;
+	} else {
+		*frame = me;
 	}
 
-	*frame = me;
-
 	return err;
 }
 
-- 
2.40.1

