Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA841D2F5B
	for <linux-staging@lists.linux.dev>; Mon,  2 Sep 2024 09:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270767; cv=none; b=E9AzuKBp+vuciuw2Y0vPiE2w9k3VcYzuB8Tzgz4rXGUJrpdrqbTT4AUOhF3t6d+TfSFtKByjnZs6Z8B2bqvPKorMi4uPBSsYMNR3XgUmeeYq12eyoKzwXUJ9CtCWXOY95Af7/iRsXot8ffviH/N4UVc5BiV0yaQ4tVUDcBYMTJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270767; c=relaxed/simple;
	bh=uFl7yUOCTqCDOLrEAYLSriT/u2ITNVBa4bTnp76X5rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jo5jRXsXXkaxPyNRclLyeCbfiG8/s0hSapTqmwSGXnzU3oCiuVUMpqrnndq+HxLeeYYxKi5K9MxEA12N79QYMBgC56ot21OWrHMZU2tupISLnRQWuEAwEzX4I1n2l6KM+2FCYqFRqPGb9mpdK9rvCiryO/etD7cWCRNk9ShV96E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iJtDjdMI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iJtDjdMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725270764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3vJDQ2P1zTQIQeCDvaOkG6DbFSwFe8KFI0TJMu3LvPg=;
	b=iJtDjdMIZlZ6st/NyXCJr7gpIlB4msFTHySS1gSSLtPW/xLkRO3dwmhj+FbjoXAHThKAdg
	5sKs2iW1YMMNWNbJUviQpn+YvrpNIOd3k6OhzlmRQIuBU+EoaQ4dcnysjaLREM9eOzqe2J
	S0YI2MqbBA8KeZoX/5fSWXqYSPSfwtg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-wULZuvGNNIW76kjhZble3A-1; Mon,
 02 Sep 2024 05:52:38 -0400
X-MC-Unique: wULZuvGNNIW76kjhZble3A-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5641819DBAC3;
	Mon,  2 Sep 2024 09:52:36 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.30])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9AD5C19560A3;
	Mon,  2 Sep 2024 09:52:31 +0000 (UTC)
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
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/3] media: atomisp: csi2-bridge: Add DMI quirk for t4ka3 on Xiaomi Mipad2
Date: Mon,  2 Sep 2024 11:52:27 +0200
Message-ID: <20240902095229.59059-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

The t4ka3 sensor on the Xiaomi Mipad2 is used as a back facing sensor,
it uses 4 CSI lanes, but the _DSM has CsiLanes set to 2. Extend
the existing Xiaomi Mipad2 DMI quirk to override the wrong _DSM setting.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 31c9e05a1435..b2a3243ae2d4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -109,6 +109,8 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
 static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 	/* _DSM contains the wrong CsiPort for the front facing OV5693 sensor */
 	{ "INT33BE:00", "CsiPort", "0" },
+	/* _DSM contains the wrong CsiLanes for the back facing T4KA3 sensor */
+	{ "XMCC0003:00", "CsiLanes", "4" },
 	{}
 };
 
-- 
2.46.0

