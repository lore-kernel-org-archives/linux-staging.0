Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774EE7E
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 11:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6886FC433C1;
	Tue,  1 Nov 2022 11:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302303;
	bh=XGfgyikroiwti/zVu1WZbr6QBIY23vB9QvosMVykRK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dvGYSlqgfwHbhcu8fYdSgtdh/kpKLI2fmNdmLG2kd1QfkM3/e7f/pM55DwGGRsHkz
	 stomiZGQqmdvvR+6P4sgh9uFa96McFRNf21DWt8IOH/IEuCiiRzyWI1eYuuNWKG+so
	 fipoGFybYVeoahv9x6GQq7OSTOWlKusuS4UIRNoTgcVPVk2XyaCZvEzGxeLo5zmOnU
	 B+pxM5ksc/YfIY5DwOT/HE4CCRCJZVDP5DuLzPheR4S8zVrCNkzn78iTe5OuCSuJH+
	 o9Di/+0QXtTGmEWX2ec+htlvQrceDNvS3GwkWnto4vAUK/yzpMtTevGcxHnm1gtj2a
	 DJGPyF2wn0Qpg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 4.14 3/4] media: atomisp: Fix v4l2_fh resource leak on open errors
Date: Tue,  1 Nov 2022 07:31:32 -0400
Message-Id: <20221101113135.800983-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101113135.800983-1-sashal@kernel.org>
References: <20221101113135.800983-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 5b9853ad1329be49343a608d574eb232ff1273d0 ]

When atomisp_open() fails then it must call v4l2_fh_release() to undo
the results of v4l2_fh_open().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c
index f1d8cc5a2730..0645751b4b19 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c
@@ -888,6 +888,7 @@ static int atomisp_open(struct file *file)
 	hmm_pool_unregister(HMM_POOL_TYPE_DYNAMIC);
 	pm_runtime_put(vdev->v4l2_dev->dev);
 	rt_mutex_unlock(&isp->mutex);
+	v4l2_fh_release(file);
 	return ret;
 }
 
-- 
2.35.1

