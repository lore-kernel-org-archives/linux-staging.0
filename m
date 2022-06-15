Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F493FDD
	for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 20:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655326288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLEDgXyK7g2XPltXOqEMT4vvvBIc8zK3FcC2/zzaTUs=;
	b=bqyKl0RdRaFasAVFDxwD5Ol2KT9AoFZVB3Ph3WyNM+nDKrQ1SqvH7O+etuKLdloThrlrbX
	u6pzI4pPBR06uMQGqYu7Co6EUsycDEYzjQQMlBPzn004Nu9WlM46LU5c2jsm2ZiNaKcu+H
	su4+ft6McIQrvl/qm+pr0cOqeOBpV5c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-qCR5UGBRMgahV6Jh0xL33Q-1; Wed, 15 Jun 2022 16:51:22 -0400
X-MC-Unique: qCR5UGBRMgahV6Jh0xL33Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D6DA85A587;
	Wed, 15 Jun 2022 20:51:22 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2C79111F5;
	Wed, 15 Jun 2022 20:51:20 +0000 (UTC)
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
Subject: [PATCH v2 23/40] media: atomisp: remove atomisp_is_acc_enabled()
Date: Wed, 15 Jun 2022 22:50:20 +0200
Message-Id: <20220615205037.16549-24-hdegoede@redhat.com>
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

atomisp_is_acc_enabled() always returns false now, remove it.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c   | 4 ++--
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 5 -----
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h | 1 -
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index d8b3896a267a..04643eb2dff0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -538,7 +538,7 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 
 	clear_irq_reg(isp);
 
-	if (!atomisp_streaming_count(isp) && !atomisp_is_acc_enabled(isp))
+	if (!atomisp_streaming_count(isp))
 		goto out_nowake;
 
 	for (i = 0; i < isp->num_of_streams; i++) {
@@ -1837,7 +1837,7 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 
 	spin_lock_irqsave(&isp->lock, flags);
 
-	if (!atomisp_streaming_count(isp) && !atomisp_is_acc_enabled(isp)) {
+	if (!atomisp_streaming_count(isp)) {
 		spin_unlock_irqrestore(&isp->lock, flags);
 		return IRQ_HANDLED;
 	}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 725b3b1562b1..73906902600c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -624,11 +624,6 @@ unsigned int atomisp_streaming_count(struct atomisp_device *isp)
 	return sum;
 }
 
-unsigned int atomisp_is_acc_enabled(struct atomisp_device *isp)
-{
-	return 0;
-}
-
 /*
  * get input are used to get current primary/secondary camera
  */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
index 412bfcf33c0f..d85e0d697a4e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
@@ -57,7 +57,6 @@ extern const struct v4l2_ioctl_ops atomisp_file_ioctl_ops;
 
 unsigned int atomisp_streaming_count(struct atomisp_device *isp);
 
-unsigned int atomisp_is_acc_enabled(struct atomisp_device *isp);
 /* compat_ioctl for 32bit userland app and 64bit kernel */
 long atomisp_compat_ioctl32(struct file *file,
 			    unsigned int cmd, unsigned long arg);
-- 
2.36.0

