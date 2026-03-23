Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A212BEC3F
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261303; cv=none; b=uUrTfcW+0I+p7yoM304Y27hRZNvnXqmMJXst9DZd8EXZ0cl1fVUnukQmsWjDKYZxwDeDAI1P3pu9TiJlENhLu9vLWBv+L/zweqLXhCpz1YH/AKVjTix2IIuFoAw1Sety1wpnldvs+l8PaiLWJp6P2bcasN7jDfRmLvOtTca6DuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261303; c=relaxed/simple;
	bh=oyYmDhz2o0YqRLTrMThZ+tgQUswO+2MnVLqzo195x7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f1iU1e8xU5ATVNbaqn2/jxOU/u9yFTmVJyJR+3b7IzrusdZv8mQMRwLix4qkWxhd/f/Z/HwC3OwGWT8nW9Oc6pQaP1Zb5BjUDgFPZ1bNDVFI2DCmGs4lghjHdvArV96q6N3xFRKKSUMIi4j4EksLxOrR9860/kfiXZ9g6mOWqH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFrST+5q; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFrST+5q"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82418b0178cso8798b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261301; x=1774866101; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBTauTdEu7jFyGoe5VcEyiFFsMZZfriVIFl5j/2ktlU=;
        b=SFrST+5qjuT6LSsyDfOlPUSAPILdhLckH7538tWbgcNtpj3t1FyDvamccvkURk3OVE
         LXeWDXWUmYhoiLcFQAcjGBQdSjkhLVc700seajOUp/Enz+nTZWh36AmDScB9Imoo+r27
         eHDPCRgj37CpzwS3AmyqMXZZP1RvRo15lW3kxDGpTNv8EXhXleG2NXBjGzUH6oW6RjM9
         qyBwvERmQj3f1+mcBuOXt7gsDgyrO5+LybvxPw0NvRiXYsEhVMmb83puUA32Vp1F5LKE
         mdb7YVbqd0UHy9P+r4EOtX1XfoG/9EXpq3/CG9e50rvWjnPN6FO9PQxEQgxBWVkSGrmn
         Or7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261301; x=1774866101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PBTauTdEu7jFyGoe5VcEyiFFsMZZfriVIFl5j/2ktlU=;
        b=tBvme1ttU7kN08oyRXKIRlfQ9BBMDzWOhjiIg1XbAwVXHLYtjzSKyNlyrN7sfck2bw
         oeEZCz2zEkC2lcMmrCZ2KFMtNqMhak0Tqt2PtsbrJgqWcA9zdSok5GUNJqT7PJnot5Ac
         0IRJ5xJ+vMB73/9CzVF6KGP/uNhvozC86S0tNS8TpYrau8A61c0TlvKOUHkS38Lmt9fe
         7ycqNfW6Sc5vtdyz70kXpslIEQAbA67knH26z4DBYnc7Jadh7DfZb1ZlqzV7BLoxIpII
         CB3yAS9bEmNDqUahWAj9CClIeVX67N5PaU2g06KnPjRbOm5PUywJ/8G0ROX2yTdnADoO
         m+4g==
X-Forwarded-Encrypted: i=1; AJvYcCXvslbZQhum/zr6HkTTmIsKX35NK/Ys2XjojNr3zkBIacRanQTDFbbpwBOqANdxXoT5nGpRk+g7xoYRo3al@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7ltVVHFw8swwuH/vUi4bEF0/sYpPNiwxyoqgwX7Y5hShSlodb
	BdEiY97mmUXUEThS+tl7D4w80isHU5ECrfQuP+7yUKImffautPp3Xh/J
X-Gm-Gg: ATEYQzxb/HHc+MtE0PgLxFzrRX0Kry4QUmJEKPH/8vbD6pxTNHQvtifNszrn5MmbC+d
	ErefaxziYk27vJ7mYi/62tGoeQttqce9RhSTuMNdxufothY5LEvuoSBZNqep6S+OmPQtkz4y+G6
	s8i4d4vw5f248GxphE1rRqHWcwyqIt6soUP3Zggig9hYnh2b4354zcy2/hV8s3EZHfYMq18AkXk
	IsRQgYWZ3P9gsQxaEyyIkl2vGUVVvFuyFVN+8gJNAmA3DzTG1ngMivRSb0QHFqsG5d9JvNchU5f
	4Xb/FqhnUZNdQOvqXYrNxcn+l4HIVMDH6hBPmmj0RQbS6thqPLybN5gj85mCc9lZQYo4uTR0yU7
	wxDp4SypWLUx4p35SXL16pV5KLnQXWmG+7eX81SiOJnZ4WFb2EPR8u57eXcr+vjS0RtV/7JfmRw
	EjNYDwcrx8K0BSTgQsh+cZJeT3LNQ=
X-Received: by 2002:a05:6a00:2d05:b0:82a:6125:728f with SMTP id d2e1a72fcca58-82a8c22de9emr9575183b3a.10.1774261301159;
        Mon, 23 Mar 2026 03:21:41 -0700 (PDT)
Received: from localhost ([2401:4900:797e:96d8:eb0e:7887:769c:9c5f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03be31f7sm10172012b3a.26.2026.03.23.03.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:21:40 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: dan.carpenter@linaro.org
Cc: andy@kernel.org,
	anushkabadhe@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: [PATCH v2] staging: atomisp: vf_1.0: fix open brace placement
Date: Mon, 23 Mar 2026 15:51:04 +0530
Message-ID: <20260323102104.44021-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <acENTtTMsD-xca2O@stanley.mountain>
References: <acENTtTMsD-xca2O@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix open brace placement on function definitions and control statements
to comply with kernel coding style.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
Changes in v2:
- Wrapped commit message at 74 characters
- Verified patch using checkpatch.pl
 .../atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c   | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index 3c675063c4a7..940b5767954c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -49,7 +49,8 @@ int
 sh_css_vf_downscale_log2(
     const struct ia_css_frame_info *out_info,
     const struct ia_css_frame_info *vf_info,
-    unsigned int *downscale_log2) {
+    unsigned int *downscale_log2)
+{
 	unsigned int ds_log2 = 0;
 	unsigned int out_width;
 
@@ -65,8 +66,7 @@ sh_css_vf_downscale_log2(
 	* test for the height since the vmem buffers only put restrictions on
 	* the width of a line, not on the number of lines in a frame.
 	*/
-	while (out_width >= vf_info->res.width)
-	{
+	while (out_width >= vf_info->res.width) {
 		ds_log2++;
 		out_width /= 2;
 	}
@@ -86,7 +86,8 @@ configure_kernel(
     const struct ia_css_frame_info *out_info,
     const struct ia_css_frame_info *vf_info,
     unsigned int *downscale_log2,
-    struct ia_css_vf_configuration *config) {
+    struct ia_css_vf_configuration *config)
+{
 	int err;
 	unsigned int vf_log_ds = 0;
 
-- 
2.43.0

