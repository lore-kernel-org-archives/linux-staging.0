Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA052C83
	for <linux-staging@lists.linux.dev>; Mon,  8 Nov 2021 09:40:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05DEF61242;
	Mon,  8 Nov 2021 09:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636364430;
	bh=3kdsbDiloldfUsyYCakxpoQVBFAHbfEI/J3qiZ1fOrg=;
	h=From:To:Cc:Subject:Date:From;
	b=o8BTlm/F88B66GDeVFjWEcYDaB3Y7up4uV396tzow/YxPVLZLmQXMT0Vyrwo20qJn
	 YjDf/7Zs38d99UpOdZ4Ga2I0Mlz+p8nqi1wW9/Sz8SBqr1pNp3XbjjBBKpf0fwNRj4
	 1EbG3vqcIJoAuBu1zBVR1bMJXCWSF0KRwebOsbs5dOQGIMm6olykmD/qMQA7KwjlHC
	 jlHzmYKQXwxfc91F7Uvk2U39RPXAo9addLB+7fD+W5/l0kBd1xq2R6jLPJ/eqTNOqh
	 k9FxnCFXYjmbw6rQSPwxj78IWCpdV1M6bFinXUyKzXqIIgL3sQ+vlE1UjWyiDOC1/R
	 oCdNJyj20IyfA==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mk18c-00118a-Jw; Mon, 08 Nov 2021 09:40:26 +0000
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Alan <alan@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: only initialize mode if pipe is not null
Date: Mon,  8 Nov 2021 09:40:25 +0000
Message-Id: <6406265f2d5f3791d5c7cbd1364186217f19524c.1636364423.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

During atomisp register, udev tries to open all devices. For
some, pipe is NULL, at least during register time, causing the
driver to try to access a NULL pointer.

So, add an extra check to avoid such condition.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index a57d480820bd..c7ac313a2edf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -901,7 +901,7 @@ static int atomisp_open(struct file *file)
 	rt_mutex_unlock(&isp->mutex);
 
 	/* Ensure that a mode is set */
-	if (asd)
+	if (asd && pipe)
 		v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
 
 	return 0;
-- 
2.33.1

