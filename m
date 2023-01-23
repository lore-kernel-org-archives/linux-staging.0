Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73BF1C01
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2WTQvgcyTu3aS+c5QfQAht1i8HC7quqbELiRPW8QonA=;
	b=WdPx8PuQjBtoyZOm/G80E4F1VvtM1XqAz8l9JVadl4fLHhj6NXiSvJelldIxcCYvOnDQ2I
	6jRZd9kMn5atDEXMbdHu6bJlF0Hyw55oEY8kbpb63mVtwzsdeNoy82+7Hi0MRJKeNuxdoQ
	cniBKTUxxHn/DePFOD2T1J2nfU28U0I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-H1NQCQcwMIqh4eb_E_Auvg-1; Mon, 23 Jan 2023 07:52:58 -0500
X-MC-Unique: H1NQCQcwMIqh4eb_E_Auvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FD543C02537;
	Mon, 23 Jan 2023 12:52:58 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7C9AC15BA0;
	Mon, 23 Jan 2023 12:52:55 +0000 (UTC)
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
Subject: [PATCH 17/57] media: atomisp: Only set default_run_mode on first open of a stream/asd
Date: Mon, 23 Jan 2023 13:51:25 +0100
Message-Id: <20230123125205.622152-18-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

Calling v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode) when
the stream is already active (through another /dev/video# node) causes
the stream to stop.

Move the call to set the default run-mode so that it is only done
on the first open of one of the 4 /dev/video# nodes of one of
the 2 streams (atomisp-sub-devices / asd-s).

Fixes: 2c45e343c581 ("media: atomisp: set per-device's default mode")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 7f4934ff9cab..78af97a64362 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -764,13 +764,13 @@ static int atomisp_open(struct file *file)
 		goto done;
 
 	atomisp_subdev_init_struct(asd);
+	/* Ensure that a mode is set */
+	v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
 
 done:
 	pipe->users++;
 	mutex_unlock(&isp->mutex);
 
-	/* Ensure that a mode is set */
-	v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
 
 	return 0;
 
-- 
2.39.0

