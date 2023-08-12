Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367F8370
	for <linux-staging@lists.linux.dev>; Sat, 12 Aug 2023 10:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691837189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m9W5ai7H7CUetv3d/Spr4U/Md6fUQTUL7anIUIfrJl8=;
	b=CL6jWEVbIRzKhnnnKFuh49WLyfVIKUCd4uYt3oEbT/rYgJmh9dISjKxcOGmI6zFm+6wpin
	Ra6n72BiyCyTtevSOvIhPoSnahR1Sxlas4O/ZdcLX6fgalBMIEnVX6Yng0hLDut85ToUei
	/qXS6Ztt95ivIT3a7Xcgt9diDoq9n44=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-rMCprpMsPI2oelVtOykKLw-1; Sat, 12 Aug 2023 06:46:23 -0400
X-MC-Unique: rMCprpMsPI2oelVtOykKLw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C62B801CF3;
	Sat, 12 Aug 2023 10:46:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B6A00492B0F;
	Sat, 12 Aug 2023 10:46:20 +0000 (UTC)
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
Subject: [PATCH] media: atomisp: Simplify some if (IS_ISP2401...) statements
Date: Sat, 12 Aug 2023 12:46:12 +0200
Message-ID: <20230812104612.38806-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

Replace:

 if (!IS_ISP2401 || (IS_ISP2401 && xxx))

with:

 if (!IS_ISP2401 || xxx)

If the right side of the '||' needs to be evaluated then it is
already known that IS_ISP2401 is true, so no need to check for it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 81f18db7316c..f35c90809414 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -7351,7 +7351,7 @@ static int capture_start(struct ia_css_pipe *pipe)
 		}
 	}
 	/* old isys: need to send_mipi_frames() in all pipe modes */
-	if (!IS_ISP2401 || (IS_ISP2401 && pipe->config.mode != IA_CSS_PIPE_MODE_COPY)) {
+	if (!IS_ISP2401 || pipe->config.mode != IA_CSS_PIPE_MODE_COPY) {
 		err = send_mipi_frames(pipe);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
@@ -8077,7 +8077,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 
 	/* check if mipi size specified */
 	if (stream_config->mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
-		if (!IS_ISP2401 || (IS_ISP2401 && !stream_config->online))
+		if (!IS_ISP2401 || !stream_config->online)
 		{
 			unsigned int port = (unsigned int)stream_config->source.port.port;
 
-- 
2.41.0

