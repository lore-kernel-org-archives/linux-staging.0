Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A2B101CF
	for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 10:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689242565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nIkA+HpSSu07W7u5pIPTT0EIfkdmYUsskjK7+pswJHs=;
	b=gUHfKjHfHlkjdxTWfn8hzG8TOUhie1W7M22+lpvbMrH/wMg8N56/SWE3fpmPqH+w3Hva9Q
	PhctIAWH1t4USknimhInxeI1uK/qauAMd0dcZK0qKL0eLfvvkuQowe5IhEIf5KOPQUTLcg
	+qLLYVlgp30DI1Ibcw8kEke4+yPnQwg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-wDWfYsxcP5-TkkVAy-yUVg-1; Thu, 13 Jul 2023 06:02:44 -0400
X-MC-Unique: wDWfYsxcP5-TkkVAy-yUVg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C874809F8F;
	Thu, 13 Jul 2023 10:02:44 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.111])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83B50111E3EB;
	Thu, 13 Jul 2023 10:02:39 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 00/11] #if defined(ISP2401) removal to make driver generic
Date: Thu, 13 Jul 2023 18:02:20 +0800
Message-ID: <20230713100231.308923-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

This patch set is to remove #if defined(ISP2401) to make the driver
generic. We focused on removing the #if defined(ISP2401) in isys and
necessary files related to it.

The changes include:
1. Removed #if defined(ISP2401) in isys and related directories.
2. Removed the debug codes for dumping status.
3. Made two individual enum to define the MIPI format for both types of
   atomisp.
4. The input system code should include both input system (ISP2400 and
   ISP2401) headers since a generic driver should cover all types
   of devcices.
5. The initialization codes of the input system was modified to initiate
   atomisp input system in a generic manner.


Kate Hsuan (11):
  media: atomisp: ia_css_debug: Removed debug codes for dumping status
  media: atomisp: Make two individual enum to define the MIPI format
  media: atomisp: Included both input system headers
  media: atomisp: css_2401_system: Remove #ifdef ISP2401 to make the
    driver generic
  media: atomisp: isys: Removed #if defined(ISP2401) to make driver
    generic
  media: atomisp: hive_isp_css_common: Removed #if defined(ISP2401) to
    make driver generic
  media: atomisp: pipeline: Removed #if defined(ISP2401) to make driver
    generic
  media: atomisp: ifmtr: Removed #if defined(ISP2401) to make driver
    generic
  media: atomisp: Compile the object codes for a generic driver
  media: atomisp: rx: Removed #if defined(ISP2401) to make driver
    generic
  media: atomisp: isys_init: Initiate atomisp in a generic manner

 drivers/staging/media/atomisp/Makefile        |  12 +-
 .../pci/css_2401_system/host/isys_irq_local.h |   3 -
 .../css_2401_system/host/isys_irq_private.h   |   2 -
 .../pci/css_2401_system/isys_irq_global.h     |   2 -
 .../host/input_formatter.c                    |   2 -
 .../hive_isp_css_common/host/input_system.c   |  75 -----
 .../host/isys_dma_public.h                    |   2 -
 .../host/isys_irq_public.h                    |   2 -
 .../hive_isp_css_include/host/isys_public.h   |  19 --
 .../pci/hive_isp_css_include/isys_irq.h       |   2 -
 .../media/atomisp/pci/input_system_local.h    |   7 +-
 .../media/atomisp/pci/input_system_private.h  |   7 +-
 .../media/atomisp/pci/input_system_public.h   |   4 +-
 .../atomisp/pci/isp2400_input_system_local.h  |  89 +++---
 .../pci/isp2400_input_system_private.h        |   4 +-
 .../atomisp/pci/isp2400_input_system_public.h |  13 +-
 .../atomisp/pci/isp2401_input_system_local.h  |  88 +++---
 .../pci/isp2401_input_system_private.h        | 112 +-------
 .../runtime/debug/interface/ia_css_debug.h    |   6 -
 .../pci/runtime/debug/src/ia_css_debug.c      | 256 ------------------
 .../atomisp/pci/runtime/ifmtr/src/ifmtr.c     |   2 -
 .../pci/runtime/isys/interface/ia_css_isys.h  |   9 +-
 .../runtime/isys/interface/ia_css_isys_comm.h |   2 -
 .../pci/runtime/isys/src/csi_rx_rmgr.c        |   2 -
 .../pci/runtime/isys/src/isys_dma_rmgr.c      |   2 -
 .../atomisp/pci/runtime/isys/src/isys_init.c  |  31 +--
 .../runtime/isys/src/isys_stream2mmio_rmgr.c  |   2 -
 .../media/atomisp/pci/runtime/isys/src/rx.c   | 227 ++++++++++------
 .../pci/runtime/isys/src/virtual_isys.c       |   8 +-
 .../pipeline/interface/ia_css_pipeline.h      |   2 -
 .../pci/runtime/pipeline/src/pipeline.c       |   2 -
 drivers/staging/media/atomisp/pci/sh_css.c    |   2 -
 drivers/staging/media/atomisp/pci/sh_css_sp.c |   2 -
 drivers/staging/media/atomisp/pci/sh_css_sp.h |   2 -
 34 files changed, 253 insertions(+), 749 deletions(-)

-- 
2.41.0

