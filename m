Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE70926E703
	for <linux-staging@lists.linux.dev>; Tue,  2 Sep 2025 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756797563; cv=none; b=Rx1IKwdpXzlvZlrmImm2V6NxRCtgfkgqFPz2GhQwqRXHzITSYyOi0gmmmFy5yJ6HDc8fNSrH2sBsfdOytYfZX5bfR23ejHPgWfAgHDrq5sQHsirpHv1rV/G5w94571jYO6QdsHC+eWnA2Un5cmm1rrlDNWccBDQ8WZyyW9So5r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756797563; c=relaxed/simple;
	bh=YTfRT7nZucuC+rOqT8u2JhzeMS4C8wWEnl7OQP5jGSg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KCh/5kQXyc97yMvvlraT9odgc0BTl9kr9lEjgeGGcxzDNez7qH4t02VCdU2IJ0TBbglchoqkqbFo2g+2hZcisC0Q2eN52U65cu4lLceamweEudlSMngoj3I1CU5xwWfge2068OAXF/+05oi/ne/6lkE4w4iuVFh/DdOo6aJEPdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ejTw0EsW; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ejTw0EsW"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b920a0c89so4047185e9.2
        for <linux-staging@lists.linux.dev>; Tue, 02 Sep 2025 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756797560; x=1757402360; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1NlE9a+9Bxy62hv5W1CTcG6yDEPlaJidN+buC/iKCU=;
        b=ejTw0EsWfXcXMO9qQiKP3Ae96FdeqeRWUqrDDsMYMr5Hb3vvlvn+Mo8MDslyKKppDP
         KydtKlFRIxjMuBlXnj9kCbYs458scFpVi72xu2MCiPMwr/fnxFJaW6YZmF+L7bNnNUzJ
         mu3ZNZNrEEUFXOYvq2siieJTjfClPx69aKYmbD6VCy/Blw7nU1RukpGUu/4i4tBXkQI0
         uTOXqvt3kCXfQgCQKtynz+i8CNKko2wgKveorLGje+Oe7v8401sDpzMRroF8xMcM8aFA
         +CrwRTnpczsAzrn3T7EGbygT+hp+HWv2rJBS2plHW91gwLnwjsdW1kDfLIs6rgiIueFm
         jsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797560; x=1757402360;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K1NlE9a+9Bxy62hv5W1CTcG6yDEPlaJidN+buC/iKCU=;
        b=Yy79XYJOb163peC9LvoyWlyJ+u77e7fGWWGcFrVHaOS92V4AHIbwEal8PP0XCBERaW
         ofq1eLJtWLp4KGcryJ5jiJDpLCxFcx5K7uk6N3TwyIKa61kKBaxtmWdarHF9zj8uEg11
         bPFsC/+ACW5y+87DAke//xnQQMO40y94w1rKhNFEokwR/x8UJNo8ztttoGRfERGOiNyf
         79P3fQio02a0T6tg9+T7+1CB09ofbnah4IH3Bx7H+RytS8u5TPApgBcxMo4iFe51VMDf
         0Zw+kMQjhWPOKIgXEqlWvJ+NUbjomxPKLaZSUMI0jbZMdBOG9zntgFjRW0WkzSTk+iqU
         m+Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXs7KAxhKHKfdN5hqacVCTObnQzIEDd3kuZyQaYXjMLgNXZAnETzTwO6s5ueBlb28GIwqZWhS2qhKo3zioI@lists.linux.dev
X-Gm-Message-State: AOJu0YyIcJE1gr5rAQOLD4+FVI7MY/ADD35lz2V6cApgeDC5whHaPX/I
	S29qoDeFzkWgFaRpSZAWnSSFYHO6OAhUPbv5+m6MxjEc4jaHs99ZuIo7Pg2nxzoNCAIuonWzSKY
	izOiSo+jWAA==
X-Google-Smtp-Source: AGHT+IF9+pEVGxeluwE6Cu/shEOucLgY1/21K2rB/PuNxx8VUUO6XEcsQ8Es/nbAGtAXGwUqiHT7PGj6FScm
X-Received: from wmsr1.prod.google.com ([2002:a05:600c:8b01:b0:45b:8501:3c72])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:418c:b0:45b:72a6:4861
 with SMTP id 5b1f17b1804b1-45b855fa346mr64547185e9.24.1756797560190; Tue, 02
 Sep 2025 00:19:20 -0700 (PDT)
Date: Tue,  2 Sep 2025 07:18:46 +0000
In-Reply-To: <20250902071847.2330409-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250902071847.2330409-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250902071847.2330409-3-abarnas@google.com>
Subject: [PATCH v2 2/3] staging: media: atomisp: Whitespaces cleanup in vmem.c
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
 .../pci/hive_isp_css_common/host/vmem.c       | 83 +++++--------------
 1 file changed, 23 insertions(+), 60 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vme=
m.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index fd640e100591..aa67638a09a5 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -13,7 +13,6 @@
 #endif
 #include "assert_support.h"
=20
-
 /* Copied from SDK: sim_semantics.c */
=20
 /* subword bits move like this:         MSB[____xxxx____]LSB -> MSB[000000=
00xxxx]LSB */
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

