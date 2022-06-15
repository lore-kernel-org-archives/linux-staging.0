Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5CC3FDD
	for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 20:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655326317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WUP87y8Z7pGtN31UM3/x+gSBcpA/s11Yx3hAsBBL4Ss=;
	b=JrlVXA7q0nSqNGZt6opEHu+hikEExQ1MgromHvYb23Q0lQclgOtpWxP6wfJGjw6H9FxevU
	GJvd/rXhM1YuvDvjUF57ROc6xwnYGaTLZevhub3KMZ3fgCJwb+AiIP9Ps8CBGCepIA/WoQ
	NBDBaXhnS/1Jr8oZCMGtruVGICVc52Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-4O7czqo7OhqDeaGDev3CFA-1; Wed, 15 Jun 2022 16:51:53 -0400
X-MC-Unique: 4O7czqo7OhqDeaGDev3CFA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 340E4185A7A4;
	Wed, 15 Jun 2022 20:51:53 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 998C1111F5;
	Wed, 15 Jun 2022 20:51:51 +0000 (UTC)
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
	linux-staging@lists.linux.dev,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 40/40] media: atomisp: Add a notes.txt file
Date: Wed, 15 Jun 2022 22:50:37 +0200
Message-Id: <20220615205037.16549-41-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5

Add a files documenting what I've learned about the driver while
working on various cleanups.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/notes.txt | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 drivers/staging/media/atomisp/notes.txt

diff --git a/drivers/staging/media/atomisp/notes.txt b/drivers/staging/media/atomisp/notes.txt
new file mode 100644
index 000000000000..d128b792e05f
--- /dev/null
+++ b/drivers/staging/media/atomisp/notes.txt
@@ -0,0 +1,30 @@
+Some notes about the working of the atomisp drivers (learned while working
+on cleaning it up).
+
+The atomisp seems to be a generic DSP(ISP) like processor without a fixed
+pipeline. It does not have its own memory, but instead uses main memory.
+The ISP has its own address-space and main memory needs to be mapped into
+its address space through the ISP's MMU.
+
+Memory is allocated by the hmm code. hmm_alloc() returns an ISP virtual
+address. The hmm code keeps a list of all allocations and when necessary
+the hmm code finds the backing hmm-buffer-object (hmm_bo) by looking
+up the hmm_bo based on the ISP virtual address.
+
+The actual processing pipeline is made by loading one or more programs,
+called binaries. The shisp_240??0_v21.bin firmware file contains many
+different binaries. Binaries are picked by filling a ia_css_binary_descr
+struct with various input and output parameters and then calling
+ia_css_binary_find(). Some binaries support creating multiple outputs
+(preview + video frame?) at the same time.
+
+For example for the /dev/video0 preview node load_preview_binaries()
+from atomisp/pci/sh_css.c is called and then loads a preview and
+optionally a scalar binary. Note when digital zoom is disabled
+(it is enabled by default) only the preview binary is loaded.
+So in this case a single binary handles the entire pipeline.
+
+Since getting a picture requires multiple processing steps,
+this means that unlike in fixed pipelines the soft pipelines
+on the ISP can do multiple processing steps in a single pipeline
+element (in a single binary).
-- 
2.36.0

