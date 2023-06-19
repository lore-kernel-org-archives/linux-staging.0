Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4FB185F
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 05:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687152314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gQSgAqSd16TiDy+6bfDlT4CcMxczGbc1cVgP0RYa0hY=;
	b=gNoyu4wWD+CpLl16fR00OLeaO29z97mS8M4lIJMw2CoyX1TsPLhbxrpUfEhZHQuO1C1Nie
	tcs3+e9g9VY1QZAZ8WZmypHGYFI1Pvd3hVcBVMMGBGbHtZdNz9GditnFns40eqqHzwlAN2
	DyfAkNvEFYRcRBYMjVJuQLbNI5x5Av0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-LzgutWKSMhmiqM2lzkOmqg-1; Mon, 19 Jun 2023 01:25:10 -0400
X-MC-Unique: LzgutWKSMhmiqM2lzkOmqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A779800193;
	Mon, 19 Jun 2023 05:25:10 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 009C283B88;
	Mon, 19 Jun 2023 05:25:05 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 0/3] Remove #ifdef ISP2401 and unifying sh_css_sp_group structure
Date: Mon, 19 Jun 2023 13:24:50 +0800
Message-Id: <20230619052453.48598-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

The changes in v3 include:
1. Tweaked the patch order.
2. Corrected the errors in v2.

Kate Hsuan (3):
  media: atomisp: ia_css_debug: Removed unused codes for debug
  media: atomisp: Removed unused HAS_WATCHDOG_SP_THREAD_DEBUG debug
  media: atomisp: sh_css_internal: sh_css_params: Unifying
    sh_css_sp_group data structure

 .../pci/hive_isp_css_common/debug_global.h    |   7 -
 .../media/atomisp/pci/ia_css_acc_types.h      |   6 +-
 .../runtime/debug/interface/ia_css_debug.h    |  12 --
 .../pci/runtime/debug/src/ia_css_debug.c      | 165 ------------------
 .../media/atomisp/pci/sh_css_internal.h       |  41 +----
 .../staging/media/atomisp/pci/sh_css_params.c |  41 ++++-
 6 files changed, 42 insertions(+), 230 deletions(-)

-- 
2.40.1

