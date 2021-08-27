Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0573FC2
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 06:49:34 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id i6so8492297edu.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 23:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0hX8911IXEO3Sw/Ph82ioUw4uVWj55iMRO3ulvegGq0=;
        b=lhqzvr6NJJ0EKgXSGZPILN6ss2vl/h4+YUXY6MS6KqFfzmIns5d4T7OSmnHxOm9N1X
         cVlNqjl/8RUZsUMXVt9GMt40HMdcmox/NZoHuc6Mgnrhj2eXQ2aE+fsW0hw1OeukQR4V
         mqHOheRzFl6LSx5CInp52xp3+09cMc/75Bt2rlsm2Oe8tG33Nf9YfMa6RZ2AeBwp+GQj
         rbbwnQJjXCNLu86JlfAjZeTpxiqmeFifiVSlRwY0G5O2UWlKQXCkAWbHrVF0jHNqvxzD
         3GdrbW8HCkJ0MfmsuJy8kd56jsPKUgnZ+WlXDoWOWBrCUF/7V97VXn4IT0HJAeDvzCdk
         ksMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0hX8911IXEO3Sw/Ph82ioUw4uVWj55iMRO3ulvegGq0=;
        b=eDF8ih9MAao9zmiTAnXGiEaMsS/onRX/m3ntRwPkcHavHvX4J/FmF594aQ4qj8g555
         feFxYR2ZrysDhidqOttK5Ixd9NCOmpwf3VIawZv5V5eG1Gfgzrof9HwGzMEBiRmvtzbg
         V75XZ3smtidGS3jQM9rxTLibZ72AeS2YwMWObx5wITh9NgWMBfjIh3z8dbxZghSinUV5
         E9E6303btDMO0uhSoQD98KLYmJeCMq/8gSsRk8NCxO1dnshIYMcWcKw9Oq7/NOU0lkMl
         CLm34sT2FcBo80J2s6yrfFPbK40YrdEQYn3USTB1VX+a8FGlXQKglwrhmOzXkqLpHZgv
         mWZw==
X-Gm-Message-State: AOAM531xjgJDDybgSmhbO2t891+8qo0nQgnO1SAkjRPlSqC5gp0sBw8J
	pr36LfknSojl0OznjMm7l/eVBG6KV+w=
X-Google-Smtp-Source: ABdhPJzPZNKTgt/8ccYnztH2gQDZ7HrDvrAydg5gEJ6FbUqJYFh2IYSmGZdTsHwlvZ48tEpOkqoh2w==
X-Received: by 2002:a05:6402:344f:: with SMTP id l15mr8309363edc.56.1630046973060;
        Thu, 26 Aug 2021 23:49:33 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id q5sm2923947edt.50.2021.08.26.23.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 23:49:32 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: linux-staging@lists.linux.dev, Krish Jain <krishjain02939@gmail.com>
Subject: Re: [PATCH] Declare the file_operations struct as const
Date: Fri, 27 Aug 2021 08:49:30 +0200
Message-ID: <3634721.RBzQ2xsved@localhost.localdomain>
In-Reply-To: <CAPGkw+x+B1731SL=afoSKiWwH-n-FA5YJ+WOwYdv8iyFhWk1zA@mail.gmail.com>
References: <CAPGkw+x+B1731SL=afoSKiWwH-n-FA5YJ+WOwYdv8iyFhWk1zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Friday, August 27, 2021 3:59:28 AM CEST Krish Jain wrote:
>  From: Krish Jain <krishjain02939@gmail.com>
> 
> Declare the file_operations struct as const as done elsewhere in the
> kernel, as there are no modifications to its fields.
> 
> Signed-off-by: Krish Jain <krishjain02939@gmail.com>
> ---
>  drivers/staging/android/ashmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
> index ddbde3f8430e..ec18f2ddd66c 100644
> --- a/drivers/staging/android/ashmem.c
> +++ b/drivers/staging/android/ashmem.c
> @@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file,
> unsigned long addr,
> 
>  static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
>  {
> -       static struct file_operations vmfile_fops;
> +       const static struct file_operations vmfile_fops;
>         struct ashmem_area *asma = file->private_data;
>         int ret = 0;
> 
> --
> 2.25.1

Are you sure that it works? I wouldn't be.
You didn't build this file. Please build your changes before submitting patches.

Furthermore, please always rebase to the current version of the staging tree.

Finally, please use the class modifier "static" as the first keyword of a declaration/definition
as it is done everywhere in the kernel (see "grep -rn "static const" drivers/staging/" and
then switch to "const static" and read the output).

Thanks,

Fabio



