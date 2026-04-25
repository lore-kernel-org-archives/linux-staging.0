Received: from sonic305-19.consmr.mail.ir2.yahoo.com (sonic305-19.consmr.mail.ir2.yahoo.com [77.238.177.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9204530DD1B
	for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777112735; cv=none; b=R0KYe3cdWidas5jAylu7lIdQUxvpnbQgZ/urHuPfaloNQt+NDBWwDEbALP5Wl9M5bGTEIB1ok4tp+6uRms9RwiyxWaiTaWgxf2h0RRQH/ew8rPJW6KRGOkwOsS5BcRkZtdhsmH6SKObyQgelecFo8JiWktNmM/zBdwzMzyc+804=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777112735; c=relaxed/simple;
	bh=uT7uA3UMxIxax0bWbmErIzrg2cuVccT3xmfyxCKBQJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=DW8Z88JLPZgVbfKkfpSP2Si9+7PrhTZJ8+AKs56OJIWFG8ZR5fNo9vzpN0MybxRwWrlIDbAThGxlYZ0+jvYIcZBwE1EW4F2n08Cf8NJpl6W0cqLBLcC+cJ1mkpzkc6FwUDkkbR6+gY3CSSq0hmjWShspmlJL+MG/PzKvZ4yV63I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=FeEr+AWm; arc=none smtp.client-ip=77.238.177.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="FeEr+AWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1777112732; bh=gxo2wqE8fN2LMy7xXrkNRtvrpoa8jVofes9IukE9K/M=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=FeEr+AWmatguqQqJS0AvOUNYal4OhAyxkVqJsxO64eSocbALFRwfmM8gtw+T/tfVYb9xlQwc6aVUdoIgoq9ODzpIzjZd+YwHIRhKxbxHsp0kqBVDdrAGTX8WN0JhK+CAekETSlKuX6qsZC9/vAgr2KBUitP+m+0lqEZXcFXpJO1tJw4+CmIkljI0dhAuzALu8GG0BR68+Zkjx/yN0zj0kQXtUX5eUpwuJ49iOFZkKRBAjMXtC0LhrWfXsSLBOBbZ7LJQ5+qQTmFoBUzsKzN3P6kpoqv0F/sMl42nQf9ujwtkJUpQOiRmSWUvxneL9OCSxU2KpKKQHlgkK5v5mct+og==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1777112732; bh=ARqdkThIn5ZTJj9GsVYxKjUNilyRVbwb2S/E82x+iAp=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=ATZF/Ev7bJG6TN60LZhkEwUJgyTTtbC8FE1r+KVwEtXZQjSdUIIoEA6XOu3ft0SbbevgSpjmBeE7uLnDiJUWDT3OiW3ti8F1ydBByda2HfV7YlJ7/Ms6PcgPQ9fl8+64aKFs/7qdPaE3cReAKZlMF9aBDF/OGD7w8Af+5t3gTn4GfV0hE6MeYvUGHP21Qa7PwOlqvXREpngnDBuRxw+USrbot0kpaNGmWLWvfR6xeHMTUiEKWxpv/bisV0XypvviDOpzkpGmmR4Y8paWDkCkpq+XvtgxfYYl1vEDyHoHM/JYOWtdE5xpogRQKEL6kF49weCSeZWYkFh/f2vIj6UA7g==
X-YMail-OSG: 8L25u_cVM1l5gL.VcWKkErE5fq.96_I7MmTpLeGalo_CH4F3PLW4dtMB6XvCl_.
 0I7Dl4yygVb7HrNJuy8FwDV_Km2HVwrTOGwGMY_f4E5YQbrefXQF3OUdMUrA7dK18VEl99yQx0Fm
 pQHIbAk62jRra4puvR2NXlYkl8n32cfGe5c_FnNzAS6Fs1MLRacGnZlNJTGywVqkfnLwgdtblyzq
 _F.mud3OrtnqVzKMod.4oLG0u8Q1j_27uOo4rM622D_zIJ16Ln1u5ZWhcZLAywq2kyw0QbNPq6d2
 F7JjrstlZsIeAGKSifdgaM.qLP4xWRMpMAH.kV.wdD5lQYFWUNFrvZWLx92Nb1Vk6ZB9AbwwfwDu
 wuf6V9aE3ixGYWVdd8uftG3TWM9U0cQi5O6WMdrQXbW58v_Sd06OnXR5W9IbH843Wsc62PjuS0NU
 8snNjcy8WFA7aLNndCTIPwB99c8ta4fNK0nfZihTeL0ptzt0DSoLmxHgAQ42xzrErWAKjMnRmwAS
 kSTRBJDuGzUJckcaJ3zMGmjKtmAfYgIIDj8482FqiF2E7_6Ajp84mt0BUJoBW4_.d9VpdUvUIFeg
 xSLGxajJbyTD6CjEj.YxOaoT7RSaQjZgafZOLJx4n6gl9awmcQma_SUUxRLNYgt4RPTWQxpyOVfW
 FefNt410n8DttAxb3wmNJzoS5k6GWJ6ulhb6y.dKwhnPiPgJSV4tQul_722buPNWU2JuhaEhf28Z
 8SkVVPfavX4BqLMrYFCAYQPQW8_0ZCEhMgrAvcrwhdg_WIrI6IoEWLNKklHeB6IO1ieTeQHoXk9Y
 bfewsbS.o9OZJ.VnE_IQuYoI9PEU6OK_hGeKEuOeFXMkePQa8ixsQAk3696nqrd0SkE76f4sa0US
 Jj29hWIU6QV7h0Vr8XqZxfhVXiYuHkjV5hOT5MqeH3KzTWGoBLGMbJpxj3UaT0X9JUpnfwazQEKG
 1Ut1_Bgj.cHgAbfJ01.nZ6S4xs_35afERva_RTz4JHPrPGUNROwTdQfWMM9h6gSDflT13Kcm055j
 QI3dzDj0jKe.dRQaXdCHDtB7_LtfpdHNuCt0PPghXf0pa8J2Cf4lI6FZlc1wAkT_wbqwlQm3k20f
 cVdURuloqKhNJMINPby1lj126NQykCXAcx2RuC2hniImBHmvaQmfZNvGUjjGSAeSFgHppkw.wbZQ
 xC6_KZMV4R83HVItGto44bi8QYMT7umaYiPOn4MEb5UXEB8sHRxFaHgx3774KO7OVxWJRIolBMsL
 kN7v1VZdP8joatBF.csWnm3TXUB8BIhE5c8cqWY91DVJ9OYQ8MuByuHCK7GKS4lQpTfaeUxN8Tx.
 auzEnRh8BIhsWlxZxPureqIl9sx7sHYJdWbNRFCOqZR4uGGHfJlJiY6QPoKHh7ZTw66wEf4m2Zzy
 Pc5pQQCRyWsHiaY4p9PLsTcJzKIEtZlXfKeOF1Fy.63tfEDNxzAIxIFJCM.dpBklqj1x9bUglg5d
 ew_b5Mr9LBtaNMVVZsJIjEZuH8qQT2WesRAYk_fEKI.HiPdddOqyaNOYnTHbp14GxhP8DUR2Z51u
 qAP8USQ4wPO_65c8op.1WM3p9n_FyfCEKFOd3G5SGGM8rzdGOrear9P9o.qEoYP0Fsx5f59sqjI.
 U6mvOlWjwzR4v8KIm9EEaHkE5XTL3cmv.rMOBErbWsOQAehn2.dNXIBrZ7eeUcpeOwZNY5.JmmYD
 .TYYkIe6E5wXVKBFc5xhMc2wi2.nOZ2V_i70D8NWE4DRQYcvJZlCI74d3HccTUlz7jkJbA4OBhxJ
 zmuZ7ZR_FGLgjxNwAFRLgK5HiucUJQXG3GzUTauqg0qTXtCm.tKUKwS2UjLnc8sZQ6wp7ZcCgg3s
 EE9eftNsUhUlaHAF9DEIepC7kJAetIG771NZnCq6AKattY8YmJxmBMtsQhSYZRb2ImJgHX1wG9U2
 O0GlNtDFUspY4OHTYqzpKuF7MeX1hrycC_3_H6wC4Bxug5sma3X_KyFvskM.1MaQzbn5TqZDqLIB
 tMwvZtoxvTn4OkqvI0jIzgC7YC4LiZc_fBe_gTWFf708cStA_vf88rNjMLhTx4Kr0o8_e687OqkE
 jghymeeQ_dtpwPMB.peliGXOIIbB4Xd1bD2aMLus07hDp4Qhx71A_BjmtiOgJziTKhZKwatOirBk
 nCCDSm9UgV6xGGx867q72vsS2jH4guz2A.BfpOh_KLnm6RqcuwFpMdraod2XYCU5odCF2RMsBT67
 FWPS6abvTzkdZ45.ZoCpDBDdPTvDerZNoCDNFsROdWNAnk2IfvKbjX7mKm_okmPcYXrE6mbWovC3
 0Vf.aKBtSttk8i0W2MfZ2uoJzpTCL
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 63a8dda8-29e1-423f-9966-0eb2ac970026
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ir2.yahoo.com with HTTP; Sat, 25 Apr 2026 10:25:32 +0000
Received: by hermes--production-ir2-89844b765-ms5jz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c4e04e7d3360ec14ea63a80235450967;
          Sat, 25 Apr 2026 10:15:11 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sat, 25 Apr 2026 12:15:08 +0200
Subject: [PATCH] staging: media: atomisp: fix typo "commmit" in comments
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-atomisp-fix-typo-v1-1-7ded6cd4bc97@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDsQgwniVUoXaRzrCJqQiUUR7
 25slx+P9x8glJgEuuqARF8WDktB/ajAj275EHJfDFppqxpt0OUws0QceMO8x4CuMao1tva2t1B
 uMVHZfsnn629Z3xP5fHfgPC8rzOOsdAAAAA==
X-Change-ID: 20260425-atomisp-fix-typo-a4508561c6d6
To: Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777112110; l=3600;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=uT7uA3UMxIxax0bWbmErIzrg2cuVccT3xmfyxCKBQJw=;
 b=H8RSU6jNHJpyS8y8UmUvxrlPy8+G5ewdRrtgl6Q7ZZeNXKcl0NHjigF6TNPj53RJS+ZZi8B9D
 9ckvW/GzoYcCDDExtnLJ4FjAZ6iqA4CKvMJjg6nm9KiViAMple7LOs2
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260425-atomisp-fix-typo-v1-1-7ded6cd4bc97.ref@yahoo.pl>

Fix a repeated typo "commmit" -> "commit" in generated code comments
across five files. Found with codespell.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/ia_css_isp_configs.c | 2 +-
 drivers/staging/media/atomisp/pci/ia_css_isp_params.c  | 2 +-
 drivers/staging/media/atomisp/pci/ia_css_isp_params.h  | 2 +-
 drivers/staging/media/atomisp/pci/ia_css_isp_states.c  | 2 +-
 drivers/staging/media/atomisp/pci/ia_css_isp_states.h  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
index 38c9c62366d6..bb603b4eb849 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
-/* Generated code: do not edit or commmit. */
+/* Generated code: do not edit or commit. */
 
 #define IA_CSS_INCLUDE_CONFIGURATIONS
 #include "ia_css_pipeline.h"
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_params.c b/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
index 1cd3322b0da0..9a19472ad64c 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
@@ -48,7 +48,7 @@
 #include "isp/kernels/eed1_8/ia_css_eed1_8.host.h"
 #include "isp/kernels/bnlm/ia_css_bnlm.host.h"
 #include "isp/kernels/conversion/conversion_1.0/ia_css_conversion.host.h"
-/* Generated code: do not edit or commmit. */
+/* Generated code: do not edit or commit. */
 
 #include "ia_css_pipeline.h"
 #include "ia_css_isp_params.h"
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
index a542f8979905..2f2f200866c4 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
@@ -4,7 +4,7 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
-/* Generated code: do not edit or commmit. */
+/* Generated code: do not edit or commit. */
 
 #ifndef _IA_CSS_ISP_PARAM_H
 #define _IA_CSS_ISP_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_states.c b/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
index af1765040464..cb3c2af91c51 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
@@ -3,7 +3,7 @@
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
  */
-/* Generated code: do not edit or commmit. */
+/* Generated code: do not edit or commit. */
 
 #include "ia_css_pipeline.h"
 #include "ia_css_isp_states.h"
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_states.h b/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
index d637ea1d13f6..75f5b1ef14aa 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
@@ -15,7 +15,7 @@
 #include "isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.h"
 #include "isp/kernels/dpc2/ia_css_dpc2.host.h"
 #include "isp/kernels/eed1_8/ia_css_eed1_8.host.h"
-/* Generated code: do not edit or commmit. */
+/* Generated code: do not edit or commit. */
 
 #ifndef _IA_CSS_ISP_STATE_H
 #define _IA_CSS_ISP_STATE_H

---
base-commit: 27d128c1cff64c3b8012cc56dd5a1391bb4f1821
change-id: 20260425-atomisp-fix-typo-a4508561c6d6

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

