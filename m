Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942192C81
	for <linux-staging@lists.linux.dev>; Tue, 23 Nov 2021 13:19:44 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id t9-20020a4a8589000000b002c5c4d19723so7464366ooh.11
        for <linux-staging@lists.linux.dev>; Tue, 23 Nov 2021 05:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sxbm5nZuxDktECFOUcgXGTkmQEJlkXm+UQAvKfd0Kcw=;
        b=c5e/+hLD3Pe944EDn1RynLZPfSMn+mZU1xnm+gzzSTFIBrpuybiIax/ansqPLmt/+W
         HJxNoDOGobI2T4CVbK750CkoeAGMw5YyFY9u+DGA13eWofErjCAn2UDUh1VIUyVra9BM
         jfnT08l0LThYJl01EPI2BNmL8TYZ4npnQuswQ4qojbbXXx0Jozf/dk1/Yh3YNzTpjsx2
         VmmPIHZL2NSFb34Hcyo+t1jRjSP4TjIHltcIQJtsm4XeY3P3vikfUaxG4iw02gQD/qc2
         LLZO9aHXR3pp3aiyRmaoTKk4MEzg7ooHtwIjGgP/NZmk+M398xBjzh0Vfnmgz/YLH6AT
         LahQ==
X-Gm-Message-State: AOAM533t+EYEoXWR3gQX6PXiht9aet4pfaXUaJObmYyae1nGZfZyLsZA
	xnCSHee11pX7LkqoKJYlzZpNt7yv+4A2+ZsRXJ4=
X-Google-Smtp-Source: ABdhPJx4LJPjPNqz/sXcVDWL5tamzih4SOz6Sq7UGTbN97hIVt3zgoG90+osvpCrjRpDoZ3z/WaeE3Jdprr6Jm1J/tY=
X-Received: by 2002:a4a:1d82:: with SMTP id 124mr2868847oog.91.1637673583839;
 Tue, 23 Nov 2021 05:19:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210818060533.3569517-1-keescook@chromium.org> <20210818060533.3569517-13-keescook@chromium.org>
In-Reply-To: <20210818060533.3569517-13-keescook@chromium.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 23 Nov 2021 14:19:25 +0100
Message-ID: <CAJZ5v0iS3qMgdab1S-NzGfeLLXV=S6p5Qx8AaqJ50rsUngS=LA@mail.gmail.com>
Subject: Re: [PATCH v2 12/63] thermal: intel: int340x_thermal: Use
 struct_group() for memcpy() region
To: Kees Cook <keescook@chromium.org>, Zhang Rui <rui.zhang@intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Linux PM <linux-pm@vger.kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, linux-staging@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	clang-built-linux@googlegroups.com, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 18, 2021 at 8:08 AM Kees Cook <keescook@chromium.org> wrote:
>
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), avoid intentionally writing across
> neighboring fields.
>
> Use struct_group() in struct art around members weight, and ac[0-9]_max,
> so they can be referenced together. This will allow memcpy() and sizeof()
> to more easily reason about sizes, improve readability, and avoid future
> warnings about writing beyond the end of weight.
>
> "pahole" shows no size nor member offset changes to struct art.
> "objdump -d" shows no meaningful object code changes (i.e. only source
> line number induced differences).
>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Amit Kucheria <amitk@kernel.org>
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Rui, Srinivas, any comments here?

> ---
>  .../intel/int340x_thermal/acpi_thermal_rel.c  |  5 +-
>  .../intel/int340x_thermal/acpi_thermal_rel.h  | 48 ++++++++++---------
>  2 files changed, 29 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
> index a478cff8162a..e90690a234c4 100644
> --- a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
> +++ b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
> @@ -250,8 +250,9 @@ static int fill_art(char __user *ubuf)
>                 get_single_name(arts[i].source, art_user[i].source_device);
>                 get_single_name(arts[i].target, art_user[i].target_device);
>                 /* copy the rest int data in addition to source and target */
> -               memcpy(&art_user[i].weight, &arts[i].weight,
> -                       sizeof(u64) * (ACPI_NR_ART_ELEMENTS - 2));
> +               BUILD_BUG_ON(sizeof(art_user[i].data) !=
> +                            sizeof(u64) * (ACPI_NR_ART_ELEMENTS - 2));
> +               memcpy(&art_user[i].data, &arts[i].data, sizeof(art_user[i].data));
>         }
>
>         if (copy_to_user(ubuf, art_user, art_len))
> diff --git a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h
> index 58822575fd54..78d942477035 100644
> --- a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h
> +++ b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h
> @@ -17,17 +17,19 @@
>  struct art {
>         acpi_handle source;
>         acpi_handle target;
> -       u64 weight;
> -       u64 ac0_max;
> -       u64 ac1_max;
> -       u64 ac2_max;
> -       u64 ac3_max;
> -       u64 ac4_max;
> -       u64 ac5_max;
> -       u64 ac6_max;
> -       u64 ac7_max;
> -       u64 ac8_max;
> -       u64 ac9_max;
> +       struct_group(data,
> +               u64 weight;
> +               u64 ac0_max;
> +               u64 ac1_max;
> +               u64 ac2_max;
> +               u64 ac3_max;
> +               u64 ac4_max;
> +               u64 ac5_max;
> +               u64 ac6_max;
> +               u64 ac7_max;
> +               u64 ac8_max;
> +               u64 ac9_max;
> +       );
>  } __packed;
>
>  struct trt {
> @@ -47,17 +49,19 @@ union art_object {
>         struct {
>                 char source_device[8]; /* ACPI single name */
>                 char target_device[8]; /* ACPI single name */
> -               u64 weight;
> -               u64 ac0_max_level;
> -               u64 ac1_max_level;
> -               u64 ac2_max_level;
> -               u64 ac3_max_level;
> -               u64 ac4_max_level;
> -               u64 ac5_max_level;
> -               u64 ac6_max_level;
> -               u64 ac7_max_level;
> -               u64 ac8_max_level;
> -               u64 ac9_max_level;
> +               struct_group(data,
> +                       u64 weight;
> +                       u64 ac0_max_level;
> +                       u64 ac1_max_level;
> +                       u64 ac2_max_level;
> +                       u64 ac3_max_level;
> +                       u64 ac4_max_level;
> +                       u64 ac5_max_level;
> +                       u64 ac6_max_level;
> +                       u64 ac7_max_level;
> +                       u64 ac8_max_level;
> +                       u64 ac9_max_level;
> +               );
>         };
>         u64 __data[ACPI_NR_ART_ELEMENTS];
>  };
> --
> 2.30.2
>
