Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39647B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 12:37:19 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso7925167wmb.0
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 04:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678538238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zcsn7bYbUgDo4BpeWVNte3Ic8CnH+XS+jUv7CFxvvPo=;
        b=M8Rcdai3EY/1Pr6pZsdfPTesC5LbaAcSxWR52epdEtjL7jMMg9uKsE2Nx/eegdp+P0
         c8dspNVGtDBq2a5hykOmOOdYm9Eq7JQiEe66Y2ROjC1PEojKnWRLVzl9rPM5OKWpH4xN
         pWZbTTfIJrJUYnqgrm5I4GZa/Q7hb0l1rfXRJ353wiRb4Z8+d/MC53vx7dVvWl0Ziy3w
         0LbGmFJzhmj7bu8EdUjO8+sRuRELEcLMptCmCg+DpRNOZfB6zWQOrt5f5eHCQcWmyCgt
         6CRpdRgBJjjhHieWS6rb67KiC9Iv8E0J+lfqnKYGV5zBvkeGuiKjIWX0huYnnjzJ4oUm
         ecuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678538238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zcsn7bYbUgDo4BpeWVNte3Ic8CnH+XS+jUv7CFxvvPo=;
        b=CDYGudtdhJAATPgC7zgB2ghOE+Osk580yMIuPEwDKOWufs/LSKgcyMhZb4La2p2T0G
         6aP9wDjNi3q/OfUDLYE9nPQdCk1axdiShGsvYjgjW3tfFE78Dj4QQyyEwR824f4dtu/Y
         7VTjxLH3wr3UFtR/S6NbUcBp4I7jgPgF3+HAMsmzPgehh+3fS7/CrOY+YsNq5MIBwLAk
         o047bHpMFrUduDyAZqq4E+Zf4MvBhGdmmXl8qASceFJyqgWwV994IleJL/fCo/oHY62E
         W5HdegwrruaVnphVfG8J2wp97MskAt+PyN8A7a1GJOekVtjNsBR+i5EUIydF9ILe0Xzq
         OcZg==
X-Gm-Message-State: AO0yUKXyH5UnxxVwPcEqA2Hxt5fWapvbsQ/vZuFUrVkrU9UJibzBXBe5
	8Rtuf5v47pwFYMleljHZjU8=
X-Google-Smtp-Source: AK7set8O4/UZd6EHLLpgwRSSHlGkdap8ASTc/E+KwDcAsgxRdk/2Uw1TQP8HS7hdMDKxnWubF+Y2/g==
X-Received: by 2002:a1c:4c12:0:b0:3ea:183b:a525 with SMTP id z18-20020a1c4c12000000b003ea183ba525mr5598243wmf.36.1678538237703;
        Sat, 11 Mar 2023 04:37:17 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bi26-20020a05600c3d9a00b003e01493b136sm2718232wmb.43.2023.03.11.04.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 04:37:17 -0800 (PST)
Date: Sat, 11 Mar 2023 15:37:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Archana <craechal@gmail.com>
Cc: gregkh@linuxfoundation.org, drv@mailo.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/2] staging: wlan-ng: small cleanup in writeimage()
Message-ID: <74e2b862-dca2-42db-8db6-9bd896c13026@kili.mountain>
References: <ZAwwRnthlPFta9oL@kroah.com>
 <20230311121253.10225-1-craechal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311121253.10225-1-craechal@gmail.com>

On Sat, Mar 11, 2023 at 12:12:52PM +0000, Archana wrote:
> It is cleaner to use "goto free_result;" as is being followed
> in rest of the implementation of writeimage function, and
> remove unnecessary kfree statements.
> 
> Signed-off-by: Archana <craechal@gmail.com>
> ---
> Changes in v2:
>   - Make the commit message more clearer.

Thanks.  Both look good to me now.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

