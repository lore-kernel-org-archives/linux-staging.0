Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5653D6696;
	Wed, 25 Mar 2026 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443594; cv=none; b=KrWuWov00xoKy+vtCnd2DSXavCfqxkLIJtA3LKF/HtBVLDWMWP3NN02NZ3hH5gy0xjWZRPHAF/5yLMO8L/AXX1KsoSnfm5DcaWwEABPoPhYCvCPcSSFr5sgGaUiOdJdS815HHK12Quxr7AegkauD7YgohNmWcAdwoGLZkNrDXgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443594; c=relaxed/simple;
	bh=YgXypY8Ej/aaElgr99nZzDrRCAiFXk5ovX7ACOgbvP8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s3xmbKe56SxzufBbTjg9OvrRsQ5u1H2eapoC1oCJoFODxm1Ujy17btB9T2iWn9yWGTkmKX/cbcuZ16cdrUPhtMRKIwstlKddrLdYgCroOqsRMiCJ+Wiav/ljGfLhxGJRFx8XkgGxYeP0qh6SsCdDJSGkMt5M0r84J5LjFv7c2q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFe+rn1M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFe+rn1M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FE7C2BCB0;
	Wed, 25 Mar 2026 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774443594;
	bh=YgXypY8Ej/aaElgr99nZzDrRCAiFXk5ovX7ACOgbvP8=;
	h=From:To:Cc:Subject:Date:From;
	b=BFe+rn1MbemUHurQYT1YO/75Vu4HAlxWSPYMYUrcUsf31SFyUy0/yfgLM1kFWDXwo
	 IuRbRkTsL0XOJwqBAwrma/IYzGus183DVVlf4EIUzHt4NaBOZ1YsSkpf+zLH2jW+Mp
	 Gc8ssd21Qv8nrG5FnrMyJcN45aIqbBm2rWk118XvnnQY65mGR5Ip1MqeMX4aUTQZQ3
	 xD4wejb+zMhh0tibxzcDdRqcZG9CAvCMmY4mS5lSYAafSLIfmwqTYdIR0ymbN+plWO
	 iGFgX2uQJLx9kTeDcccTmnveSpOHMloXHkttUsOCcQwQK9Btl7jg2E7PPZnCqkIxny
	 fGnNOu9fWfJJg==
From: Arnd Bergmann <arnd@kernel.org>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Cox <alan@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging/atomisp: reduce load_primary_binaries() stack usage
Date: Wed, 25 Mar 2026 13:59:43 +0100
Message-Id: <20260325125948.1385064-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The load_primary_binaries() function is overly complex and has som large
variables on the stack, which can cause warnings depending on CONFIG_FRAME_WARN
setting:

drivers/staging/media/atomisp/pci/sh_css.c: In function 'load_primary_binaries':
drivers/staging/media/atomisp/pci/sh_css.c:5260:1: error: the frame size of 1560 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]

Half of the stack usage is for the prim_descr[] array, but only one
member of the array is used at any given time.

Reduce the stack usage by turning the array into a single structure.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..584751516b69 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5020,7 +5020,6 @@ static int load_primary_binaries(
 	struct ia_css_capture_settings *mycs;
 	unsigned int i;
 	bool need_extra_yuv_scaler = false;
-	struct ia_css_binary_descr prim_descr[MAX_NUM_PRIMARY_STAGES];
 
 	IA_CSS_ENTER_PRIVATE("");
 	assert(pipe);
@@ -5189,15 +5188,16 @@ static int load_primary_binaries(
 
 	/* Primary */
 	for (i = 0; i < mycs->num_primary_stage; i++) {
+		struct ia_css_binary_descr prim_descr;
 		struct ia_css_frame_info *local_vf_info = NULL;
 
 		if (pipe->enable_viewfinder[IA_CSS_PIPE_OUTPUT_STAGE_0] &&
 		    (i == mycs->num_primary_stage - 1))
 			local_vf_info = &vf_info;
-		ia_css_pipe_get_primary_binarydesc(pipe, &prim_descr[i],
+		ia_css_pipe_get_primary_binarydesc(pipe, &prim_descr,
 						   &prim_in_info, &prim_out_info,
 						   local_vf_info, i);
-		err = ia_css_binary_find(&prim_descr[i], &mycs->primary_binary[i]);
+		err = ia_css_binary_find(&prim_descr, &mycs->primary_binary[i]);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
-- 
2.39.5

