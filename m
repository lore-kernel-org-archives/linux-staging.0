Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556425;
	b=GVqc2vtz8XCXaQY6/FLD4xqRAeNjujqkxE2uzR36sE/sJGBpoEN8Ga31RyALSe84ArdB
	 bnOXBMHAGCdMdQguRmBDDlwSjVMxqYZ/idqBBRBatDZo4luWTSRBItvTZxURri+LdmYT+
	 CVRRmcwx6v3E+v0fDZCPTenkDb0BvI4TFJgqKs++2fojTN2jzti2qw2mPKuLVEtKtmo4X
	 DtklbtCQHjQ5Fbv7ENn1bT2rDbGNHR8zpVGC29QOxookrRAJ5l4RUW6LuWBaoEzRh2scS
	 lb2G2drtofErfFUaKQvlCpSYC1thjZw7eCJHtDKL2P2EkOv/4k3YBx7MN6bn4+vobgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556425;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CuBjlJhdzOrqOW7FazDIjFnia92qOxigqhgEQXmfmMM=;
	b=l6e+RCNqDXmVGesjybvdbxxR7eTNRtvBPBFYvkuetcz4DqRk4ien2eKS8/QK25JNlxnZ
	 +vsDl7OXCcI4y5g+OQNb5Z2hIkhASbNDOUYDAuYvmxD/uwIL0chyj43fUirpECaX39M1R
	 qW+O+k6rONyl6WGi02I0VdTkbLtL/f1qozdvJokqfLU5H9UXrtDvss7oKBPgfaDt7oQtg
	 mS6yMBBMBlu1WcE/uYZjnE6+iybnwyWnWCacmgz6hmf1Q/sQ2cSjZPHBi5SUH1Qpee+YC
	 i041NLxyLdI1CZ273TnoVKY8nyV1lRH6c3NFn2qPPGCbZClIth1zwd02LAWrGhboPmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JzrrRqqD;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71A0606A89B
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 07:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C71A0606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JzrrRqqD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794556425; x=1826092425;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ccjmimuf5uzssdKBEbZnKI/cNIv+9rYcI0MozPt/Tzo=;
  b=JzrrRqqDuZMDfh0VSQFt11ktraBDndRf4Dd2NG1tduuPBuiF1D4gCj0O
   QGORsWB8w06509ADP6qbydt4K3+agaVv4+0Uuq6A3xx8pjyr2b3nF9Xt0
   AFdwn1AOOGcGy+nClcBSD8ACDOKcxUSn13uG+Mk58Yn2GsdlFXoJhfwVx
   FIX9L6HKjAqe5hmINeoEkEcYlQHXalrq6LIckG7xEXijkZ3lT8qBAfWz0
   FqobsJ5nwJKRzqY53gG2P/2obwya6qmAtGdfRZxDXQqH4fxyuaLZzly7e
   MRuLGpPEnTj0n8RSFLOz9HczagAfOXmSoxP3XeyoF3luoEmt529Clgxik
   A==;
X-CSE-ConnectionGUID: Xyg0SkqCRvGzovVhdjnmQQ==
X-CSE-MsgGUID: oDlwF0RXTGq7w8CMlm6bug==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3223869"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3223869"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 23:53:44 -0800
X-CSE-ConnectionGUID: jr2YH7EfT06t82FLaNBoTQ==
X-CSE-MsgGUID: dNPAAql5QlyMCcWfVjMm2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8773900"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2026 23:53:41 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id A703499; Fri, 13 Nov 2026 08:53:40 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hamdan Khan <hamdankhan212@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] media: atomisp: Inline one time use __IS_SOCS() macro
Date: Fri, 13 Nov 2026 08:53:39 +0100
Message-ID: <20261113075339.2561993-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__IS_SOCS() macro is used only once and there is no sense
to keep it separate. Inline it into the IS_ISP2401, which
is the only user.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../staging/media/atomisp/include/linux/atomisp_platform.h    | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 0d6f2a4039f1..81b58a91bb9d 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -168,7 +168,6 @@ void atomisp_unregister_subdev(struct v4l2_subdev *subdev);
 
 /* API from old platform_camera.h, new CPUID implementation */
 #define __IS_SOC(x) (boot_cpu_data.x86_vfm == x)
-#define __IS_SOCS(x, y) (boot_cpu_data.x86_vfm == x || boot_cpu_data.x86_vfm == y)
 
 #define IS_MFLD	__IS_SOC(INTEL_ATOM_SALTWELL_MID)
 #define IS_BYT	__IS_SOC(INTEL_ATOM_SILVERMONT)
@@ -177,7 +176,6 @@ void atomisp_unregister_subdev(struct v4l2_subdev *subdev);
 #define IS_MOFD	__IS_SOC(INTEL_ATOM_SILVERMONT_MID2)
 
 /* Both CHT and MOFD come with ISP2401 */
-#define IS_ISP2401 __IS_SOCS(INTEL_ATOM_AIRMONT, \
-			     INTEL_ATOM_SILVERMONT_MID2)
+#define IS_ISP2401 (IS_CHT || IS_MOFD)
 
 #endif /* ATOMISP_PLATFORM_H_ */
-- 
2.50.1

