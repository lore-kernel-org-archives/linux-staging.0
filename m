Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07B93054FD
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756717868; cv=none; b=BK1NnlG0wJ0WMLaJQI93haauciAk6Bp05S3telUjb006/QrCHe8dYq18l1DyNSXOin4Qdvh55EzBXPBr7hFPqmBMVkEhkOgvD5ZHKwZ3r79DYbCOkuX6qcHNpSvGJdGM7mTSKHRfH5ZahNaGAi+wCF2cLxBskxSkKDs5p0gtUYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756717868; c=relaxed/simple;
	bh=C6PSeroBBAXUkCfk//yXsUzvuy7IJKNHAggHy7Mv74s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mJB7zKWREuDXQnLyHw6I7hnyp9FpPgnVJx+5w5divawzZTjPEV9LHHUFUuwbi/5I2LroEBIm4LPAqCQUdilCNEFAlwCda+M29DyooXQ0WBRYTMNftOA8FvDKa9EEPvpaDWZisTVk5meJXgLGY+OpwK7HZeifJLfqsLOYo2Plxgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jf3ROJZU; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jf3ROJZU"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-61d2ab4bcbeso1740817a12.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 02:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756717863; x=1757322663; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0cook3tZu/pahjAdhVSuHrsuCcIggtxoSDo9eGj8lY=;
        b=jf3ROJZU49plUvCDplfLNlwz0aiMhgOUOsx4Ul/ijSE9PXUBwpSEDgnP/7xeZHrCP5
         7PWY/pcwyATyQe2/QJeTmnvh44YKYhz5oauSWg8+geyjaOZT2gOspkX6WeUkCfyMQ2V8
         Dia2bpGDQzxB0lt51uKtLh9hah/dTk+52lpHRGgLgC0SlFCw8k4pYJ0nsOeV9WbIl/Zl
         83nx8Yn/3oHirE4LA3KSjNQL5sF9ETzbqkxBN12jEORXuEdHw9H9gw3VQXg9MxnFFBLP
         B0ONSHuFNy9JvX1awYKCjJDo36bnzch57H7nEKonj1Hx70w7O9NHEAr4aKWv0UlQ226c
         8twQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756717863; x=1757322663;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w0cook3tZu/pahjAdhVSuHrsuCcIggtxoSDo9eGj8lY=;
        b=C9wzGLLjhcjZy0GprFF2vFEAfAL9m1YTyzu/looX8oQjJivOz5NanFVuhRAu/05tTa
         2/EJ+1EyZWcRGV0JIp84aJVOJ3z1MW4sLA3dx4XQqgiNiSfrm3iTSpucVWbDgWmZenNW
         fYc2Szvr5B80HkgsoaMQnl9M83jvVyZDG2oIfJYo8nXe9/X2/ZHMxRSMLX/Mrdpb1SeI
         CdPuIoRxyocTEFL4cUGYVMmyywy0YhkV8pl8beUNJeyuTI/0jXlVQyxeQyRm8wI/c+Ve
         SgpPIcx5YgVJEkhLhME4DpCbu69SbjZ8iBuHUk3QwmkEJ6w/FFbj3qbgroP6et74iGOj
         iEnw==
X-Forwarded-Encrypted: i=1; AJvYcCUSGq7FD4UtS5fcoAS5psj6bP1xOrVZvkfHLtKYN1IlHjLaIrO8BkHhGIW1sqALRfMXSQ4jh8wGwS60hhPh@lists.linux.dev
X-Gm-Message-State: AOJu0YwEjRGsr250UFuGpZTFIs8Kf8rVBRwKTNlfYDSKFF+n8T5HVWJk
	pNdEIrjAZ7+N2FXZQFuTQpgLmGY4O/BhyV9u8sn/GuoPD0yNxD9Li2W8R3s88QFQEBfRxxsk3ho
	Lh51NyIDjEw==
X-Google-Smtp-Source: AGHT+IF4+qEShLjVFt7BDIbHBSFiIQP/xPnM97kkCf5E+r9Z0xWv6LIr8w+OXj7NGIbaiVsTggH4G2R4LI8M
X-Received: from edj28.prod.google.com ([2002:a05:6402:325c:b0:61c:59a0:3f3b])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:52cb:b0:609:9115:60f1
 with SMTP id 4fb4d7f45d1cf-61d2699f676mr5835853a12.16.1756717857779; Mon, 01
 Sep 2025 02:10:57 -0700 (PDT)
Date: Mon,  1 Sep 2025 09:10:50 +0000
In-Reply-To: <20250901091050.1935505-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250901091050.1935505-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250901091050.1935505-3-abarnas@google.com>
Subject: [PATCH 2/2] staging:media: atomisp: Whitespaces cleanup in vmem.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Whitespaces cleanup to conform with kernel style and improve readability.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../pci/hive_isp_css_common/host/vmem.c       | 91 ++++++-------------
 1 file changed, 27 insertions(+), 64 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vme=
m.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index fd640e100591..d8a9aaa7b302 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -13,19 +13,18 @@
 #endif
 #include "assert_support.h"
=20
-
 /* Copied from SDK: sim_semantics.c */
=20
 /* subword bits move like this:         MSB[____xxxx____]LSB -> MSB[000000=
00xxxx]LSB */
-static inline unsigned long long
-subword(unsigned long long w, unsigned int start, unsigned int end)
+static inline unsigned long long subword(unsigned long long w, unsigned in=
t start,
+					 unsigned int end)
 {
 	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
 }
=20
 /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx00=
00xxxx]LSB */
-static inline unsigned long long
-inv_subword(unsigned long long w, unsigned int start, unsigned int end)
+static inline unsigned long long inv_subword(unsigned long long w, unsigne=
d int start,
+					     unsigned int end)
 {
 	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1)=
);
 }
@@ -35,13 +34,8 @@ inv_subword(unsigned long long w, unsigned int start, un=
signed int end)
 #define move_upper_bits(target, target_bit, src, src_bit) move_subword(tar=
get, target_bit, src, src_bit, uedge_bits)
 #define move_word(target, target_bit, src) move_subword(target, target_bit=
, src, 0, uedge_bits)
=20
-static void
-move_subword(
-    unsigned long long *target,
-    unsigned int target_bit,
-    unsigned long long src,
-    unsigned int src_start,
-    unsigned int src_end)
+static void move_subword(unsigned long long *target, unsigned int target_b=
it,
+			 unsigned long long src, unsigned int src_start, unsigned int src_end)
 {
 	unsigned int start_elem =3D target_bit / uedge_bits;
 	unsigned int start_bit  =3D target_bit % uedge_bits;
@@ -51,7 +45,8 @@ move_subword(
=20
 	if (subword_width + start_bit > uedge_bits) { /* overlap */
 		unsigned long long old_val1;
-		unsigned long long old_val0 =3D inv_subword(target[start_elem], start_bi=
t, uedge_bits);
+		unsigned long long old_val0 =3D inv_subword(target[start_elem],
+							  start_bit, uedge_bits);
=20
 		target[start_elem] =3D old_val0 | (src_subword << start_bit);
 		old_val1 =3D inv_subword(target[start_elem + 1], 0,
@@ -59,18 +54,14 @@ move_subword(
 		target[start_elem + 1] =3D old_val1 | (src_subword >> (uedge_bits - star=
t_bit));
 	} else {
 		unsigned long long old_val =3D inv_subword(target[start_elem], start_bit=
,
-						 start_bit + subword_width);
+							 start_bit + subword_width);
=20
 		target[start_elem] =3D old_val | (src_subword << start_bit);
 	}
 }
=20
-static void
-hive_sim_wide_unpack(
-    unsigned long long *vector,
-    unsigned long long *elem,
-    hive_uint elem_bits,
-    hive_uint index)
+static void hive_sim_wide_unpack(unsigned long long *vector, unsigned long=
 long *elem,
+				 hive_uint elem_bits, hive_uint index)
 {
 	/* pointers into wide_type: */
 	unsigned int start_elem =3D (elem_bits * index) / uedge_bits;
@@ -99,12 +90,8 @@ hive_sim_wide_unpack(
 	}
 }
=20
-static void
-hive_sim_wide_pack(
-    unsigned long long *vector,
-    unsigned long long *elem,
-    hive_uint elem_bits,
-    hive_uint index)
+static void hive_sim_wide_pack(unsigned long long *vector, unsigned long l=
ong *elem,
+			       hive_uint elem_bits, hive_uint index)
 {
 	/* pointers into wide_type: */
 	unsigned int start_elem =3D (elem_bits * index) / uedge_bits;
@@ -128,10 +115,7 @@ hive_sim_wide_pack(
 	}
 }
=20
-static void load_vector(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from)
+static void load_vector(const isp_ID_t ID, t_vmem_elem *to, const t_vmem_e=
lem *from)
 {
 	unsigned int i;
 	unsigned long long *data;
@@ -154,10 +138,7 @@ static void load_vector(
 	udelay(1); /* Spend at least 1 cycles per vector */
 }
=20
-static void store_vector(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from)
+static void store_vector(const isp_ID_t ID, t_vmem_elem *to, const t_vmem_=
elem *from)
 {
 	unsigned int i;
 	unsigned int size =3D sizeof(short) * ISP_NWAY;
@@ -166,9 +147,9 @@ static void store_vector(
 	//load_vector (&v[1][0], &to[ISP_NWAY]); /* Fetch the next vector, since =
it will be overwritten. */
 	unsigned long long *data =3D (unsigned long long *)v;
=20
-	for (i =3D 0; i < ISP_NWAY; i++) {
+	for (i =3D 0; i < ISP_NWAY; i++)
 		hive_sim_wide_pack(data, (unsigned long long *)&from[i], ISP_VEC_ELEMBIT=
S, i);
-	}
+
 	assert(ISP_BAMEM_BASE[ID] !=3D (hrt_address) - 1);
 #if !defined(HRT_MEMORY_ACCESS)
 	ia_css_device_store(ISP_BAMEM_BASE[ID] + (unsigned long)to, &v, size);
@@ -179,11 +160,8 @@ static void store_vector(
 	udelay(1); /* Spend at least 1 cycles per vector */
 }
=20
-void isp_vmem_load(
-    const isp_ID_t		ID,
-    const t_vmem_elem	*from,
-    t_vmem_elem		*to,
-    unsigned int elems) /* In t_vmem_elem */
+void isp_vmem_load(const isp_ID_t ID, const t_vmem_elem *from, t_vmem_elem=
 *to,
+		   unsigned int elems) /* In t_vmem_elem */
 {
 	unsigned int c;
 	const t_vmem_elem *vp =3D from;
@@ -197,11 +175,8 @@ void isp_vmem_load(
 	}
 }
=20
-void isp_vmem_store(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from,
-    unsigned int elems) /* In t_vmem_elem */
+void isp_vmem_store(const isp_ID_t ID, t_vmem_elem *to, const t_vmem_elem =
*from,
+		    unsigned int elems) /* In t_vmem_elem */
 {
 	unsigned int c;
 	t_vmem_elem *vp =3D to;
@@ -215,15 +190,9 @@ void isp_vmem_store(
 	}
 }
=20
-void isp_vmem_2d_load(
-    const isp_ID_t		ID,
-    const t_vmem_elem	*from,
-    t_vmem_elem		*to,
-    unsigned int height,
-    unsigned int width,
-    unsigned int stride_to,  /* In t_vmem_elem */
-
-    unsigned stride_from /* In t_vmem_elem */)
+void isp_vmem_2d_load(const isp_ID_t ID, const t_vmem_elem *from, t_vmem_e=
lem *to,
+		      unsigned int height, unsigned int width,
+		      unsigned int stride_to, unsigned int stride_from) /* In t_vmem_ele=
m */
 {
 	unsigned int h;
=20
@@ -244,15 +213,9 @@ void isp_vmem_2d_load(
 	}
 }
=20
-void isp_vmem_2d_store(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from,
-    unsigned int height,
-    unsigned int width,
-    unsigned int stride_to,  /* In t_vmem_elem */
-
-    unsigned stride_from /* In t_vmem_elem */)
+void isp_vmem_2d_store(const isp_ID_t ID, t_vmem_elem *to, const t_vmem_el=
em *from,
+		       unsigned int height, unsigned int width,
+		       unsigned int stride_to, unsigned int stride_from) /* In t_vmem_el=
em */
 {
 	unsigned int h;
=20
--=20
2.51.0.318.gd7df087d1a-goog

