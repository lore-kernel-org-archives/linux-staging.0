Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1969A2C98
	for <linux-staging@lists.linux.dev>; Tue, 16 Nov 2021 11:29:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5314A61B39;
	Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637062148;
	bh=l7NZiSDJabx9ABJweVm8PSddhwj8pVnGlFgRNwIG9r0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AR4PxvAvohd8nE29x8vJ75xYXcvjYDk6kRIG5TUesXvWSwqniq4Ba8fyjDuD+72e1
	 6r8H+3u+cCCp4uS27GeVkMcZZ9v99pQeNz05bs1Ojn/Zn/sGU6yAN4ceRm7Am6KEYo
	 zjqW2s8YhwIWGjz9DuaJhn1ffkxCc/uunpgCnMulLb+F7yUZHQJg+ilGf6dxgezRRS
	 bwbw8kOrIdalBWFHX9+McB7soD12IYv2HyVRcgkmlRlpAew7Gpn6/KWGMhKq7zusXB
	 6SHmWleMAO5e8EHMLMQ/YzMYd9ORZfOxFLzNZTZXITIqZb4ywjRjP1RkPzpeSe1fy+
	 mBB2Ds/WZlblg==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mmwe9-008QfU-Fj; Tue, 16 Nov 2021 11:29:05 +0000
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Martiros Shakhzadyan <vrzh@vrzh.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 08/23] media: atomisp: drop an useless #ifdef ISP2401
Date: Tue, 16 Nov 2021 11:28:49 +0000
Message-Id: <2ee0cc013a060a634fefbd75f4ea1179dd57eb66.1637061474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637061474.git.mchehab+huawei@kernel.org>
References: <cover.1637061474.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

The Yocto Aero driver for ISP2401 sets my_css_save.loaded_fw.
As we're using the same firmware, remove the ifdef there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 3aa4f8bc39c4..51dbd4e495d0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1742,9 +1742,8 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 			return err;
 		}
 		fw_explicitly_loaded = false;
-#ifndef ISP2401
+
 		my_css_save.loaded_fw = (struct ia_css_fw *)fw;
-#endif
 	}
 	if (!sh_css_setup_spctrl_config(&sh_css_sp_fw, SP_PROG_NAME, &spctrl_cfg))
 		return -EINVAL;
-- 
2.33.1

