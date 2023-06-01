Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4E321CE7
	for <linux-staging@lists.linux.dev>; Thu,  1 Jun 2023 14:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685631545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JVRvs8QJx9CNBtc2Rk8H2xebHJdKqyXP5sJ0dypZkx8=;
	b=YbU5hHS07u18Xjrp+wPn6a2pcsw5WDTdW9/ikpe6SLv5ItuAWYU9+rYyX5rPaLs5Ej/75U
	SvzX/ltOL2DwO/EmHjGdYtetTgIpWa5pZN3frdqFatK6BBG9Klq/MuioVLapnQf1LsAPfv
	k3L1nxaobiWsjNp2l/N11jHsyIdl2cw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-kiELqxH_ObOxVUAHr9yOGg-1; Thu, 01 Jun 2023 10:59:01 -0400
X-MC-Unique: kiELqxH_ObOxVUAHr9yOGg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E70EB101A585;
	Thu,  1 Jun 2023 14:59:00 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67FDE20296C6;
	Thu,  1 Jun 2023 14:58:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/3] media: atomisp: Selection API support bugfixes
Date: Thu,  1 Jun 2023 16:58:55 +0200
Message-Id: <20230601145858.59652-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

Hi All,

Here is a set of bugfixes for the recently added Selection API support.

Regards,

Hans


Hans de Goede (3):
  media: atomisp: Take minimum padding requirement on BYT/ISP2400 into
    account
  media: atomisp: Make atomisp_enum_framesizes_crop() check resolution
    fits with padding
  media: atomisp: Fix binning check in atomisp_set_crop()

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 42 ++++++++++++++++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  4 ++
 .../media/atomisp/pci/atomisp_common.h        |  4 ++
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 18 +++++---
 4 files changed, 58 insertions(+), 10 deletions(-)

-- 
2.40.1

