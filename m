Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA59101CF
	for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 10:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689242630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ap+X2t78sySvi00h8AzgFnMtAYAITpWKdoZI1uIAFcs=;
	b=EvaVBEErvgErawESw4AIQnpuvpOoeD5j3ihNL4NmFEl3I3yqdWSaiOWOI0LB4oLAd1hDkM
	tCAlSAZnn0BqRNAvjMYhM3HMrfBD8htxpHObqRiySJZZIPJYczvUYA0J7UITOCHQgJZGxT
	WjRZXWb6FrAJGiE+Lb2PM7Gm7IfiqIE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-pXfvsAwfNkeN_myUHRvamA-1; Thu, 13 Jul 2023 06:03:49 -0400
X-MC-Unique: pXfvsAwfNkeN_myUHRvamA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AE84858F1E;
	Thu, 13 Jul 2023 10:03:48 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.111])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56148111E3EB;
	Thu, 13 Jul 2023 10:03:43 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 05/11] media: atomisp: isys: Removed #if defined(ISP2401) to make driver generic
Date: Thu, 13 Jul 2023 18:02:25 +0800
Message-ID: <20230713100231.308923-6-hpa@redhat.com>
In-Reply-To: <20230713100231.308923-1-hpa@redhat.com>
References: <20230713100231.308923-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

Removed #if defined(ISP2401) to make code generic.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../atomisp/pci/hive_isp_css_include/host/isys_dma_public.h     | 2 --
 .../atomisp/pci/hive_isp_css_include/host/isys_irq_public.h     | 2 --
 .../staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h   | 2 --
 3 files changed, 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
index d9b6af898c06..f18a057adb0f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
@@ -16,7 +16,6 @@
 #ifndef __ISYS_DMA_PUBLIC_H_INCLUDED__
 #define __ISYS_DMA_PUBLIC_H_INCLUDED__
 
-#ifdef ISP2401
 
 #include "system_local.h"
 #include "type_support.h"
@@ -34,6 +33,5 @@ void isys2401_dma_set_max_burst_size(
     const isys2401_dma_ID_t dma_id,
     uint32_t		max_burst_size);
 
-#endif /* ISP2401 */
 
 #endif /* __ISYS_DMA_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h
index 736cbc4e3705..2b13688256cf 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h
@@ -19,7 +19,6 @@
 #include "isys_irq_global.h"
 #include "isys_irq_local.h"
 
-#if defined(ISP2401)
 
 void isys_irqc_state_get(const isys_irq_ID_t	isys_irqc_id,
 			 isys_irqc_state_t	*state);
@@ -36,6 +35,5 @@ hrt_data isys_irqc_reg_load(const isys_irq_ID_t	isys_irqc_id,
 
 void isys_irqc_status_enable(const isys_irq_ID_t isys_irqc_id);
 
-#endif /* defined(ISP2401) */
 
 #endif	/* __ISYS_IRQ_PUBLIC_H__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h
index 001c55ea970b..952b633fdca7 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h
@@ -19,10 +19,8 @@
 #include <type_support.h>
 #include <system_local.h>
 
-#if defined(ISP2401)
 
 #include "isys_irq_public.h"
 
-#endif /* defined(ISP2401) */
 
 #endif	/* __IA_CSS_ISYS_IRQ_H__ */
-- 
2.41.0

