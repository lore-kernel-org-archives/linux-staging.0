Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB07112D750
	for <linux-staging@lists.linux.dev>; Mon,  3 Jun 2024 13:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717420870; cv=none; b=uJryIM2sKnfvA2bCRnHAKeICIYF7SsyxOr7wmxPIwHcJnEx6LUerI1b8C/8C7EIFQmin+Mt2obgw6gGykQggnnioWWfGkqiRw39WZ1vuXGIdVF3/Ros38i7Gn3kUEZOkSwXLzl2WtodpLmiX36HP6XGW1Uz5yzo3SIbAwnzEOJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717420870; c=relaxed/simple;
	bh=kCiZf/EstAVk0j7LktRbvsqhswdKr9a4X1y1doh/JYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrKlaji+wI0/NXUds/2frSJHNJH1oNrXgeWaUwaKI3ua0dNoB67+PfW8ZONU9b0q9Hbq1KxCAXx9aq0HyqQEe//ANAngYYRWmeRasrDXzUC3/GiNXUgODEQSVdkvGIEbw7Rjr3wM9FI4SFtN+Fkrr8OoZxLJMeHQhoyHCJy/ElA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jxa/DmJn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jxa/DmJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717420867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4h7oqV7Gp3dwPcoZBciov7bOn4WGfpSJ30Rdq1VmwvM=;
	b=Jxa/DmJn5txojBJtokPFVd6KU7U8x2Oj3YyWQVG8GKDIGNZDLGjuSC7nxMYURM4jQd7QD4
	YnUdr1z0Gf4iKKWNWTaWBfp+dg92llk6QUdp2vAP4gwoOVmT6/O0dqHuKzJA8z8F/F6GtP
	FWdmj+CmUSAcOVEdFigRHHtip39P0nY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-k6jKerjJN9KY8UC8wApfSw-1; Mon, 03 Jun 2024 09:21:04 -0400
X-MC-Unique: k6jKerjJN9KY8UC8wApfSw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66F34185A783;
	Mon,  3 Jun 2024 13:21:03 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.39])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD73A155D;
	Mon,  3 Jun 2024 13:21:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 3/5] media: atomisp: Prefix firmware paths with "intel/ipu/"
Date: Mon,  3 Jun 2024 15:20:55 +0200
Message-ID: <20240603132057.255917-3-hdegoede@redhat.com>
In-Reply-To: <20240603132057.255917-1-hdegoede@redhat.com>
References: <20240603132057.255917-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

The atomisp firmwares have been added to upstream linux-firmware
under intel/ipu/ add this prefix to the firmware name passed
to request_firmware().

Fall back to the old location if this fails to avoid breaking existing
setups.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index cfdfbf96c3fe..9d7f57d37b27 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1099,17 +1099,17 @@ atomisp_load_firmware(struct atomisp_device *isp)
 
 	if ((isp->media_dev.hw_revision >> ATOMISP_HW_REVISION_SHIFT) ==
 	    ATOMISP_HW_REVISION_ISP2401)
-		fw_path = "shisp_2401a0_v21.bin";
+		fw_path = "intel/ipu/shisp_2401a0_v21.bin";
 
 	if (isp->media_dev.hw_revision ==
 	    ((ATOMISP_HW_REVISION_ISP2401_LEGACY << ATOMISP_HW_REVISION_SHIFT) |
 	     ATOMISP_HW_STEPPING_A0))
-		fw_path = "shisp_2401a0_legacy_v21.bin";
+		fw_path = "intel/ipu/shisp_2401a0_legacy_v21.bin";
 
 	if (isp->media_dev.hw_revision ==
 	    ((ATOMISP_HW_REVISION_ISP2400 << ATOMISP_HW_REVISION_SHIFT) |
 	     ATOMISP_HW_STEPPING_B0))
-		fw_path = "shisp_2400b0_v21.bin";
+		fw_path = "intel/ipu/shisp_2400b0_v21.bin";
 
 	if (!fw_path) {
 		dev_err(isp->dev, "Unsupported hw_revision 0x%x\n",
@@ -1118,6 +1118,9 @@ atomisp_load_firmware(struct atomisp_device *isp)
 	}
 
 	rc = request_firmware(&fw, fw_path, isp->dev);
+	/* Fallback to old fw_path with "intel/ipu/" prefix */
+	if (rc)
+		rc = request_firmware(&fw, strrchr(fw_path, '/') + 1, isp->dev);
 	if (rc) {
 		dev_err(isp->dev,
 			"atomisp: Error %d while requesting firmware %s\n",
-- 
2.45.1

