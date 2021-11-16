Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CC02CA9
	for <linux-staging@lists.linux.dev>; Tue, 16 Nov 2021 11:29:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4C1363213;
	Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637062148;
	bh=5lb+VVTdBmVUhauXjjhq3dpB2TX8upwkl7EqKv4fXiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ugIwfIk0SAoCMco9ueHVivlZimyckcitHvYi6OUnUSrujYVhV6jB+lb7yw9KWu3GA
	 DXKrEpTvHMe262kFDLmzrGI9hoIc4iQv5KvNl26FMnohsDtHOx+nsO2AQq4TsNRYGK
	 dwqr22sZGQM3HbL4+lPk/FvdMTSeHR3R2Hy+3XSZd62Eu/68L1LxGnRt1raZHeGb/S
	 SfAy+yxew7b5++sVQYTzU0Ul0F3jcfo6Z48RuTBW8ZZqJnNUdY35J4DCS8uikj6jMc
	 olxDzA/0r+rO1dcSXTR0GoUSluCLTildjgZ5T0Qj/3CjfwqDzO27rqYUJIFUfxLdHo
	 DpuoXVeF1nBKg==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mmwe9-008QfX-GK; Tue, 16 Nov 2021 11:29:05 +0000
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Deepak R Varma <drv@mailo.com>,
	Ding Xiang <dingxiang@cmss.chinamobile.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Martiros Shakhzadyan <vrzh@vrzh.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Yang Li <abaci-bugfix@linux.alibaba.com>,
	Zheng Yongjun <zhengyongjun3@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 09/23] media: atomisp: remove #ifdef HAS_OUTPUT_SYSTEM
Date: Tue, 16 Nov 2021 11:28:50 +0000
Message-Id: <198fee2609f7f1d1c780d58dbb16a1042d8f419c.1637061474.git.mchehab+huawei@kernel.org>
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

None of the firmwares we use has support for it. So, drop the
unused code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c        | 2 --
 drivers/staging/media/atomisp/pci/sh_css_params.c | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 51dbd4e495d0..3a347b72e4bd 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5507,7 +5507,6 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 	(void)continuous;
 #endif
 
-#if !defined(HAS_OUTPUT_SYSTEM)
 	if (pipe->enable_viewfinder[IA_CSS_PIPE_OUTPUT_STAGE_0] && need_vf_pp) {
 		struct ia_css_binary_descr vf_pp_descr;
 
@@ -5533,7 +5532,6 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 		if (err)
 			return err;
 	}
-#endif
 
 	err = allocate_delay_frames(pipe);
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index ccc007879564..b3ef6b4c3225 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -96,9 +96,6 @@
 
 #include "xnr/xnr_3.0/ia_css_xnr3.host.h"
 
-#if defined(HAS_OUTPUT_SYSTEM)
-#include <components/output_system/sc_output_system_1.0/host/output_system.host.h>
-#endif
 
 #include "sh_css_frac.h"
 #include "ia_css_bufq.h"
-- 
2.33.1

