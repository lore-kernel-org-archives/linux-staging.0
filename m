Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D73101CF
	for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 10:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689242680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=roKT0Mw7z+vrtzfyyneQeok4ElOuj23Rtc+8BsjourQ=;
	b=ZxEPS5gXkIE4A3tBbGyOSDZsAggMh5cGU0Czgb0cb9zza23+jM4VQSBPZzxTFdci8S5tYV
	OBrbXtA5TCyVrUmMcXHW+9N2/mNT5pOmA+E34mhmbYQ7hCsZZJWXEt2x6mlS0h2q7DBo/M
	j0665SeYfPusU0isDpsso4BEL898jlA=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-sBn24KCnMdqUPUvWfmusFg-1; Thu, 13 Jul 2023 06:04:34 -0400
X-MC-Unique: sBn24KCnMdqUPUvWfmusFg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D1172999B2E;
	Thu, 13 Jul 2023 10:04:34 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.111])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05BA7111E3EC;
	Thu, 13 Jul 2023 10:04:29 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 11/11] media: atomisp: isys_init: Initiate atomisp in a generic manner
Date: Thu, 13 Jul 2023 18:02:31 +0800
Message-ID: <20230713100231.308923-12-hpa@redhat.com>
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

The original implementation distinguishes and initiates atomisp during
compiler time. This commit allows isys_init to initiate isys for both types
of atomisp in a generic manner.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../atomisp/pci/runtime/isys/src/isys_init.c  | 31 +++++++++----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
index d0a43c44963c..1a7b45bb4544 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
@@ -18,13 +18,10 @@
 #include "ia_css_isys.h"
 #include "platform_support.h"
 
-#ifdef ISP2401
 #include "isys_dma_public.h"	/* isys2401_dma_set_max_burst_size() */
 #include "isys_irq.h"
-#endif
 
-#if !defined(ISP2401)
-input_system_err_t ia_css_isys_init(void)
+input_system_err_t ia_css_isys_2400_init(void)
 {
 	backend_channel_cfg_t backend_ch0;
 	backend_channel_cfg_t backend_ch1;
@@ -86,8 +83,8 @@ input_system_err_t ia_css_isys_init(void)
 
 	return error;
 }
-#elif defined(ISP2401)
-input_system_err_t ia_css_isys_init(void)
+
+input_system_err_t ia_css_isys_2401_init(void)
 {
 	ia_css_isys_csi_rx_lut_rmgr_init();
 	ia_css_isys_ibuf_rmgr_init();
@@ -104,19 +101,21 @@ input_system_err_t ia_css_isys_init(void)
 
 	return INPUT_SYSTEM_ERR_NO_ERROR;
 }
-#endif
 
-#if !defined(ISP2401)
-void ia_css_isys_uninit(void)
+input_system_err_t ia_css_isys_init(void)
 {
+	if (IS_ISP2401)
+		return ia_css_isys_2401_init();
+
+	return ia_css_isys_2400_init();
 }
-#elif defined(ISP2401)
+
 void ia_css_isys_uninit(void)
 {
-	ia_css_isys_csi_rx_lut_rmgr_uninit();
-	ia_css_isys_ibuf_rmgr_uninit();
-	ia_css_isys_dma_channel_rmgr_uninit();
-	ia_css_isys_stream2mmio_sid_rmgr_uninit();
+	if (IS_ISP2401) {
+		ia_css_isys_csi_rx_lut_rmgr_uninit();
+		ia_css_isys_ibuf_rmgr_uninit();
+		ia_css_isys_dma_channel_rmgr_uninit();
+		ia_css_isys_stream2mmio_sid_rmgr_uninit();
+	}
 }
-#endif
-
-- 
2.41.0

