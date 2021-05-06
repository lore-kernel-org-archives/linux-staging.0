Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3701D2F82
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 15:26:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8113613EA;
	Thu,  6 May 2021 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620314800;
	bh=FkmgprH1Efaxx2ACANKQIX0x+YQtBzJ9hcv6iynvk/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e6WPCzWeK5ndy4vrit25wUyDiO0K5AqFr4oaF9rquuwtK9f2msNvU7ZaCClijoc26
	 4XDSeMrSjNiRbqARoYsLkBoYL0HqnHP/5gk95fIGhhrHblB6AjfFXNXi/kCHJL8OlS
	 voy/XmUrCC46HextonH00dlR96DsaYP3HcTbA2MgKfdzcbDn/gzjtWK1wSkoLb+sRG
	 O+NrVlMYp4TNAC5+5zzaOCgPqpFkwDa8LSK9Hegic/tAgBPSJUJhaYglv3NVHXB5fj
	 3pQOXiiwQD0zJmzck29ljMR7/k0q2DDqz0byD65/9QfhEUBnLgZu5c5LaVVYN8ZnnY
	 yNc35wDpA+wsA==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1left7-000SB8-N5; Thu, 06 May 2021 17:26:05 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 02/25] staging: media: atomisp: use pm_runtime_resume_and_get()
Date: Thu,  6 May 2021 17:25:40 +0200
Message-Id: <4111169357a17dda547034b7a5e15f1ce225d4ab.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Besides that, the de-init order in case of css error was wrong.
This change should also fix that.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index f1e6b2597853..26d05474a035 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -837,7 +837,7 @@ static int atomisp_open(struct file *file)
 	}
 
 	/* runtime power management, turn on ISP */
-	ret = pm_runtime_get_sync(vdev->v4l2_dev->dev);
+	ret = pm_runtime_resume_and_get(vdev->v4l2_dev->dev);
 	if (ret < 0) {
 		dev_err(isp->dev, "Failed to power on device\n");
 		goto error;
@@ -881,9 +881,9 @@ static int atomisp_open(struct file *file)
 
 css_error:
 	atomisp_css_uninit(isp);
-error:
-	hmm_pool_unregister(HMM_POOL_TYPE_DYNAMIC);
 	pm_runtime_put(vdev->v4l2_dev->dev);
+error:
+	hmm_pool_unregister(HMM_POOL_TYPE_DYNAMIC);
 	rt_mutex_unlock(&isp->mutex);
 	return ret;
 }
-- 
2.30.2

