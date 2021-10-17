Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8482C81
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 16:22:45 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id ls18so10602797pjb.3
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lIXhjnsru+rHchNvOAzzDS2YJa0jp6BsYH6fxJksSb4=;
        b=XCGWncoB1dFyIxMSafrAUNhtNY7tSgkaYxuCHzguKUQlCQsVkBH5rjrTHXMrEgWvdH
         2alYns1Ua2QDr6qndu1aJMVwytJAmXZ204m6X8CbnT5amEPmssrt14cBdfgCXHNzaVS7
         WtYvGL/1NHstO0dsu3S74VKB6yDL8cmUmX4Kzm1Vu9TFOcw2dXHR7KFJmhhfN0itzayQ
         F3wJoFG0kYeuVzTDrg4QFmmrjcXp3uoy8DnifrXiZQoJGQoz8MJEA6CXqgv9XeNDnBzt
         Bkua9T/etgPdRakCULCbin87XCCsX4m6voJkAqqOh0Y++EO2R5nj/1VahtZ7fAdd6od0
         7rlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lIXhjnsru+rHchNvOAzzDS2YJa0jp6BsYH6fxJksSb4=;
        b=kR8fDbJHkOYxRb2nR6okehicSc6LphlWqKNqRWH7SfJGMtzE0pJK8pVDmh/f/kJ0N8
         GStCNb//Ctxs0iNLtQo2wVzRP4zilBgfeadyFYg8kb0QiRlxVwg5f+v2VfhhBFaIuNRO
         vO5FjbQIPOyzjkzp+SfKWjnmAH1ckyiTD7C1fW9TjADdA3DrSKakndjr8FTjC6Dtcr9K
         +IiBxVv2wGwTbN+rm4o8GmmAsRncyguMIgVwCz/Wv8aef5XMZx2TeD5tPIGhur7a65n/
         YXYRN47xLztzCdGfI+tEkz+onPoYDQolfHK3CE6LxWrY/4XIRu5KyPufJ15JkdMLmKLh
         sRQQ==
X-Gm-Message-State: AOAM530muffJ2mktjZp7SI7UB2khn92VdYWyGxboG0bAcaUtDvfY+902
	L38oy3wxHP4CoC3TXi12HJY=
X-Google-Smtp-Source: ABdhPJyzjLpYwU/zAbPhyTcd/mmrU+3ADlvsC4sPn8KLWwM5DAo1+NU2WY64bK/JwdNecPK/Ug77UQ==
X-Received: by 2002:a17:90b:3cc:: with SMTP id go12mr42019419pjb.127.1634487765267;
        Sun, 17 Oct 2021 09:22:45 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:22:44 -0700 (PDT)
From: Tsuchiya Yuto <kitakar@gmail.com>
To: 
Cc: Hans de Goede <hdegoede@redhat.com>,
	Patrik Gfeller <patrik.gfeller@gmail.com>,
	Alan <alan@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Dinghao Liu <dinghao.liu@zju.edu.cn>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/17] [NOT-FOR-MERGE] atomisp: Fix up the open v load race
Date: Mon, 18 Oct 2021 01:19:57 +0900
Message-Id: <20211017161958.44351-18-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan <alan@linux.intel.com>

Applied this patch as-is for now to pass firmware load on probe.
I haven't looked into this and not written by me anyway.
Thus, NOT-FOR-MERGE. At least I can say this patch works just fine.

>8-----------------------------------------------------------------8<

From: Alan <alan@linux.intel.com>
Patch from https://lore.kernel.org/linux-media/151001137594.77201.4306351721772580664.stgit@alans-desktop/raw

Here is the original commit message:

	Subject: [PATCH 1/3] atomisp: Fix up the open v load race
	From: Alan <alan@linux.intel.com>
	Date: Mon, 06 Nov 2017 23:36:36 +0000

	This isn't the ideal final solution but it stops the main problem for now
	where an open (often from udev) races the device initialization and we try
	and load the firmware twice at the same time. This needless to say doesn't
	usually end well.

	Signed-off-by: Alan Cox <alan@linux.intel.com>

This patch fixes the following "css init failed" error related to
firmware load. This issue often occurs when I insmod the module after
boot.

	kern  :err   : [  234.658869] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.755023] atomisp-isp2 0000:00:03.0: can't change power state from D0 to D3hot (config space inaccessible)
	kern  :err   : [  234.755053] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.755581] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.756146] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.757115] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.757582] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.758885] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.760317] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.760818] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.769102] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.769527] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.771353] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.771804] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.772299] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.774617] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.775090] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.775607] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.776230] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.779059] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.787726] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.788078] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?

Patch is adapted to v5.15-rc4.

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c     | 12 ++++++++++++
 drivers/staging/media/atomisp/pci/atomisp_internal.h |  5 +++++
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c     |  6 ++++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index f82bf082aa79..62535e0f4429 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -772,6 +772,18 @@ static int atomisp_open(struct file *file)
 
 	dev_dbg(isp->dev, "open device %s\n", vdev->name);
 
+	/* Ensure that if we are still loading we block. Once the loading
+	   is over we can proceed. We can't blindly hold the lock until
+	   that occurs as if the load fails we'll deadlock the unload */
+	rt_mutex_lock(&isp->loading);
+	/* Revisit this with a better check once the code structure is
+	   cleaned up a bit more FIXME */
+	if (!isp->ready) {
+		rt_mutex_unlock(&isp->loading);
+		return -ENXIO;
+	}
+	rt_mutex_unlock(&isp->loading);
+
 	rt_mutex_lock(&isp->mutex);
 
 	acc_node = !strcmp(vdev->name, "ATOMISP ISP ACC");
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index c01db10bb735..356a7f1bb757 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -246,6 +246,11 @@ struct atomisp_device {
 	/* Purpose of mutex is to protect and serialize use of isp data
 	 * structures and css API calls. */
 	struct rt_mutex mutex;
+	/* This mutex ensures that we don't allow an open to succeed while
+	 * the initialization process is incomplete */
+	struct rt_mutex loading;
+	/* Set once the ISP is ready to allow opens */
+	bool ready;
 	/*
 	 * Serialise streamoff: mutex is dropped during streamoff to
 	 * cancel the watchdog queue. MUST be acquired BEFORE
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 720963156d24..e2ccace77a73 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1567,6 +1567,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	dev_dbg(&pdev->dev, "atomisp mmio base: %p\n", isp->base);
 
 	rt_mutex_init(&isp->mutex);
+	rt_mutex_init(&isp->loading);
 	mutex_init(&isp->streamoff_mutex);
 	spin_lock_init(&isp->lock);
 
@@ -1749,6 +1750,8 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		pci_write_config_dword(pdev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL, csi_afe_trim);
 	}
 
+	rt_mutex_lock(&isp->loading);
+
 	err = atomisp_initialize_modules(isp);
 	if (err < 0) {
 		dev_err(&pdev->dev, "atomisp_initialize_modules (%d)\n", err);
@@ -1806,6 +1809,8 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	release_firmware(isp->firmware);
 	isp->firmware = NULL;
 	isp->css_env.isp_css_fw.data = NULL;
+	isp->ready = true;
+	rt_mutex_unlock(&isp->loading);
 
 	atomisp_drvfs_init(isp);
 
@@ -1825,6 +1830,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 register_entities_fail:
 	atomisp_uninitialize_modules(isp);
 initialize_modules_fail:
+	rt_mutex_unlock(&isp->loading);
 	cpu_latency_qos_remove_request(&isp->pm_qos);
 	atomisp_msi_irq_uninit(isp);
 	pci_free_irq_vectors(pdev);
-- 
2.33.1

