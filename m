Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F3B6CDBE
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182577; cv=none; b=Z0zr3SEdUDuEllmz6DDSsri0ds3aSqCdcQNzFw/SRjis7ttF0/D+4Y/C3ce0GRJAexkniL7IztNPBoD4CoQRjiwZna/u3c3IdeKnxRvD061pO550OFTtbFqOimo4hn9XTXA8tPyG0ORb+v65KxzQoeUfueqmLWbuT1cbBs4UflQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182577; c=relaxed/simple;
	bh=Ylz6rzQsgY/smEeOjGzzC4QgItrBXNo3xi5lbtRO3wE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SSTzranW71AHfan84ewW4f1kSo3KLvAEtjfy5/WNAg58aZKxNKR11vfrbVA59dm5+LNKWSTJv/6znDneWnorRsyFGApMphQEKXqw5TpK6CT7y6LwJGEeL642tPVLWF4kQw4q3cMYchqGjIYbXk3ngZ+tzyYs02npSXFjM5Y+DnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WRXBtObk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WRXBtObk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ynX0DGXz84eH72mur6sdT5zYy1ByXKBp3wkUemoSC/8=;
	b=WRXBtObkVhR1to/xCUE+qhW5ICAAiF195lfN2pvdkXiAj/6bnrI/EQqUrkX/82nrZQglTQ
	dLI6B8QnwHnKBm5XjCSU3flYloPj2RsnAvOTVwlpQA2Layqyt1/nRsDQcjhoiOQ8HEDynl
	nGc32AyWDU4+iavP++JiFzGQvJKPTnU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-168-pw2uRze3Pee3v1fMGDJvrA-1; Mon,
 15 Apr 2024 08:02:52 -0400
X-MC-Unique: pw2uRze3Pee3v1fMGDJvrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 950F33C0252A;
	Mon, 15 Apr 2024 12:02:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AA5CC15771;
	Mon, 15 Apr 2024 12:02:50 +0000 (UTC)
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
Subject: [PATCH 12/23] media: atomisp: Remove input_port_ID_t
Date: Mon, 15 Apr 2024 14:02:09 +0200
Message-ID: <20240415120220.219480-13-hdegoede@redhat.com>
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

Change the single, unexpected user of CSI_PORT0_ID

	for (port = CSI_PORT0_ID; port < N_CSI_PORTS; port++)

to

	for (port = 0; port < N_CSI_PORTS; port++) {

matching all the other for-loops iterating over the ports in
the same file.

And remove the now fully unused input_port_ID_t enum type.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c   |  2 +-
 drivers/staging/media/atomisp/pci/system_global.h | 12 ------------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 6e11fd771938..80f0395cc560 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -489,7 +489,7 @@ free_mipi_frames(struct ia_css_pipe *pipe)
 		}
 	} else { /* pipe ==NULL */
 		/* AM TEMP: free-ing all mipi buffers just like a legacy code. */
-		for (port = CSI_PORT0_ID; port < N_CSI_PORTS; port++) {
+		for (port = 0; port < N_CSI_PORTS; port++) {
 			unsigned int i;
 
 			for (i = 0; i < my_css.num_mipi_frames[port]; i++) {
diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index 060b924023ec..e8a29f73d67a 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -201,18 +201,6 @@ enum mipi_port_id {
 
 #define	N_RX_CHANNEL_ID		4
 
-/* Generic port enumeration with an internal port type ID */
-typedef enum {
-	CSI_PORT0_ID = 0,
-	CSI_PORT1_ID,
-	CSI_PORT2_ID,
-	TPG_PORT0_ID,
-	PRBS_PORT0_ID,
-	FIFO_PORT0_ID,
-	MEMORY_PORT0_ID,
-	N_INPUT_PORT_ID
-} input_port_ID_t;
-
 typedef enum {
 	CAPTURE_UNIT0_ID = 0,
 	CAPTURE_UNIT1_ID,
-- 
2.44.0

