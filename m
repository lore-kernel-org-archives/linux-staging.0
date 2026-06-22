Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8572D30EF77
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139867; cv=none; b=fsavSzkChKmjQCvR0NgZPFCqYd1sTQqZrNIJ+EW2rTqQAIp5M9YhzQqnfi4q4ziB8qQQ9xwRuFNhetfGJSj+wFervvaqpuJbO4rsfCZEXXPGLz9myNXR0PP4UwszQVvhPDTvZU9u++QoZM997qd4iCvClal15SXpVKEnj9wrHBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139867; c=relaxed/simple;
	bh=3tZUaI9MFDxL1xc8CxX0yB8M6M58S8qPUaii7OTTRp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q6ELtohlTGczufJTDwX6JuhXvRcQZjI2nIPa7dn3gfCRwA1zl1QfpVMk41ipbZVfdWfWRTVwouiXOPU5/N0o7W7nKQIWRmWWl0O8fa/hVTetb5GYmoiWUPUoZWV4+E01BXSjQvRZElaMb3rLJ4YI98LMaquOJFEZoQj0d/Piulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIZ96637; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIZ96637"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so41609525e9.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 07:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782139865; x=1782744665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4dLP/ZuYJZUJG7fQSoJFcdghe6DjQYILe2Gxo98gRI=;
        b=GIZ96637Yvf3j4i7p8EvaXvIqX2Kui+Lez1GgUhagJuXhEDZyKlH+MS51T5bOyvNym
         qi46HG49NTxJAWFBF/YSIsqsRpUwi2eWn68qERsPAD3kngsazwkTOqi3MO33Dh9oDBaC
         48BUkPZE2Qg9zsecSPEuDXxPNTC7NqFq/p6gy2wJiJi0/HLoFTQ4axIbkCYQsXegMZYd
         E5Om8JWWcf1pkNeFio8hPnsNDwjbMm4BtA38kukAv+UgmvpdwHG3lE1a7Wd+rTmM+4RZ
         ZBvpekX/kDJzSpFobjL1nlO1BJT2DDpRY5LtaGgTlD3qsxNIRI0ey7gcnfLR6UiVERVr
         Mc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139865; x=1782744665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4dLP/ZuYJZUJG7fQSoJFcdghe6DjQYILe2Gxo98gRI=;
        b=btpe1Kb0uq9G0PTPecGtqlvQHfvggMm08pUq68JWAnceTmo/qWQ9aE6q5zBPwrsgTD
         VBdrmPGMR26vEG2NibIIyz60kcKubnqiARcADpcHj+f2ECCAjr/hNhz3G2Qzr+3KZuco
         /kqm/Ry7a85iXrQWCsbKLBKBYQjzsSYQ577MN98+VK3Qt5f5pdpmNX/32Ae6z87uAs1V
         VdMjG+qPsNp5OyU93XB2821UWmlsNE6SgnE+bFY6m1ItHLtGpwVVOKSoV8B/kZ4tMcK1
         PrlegYD0FbNC+Nvp8eMbokA/Z4Uuv+7YyuatA16D9Dxk+jpXtlEE4aVA6uU0pncnT+0S
         cqRQ==
X-Gm-Message-State: AOJu0YzEdCU4ysDzvQv21GibjT2QLXRY0w9iQdSGSYHUOFa6J5qZhBVG
	KKBJpdZh9MeaekWf18zw3s3FApSbmhk50ARBmFdwQx4hgWn/oIX0RAtm2koR8rhr
X-Gm-Gg: AfdE7cmTaY3nGDNP9369KN6q+ws6Cl4yRAYi3nFUwGGn0aV8PgWLUCy4aO1EqAjFsJ+
	yWIi2If5mVtSE5T8uaGQC8FIZ+fRKyixvd1rLr1YM2eXin/axIFLJhcGwN3zcMfitvZsKKmmpHR
	a3+jTYF8Zl4jgXmDjwd3o2o9PKJXJW5Mf7V4FXtu3jCvap1jmTQat8Oww/1rKAXwiBAThv2YOhp
	NNbhrcnNIagufBhm5SWTOtUHn2LDoQghuq7QS3H1aFj/cqMdIcLOYltvW5cLTIf/ycYWdPeiAWj
	Es5MN49tXXw/x3ZoHDv6Z9jU9zoXzO+eMyosU7TVIxWgeZHQ07EmX1bskULaZ129sAsWuj4Yft/
	qa0/1U9LUa0kI8WTTbo4E+h+fELagpj2bn1dmY2uXrGtlnrtLyNmcWbndn9aUSusmzNtqmxHg+f
	INBRFj3u4bkilJxdWwAzlr6njls+F1PIT4feZkPSMVZJnjo79wYKND77pp3PaRWr+NbQ==
X-Received: by 2002:a05:600c:5010:b0:490:e19b:9632 with SMTP id 5b1f17b1804b1-49240a59ademr190410775e9.17.1782139864619;
        Mon, 22 Jun 2026 07:51:04 -0700 (PDT)
Received: from legion.localdomain ([92.44.171.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240f054e3sm305629905e9.2.2026.06.22.07.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:51:04 -0700 (PDT)
From: Batu Ada Tutkun <batuadatutkun@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Batu Ada Tutkun <batuadatutkun@gmail.com>
Subject: [PATCH] staging: media: atomisp: sh_css_mmu: use %s/__func__ in debug trace
Date: Mon, 22 Jun 2026 17:50:58 +0300
Message-ID: <20260622145058.9136-1-batuadatutkun@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded function name strings in ia_css_debug_dtrace() calls
with the '%s', __func__ pattern, as preferred by the kernel coding style.

Signed-off-by: Batu Ada Tutkun <batuadatutkun@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mmu.c b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
index f2a84c1d6..bcc973b22 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mmu.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
@@ -19,7 +19,7 @@ ia_css_mmu_invalidate_cache(void)
 	unsigned int HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb;
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_mmu_invalidate_cache() enter\n");
+			    "%s() enter\n", __func__);
 
 	/* if the SP is not running we should not access its dmem */
 	if (sh_css_sp_is_running()) {
@@ -32,7 +32,7 @@ ia_css_mmu_invalidate_cache(void)
 				     true);
 	}
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_mmu_invalidate_cache() leave\n");
+			    "%s() leave\n", __func__);
 }
 
 void
-- 
2.53.0

