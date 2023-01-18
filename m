Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10F43C16
	for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 16:18:04 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id x7so20101385qtv.13
        for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 08:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OMMu3XovHqwLeu0gHfs9xCvQZaDl1KpPgg4sPO5JPY8=;
        b=PTj+AMj1P8vRit+dcK05Jx2X7ySZUq8HNs0uBdGF9PwJlCw7bl8/YtzpVcJQIaLSoN
         hD4uiIyyDFjsMYopDsmWa3wXKhJ/E7NO9MDYS98j3dtou+K0EMgTUk/iJUGHxEREzMwF
         B8/XC84Lx/H2N9LFKlKc65cLuHrx4YrZwSjTuvsVQuyGGvbfvxC8myrZPo/pUkJM3vhW
         XWV8RgCf3NjUkJGew7DYRaWZ3PujeIkxHQr4R8DFgcT5FYiUEw5RJ3yF/SJE1EWzKrLP
         OS2F6JjJ+5wipzh764Y3CZDT2tDcnycNes+V4BwOKxxRFI/bhMktewv2wQuYGjpwLRqz
         XiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMMu3XovHqwLeu0gHfs9xCvQZaDl1KpPgg4sPO5JPY8=;
        b=vwtTzCGMAlRb/GHMM+Kpsf/JIV35CtG05p1v65nrvbSCHpismF8lGuxlo5fsO7dGg0
         cM84LRcSKR183WNUIlc7yPOVCL8W+PZiPYiIPuTcVsWQd1XjGh1j7yxiDrGEFnidtJCM
         JGPUdysAHz/AfW/jMRxjDzsk/5pFIbmOFt7R3UYpPwCuBwloy5Kg7gmeoUpyyyYvAq2Q
         Jv/zGrsuqSSrVhJBAmrrKIuhfBzHzow93qpGJ6ub++GNeXoE4AMwKXtLMTb2c330XE7c
         GbfJOrUaWLe7hoMW+W1pAezdBJIYSpesKnzJWKd1xIjxdP0zUXLO5rAuyiAHBdO0kaS7
         MrZw==
X-Gm-Message-State: AFqh2krRjNL9L2uc95k5/6ZJ6Ni2VHhguE89E8nIiEvSgsLJY9SfUqcs
	iPSadOjYALKIWpHZVIySo9EEM8KauINuZTx5aMs=
X-Google-Smtp-Source: AMrXdXvvmUfykE6Z5yGDFpO8mZ7rNMTtzVx/lK8I1taRVEeqLVqPLwwL4C+PuW1djDYIUxVLKjAj29X3QA5e/Oa+5sA=
X-Received: by 2002:ac8:6e81:0:b0:3b6:3c45:ada4 with SMTP id
 c1-20020ac86e81000000b003b63c45ada4mr340174qtv.481.1674058683393; Wed, 18 Jan
 2023 08:18:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHp75VcxvPZOZpGMSQXkCFv+WekHckMJkympfdR0ih72AjjkNw@mail.gmail.com>
 <20230118160739.26059-1-bpappas@pappasbrent.com>
In-Reply-To: <20230118160739.26059-1-bpappas@pappasbrent.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 18 Jan 2023 18:17:27 +0200
Message-ID: <CAHp75VeP42nhAnjWMXnsHpd7SQhJ2G1kqX6mbEHxnpFHhKWYHg@mail.gmail.com>
Subject: Re: [PATCH v6] media: atomisp: pci: Replace bytes macros with functions
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: ailus@linux.intel.com, error27@gmail.com, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 18, 2023 at 6:08 PM Brent Pappas <bpappas@pappasbrent.com> wrote:
>
> Replace the function-like macros FPNTBL_BYTES(), SCTBL_BYTES(), and
> MORPH_PLANE_BYTES() with functions to comply with Linux coding style
> standards.
> Replace multiplication with calls to array_size() and array3_size()
> to prevent accidental arithmetic overflow.

In my MUA I don't clearly see if indentations are really being fixed,
assuming that
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Thank you and keep going!

> Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
> ---
> Changelog:
> V1 -> V2: Use size_mul() to perform size_t multiplication without risk of
>                   overflow.
>                   Remove the inline keyword from function definitions.
>
> V2 -> V3: Add commit message.
>
> V3 -> V4: Use array_size() and array3_size() for multiplication.
>
> V4 -> V5: Fix indentation.
>
> V5 -> V6: Try again to fix indentation (use tabs of size 8).
>
>  .../staging/media/atomisp/pci/sh_css_params.c | 38 +++++++++++--------
>  1 file changed, 23 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index f08564f58242..7e111df5c09d 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -98,17 +98,27 @@
>  #include "sh_css_frac.h"
>  #include "ia_css_bufq.h"
>
> -#define FPNTBL_BYTES(binary) \
> -       (sizeof(char) * (binary)->in_frame_info.res.height * \
> -        (binary)->in_frame_info.padded_width)
> +static size_t fpntbl_bytes(const struct ia_css_binary *binary)
> +{
> +       return array3_size(sizeof(char),
> +                          binary->in_frame_info.res.height,
> +                          binary->in_frame_info.padded_width);
> +}
>
> -#define SCTBL_BYTES(binary) \
> -       (sizeof(unsigned short) * (binary)->sctbl_height * \
> -        (binary)->sctbl_aligned_width_per_color * IA_CSS_SC_NUM_COLORS)
> +static size_t sctbl_bytes(const struct ia_css_binary *binary)
> +{
> +       return size_mul(sizeof(unsigned short),
> +                         array3_size(binary->sctbl_height,
> +                                     binary->sctbl_aligned_width_per_color,
> +                                     IA_CSS_SC_NUM_COLORS));
> +}
>
> -#define MORPH_PLANE_BYTES(binary) \
> -       (SH_CSS_MORPH_TABLE_ELEM_BYTES * (binary)->morph_tbl_aligned_width * \
> -        (binary)->morph_tbl_height)
> +static size_t morph_plane_bytes(const struct ia_css_binary *binary)
> +{
> +       return array3_size(SH_CSS_MORPH_TABLE_ELEM_BYTES,
> +                          binary->morph_tbl_aligned_width,
> +                          binary->morph_tbl_height);
> +}
>
>  /* We keep a second copy of the ptr struct for the SP to access.
>     Again, this would not be necessary on the chip. */
> @@ -3279,7 +3289,7 @@ sh_css_params_write_to_ddr_internal(
>         if (binary->info->sp.enable.fpnr) {
>                 buff_realloced = reallocate_buffer(&ddr_map->fpn_tbl,
>                                                    &ddr_map_size->fpn_tbl,
> -                                                  (size_t)(FPNTBL_BYTES(binary)),
> +                                                  fpntbl_bytes(binary),
>                                                    params->config_changed[IA_CSS_FPN_ID],
>                                                    &err);
>                 if (err) {
> @@ -3304,7 +3314,7 @@ sh_css_params_write_to_ddr_internal(
>
>                 buff_realloced = reallocate_buffer(&ddr_map->sc_tbl,
>                                                    &ddr_map_size->sc_tbl,
> -                                                  SCTBL_BYTES(binary),
> +                                                  sctbl_bytes(binary),
>                                                    params->sc_table_changed,
>                                                    &err);
>                 if (err) {
> @@ -3538,8 +3548,7 @@ sh_css_params_write_to_ddr_internal(
>                         buff_realloced |=
>                             reallocate_buffer(virt_addr_tetra_x[i],
>                                             virt_size_tetra_x[i],
> -                                           (size_t)
> -                                           (MORPH_PLANE_BYTES(binary)),
> +                                           morph_plane_bytes(binary),
>                                             params->morph_table_changed,
>                                             &err);
>                         if (err) {
> @@ -3549,8 +3558,7 @@ sh_css_params_write_to_ddr_internal(
>                         buff_realloced |=
>                             reallocate_buffer(virt_addr_tetra_y[i],
>                                             virt_size_tetra_y[i],
> -                                           (size_t)
> -                                           (MORPH_PLANE_BYTES(binary)),
> +                                           morph_plane_bytes(binary),
>                                             params->morph_table_changed,
>                                             &err);
>                         if (err) {
> --
> 2.34.1
>


-- 
With Best Regards,
Andy Shevchenko
