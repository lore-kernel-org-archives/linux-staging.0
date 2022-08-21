Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA064690
	for <linux-staging@lists.linux.dev>; Sun, 21 Aug 2022 21:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661118655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t7dC7NDfGX7Y/cZVoS4u5giB9bv/f9bDCicbc12GB1M=;
	b=WRgyVdmHeAcLBxkLPnE5POjxFKhF4kXwlhtXAlCmgcaCe3bJITM12jw7Eb1J5VM84XDkg/
	MI/uuYolKOGDEawo64dVA122rqF3HSygpPKGji39bFm69IZ27h2wv4XMQZvNj5TTm45m6s
	A3xDyGfIPuuVkTIzfCwSIn1d7VPTZZw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-xX9kyP1fOyiPVQjCSVO4iw-1; Sun, 21 Aug 2022 17:50:50 -0400
X-MC-Unique: xX9kyP1fOyiPVQjCSVO4iw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE9F6185A79C;
	Sun, 21 Aug 2022 21:50:49 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.47])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6746140CF8EB;
	Sun, 21 Aug 2022 21:50:48 +0000 (UTC)
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
Subject: [PATCH 13/13] media: atomisp: Ensure that USERPTR pointers are page aligned
Date: Sun, 21 Aug 2022 23:50:27 +0200
Message-Id: <20220821215027.461344-13-hdegoede@redhat.com>
In-Reply-To: <20220821215027.461344-1-hdegoede@redhat.com>
References: <20220821215027.461344-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1

The atomisp code needs USERPTR pointers to be page aligned,
otherwise bad things (scribbling over other parts of the
process' RAM) happen.

Add a check to ensure this and exit VIDIOC_QBUF calls with
unaligned pointers with -EINVAL.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 7ecee39ef5a4..c8c6f9f8f0b8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1345,6 +1345,12 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	 * address and reprograme out page table properly
 	 */
 	if (buf->memory == V4L2_MEMORY_USERPTR) {
+		if (buf->m.userptr & ~PAGE_MASK) {
+			dev_err(isp->dev, "Error userptr is not page aligned.\n");
+			ret = -EINVAL;
+			goto error;
+		}
+
 		vb = pipe->capq.bufs[buf->index];
 		vm_mem = vb->priv;
 		if (!vm_mem) {
-- 
2.37.2

