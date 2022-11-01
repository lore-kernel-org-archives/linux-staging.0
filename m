Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAA07E
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 11:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B0CC433C1;
	Tue,  1 Nov 2022 11:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302086;
	bh=sFbRVrvnTUcWjQrPQOYG51/HG21tYtpyY/ElwlplYz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lg2A7cxO4IwfOq/k7vfm38c9EDcoSFJ1pugxFEth/XlaSQFjLIaxoDXyUtpP+rB/L
	 WFUAjzdJpQb5X8yleRF6hWUooYeVj8VFeW5Y94MsRrKWQTk186xWq9zcvaPYylxaYb
	 7RMbeWqJgV1d83AILkmd1/fTHPPHnPxGatsGPrmWOmFVxS6MoMbuUeaXN53l1J2SV/
	 uBya6Qyi+wUFxxoAKS26h2T46YOdrWjhuafMTYEElsGfkZzaJQPCKTkc23lwtH6aXq
	 2jjF5DuKWGGRB+3RNkFRlhaZhhbklQab1qvDf5xd8Kop6ZBMFkoqQe9txsFmggAmOi
	 eMHcjdeZIe6Ww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	kitakar@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 6.0 17/34] media: atomisp: Ensure that USERPTR pointers are page aligned
Date: Tue,  1 Nov 2022 07:27:09 -0400
Message-Id: <20221101112726.799368-17-sashal@kernel.org>
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

[ Upstream commit 6e6c4ae0f0ba295dbf6cbd48d93bec169d6ce431 ]

The atomisp code needs USERPTR pointers to be page aligned,
otherwise bad things (scribbling over other parts of the
process' RAM) happen.

Add a check to ensure this and exit VIDIOC_QBUF calls with
unaligned pointers with -EINVAL.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 459645c2e2a7..4de01aa28fe5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1338,6 +1338,12 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	 * address and reprograme out page table properly
 	 */
 	if (buf->memory == V4L2_MEMORY_USERPTR) {
+		if (offset_in_page(buf->m.userptr)) {
+			dev_err(isp->dev, "Error userptr is not page aligned.\n");
+			ret = -EINVAL;
+			goto error;
+		}
+
 		vb = pipe->capq.bufs[buf->index];
 		vm_mem = vb->priv;
 		if (!vm_mem) {
-- 
2.35.1

