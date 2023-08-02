Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7CB63B6
	for <linux-staging@lists.linux.dev>; Wed,  2 Aug 2023 09:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690970217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Nsg66m0yg/qEPYdZNgAIvwYyyckJYI36WYsteMTVv0=;
	b=f25uGnPvqiVglHbQakWOjXZNNulmbCkZAtQjlr0UUHP1cY8u9nuQ4nlWsKXwq1qFS1pa9i
	UkBhvZoN7ZUcdHUnNSJ21ToE3PcApfEb2r+w1GzXKWduyBNd4o8cj1oRiS3SSWRB7qinzS
	T7JRu9hOEl3f2ZApouY482Iul95xris=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-36_35a-YPGygQl2vJOMQtw-1; Wed, 02 Aug 2023 05:56:53 -0400
X-MC-Unique: 36_35a-YPGygQl2vJOMQtw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D841E1044592;
	Wed,  2 Aug 2023 09:56:52 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C2D2401061;
	Wed,  2 Aug 2023 09:56:49 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 03/12] media: atomisp: hive_isp_css_include: Removed #ifdef ISP2401 to make driver generic
Date: Wed,  2 Aug 2023 17:55:57 +0800
Message-ID: <20230802095606.1298152-4-hpa@redhat.com>
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

Removed #ifdef ISP2401 to make the driver generic.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h | 2 --
 .../atomisp/pci/hive_isp_css_include/host/pixelgen_public.h     | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
index 3d6621f2fa96..693154e8ec2f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
@@ -16,7 +16,6 @@
 #ifndef __CSI_RX_PUBLIC_H_INCLUDED__
 #define __CSI_RX_PUBLIC_H_INCLUDED__
 
-#ifdef ISP2401
 /*****************************************************
  *
  * Native command interface (NCI).
@@ -132,5 +131,4 @@ void csi_rx_be_ctrl_reg_store(
     const hrt_address reg,
     const hrt_data value);
 /* end of DLI */
-#endif /* ISP2401 */
 #endif /* __CSI_RX_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
index 40a9fb6d7761..da10e6b98c63 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
@@ -16,7 +16,6 @@
 #ifndef __PIXELGEN_PUBLIC_H_INCLUDED__
 #define __PIXELGEN_PUBLIC_H_INCLUDED__
 
-#ifdef ISP2401
 /*****************************************************
  *
  * Native command interface (NCI).
@@ -76,5 +75,4 @@ STORAGE_CLASS_PIXELGEN_H void pixelgen_ctrl_reg_store(
     const hrt_data value);
 /* end of DLI */
 
-#endif /* ISP2401 */
 #endif /* __PIXELGEN_PUBLIC_H_INCLUDED__ */
-- 
2.41.0

