Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFAF7B
	for <linux-staging@lists.linux.dev>; Tue, 25 Apr 2023 07:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682408950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5RHO07m1f9W2RKPCP1klHGEZU5kaUC4LlrOjGSFX8WQ=;
	b=fzXBx8fDZhHYCJF2MMBx0iPa9ZUkeb/V3DzVKUhkYVQtjLMJXS0HDPwKsNEVAQYSitOjXn
	+RgSlotN7v7RrWdsMEzDm5lHsLouat8b9yKk2YX++2m3q3bqRB/kBZBcMHe08GMtlNkqYI
	32OM7Mkut0sACXHx04Sl1/8OE7qdDGU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-GVLX56wXOSmNYAQtP5_adQ-1; Tue, 25 Apr 2023 03:49:06 -0400
X-MC-Unique: GVLX56wXOSmNYAQtP5_adQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 616A71C07587;
	Tue, 25 Apr 2023 07:49:06 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.153])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56A07140263F;
	Tue, 25 Apr 2023 07:49:02 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 0/5] staging: media: atomisp: Remove #ifdef 2401
Date: Tue, 25 Apr 2023 15:48:36 +0800
Message-Id: <20230425074841.29063-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

Since #ifdef ISP2401 is used to determine the action of both models in compiler
time, we have to provide two binaries for both models. It is very unfriendly for
the users and for the package management aspect.

The proposed patch removed the #ifdef ISP2041 from the codes and made the 
path for both models can be determined at the runtime. Some of the #ifdef is 
highly integrated with functions and data structures. If we try to remove 
them, it will cause many issues, such as duplicated variable/function name
and data length. Therefore, these patches focus on removing the #ifdef
without affecting the change of structure.

Kate Hsuan (5):
  staging: media: atomisp: sh_css: Remove #ifdef ISP2401
  staging: media: atomisp: runtime: frame: remove #ifdef ISP2401
  staging: media: atomisp: sh_css_sp: Remove #ifdef ISP2401
  staging: media: atomisp: sh_css_firmware: determine firmware version
    at runtime
  staging: media: atomisp: sh_css_mipi: Remove #ifdef 2041

 .../atomisp/pci/runtime/frame/src/frame.c     |  15 +-
 drivers/staging/media/atomisp/pci/sh_css.c    | 584 +++++++++---------
 .../media/atomisp/pci/sh_css_firmware.c       |  18 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 101 ++-
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  10 +-
 5 files changed, 359 insertions(+), 369 deletions(-)

-- 
2.39.2

