Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE07815494
	for <linux-staging@lists.linux.dev>; Mon,  5 Jun 2023 10:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685960956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xnPtTwgao029ZtXY+VEkL6IjneNgZ5e3SngEFAXXG4I=;
	b=Rc0RD84NzXLsN5Rz2Y7cqImihLI7KReZykKZnLUDDPaGN+rO7JeBuUcmtIg1VOeoOLZd/I
	F5FIHMygPOXKNuARTjDzqFMLcqYKhJIUjPsoqLaW2XHpFtIfTf5tFv1JGT4N4633+KJudF
	Uhet7loHlZnKaC4mGlQjFsZoFQ/dfdg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-tXQWFKYVOXe1f0CFEbriJA-1; Mon, 05 Jun 2023 06:29:13 -0400
X-MC-Unique: tXQWFKYVOXe1f0CFEbriJA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D509585A5BD;
	Mon,  5 Jun 2023 10:29:12 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.47])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 928F27AE4;
	Mon,  5 Jun 2023 10:29:09 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 0/3] Remove #ifdef ISP2401 and unifying sh_css_sp_group structure
Date: Mon,  5 Jun 2023 18:29:00 +0800
Message-Id: <20230605102903.924283-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

sh_css_sp_group structure was managed by #ifdef ISP2401. The configuration
structure was also determined in compile time which means we have to
compile the kernel code twice for each ISP2400 and ISP2401.

In order to determine the ISP types in runtime, the configuration
structure needs to be unified. It allows can be used to configure both
types of ISP. Since the length of the sh_css_sp_group for ISP2400 and
ISP2401 is different, before submitting the configuration to ISP, the data
has to be carefully put the necessary part to a buffer and then submitted
to the ISP.

Kate Hsuan (3):
  media: atomisp: sh_css_internal: Unifying sh_css_sp_group to remove
    #ifdef ISP2401
  atomisp: sh_css_params: write the sp_group config according to the ISP
    model
  media: atomisp: ia_css_debug: remove unused codes

 .../runtime/debug/interface/ia_css_debug.h    |  6 --
 .../pci/runtime/debug/src/ia_css_debug.c      | 76 +------------------
 .../media/atomisp/pci/sh_css_internal.h       | 35 +++------
 .../staging/media/atomisp/pci/sh_css_params.c | 37 ++++++++-
 4 files changed, 48 insertions(+), 106 deletions(-)

-- 
2.40.1

