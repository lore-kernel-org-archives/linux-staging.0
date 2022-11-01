Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70F97E
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 11:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8E0C433C1;
	Tue,  1 Nov 2022 11:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302089;
	bh=IQWnML7R5rhFY2oavhDQX27l1tZcyVC5nL2ZXOPK5tc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t41498uOZCJ/Ax089/oKNvKpllDmE7HDEj7Hdw88iuzsnjVFbIKqfeMSixUi/ONZs
	 VxZp6XG0WcBsqD6N59XGp2By5b4lb5sGtBo272w8VcvxHOfUo4HlKgp2BneRdcEfO6
	 A0WWu6PResHLKOh7zXqP/RbspNKI5ltYa4t9TnPd3l9cl2SZb3edehff0j9cd0aKtd
	 DaOJB+UjlCLKy6VPUqWoiKE1Y6Mp20LBmSUs57+GWpkRRdfi+XH0JvMOKFOXKlMQmu
	 skKQ1jxpXPaQyBcACEnnyAfi3SXk84BffZLoxYM1gtJimzZTav1v0XS2/y6UFMMw21
	 YqLx5V5S1EreA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	kitakar@gmail.com,
	alan@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 6.0 18/34] media: atomisp: Fix v4l2_fh resource leak on open errors
Date: Tue,  1 Nov 2022 07:27:10 -0400
Message-Id: <20221101112726.799368-18-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101112726.799368-1-sashal@kernel.org>
References: <20221101112726.799368-1-sashal@kernel.org>
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
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 77150e4ae144..92cbc0e263e8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -903,6 +903,7 @@ static int atomisp_open(struct file *file)
 	pm_runtime_put(vdev->v4l2_dev->dev);
 error:
 	rt_mutex_unlock(&isp->mutex);
+	v4l2_fh_release(file);
 	return ret;
 }
 
-- 
2.35.1

