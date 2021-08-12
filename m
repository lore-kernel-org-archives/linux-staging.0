Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8EA6D18
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 23:11:22 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id b15so14733454ejg.10
        for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 16:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9pldq4BQLhbXUiMQyVqnQvEJ+WijB05dp31Np55Rm74=;
        b=f64+GA1QNqvr9ZaICAQIwgSvc+KRG2fqIRRmJkb8fW1M4yjXUm6st4fHgqUmbApkKp
         HzTpdNFMbsAg2E3jxTjNVro271Idcyfk0PTaN/Kj2gyPza57rWgQc4lYirT71xvWB0q+
         l6jkQhmtMo4iKu1qKbno54lUSW9g6oilznkoVMwN+0mIbS2noQdAxemddKneSZ8i7JuU
         EltmVlBPirypbVocSRRtecaQx5YlqEBlJW8FAwJWqaj3BZJXrhLS63DBKDxvyk1Fpi8T
         6YM6QvPndO0UfI/M5o7iAWKA+jqogihE9NAjjG39/8tp054wY6feUNCWOZz/Trg+l1B7
         ywxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9pldq4BQLhbXUiMQyVqnQvEJ+WijB05dp31Np55Rm74=;
        b=egWiO8zZBOFHzZ0PFRJfMEBISOY8cMqTozRaTwV6SsABTNGQhC7exPIJ4meXQQ9Nbf
         rnwHvc8Nsy2ABq92mvrZJqNAbHWUMtVcDOVN2PMNz7CM88f5qGy6aFLKUOokQ1OxCbc2
         LReygDf/LK6kjGrl9A68LT24eE7Vehbrtv2cBNfdwoEFs4hrdrsq7iUZtPKXZ2j4tvR2
         OmhITHeJLVQXEQMf0v0jnwvq7l8ktJ3C5WzNCmGy4RRDmbtGd4PfoAWrWo9QjLChdLAW
         Gxg1y5MDeQBKcwgHW5oB58uYxzpEM+3gXXzTK+NLANbor2/YpgkcT/j0LlrQD6nzJM4O
         I4OA==
X-Gm-Message-State: AOAM53285lYP6UUVZj8cKnaTcq1WHJOvq3mzRET8FJvzEqlMrvi2LxQU
	4tBa9JmArka7zusYKKg89uQ=
X-Google-Smtp-Source: ABdhPJxB3YLm/NLdB9V53s3dwtW1iOZmqRS6c1VTd2TMck3BODrOwzz2+Zv2KBMetylSl6y2ZZbT1w==
X-Received: by 2002:a17:906:4fd6:: with SMTP id i22mr6054053ejw.92.1628809881282;
        Thu, 12 Aug 2021 16:11:21 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id v24sm1789314edt.41.2021.08.12.16.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 16:11:20 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phillip Potter <phil@philpotter.co.uk>, Larry Finger <Larry.Finger@lwfinger.net>, Nick Desaulniers <ndesaulniers@google.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 3/3] staging: r8188eu: Reorganize error handling in rtw_drv_init()
Date: Fri, 13 Aug 2021 01:11:19 +0200
Message-ID: <1651213.ETx7SW4KbR@localhost.localdomain>
In-Reply-To: <20210812204027.338872-4-nathan@kernel.org>
References: <20210812204027.338872-1-nathan@kernel.org> <20210812204027.338872-4-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 12, 2021 10:40:27 PM CEST Nathan Chancellor wrote:
> [...]
> Looking at the error function as a whole, the error handling is odd
> compared to the rest of the kernel, which prefers to set error codes on
> goto paths, rather than a global "status" variable which determines the
> error code at the end of the function and function calls in the case of
> error.
>
"status" is not a global variable, instead it is a local variable with only 
in-function visibility and it has an automatic storage duration (i.e., it is 
allocated on the stack frame of the function and is destroyed when the stack 
is unwound at the return from the function). 

According to the above definition there's no difference in storage classes  
between the old "status" and the new "ret" (the latter being a merely rename 
of the former). However, "ret" is a more appropriate name for that variable.
Furthermore, your handling of errors and return value is more consistent with 
best practices. 

Therefore, apart that minor misuse of the "global" class in your commit 
message, it's a nice work and so...

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Regards,

Fabio
>
> [...]
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/staging/r8188eu/os_dep/usb_intf.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> [...]
>



