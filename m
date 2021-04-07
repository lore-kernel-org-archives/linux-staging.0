Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB576D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 15:24:02 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id h3so6179477qvr.10
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 08:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bYbr5XFh7eAyaZ8aLGKWX2AmCToqdu77M7av+YkmMFs=;
        b=GQzQ1sEHpVao0SapC0J0/sm4wwrg1clLn5zNDA2WaXGlBHjRmgL9rHyQIsjPFYRVw5
         kR+HEE6dDdpugfCQiWTBipJZk2aatUyWtBjrxtYo6kW4BB/+K3jRA4wX4P+FNxK/JFv4
         QsyokYjhy+MY34p0teKZQW6gfnEIY/5YhCxJFd2r4ywfpG9qA2QefHG4kHTX9+5e7ajQ
         6MZixiCayGL83pw2RnCGvlzEfUSKjg2Bw3VsybQWXPk8x6VM2Z56maUj8XfaX68jS6MB
         ikEBwM0kCsyg46xcyvGc34vK4OffsfM9Pk7BFKXaFfuj/gh4ZfJvZ3+wqWh+DysXJ/e6
         abDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bYbr5XFh7eAyaZ8aLGKWX2AmCToqdu77M7av+YkmMFs=;
        b=D5u9qSq/kq8f6uBg50tX3KAnd+BqYUZATtmnfcPedxKu7fbmStFMe3rvmdzuqRlx6z
         /vtR8gPHIB9r9ImpKDV2GQ97f5CgN5nX91CwNZ/ct/gjNJE3RNxC0am5KknFNLyC8okI
         IKcSnA8knWYPkUnXk7wrBZfqOtCB3GMswDT68XIKFfOgOEE+YqZXT2GwYP2f6d3nxcWV
         n8kXC1wnOrwT5wUymfzvnZHziIZHKsgttClpN7kgQPTb9uKB9TlG/+CKLuW7yqayVrpr
         zjMF0BIOxDos6gB8bApkrWx3bf3QXR5X6sxzuaqXhyaq3LhckJLttwfzAjQs6b79+J0F
         KhTA==
X-Gm-Message-State: AOAM533t4gYjhsHzIRIWoc1VjoI5u4FLXJaX4trT1xdZ3cj1PPirNqxn
	OfDuRzXVvnUX6leWbWOYk6oyFOfLKluyEDOW/1NbMQ==
X-Google-Smtp-Source: ABdhPJyhvp56TN99d2IYq2cu9ch4RRLunEoN4ahAQNALyyw0ko1mQgtQKjWPOubsnbwndK5b8aPH9rjkh+ci4QC86Pc=
X-Received: by 2002:a0c:ff06:: with SMTP id w6mr4028393qvt.51.1617809041384;
 Wed, 07 Apr 2021 08:24:01 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210407140142.447250-1-abbotti@mev.co.uk> <20210407140142.447250-4-abbotti@mev.co.uk>
In-Reply-To: <20210407140142.447250-4-abbotti@mev.co.uk>
From: Spencer Olson <olsonse@umich.edu>
Date: Wed, 7 Apr 2021 09:23:50 -0600
Message-ID: <CAOx9PejvPxnNEFbGP3beer7prNBwhL1B4B5_VJJX1sxXbvf2WA@mail.gmail.com>
Subject: Re: [PATCH 3/5] staging: comedi: tests: ni_routes_test: Avoid
 CamelCase: <RVi>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: linux-staging@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 7, 2021 at 8:11 AM Ian Abbott <abbotti@mev.co.uk> wrote:
>
> Rename the `RVi` macro to `RVI` to avoid this checkpatch.pl issue:
>
> CHECK: #27: FILE: drivers/staging/comedi/drivers/tests/ni_routes_test.c:27:
> +#define RVi(table, src, dest)  ((table)[(dest) * NI_NUM_NAMES + (src)])
>
> Cc: Spencer E. Olson <olsonse@umich.edu>
> Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
> ---
> Note: checkpatch.pl shows an unrelated CamelCase issue for this patch.
> ---
>  .../comedi/drivers/tests/ni_routes_test.c      | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/staging/comedi/drivers/tests/ni_routes_test.c b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
> index 696e610f1822..7dfc70a4cc6f 100644
> --- a/drivers/staging/comedi/drivers/tests/ni_routes_test.c
> +++ b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
> @@ -24,7 +24,7 @@
>  #include "../ni_routes.h"
>  #include "unittest.h"
>
> -#define RVi(table, src, dest)  ((table)[(dest) * NI_NUM_NAMES + (src)])
> +#define RVI(table, src, dest)  ((table)[(dest) * NI_NUM_NAMES + (src)])
>  #define O(x)   ((x) + NI_NAMES_BASE)
>  #define B(x)   ((x) - NI_NAMES_BASE)
>  #define V(x)   ((x) | 0x80)
> @@ -244,10 +244,10 @@ void test_ni_assign_device_routes(void)
>                  "all pci-6070e route_set->src's in order of signal source\n");
>
>         unittest(
> -         RVi(table, B(PXI_Star), B(NI_AI_SampleClock)) == V(17) &&
> -         RVi(table, B(NI_10MHzRefClock), B(TRIGGER_LINE(0))) == 0 &&
> -         RVi(table, B(NI_AI_ConvertClock), B(NI_PFI(0))) == 0 &&
> -         RVi(table, B(NI_AI_ConvertClock), B(NI_PFI(2))) ==
> +         RVI(table, B(PXI_Star), B(NI_AI_SampleClock)) == V(17) &&
> +         RVI(table, B(NI_10MHzRefClock), B(TRIGGER_LINE(0))) == 0 &&
> +         RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(0))) == 0 &&
> +         RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(2))) ==
>                 V(NI_PFI_OUTPUT_AI_CONVERT),
>           "pci-6070e finds e-series route_values table\n");
>
> @@ -264,10 +264,10 @@ void test_ni_assign_device_routes(void)
>         unittest(oldtable != table, "pci-6220 find other route_values table\n");
>
>         unittest(
> -         RVi(table, B(PXI_Star), B(NI_AI_SampleClock)) == V(20) &&
> -         RVi(table, B(NI_10MHzRefClock), B(TRIGGER_LINE(0))) == V(12) &&
> -         RVi(table, B(NI_AI_ConvertClock), B(NI_PFI(0))) == V(3) &&
> -         RVi(table, B(NI_AI_ConvertClock), B(NI_PFI(2))) == V(3),
> +         RVI(table, B(PXI_Star), B(NI_AI_SampleClock)) == V(20) &&
> +         RVI(table, B(NI_10MHzRefClock), B(TRIGGER_LINE(0))) == V(12) &&
> +         RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(0))) == V(3) &&
> +         RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(2))) == V(3),
>           "pci-6220 finds m-series route_values table\n");
>  }
>
> --
> 2.31.0
>

Had not really been meant to be CamelCase (like all the other
exceptions that were meant to mirror documentation from NI).

Spencer
