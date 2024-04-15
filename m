Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E58967752
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182567; cv=none; b=N0u10F0kj/5LEYcZrgkCZ/NfZvjGhTZo8HZaQZ/2eAYTBF5CEjbCRGqD6Vh2X6rBEJHjvRq6GHPCJerGMX5Ti1PsC3bZ7p0qJkkSD7UwsnYMLlp587QRITMKwbu/MHV3FPAXc43mfs8pdoqmSLtG360n2glhGkh1+3qujxCYPaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182567; c=relaxed/simple;
	bh=IBjycQH/ah2J6zEhfDYnafJcHq1wuOsLvoN3Mm1nCcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p7Cp4r7/itBZOaLJETEoaV1ecJsH+ZK4UdB2luNZzHdhDusD5EouPC2Q65itpAfcvkISNt8ViPf+i2g2uUXMRzb2jC1hNMewxiSUo289dpBPWBJCRjgtb3MLC+LNFfGfFGXBekGFavXadN7vn33DBT8ywVJFYuzXwnwIK+QJnMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pm8KAYWp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pm8KAYWp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BOItoHEXWBi06NOb9JNy1oZLgbJnOL7jxLkfa62azxc=;
	b=Pm8KAYWp+E/oS2G5FakcTyKMKtwlw26Y9yVgacBh3O2BHJas+sewi3Ntucg2gWXN4i1Gi0
	GBV5bAntyJalhHqwsFS++YEGcdvDGbs7krhBDXAN4HX0OEU/M8o2TzUCh7GsyvQUdcKe0l
	+BuV6RFPhgqkGz5UyFqrVIrEFsWiCyg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-NNeDycYkPWenH6Bs8heE3A-1; Mon, 15 Apr 2024 08:02:40 -0400
X-MC-Unique: NNeDycYkPWenH6Bs8heE3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 014C91049BC7;
	Mon, 15 Apr 2024 12:02:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBE19C13FA2;
	Mon, 15 Apr 2024 12:02:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 04/23] media: atomisp: Simplify atomisp_s_input() input argument checking
Date: Mon, 15 Apr 2024 14:02:01 +0200
Message-ID: <20240415120220.219480-5-hdegoede@redhat.com>
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Simplify the checking of the input argument to atomisp_s_input():
- Remove the check for input >= ATOM_ISP_MAX_INPUTS, input_cnt
  never is > ATOM_ISP_MAX_INPUTS so checking only that is sufficient
- Remove the unnecessary camera local variable
- Move the 2 invalid argument checks to above the atomisp_pipe_check()
  which checks if the pipe is busy or not

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c  | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index b3ad53449cb8..1f8d44900a82 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -449,24 +449,18 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-	struct v4l2_subdev *camera = NULL;
 	int ret;
 
+	if (input >= isp->input_cnt)
+		return -EINVAL;
+
+	if (!isp->inputs[input].camera)
+		return -EINVAL;
+
 	ret = atomisp_pipe_check(pipe, true);
 	if (ret)
 		return ret;
 
-	if (input >= ATOM_ISP_MAX_INPUTS || input >= isp->input_cnt) {
-		dev_dbg(isp->dev, "input_cnt: %d\n", isp->input_cnt);
-		return -EINVAL;
-	}
-
-	camera = isp->inputs[input].camera;
-	if (!camera) {
-		dev_err(isp->dev, "%s, no camera\n", __func__);
-		return -EINVAL;
-	}
-
 	return atomisp_select_input(isp, input);
 }
 
-- 
2.44.0

