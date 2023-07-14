Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665ABFC03
	for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 09:53:19 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fbc656873eso16690495e9.1
        for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 02:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689328397; x=1691920397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RkZHHcRsX6xT5CwFSt0BPE87o3Wbf8EEmNwVu3AS04s=;
        b=dK3IFU+sdFFeYFy+O2s+OJ9hivKr3h30WV1HuYXwbxE+ae6q9bUwX55R5WRM6On8Ab
         koPOe8Bj5neJBcTC+v53ZbKTQgrkcItOrR7t7AJonM3RFzPSd2/oXmC9OkyDZENVCir1
         wUkb69ymsyIwKYwksfRva0r9kQcVW3yGnSJTe5snk6ZSLODIH9JkO6hUtedGH6xV00YO
         0wTj4IyxDv6T/OHqBJkuc9+nZfbU1KMf94zJwJODs2u2i2AU7nsSW9oqMyAxbhWKDP0w
         5a74osDolzaa48qbTbXtkw7lTxKNmptnTipbVhcQ27Xt5x8WRzm7nglOEW4hd1uv09do
         hZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689328397; x=1691920397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkZHHcRsX6xT5CwFSt0BPE87o3Wbf8EEmNwVu3AS04s=;
        b=gx23TsmEh8gTGanWM03vr2nmAGe50dumy1SrmbGO3vQhKc1OFj0pvqbF/bCfUgVg2U
         8G1C71Sb8sqR26rB57+Fm41nS5M1td4S1iZttwF5268hI86uJSy23XJ0O3beVNX7pD38
         o1Xha4bEwfpCGtPhRPefWLPzz4o6nBChCKaKM5i1b6CWLRhlI0qvYM5fpkPCNA4L+NI5
         4VSkP3E+qGmvjRjDo83x7k+ELEhEJXt0syJTBLSxwxSjg+Mujxsx+5ON1b7k+UDNCPcF
         2fgVQo/O7B5Qf5YSQ70KguW07xDi9yHkT0R0KYLLcQNT5JbdGeKvLi8yotNwr2JOojz4
         G/9A==
X-Gm-Message-State: ABy/qLaBG5que3+czFxx4kYBwI5XzAJMTEKsDUgZ/2vAi/i53DTrQPsS
	LSGmNd7FBy/zfmSYLvz+472Biw==
X-Google-Smtp-Source: APBJJlEeo9gAOUZlKead1BmpWj8b5QWJLKPIK39T1k2tRBtPjxfuO88MJ87xg7EaQbkJrOjP2zZ8qA==
X-Received: by 2002:a05:600c:214d:b0:3fa:aeac:e96c with SMTP id v13-20020a05600c214d00b003faaeace96cmr4384362wml.9.1689328397419;
        Fri, 14 Jul 2023 02:53:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d6752000000b0031434cebcd8sm10304400wrw.33.2023.07.14.02.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 02:53:14 -0700 (PDT)
Date: Fri, 14 Jul 2023 12:53:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/12] Staging: rtl8192e: Rename variable pBA
Message-ID: <da405689-d41d-4633-acdc-1c03d35cb871@kadam.mountain>
References: <ZK84sYjc9uHIWZcr@basil>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZK84sYjc9uHIWZcr@basil>

On Wed, Jul 12, 2023 at 04:35:13PM -0700, Tree Davies wrote:
> Rename variable pBA to pba in order to Fix checkpatch
> warning: Avoid CamelCase
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
>  drivers/staging/rtl8192e/rtl819x_BAProc.c | 106 +++++++++++-----------
>  drivers/staging/rtl8192e/rtllib.h         |   2 +-
>  2 files changed, 54 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> index 6b5da38353ee..43ee1bd4a6ed 100644
> --- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> @@ -10,17 +10,17 @@
>  #include "rtllib.h"
>  #include "rtl819x_BA.h"
>  
> -static void activate_ba_entry(struct ba_record *pBA, u16 Time)
> +static void activate_ba_entry(struct ba_record *pba, u16 Time)

Here the "p" stands for "pointer".  This style of naming is not allowed
in the Linux kernel.  Just use "ba" as a name.  This happens in a couple
other patches as well so fix those too.

regards,
dan carpenter

