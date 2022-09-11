Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EF0186D
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 17:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662916647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vlXof5eQmvTm/gLBUpQY05/ds9rbI+EodzAT/kvIFQ=;
	b=DZH2LJNDhBO0hWYYoRNLm1vfdGmkM0HbSzd9qFnnK1bWHS5fJZcFX1o26W2EsO7VbfV1DT
	HEhFgssexAQ+nrW+TfMlwTfqZQyA9hlHkXlW00f98es50feKXP8tafxsrHz7kP/jl3NpdN
	jRFuQaUCgYRVjDxVmbrAbEvuzr4O7yY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-NROsa3zAPk24Z3fGVBeEcg-1; Sun, 11 Sep 2022 13:17:20 -0400
X-MC-Unique: NROsa3zAPk24Z3fGVBeEcg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AF09101A56C;
	Sun, 11 Sep 2022 17:17:20 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95D02403353;
	Sun, 11 Sep 2022 17:17:18 +0000 (UTC)
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
Subject: [PATCH 13/17] media: atomisp: Make atomisp_set_raw_buffer_bitmap() static
Date: Sun, 11 Sep 2022 19:16:49 +0200
Message-Id: <20220911171653.568932-14-hdegoede@redhat.com>
In-Reply-To: <20220911171653.568932-1-hdegoede@redhat.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10

atomisp_set_raw_buffer_bitmap() is only used in atomisp_cmd.c,
make it static. Unfortunately this still requires a forward
declaration (the function cannot be moved easily).

Still this will at least make it obvious to anyone reading the code
that the function is not used elsewhere.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 4 +++-
 drivers/staging/media/atomisp/pci/atomisp_cmd.h | 2 --
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 20962d4c2b76..8cc8ee64fb44 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -80,6 +80,8 @@ union host {
 	} ptr;
 };
 
+static int atomisp_set_raw_buffer_bitmap(struct atomisp_sub_device *asd, int exp_id);
+
 /*
  * get sensor:dis71430/ov2720 related info from v4l2_subdev->priv data field.
  * subdev->priv is set in mrst.c
@@ -5993,7 +5995,7 @@ void atomisp_init_raw_buffer_bitmap(struct atomisp_sub_device *asd)
 	spin_unlock_irqrestore(&asd->raw_buffer_bitmap_lock, flags);
 }
 
-int atomisp_set_raw_buffer_bitmap(struct atomisp_sub_device *asd, int exp_id)
+static int atomisp_set_raw_buffer_bitmap(struct atomisp_sub_device *asd, int exp_id)
 {
 	int *bitmap, bit;
 	unsigned long flags;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index cfc970b531f0..ba3433a63595 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -321,8 +321,6 @@ void atomisp_flush_params_queue(struct atomisp_video_pipe *asd);
 int atomisp_exp_id_unlock(struct atomisp_sub_device *asd, int *exp_id);
 int atomisp_exp_id_capture(struct atomisp_sub_device *asd, int *exp_id);
 
-/* Function to update Raw Buffer bitmap */
-int atomisp_set_raw_buffer_bitmap(struct atomisp_sub_device *asd, int exp_id);
 void atomisp_init_raw_buffer_bitmap(struct atomisp_sub_device *asd);
 
 /* Function to enable/disable zoom for capture pipe */
-- 
2.37.3

