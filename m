Received: from mail-106105.protonmail.ch (mail-106105.protonmail.ch [79.135.106.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B51C18AFE
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 04:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776228447; cv=none; b=Eja0boYcehXKcc+a/CJN3LVWZKcGV9je5o43xAgBIeOJ7F/Y1V9xlz1pL58A33p0Cse0QXl2ZUsd9kvyTKyN2KkNh+1Q/liqnWoOIjmuXq5o9JLH3CJQDe5G0yPMytdOyP66E5nRXGxEjLOZLNONK9pZmqqCOtoh3+u1O5bXU5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776228447; c=relaxed/simple;
	bh=My2OMjau2bBWeR1qaXJWYR9RaQQRDb1XEOn4XhqZ540=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BIHR7xS5Nwtx+34cGu5fazANXLL/9kyhgU3HdsK6sLzIse86Mvn6gYG7EX1pES3RSEf0LIT4hzbiMimuCYfD3l1CT2Mp/BnEAE6rgXnpFo5OCdbo8/WxqUmXrrdfMENg2giMh11IXPleVMzJWK606kTSOIAnw/P6jEE0FoW49U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai; spf=pass smtp.mailfrom=innora.ai; dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b=BopgUqsf; arc=none smtp.client-ip=79.135.106.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b="BopgUqsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail2; t=1776228435; x=1776487635;
	bh=wDmce4s2wrLZeOIiK4BdtFj46JvHznACbcs44kK0FU0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BopgUqsfi2oSFMTm2ylQEbHh3fGkYOiXQynUmQT123S3oJHbzZKwdsOPuFHlybZ2X
	 qdXnPOOCk76QbzRDqKRd/PUJaekGhxumbct2MGRjylen/Ut+iaqwjOgN6vJklJsN8R
	 KRZTGJYQvuRf758ur9S6KLKdPE0hJT0+0TgiKAMJPgfX69Vk7sNvw9i5XvH+XG4H1w
	 EgFkEpiQQ/XY1ydW4Qcyd293Ftef53WXWCUWE/WAlx9O8G9eUQOe7dz/qaZByIN23t
	 7buhcgVQeCbz2l9ZbPNP6wfeA+9pa1OyVnMYk5zmi/M+cU1MLifCB6ky1h1KMFq4IU
	 1W/neArJxoXSw==
Date: Wed, 15 Apr 2026 04:47:10 +0000
To: gregkh@linuxfoundation.org
From: Feng Ning <feng@innora.ai>
Cc: andy.shevchenko@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Feng Ning <feng@innora.ai>
Subject: [PATCH v6] staging: media: atomisp: use kvmalloc_objs() for overflow-safe allocations
Message-ID: <20260415044700.81764-1-feng@innora.ai>
In-Reply-To: <20260413112904.98864-1-feng@innora.ai>
References: <20260413112904.98864-1-feng@innora.ai>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: cb584e9aad0b246fa7647975b498926a30777868
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Replace open-coded width * height * sizeof() multiplications with
kvmalloc_objs() and array_size() to prevent integer overflow in buffer
allocations.

The atomisp driver computes DVS, morphing table, and statistics buffer
sizes using unchecked arithmetic.  When dimensions are large, the
product can silently wrap, causing kvmalloc() to allocate an undersized
buffer.

kvmalloc_objs() uses size_mul() internally, which saturates to SIZE_MAX
on overflow, so kvmalloc() returns NULL instead of succeeding with too
few bytes.  array_size() provides the same overflow protection for the
two-factor dimension products.  Common size expressions are extracted to
local variables to avoid recomputing them across repeated allocations in
the same function.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Feng Ning <feng@innora.ai>
---
 .../media/atomisp/pci/sh_css_param_dvs.c      | 18 ++---
 .../staging/media/atomisp/pci/sh_css_params.c | 72 +++++++------------
 2 files changed, 34 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers=
/staging/media/atomisp/pci/sh_css_param_dvs.c
index 9ccdb66de..2947e0f48 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -4,6 +4,9 @@
  * Copyright (c) 2015, Intel Corporation.
  */
=20
+#include <linux/overflow.h>
+#include <linux/slab.h>
+
 #include "sh_css_param_dvs.h"
 #include <assert_support.h>
 #include <type_support.h>
@@ -48,16 +51,17 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *f=
rame_res,
 =09=09}
=20
 =09=09/* Generate Y buffers  */
-=09=09dvs_config->xcoords_y =3D kvmalloc(width_y * height_y * sizeof(uint3=
2_t),
-=09=09=09=09=09=09 GFP_KERNEL);
+=09=09size_t cnt_y =3D array_size(width_y, height_y);
+=09=09size_t cnt_uv =3D array_size(width_uv, height_uv);
+
+=09=09dvs_config->xcoords_y =3D kvmalloc_objs(*dvs_config->xcoords_y, cnt_=
y);
 =09=09if (!dvs_config->xcoords_y) {
 =09=09=09IA_CSS_ERROR("out of memory");
 =09=09=09err =3D -ENOMEM;
 =09=09=09goto exit;
 =09=09}
=20
-=09=09dvs_config->ycoords_y =3D kvmalloc(width_y * height_y * sizeof(uint3=
2_t),
-=09=09=09=09=09=09 GFP_KERNEL);
+=09=09dvs_config->ycoords_y =3D kvmalloc_objs(*dvs_config->ycoords_y, cnt_=
y);
 =09=09if (!dvs_config->ycoords_y) {
 =09=09=09IA_CSS_ERROR("out of memory");
 =09=09=09err =3D -ENOMEM;
@@ -67,16 +71,14 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *f=
rame_res,
 =09=09/* Generate UV buffers  */
 =09=09IA_CSS_LOG("UV W %d H %d", width_uv, height_uv);
=20
-=09=09dvs_config->xcoords_uv =3D kvmalloc(width_uv * height_uv * sizeof(ui=
nt32_t),
-=09=09=09=09=09=09  GFP_KERNEL);
+=09=09dvs_config->xcoords_uv =3D kvmalloc_objs(*dvs_config->xcoords_uv, cn=
t_uv);
 =09=09if (!dvs_config->xcoords_uv) {
 =09=09=09IA_CSS_ERROR("out of memory");
 =09=09=09err =3D -ENOMEM;
 =09=09=09goto exit;
 =09=09}
=20
-=09=09dvs_config->ycoords_uv =3D kvmalloc(width_uv * height_uv * sizeof(ui=
nt32_t),
-=09=09=09=09=09=09  GFP_KERNEL);
+=09=09dvs_config->ycoords_uv =3D kvmalloc_objs(*dvs_config->ycoords_uv, cn=
t_uv);
 =09=09if (!dvs_config->ycoords_uv) {
 =09=09=09IA_CSS_ERROR("out of memory");
 =09=09=09err =3D -ENOMEM;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/st=
aging/media/atomisp/pci/sh_css_params.c
index fcebace11..00d126665 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -5,6 +5,8 @@
  */
=20
 #include <linux/math.h>
+#include <linux/overflow.h>
+#include <linux/slab.h>
=20
 #include "gdc_device.h"=09=09/* gdc_lut_store(), ... */
 #include "isp.h"=09=09=09/* ISP_VEC_ELEMBITS */
@@ -1380,13 +1382,11 @@ struct ia_css_morph_table *ia_css_morph_table_alloc=
ate(
 =09=09me->coordinates_y[i] =3D NULL;
 =09}
=20
+=09size_t cnt =3D array_size(height, width);
+
 =09for (i =3D 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
-=09=09me->coordinates_x[i] =3D kvmalloc(height * width *
-=09=09=09=09=09=09sizeof(*me->coordinates_x[i]),
-=09=09=09=09=09=09GFP_KERNEL);
-=09=09me->coordinates_y[i] =3D kvmalloc(height * width *
-=09=09=09=09=09=09sizeof(*me->coordinates_y[i]),
-=09=09=09=09=09=09GFP_KERNEL);
+=09=09me->coordinates_x[i] =3D kvmalloc_objs(*me->coordinates_x[i], cnt);
+=09=09me->coordinates_y[i] =3D kvmalloc_objs(*me->coordinates_y[i], cnt);
=20
 =09=09if ((!me->coordinates_x[i]) ||
 =09=09    (!me->coordinates_y[i])) {
@@ -4206,13 +4206,13 @@ ia_css_dvs_statistics_allocate(const struct ia_css_=
dvs_grid_info *grid)
 =09=09goto err;
=20
 =09me->grid =3D *grid;
-=09me->hor_proj =3D kvmalloc(grid->height * IA_CSS_DVS_NUM_COEF_TYPES *
-=09=09=09=09sizeof(*me->hor_proj), GFP_KERNEL);
+=09me->hor_proj =3D kvmalloc_objs(*me->hor_proj,
+=09=09=09=09     array_size(grid->height, IA_CSS_DVS_NUM_COEF_TYPES));
 =09if (!me->hor_proj)
 =09=09goto err;
=20
-=09me->ver_proj =3D kvmalloc(grid->width * IA_CSS_DVS_NUM_COEF_TYPES *
-=09=09=09=09sizeof(*me->ver_proj), GFP_KERNEL);
+=09me->ver_proj =3D kvmalloc_objs(*me->ver_proj,
+=09=09=09=09     array_size(grid->width, IA_CSS_DVS_NUM_COEF_TYPES));
 =09if (!me->ver_proj)
 =09=09goto err;
=20
@@ -4245,15 +4245,13 @@ ia_css_dvs_coefficients_allocate(const struct ia_cs=
s_dvs_grid_info *grid)
=20
 =09me->grid =3D *grid;
=20
-=09me->hor_coefs =3D kvmalloc(grid->num_hor_coefs *
-=09=09=09=09 IA_CSS_DVS_NUM_COEF_TYPES *
-=09=09=09=09 sizeof(*me->hor_coefs), GFP_KERNEL);
+=09me->hor_coefs =3D kvmalloc_objs(*me->hor_coefs,
+=09=09=09=09      array_size(grid->num_hor_coefs, IA_CSS_DVS_NUM_COEF_TYPE=
S));
 =09if (!me->hor_coefs)
 =09=09goto err;
=20
-=09me->ver_coefs =3D kvmalloc(grid->num_ver_coefs *
-=09=09=09=09 IA_CSS_DVS_NUM_COEF_TYPES *
-=09=09=09=09 sizeof(*me->ver_coefs), GFP_KERNEL);
+=09me->ver_coefs =3D kvmalloc_objs(*me->ver_coefs,
+=09=09=09=09      array_size(grid->num_ver_coefs, IA_CSS_DVS_NUM_COEF_TYPE=
S));
 =09if (!me->ver_coefs)
 =09=09goto err;
=20
@@ -4286,59 +4284,37 @@ ia_css_dvs2_statistics_allocate(const struct ia_css=
_dvs_grid_info *grid)
=20
 =09me->grid =3D *grid;
=20
-=09me->hor_prod.odd_real =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09 grid->aligned_height *
-=09=09=09=09=09 sizeof(*me->hor_prod.odd_real),
-=09=09=09=09=09 GFP_KERNEL);
+=09size_t cnt =3D array_size(grid->aligned_width, grid->aligned_height);
+
+=09me->hor_prod.odd_real =3D kvmalloc_objs(*me->hor_prod.odd_real, cnt);
 =09if (!me->hor_prod.odd_real)
 =09=09goto err;
=20
-=09me->hor_prod.odd_imag =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09 grid->aligned_height *
-=09=09=09=09=09 sizeof(*me->hor_prod.odd_imag),
-=09=09=09=09=09 GFP_KERNEL);
+=09me->hor_prod.odd_imag =3D kvmalloc_objs(*me->hor_prod.odd_imag, cnt);
 =09if (!me->hor_prod.odd_imag)
 =09=09goto err;
=20
-=09me->hor_prod.even_real =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09  grid->aligned_height *
-=09=09=09=09=09  sizeof(*me->hor_prod.even_real),
-=09=09=09=09=09  GFP_KERNEL);
+=09me->hor_prod.even_real =3D kvmalloc_objs(*me->hor_prod.even_real, cnt);
 =09if (!me->hor_prod.even_real)
 =09=09goto err;
=20
-=09me->hor_prod.even_imag =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09  grid->aligned_height *
-=09=09=09=09=09  sizeof(*me->hor_prod.even_imag),
-=09=09=09=09=09  GFP_KERNEL);
+=09me->hor_prod.even_imag =3D kvmalloc_objs(*me->hor_prod.even_imag, cnt);
 =09if (!me->hor_prod.even_imag)
 =09=09goto err;
=20
-=09me->ver_prod.odd_real =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09 grid->aligned_height *
-=09=09=09=09=09 sizeof(*me->ver_prod.odd_real),
-=09=09=09=09=09 GFP_KERNEL);
+=09me->ver_prod.odd_real =3D kvmalloc_objs(*me->ver_prod.odd_real, cnt);
 =09if (!me->ver_prod.odd_real)
 =09=09goto err;
=20
-=09me->ver_prod.odd_imag =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09 grid->aligned_height *
-=09=09=09=09=09 sizeof(*me->ver_prod.odd_imag),
-=09=09=09=09=09 GFP_KERNEL);
+=09me->ver_prod.odd_imag =3D kvmalloc_objs(*me->ver_prod.odd_imag, cnt);
 =09if (!me->ver_prod.odd_imag)
 =09=09goto err;
=20
-=09me->ver_prod.even_real =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09  grid->aligned_height *
-=09=09=09=09=09  sizeof(*me->ver_prod.even_real),
-=09=09=09=09=09  GFP_KERNEL);
+=09me->ver_prod.even_real =3D kvmalloc_objs(*me->ver_prod.even_real, cnt);
 =09if (!me->ver_prod.even_real)
 =09=09goto err;
=20
-=09me->ver_prod.even_imag =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09  grid->aligned_height *
-=09=09=09=09=09  sizeof(*me->ver_prod.even_imag),
-=09=09=09=09=09  GFP_KERNEL);
+=09me->ver_prod.even_imag =3D kvmalloc_objs(*me->ver_prod.even_imag, cnt);
 =09if (!me->ver_prod.even_imag)
 =09=09goto err;
=20
--=20
2.49.0


