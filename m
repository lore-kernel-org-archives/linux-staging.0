Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6685F7E
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 11:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02ABCC433D6;
	Tue,  1 Nov 2022 11:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302188;
	bh=Zun/SsDVfloOHkAJheKU5bg8mYtiWisWdGLNQhr2Pcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ukNOK4Ngb3GaOhiZlxczym+wsGfUD+aPTEMJs85MtAnAvkb7kivR4I0uQ43w7H1Fk
	 FLl8mFek0U/46R+o0/EI142DGp2/I0WQmIW+gVHSCLJFboBU79c0pj7eKtU9aujpg8
	 zMUCnf3+Kbwnn3S4zCsu6A+1aoVFNZfgGNxVa7lgtUmmFSRpKYEm7AW83bWlgp/Aer
	 x+OR/WkGnOvmFdE3Kheup+nrCIK6lOhGNhSkEAERNHwzesN0JLyl9owe8ROUst2w2W
	 4WS3aLepdEwDF2l+BSEHthgXOhg7l0qyu/N3mAxBJt4gSKiSaAlP+yL0DpK9jddwSK
	 YK9lNSlbzbeUw==
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
Subject: [PATCH AUTOSEL 5.15 12/19] media: atomisp: Fix v4l2_fh resource leak on open errors
Date: Tue,  1 Nov 2022 07:29:12 -0400
Message-Id: <20221101112919.799868-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101112919.799868-1-sashal@kernel.org>
References: <20221101112919.799868-1-sashal@kernel.org>
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
index 18fff47bd25d..cb61ffb7d3b2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -890,6 +890,7 @@ static int atomisp_open(struct file *file)
 error:
 	hmm_pool_unregister(HMM_POOL_TYPE_DYNAMIC);
 	rt_mutex_unlock(&isp->mutex);
+	v4l2_fh_release(file);
 	return ret;
 }
 
-- 
2.35.1

