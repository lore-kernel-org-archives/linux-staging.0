Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E65283FC5
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242039; cv=none; b=FkjsbohOl+rKzc/dynX2J3HXCMP7FhLaDIA6KNBod0DfEBm0ATl5ASbz5u0iNpzfU7DNz+EvYOJYjCAyQqx78pzlswxGYUS20ALXcVlEtgYAEUUJR5qQWJgIEXzAdtaT/CnkrD5PKMUWaMal7D18TX9AnDgKqH0hcAKuciGZSlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242039; c=relaxed/simple;
	bh=XD45q+33d1RCd5CzmKC9Ts8w30QzxVbqLnlMN0Zwgk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kHLiuUM0BrWKo7Gg722hqnUhg8bmiHOcSjBaDoUwiRbzeX0EzST7odBlM28ZOsDApUw02Jk0I8/agYys5yCq2xlZpKFKa57fd6eOW6yBIUbdzh7MJJxBqeCULF6M6OluhAvkkEd5K7KL2C9F8XwcFou+FJDdMu8tt7lNB06eF0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1D8+JQC; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1D8+JQC"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35983877dc5so4872539a91.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 08:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773242036; x=1773846836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=84SjFZaTIYWd1JD1S1Qs8NOutRXunKp9VX/f1s94fpE=;
        b=g1D8+JQC5SSnI1dCbGYs84mPR2SQifx9rg9zU7Mv8aphbieUZmLuCofBxs8fBxkWoR
         xpN8Xwb4fS8SWYBRnhNNS5iMhB83SbBQDRr7r464LrWr3j25nP3mvAwwZlbcI31NMl24
         wp78VPAZ8m/Z1EwFG8I7cCWOu9L/cGMHwnnpaCrhUXAmqliC61RkA5zO3AQnRkS1pHw9
         aYxvP3OrLtA2GDgt7GWoTuLJ9uYvH0POaFhbM4z+a1XDQnMH33AB0Bgajq+5M9Recmjv
         R3es6/MVA7INQuFbtzfbvbBFr6kDIV3J3721Nwy3ZpT+MAX7a/1PnePIPEWqZPBRAaQy
         VrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773242036; x=1773846836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84SjFZaTIYWd1JD1S1Qs8NOutRXunKp9VX/f1s94fpE=;
        b=BnwaRBQKJcGZDkahVduHz6kTx24z5bnlYTsBLQB72PHc6pPD6DZv2tsyUzZo2Ytj5n
         1hCLFnZ0OhFiQ8wUzoZYyqUCY93arg3DNxaKg881qjFK5Q0QHUhVjD1nUzAtp77LdAoS
         RPAAPaRsGYhJGnVGjfIPpIvUoSzL2f/hPr7uHVQbr61WyNPWchGkxa7xm4YTDNGcst11
         3O05oZENd1JUNJ4mK3LD8NGNGZ34ypOWH+5Eyv/5iN3j9FbqM7x+ATqwPbnOvVG0WsoM
         9Fd9mxWHoZsvG7f9VLHpMd3anLg/YHoEpBrCJuOZBuV0//75ls80zUFqKsguTdutL8rn
         cX4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKkE4e9m/IYoOPly0GRHSbxRiHoAnZJCDARpVZVzjYgYO1qbRpGvik/X3/6Ej3FViGJWpvbr2ieUYMorPI@lists.linux.dev
X-Gm-Message-State: AOJu0YxhuKTactIbwAQAcV/i1UW/r9jiH9Nq82CP8cujYZ9R19BfKnVD
	2xN/yS4B5utk2vnoe6FTImVQE37K4PkihjNRh40xrLiCze1c+u7ohnC9
X-Gm-Gg: ATEYQzybYCWVMue+RZjOIgrfFFv+muSWr+ZoAx2uum206sqiHwZT+6w+nYVbu20dbQ0
	m0jH013IJHGIglTolyiuO59HhyGTNsrWLi4/LGrYt09nXKAp3pIQuuE9epHpbJd8GbO/VwIJBk7
	Xo2w/FmFN481kcqf0xaGc0q9cU5NWs2vreHwRtSuQmtSbgB9GrN8yZNLtQ/frOHH+jKCZFpw9pl
	ErE8+NTPEglzBtNH3dKcw9AohH1LgnIwU4BFmm9U6+hCgPebghBXXj8p7OZbejYFmOT0KqxD/cW
	u6url77fLjBYC1Ur7D0jvXnczkKhXkc+7K2qD176URj7ZAVvTtQ6XFi88EkvdlSmfL17GTry3TO
	GobJmoZiWS6fTvQZDjj/SQp1EIfSeCtLZepMHYRyBnRmpgpFNZoZ3EDVe6E+iNA8iWpZUOGtACS
	fdSEKn/7kkz+5Ec7Zv6gbO4cxxsPfcaFU0p8vOd2kcTa0=
X-Received: by 2002:a17:903:3510:b0:2ad:cede:3a1a with SMTP id d9443c01a7336-2aeae8cace5mr29932705ad.39.1773242035695;
        Wed, 11 Mar 2026 08:13:55 -0700 (PDT)
Received: from kalyani.. ([2401:4900:88f6:f504:2b46:93ec:f6d1:99e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae247cbesm28897575ad.29.2026.03.11.08.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 08:13:54 -0700 (PDT)
From: Kalyani Patra <kalyanipatra2003@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Simona Toaca <simona.toaca@nxp.com>,
	d-gole@ti.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Kalyani Patra <kalyanipatra2003@gmail.com>
Subject: [PATCH v2] staging: atomisp: fix brace style and trailing whitespace in isp_param.c
Date: Wed, 11 Mar 2026 20:43:02 +0530
Message-ID: <20260311151302.105992-1-kalyanipatra2003@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch errors related to brace placement and remove trailing
whitespace in isp_param.c.

Reported by scripts/checkpatch.pl.

Signed-off-by: Kalyani Patra <kalyanipatra2003@gmail.com>
---
 .../atomisp/pci/runtime/isp_param/src/isp_param.c    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index 251dd75a7613..f21797598cd5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -97,13 +97,13 @@ int
 ia_css_isp_param_allocate_isp_parameters(
     struct ia_css_isp_param_host_segments *mem_params,
     struct ia_css_isp_param_css_segments *css_params,
-    const struct ia_css_isp_param_isp_segments *mem_initializers) {
+    const struct ia_css_isp_param_isp_segments *mem_initializers)
+{
 	int err = 0;
 	unsigned int mem, pclass;
 
 	pclass = IA_CSS_PARAM_CLASS_PARAM;
-	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++) {
 		for (pclass = 0; pclass < IA_CSS_NUM_PARAM_CLASSES; pclass++) {
 			u32 size = 0;
 
@@ -175,11 +175,11 @@ int
 ia_css_isp_param_copy_isp_mem_if_to_ddr(
     struct ia_css_isp_param_css_segments *ddr,
     const struct ia_css_isp_param_host_segments *host,
-    enum ia_css_param_class pclass) {
+    enum ia_css_param_class pclass)
+{
 	unsigned int mem;
 
-	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++) {
 		size_t       size	  = host->params[pclass][mem].size;
 		ia_css_ptr ddr_mem_ptr  = ddr->params[pclass][mem].address;
 		char	    *host_mem_ptr = host->params[pclass][mem].address;
-- 
2.43.0

