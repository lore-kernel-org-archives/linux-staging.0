Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3101763B6
	for <linux-staging@lists.linux.dev>; Wed,  2 Aug 2023 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690970222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tMy00+mukDtBO0ywFb0h7PqgyqdBhPFOdRO6WToGazY=;
	b=hOrEzdJ3n5eD3jQodoBYbDdbePv4WtAf+K3xQnYOC3QGbkPfmPVX2fm8HOZv0g2Z1depSX
	Et1BVKnRv1dfLWru5xo9LDMc5OVOp7MZZNxX3/XZk4zwSV3r6awuM2AJmwOrMtA/PpFfLp
	PQbDfwE1ikr7/5aqP3wbxHWvR5A87tw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-BmKzySnuNfuviV8NlYgObw-1; Wed, 02 Aug 2023 05:56:59 -0400
X-MC-Unique: BmKzySnuNfuviV8NlYgObw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99C26895680;
	Wed,  2 Aug 2023 09:56:58 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C25C0401061;
	Wed,  2 Aug 2023 09:56:55 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 04/12] media: atomisp: atomisp_compat_css20: Removed #ifdef ISP2401 to make driver generic
Date: Wed,  2 Aug 2023 17:55:58 +0800
Message-ID: <20230802095606.1298152-5-hpa@redhat.com>
In-Reply-To: <20230802095606.1298152-1-hpa@redhat.com>
References: <20230802095606.1298152-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

Removed #ifdef ISP2401 to make code to be generic. The driver flow if determined
in runtime.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../media/atomisp/pci/atomisp_compat_css20.c       | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index b97ec85aa0ba..bd28b692721d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -850,19 +850,17 @@ int atomisp_css_irq_translate(struct atomisp_device *isp,
 void atomisp_css_rx_get_irq_info(enum mipi_port_id port,
 				 unsigned int *infos)
 {
-#ifndef ISP2401
-	ia_css_isys_rx_get_irq_info(port, infos);
-#else
-	*infos = 0;
-#endif
+	if (IS_ISP2401)
+		*infos = 0;
+	else
+		ia_css_isys_rx_get_irq_info(port, infos);
 }
 
 void atomisp_css_rx_clear_irq_info(enum mipi_port_id port,
 				   unsigned int infos)
 {
-#ifndef ISP2401
-	ia_css_isys_rx_clear_irq_info(port, infos);
-#endif
+	if (!IS_ISP2401)
+		ia_css_isys_rx_clear_irq_info(port, infos);
 }
 
 int atomisp_css_irq_enable(struct atomisp_device *isp,
-- 
2.41.0

