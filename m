Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F75618E032
	for <linux-staging@lists.linux.dev>; Wed,  9 Oct 2024 08:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463068; cv=none; b=ZZgFIFcl4uv2D1YrDluzNMiG2P3rk7JZHxe6nDyo8XhKYBjEMJahBMOIFp/aGimk0S1taRBBSrpwOv/5NAKX5WyUKG23tjww25WUmnAaP2S4iATwxVZS9mdi5jYzQXZ+AxniFlEJoiF8mEpVsrYs2uZAThu1dfeSpnLWBMYj0k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463068; c=relaxed/simple;
	bh=EpcjpNUPxDJfeNBdK7OSbEE2nGoSE5GNXjSmcKadEZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ay+dKQhhXcLUNHRR7qL8RrkkPZbiPhojsMqpzPefvrlO5mbnDoMmYFTZlQ2sTxQUZjL413Fnt1jhfFXVVptu1daWFuacTYvUNd9ZYA5OMuB/6oERLzoMKaI1kgxFrs/6/S7f1pAMk+rAi0f0c8vglP3se+YBfdlGVOWfOVp5Pgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DlD8AC5F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DlD8AC5F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728463065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JsGvGJm9MmViCmQHy+rwDTsxwdGI+an22CjgwnYtt0I=;
	b=DlD8AC5FeAy12otSKJW3K7BOBbkihwJUfV25ldfUwtq+khE2Xao17JNFw31+swaMiPOeaj
	7Jpif5VM0PlipxjDSNty8+MfYpvEki8iGKUYLPfQfb7BNK8m2/G8eaCTB+/cTVn3y30XRN
	/C6COYsqe5HfH6By6kOGCpklm6h9WUk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-hrwsjTk0Oaukolmq0ZBF-Q-1; Wed, 09 Oct 2024 04:37:44 -0400
X-MC-Unique: hrwsjTk0Oaukolmq0ZBF-Q-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7afcd3945fbso184387285a.3
        for <linux-staging@lists.linux.dev>; Wed, 09 Oct 2024 01:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463063; x=1729067863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsGvGJm9MmViCmQHy+rwDTsxwdGI+an22CjgwnYtt0I=;
        b=hX9TfcDSlOBoP4l08i7RbuJnz8GE9E9uPQFHipXyqKtaix8ot9TLl92ihpM0Jxwv1A
         5AVqz4OmEDITfZpZXK7GUamPvUi7IvBFhwCgbyn2YPOX6g1RA2wYkKrbJLydmyge2RdL
         cm/0iZBf+sfOubK5FbOLft27bR0WE10HLuHlXJvtPhft7rLM44QCpqIN5CZXUB744JRS
         DwwXKBenaBaPSiSZ1IG9kU6lnP29aB4d4MNy0dbUFfaFewLlEDGzpj4vD88Ffii1uHfJ
         v5mQRiTeT/AcdKmx2LdX0IbYLdLxEiv3BCGbkk999v16+XkinVbN03pYzpGHvnkz1UO8
         ocpA==
X-Forwarded-Encrypted: i=1; AJvYcCWHXePQabatasBAb6Vd6mJ2jpbXGUwpwH12V66eOOHWOdhlb3GGoFZwAffzCL+lHZG6Bx57bv0QqqoRnksh@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7tWs+4Rw5fwYUTOuTK8xQjha8+PPGiux4x837QV+5yOpzwiSy
	qiK9LYigjBn/yYPdaUT4wfrE5HCaGZyaQe8ifhhvye6/Xm2gde92ZW1M5ZIt9zy3O8764Hxdjt6
	SHODiwy8bSTDsR8JHvs7imRgG5Cw81fZU+JPIxM+nV5yKSj2WIFC2ctOzs+UFmPc=
X-Received: by 2002:a05:620a:2a0e:b0:7ac:a6f9:2986 with SMTP id af79cd13be357-7b0874d79cdmr228241585a.56.1728463063338;
        Wed, 09 Oct 2024 01:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFImvB9Qv7o17NV9RNqrUwhslSwlEiuBLwjyyln/SL0KXDFR9AO0zKFsp8+HNe0WvD5hbb1TQ==
X-Received: by 2002:a05:620a:2a0e:b0:7ac:a6f9:2986 with SMTP id af79cd13be357-7b0874d79cdmr228232385a.56.1728463062845;
        Wed, 09 Oct 2024 01:37:42 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae75615aa2sm439643585a.14.2024.10.09.01.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:37:42 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasesh Mody <rmody@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Igor Mitsyanko <imitsyanko@quantenna.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hannes Reinecke <hare@suse.de>,
	John Garry <john.g.garry@oracle.com>,
	Soumya Negi <soumya.negi97@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ye Bin <yebin10@huawei.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org
Subject: [RFC PATCH 07/13] vfio/pci: Use never-managed version of pci_intx()
Date: Wed,  9 Oct 2024 10:35:13 +0200
Message-ID: <20241009083519.10088-8-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241009083519.10088-1-pstanner@redhat.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

vfio enables its PCI-Device with pci_enable_device(). Thus, it
needs the never-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/vfio/pci/vfio_pci_core.c  |  2 +-
 drivers/vfio/pci/vfio_pci_intrs.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 1ab58da9f38a..90240c8d51aa 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -498,7 +498,7 @@ int vfio_pci_core_enable(struct vfio_pci_core_device *vdev)
 		if (vfio_pci_nointx(pdev)) {
 			pci_info(pdev, "Masking broken INTx support\n");
 			vdev->nointx = true;
-			pci_intx(pdev, 0);
+			pci_intx_unmanaged(pdev, 0);
 		} else
 			vdev->pci_2_3 = pci_intx_mask_supported(pdev);
 	}
diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
index 8382c5834335..40abb0b937a2 100644
--- a/drivers/vfio/pci/vfio_pci_intrs.c
+++ b/drivers/vfio/pci/vfio_pci_intrs.c
@@ -118,7 +118,7 @@ static bool __vfio_pci_intx_mask(struct vfio_pci_core_device *vdev)
 	 */
 	if (unlikely(!is_intx(vdev))) {
 		if (vdev->pci_2_3)
-			pci_intx(pdev, 0);
+			pci_intx_unmanaged(pdev, 0);
 		goto out_unlock;
 	}
 
@@ -132,7 +132,7 @@ static bool __vfio_pci_intx_mask(struct vfio_pci_core_device *vdev)
 		 * mask, not just when something is pending.
 		 */
 		if (vdev->pci_2_3)
-			pci_intx(pdev, 0);
+			pci_intx_unmanaged(pdev, 0);
 		else
 			disable_irq_nosync(pdev->irq);
 
@@ -178,7 +178,7 @@ static int vfio_pci_intx_unmask_handler(void *opaque, void *data)
 	 */
 	if (unlikely(!is_intx(vdev))) {
 		if (vdev->pci_2_3)
-			pci_intx(pdev, 1);
+			pci_intx_unmanaged(pdev, 1);
 		goto out_unlock;
 	}
 
@@ -296,7 +296,7 @@ static int vfio_intx_enable(struct vfio_pci_core_device *vdev,
 	 */
 	ctx->masked = vdev->virq_disabled;
 	if (vdev->pci_2_3) {
-		pci_intx(pdev, !ctx->masked);
+		pci_intx_unmanaged(pdev, !ctx->masked);
 		irqflags = IRQF_SHARED;
 	} else {
 		irqflags = ctx->masked ? IRQF_NO_AUTOEN : 0;
@@ -569,7 +569,7 @@ static void vfio_msi_disable(struct vfio_pci_core_device *vdev, bool msix)
 	 * via their shutdown paths.  Restore for NoINTx devices.
 	 */
 	if (vdev->nointx)
-		pci_intx(pdev, 0);
+		pci_intx_unmanaged(pdev, 0);
 
 	vdev->irq_type = VFIO_PCI_NUM_IRQS;
 }
-- 
2.46.1

