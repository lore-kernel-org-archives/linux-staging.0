Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BACF9460
	for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 14:16:14 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso11184496wmb.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 07:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679408172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tTf4SFGvPPUH4a0PRrn6TfKCJyApZZxth8R3YNjD0S4=;
        b=lrGHU2vNwiejsHlaaBi6XrslNBo7vy249y7bQt/jTbqjrw6H703gB7PQInlelyXOVg
         XpUmZ+Di6KAOEplmoIDqTaaSv6tdALTazZMx/T09cO/6db6um9NOq6P+fwRq0s2hV1Mo
         Z3PrcT6ASbTycNjAbOz44lS7vO0XKdPXb3hMWxEXg7jDoMAbA5PGHPtCvy83IrZOl4BL
         fzmEN5WRsOAF/GjBuEdC7OuXhOO5NywlH/eUiI68VOhFCSi4f8v63ssCUmt6WniJD/Ju
         XY8R2i/vSd9rTKxfU/Rz6aOA7xXPREWWt+9r7h+5ozy789B9m/L5suTT3lstd8SUzMHy
         ma/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTf4SFGvPPUH4a0PRrn6TfKCJyApZZxth8R3YNjD0S4=;
        b=tJCLC7YeN//pDuRDNMXSXSRrGXVtnRDwArrphXqJg9I93i2eaocJg8H3glX05FkfAG
         qMObDG19d3VvLdv5m7hlpGGH8DvJZazQxRbZEhLaaS6stRb3GIVA69Kprr6VNxxv7WhB
         3qwF98Fvcl5VWkBvb0Kz8f/O44xxfEMxknme/Z+0csuWTIlxCvkG75Or2R1hdqWfCiOU
         iz8qqPrvoodGZpLAiI+MGZ6eu4YvL6NWIxGIIbnRL/CBZy5WnazcHP+KRXkR5q5MXuUu
         B1iLlEOhVcktAlYXIaS8emERyhrZpfpNqJht8vC9hCJTZGit2VK09ZoQ/iw94tG5Ht9R
         fu8g==
X-Gm-Message-State: AO0yUKVJIRm0pPwMrYgmLcIWdnvfVpAIFJYs7q0Sez4ydKTtfOXcEjSd
	fKHq/TMZ4meuKU61UGLpt6w=
X-Google-Smtp-Source: AK7set/b+JE78TqRXj3ubJBmPsRmXOUN7cB7sBTtlvamu22wSNF49RDmsukXzOfjOWwCbs8Y9ogNKw==
X-Received: by 2002:a05:600c:3649:b0:3ed:2a8f:e6dd with SMTP id y9-20020a05600c364900b003ed2a8fe6ddmr2357117wmq.6.1679408172584;
        Tue, 21 Mar 2023 07:16:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c154900b003ede03e4369sm7971218wmg.33.2023.03.21.07.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:16:12 -0700 (PDT)
Date: Tue, 21 Mar 2023 16:36:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Inshal Khan <kziaul123@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] Staging: rtl8712: osdep_intf: Improve RND4 macro for
 better debugging and safety
Message-ID: <d3307a75-fcc0-4a94-8a05-05b871f4fa9f@kili.mountain>
References: <ZBmX9cjTRNhwt2zA@mehmed-HP-Pavilion-Laptop-15-eh2xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBmX9cjTRNhwt2zA@mehmed-HP-Pavilion-Laptop-15-eh2xxx>

On Tue, Mar 21, 2023 at 05:11:41PM +0530, Inshal Khan wrote:
>  drivers/staging/rtl8712/osdep_intf.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/osdep_intf.h b/drivers/staging/rtl8712/osdep_intf.h
> index 95a21f380cd7..0e097b4a8670 100644
> --- a/drivers/staging/rtl8712/osdep_intf.h
> +++ b/drivers/staging/rtl8712/osdep_intf.h
> @@ -18,8 +18,8 @@
>  #include "drv_types.h"
>  
>  #define RND4(x)	({ \
> -		typeof(x) _x = (x); \
> -		(((_x) + 3) & ~3); \
> +			typeof(x) _x = (x); \
> +			(((_x) + 3) & ~3); \

Just use normal kernel rounding macros and delete RND4().

regards,
dan carpenter

