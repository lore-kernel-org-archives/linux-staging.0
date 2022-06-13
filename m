Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD547C
	for <linux-staging@lists.linux.dev>; Mon, 13 Jun 2022 19:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655149976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9q64LWP12y0X95rSsagQ9xkrf9Y3OYzzhSyXXwSq9FQ=;
	b=OCMI8Tv8U41qofT3D/AtmV/4kRDfZQil65ZetFFMsmhYcz0XDMOAEsdPrkvB5xweSqjYSC
	7CAnV2e225vW96Dqa3rv5Kco9W7DammSxdnboiqYEY+/IfwmuuIiRBGsb2PENDU15Pm+ca
	cLk89Hp9qTJwo/AxtH5trKs2EFQWHV8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-SDkwoOmWOdCp9dFzPcSgvQ-1; Mon, 13 Jun 2022 15:52:52 -0400
X-MC-Unique: SDkwoOmWOdCp9dFzPcSgvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0028880B70A;
	Mon, 13 Jun 2022 19:52:51 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71FAB2166B26;
	Mon, 13 Jun 2022 19:52:49 +0000 (UTC)
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
	linux-staging@lists.linux.dev
Subject: [PATCH 40/40] media: atomisp: Add a notes.txt file
Date: Mon, 13 Jun 2022 21:51:37 +0200
Message-Id: <20220613195137.8117-41-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6

Add a files documenting what I've learned about the driver while
working on various cleanups.

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

