Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2D27C
	for <linux-staging@lists.linux.dev>; Mon, 13 Jun 2022 19:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655149968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GVCUuAPx13J/edY6RlmG+VcE5YVud1g2ONG3F/9qLtg=;
	b=Hwt0fi540Kwom4SNXVWMmeoLNB+LJCfesbeOM7t/ElGwGwllmyqYHpdBK6fr4F0qF6fYXg
	TSEACEp64G9rl35vn69/XI6eyCfgzOac+Epk7X0ZPIeHIoTNsX+AFeiMZVn655jHj9RdEE
	R4Wa+hPaKASd4IcbYJ3v3oyTfqb8QCw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-O79ukws1OQKpz9BLp9f_7w-1; Mon, 13 Jun 2022 15:52:42 -0400
X-MC-Unique: O79ukws1OQKpz9BLp9f_7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F21DD299E746;
	Mon, 13 Jun 2022 19:52:41 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6805F2166B26;
	Mon, 13 Jun 2022 19:52:40 +0000 (UTC)
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
Subject: [PATCH 35/40] media: atomisp: add error logging to atomisp_destroy_pipes_stream_force()
Date: Mon, 13 Jun 2022 21:51:32 +0200
Message-Id: <20220613195137.8117-36-hdegoede@redhat.com>
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

__destroy_streams() and __destroy_pipes() may return an error.
Log a warning when either of them fails.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 6375cfb839d4..358ef29f27ba 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -581,8 +581,11 @@ static int __destroy_pipes(struct atomisp_sub_device *asd, bool force)
 
 void atomisp_destroy_pipes_stream_force(struct atomisp_sub_device *asd)
 {
-	__destroy_streams(asd, true);
-	__destroy_pipes(asd, true);
+	if (__destroy_streams(asd, true))
+		dev_warn(asd->isp->dev, "destroy stream failed.\n");
+
+	if (__destroy_pipes(asd, true))
+		dev_warn(asd->isp->dev, "destroy pipe failed.\n");
 }
 
 static void __apply_additional_pipe_config(
-- 
2.36.0

