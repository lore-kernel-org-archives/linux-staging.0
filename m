Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BF22F28F1
	for <linux-staging@lists.linux.dev>; Wed,  3 Sep 2025 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891697; cv=none; b=bFCuValt9KWqwMaIGkg+Lc3K9TAVtKukGjBEPd0nf/BsQAG12/OZA+0pnYLGnnzzNOCJcbRhsgvOrW7X65vhqccHfGBA56RM8uTvUNveakeKlMbj69GA+NvHV0/cUEFLGNgJ2tcqcnD829gO5aPwe2pOObfl4GEExJT7XLWOt3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891697; c=relaxed/simple;
	bh=qKKSA6BQE9yHosLS//5MBxPP+lVnakPngtoSP4h66Nc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ECN9D9kKKzV9GZyKwJqtCUjhCY3WMywHazbeDsIua1w9d71KySAjHLFRCj2sMZJKsxLsW7iubNOVf+Km1ZvyvNavEp9JbmlkrFWnnAQaFo4uFWaiB4seQph/+tt1puNTyt45Z+lNqyKKAqIrSf9ZIpRcLvlf/mdm6Xry5uFs7sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vaI4UW9s; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vaI4UW9s"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45b920e0c25so16990765e9.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 02:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756891694; x=1757496494; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZNErLUB5OL/PMLhd6A1jzaNLQ2AEV0NouRMBCYTl2M=;
        b=vaI4UW9squh5voZyHelmQ/4/sp4T0X3CtG32nxrqjkN9rZPN5aHUPWPGKuFPZ/Zvig
         bIOsPA45+2ExTJmu2QwPFuc3N7wLJM515hqZj4/5LxQqzDZnj7TTi42fP1ir/cbddJvj
         qk6WjPCda3yOJc1ihTOCMjTqM4FegldPA7BSDyRzmH3rtaekpZOdM4pjnfs5zLBKfeLF
         7qYHJV0AFT0Lx99taOwxAtjVVMvohPPCIm+DmJrB0EXwdV0XUZdip7SuvHlOcNRE2Y9T
         gU4gxru/AsX5ovVcAoyho/ow36VFfxDEeb/y/WBbXxaAohOtBoSAZz621r+f1Ee1nycS
         wlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756891694; x=1757496494;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OZNErLUB5OL/PMLhd6A1jzaNLQ2AEV0NouRMBCYTl2M=;
        b=M1WIV8BGp8TwxEX243ip4dVQfQXeVI84M9JX+HdqfrTKFP1jw1VRsPETAJM16rhbKh
         q3MZtquPUzsqEfzbo8eai+N6GBnlUfzFTjyUW/yclNBTUvLBXLfQW6hGO06sQ8w+QHJ6
         w9n/WdKaWqdzpbm9zStRcQAY15QxwxjToDazDV2ebC5Xaq2q8N/xGmGF94yhUch6D+4y
         UHJ/SmnMmhOoxfIKRBnQrManPvDeA+skeDSkvzqgpzsd1g+TiH8+sq7j5eXegznJ3T8I
         3E1wkdZ2i0RS47ak4sR5C5OEcm9NG2R4N7YAnH/+sSn3z0fIFsgrgphqUK8y5P2sah7F
         PSPg==
X-Forwarded-Encrypted: i=1; AJvYcCUEpUynXcUjlvtins/x29AUHw+03FhUynz2ZLALeymLxD8f6+utbjGAlptAm5mzPCYNKYfUJnd/lcHzLLqf@lists.linux.dev
X-Gm-Message-State: AOJu0YzxBm2AyHD/9LD3kaRUh4vU9+wqxlRAk0/lyoNUdXi/fDEeCIRO
	5OG8Zt/MZLq4mJ7bm80y1lLxVnW8IBengt7emCYYaZMZFnvd5ojfQDOGztEMqHJpxQpSVFoTE0J
	fZaLMMj9zJA==
X-Google-Smtp-Source: AGHT+IFnWh841cOnAh3nRAM8eplxLxhfI2ZySq8PueqPfpVd5Li2djuTOGDmJgDPyjn9FbOfO4yL0Zt772wk
X-Received: from wmsr6.prod.google.com ([2002:a05:600c:8b06:b0:45b:7a6f:5dc0])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b41:b0:45b:7be1:be1f
 with SMTP id 5b1f17b1804b1-45b8557d72amr108441325e9.32.1756891694453; Wed, 03
 Sep 2025 02:28:14 -0700 (PDT)
Date: Wed,  3 Sep 2025 09:27:54 +0000
In-Reply-To: <20250903092754.2751556-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250903092754.2751556-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250903092754.2751556-3-abarnas@google.com>
Subject: [RFC PATCH v2 2/2] staging: media: atomisp: Simplify logic in vmem.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add inline helper and simplify logic for subword operations in
pci/hive_isp_css_common/host/vmem.c.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/vmem.c    | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vme=
m.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index a3fe03216389..f11b0448ed83 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -15,18 +15,23 @@
=20
 /* Copied from SDK: sim_semantics.c */
=20
+static inline unsigned long long subword_bitmask(unsigned int start, unsig=
ned int end)
+{
+	return GENMASK_ULL(end - 1, 0) & ~(GENMASK_ULL(start, 0) >> 1);
+}
+
 /* subword bits move like this:         MSB[____xxxx____]LSB -> MSB[000000=
00xxxx]LSB */
 static inline unsigned long long
 subword(unsigned long long w, unsigned int start, unsigned int end)
 {
-	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
+	return (w & GENMASK_ULL(end - 1, 0)) >> start;
 }
=20
 /* clears subword bits like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx0000xxxx=
]LSB */
 static inline unsigned long long
 clear_subword(unsigned long long w, unsigned int start, unsigned int end)
 {
-	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1)=
);
+	return w & ~subword_bitmask(start, end);
 }
=20
 #define uedge_bits (8 * sizeof(unsigned long long))
--=20
2.51.0.355.g5224444f11-goog

