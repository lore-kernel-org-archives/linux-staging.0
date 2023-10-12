Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CBD440C
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 06:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FpNsrVqn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso7522775e9.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 23:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697092390; x=1697697190; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=phl5W3+qj5b5s8Bsed+j+WLh4nK22bVVfYDfsSd3Poo=;
        b=FpNsrVqnetLCg4L1UCgIImaPEe3YTIEG3CPl8sSFnz3g1ZNiZDsJVsvNduvjTR3SXX
         SmVy3HmIN7/sKaguEFzlfLnnjBp7uBC1uwzcsdHyTy8Npb6sOkcLXEuwfDTsPg3rYV8N
         CTItuwS8y/b7QotxmYLqL9TUpPNXjd2nIMIq87uKz+85Lo8WA+K5SkLBOrX7tq2jLA8b
         NcxyzZ+1VI5scR9Klud+UdsqHtWvS9KfU9sd7c4RC1GALrKVYd8JyFhJuWZfEz7V5iAd
         QtaFjS/FZsR5WnhVzUcqnpo8OXxvADu55uCPQ2VYZAd/L0C+fy72UuTkqGx1qCB6ugII
         wJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697092390; x=1697697190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phl5W3+qj5b5s8Bsed+j+WLh4nK22bVVfYDfsSd3Poo=;
        b=UlHqW0HRXNpur6BzntifCvXjeHEqJmNu01shxykzquM0DzcwD3m68odNxC5/wea6oT
         WBOAC133UqHDNWe4OU9BEE3rfK5YZArDSWgTQI8rsew+fVGDWhFVlFO01C9TbP91ktWk
         JUQ5YHgldLfPYk4UQmlDj4nKRAlL6TzDvkiRe1o6CoLS+H2gOu+gzNdWbGRu32oQ5NK7
         kkWVTWOIkgy3qeZ6FwotnQPlz6Cl/Ci79m0+bYVN9hNcYsfsdrsTsvgSqsLUD5zl3alS
         fw5ICFknh2H8eS8PWyYWjYqn+AQ967XweYjfGIxJNotybNAXoxfdFOkmhiDrqhPm6lQr
         6C6w==
X-Gm-Message-State: AOJu0YzvFJ+c9+cs1g+agoahqTud1matQerLtJq1PLR/N4wzYk0T9jkV
	sJ9w9bAxwP9NaWJLQmokwG2cyeeQ6dz0noOrWMY=
X-Google-Smtp-Source: AGHT+IFQ3UuhcbmL5nDmRzL7RHQDZpDGZlVDtI11m8XgEEIoIDkUDGj/sgKidZxvEZtzRGSsgxOK5w==
X-Received: by 2002:adf:fb0b:0:b0:31f:c1b5:d4c1 with SMTP id c11-20020adffb0b000000b0031fc1b5d4c1mr18781994wrr.35.1697092390464;
        Wed, 11 Oct 2023 23:33:10 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q8-20020a05600000c800b0032415213a6fsm17313023wrx.87.2023.10.11.23.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:33:10 -0700 (PDT)
Date: Thu, 12 Oct 2023 09:33:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soumya Negi <soumya.negi97@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Micky Ching <micky_ching@realsil.com.cn>, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Parenthesize macro arguments
Message-ID: <81d6e283-fd87-4fd6-964f-22cbf420cdaa@kadam.mountain>
References: <20231012050240.20378-1-soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012050240.20378-1-soumya.negi97@gmail.com>

On Wed, Oct 11, 2023 at 10:02:40PM -0700, Soumya Negi wrote:
> Use parenthesis with macro arguments to avoid possible precedence
> issues. Found by checkpatch.pl
> 
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> ---
>  drivers/staging/rts5208/rtsx.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/rtsx.h b/drivers/staging/rts5208/rtsx.h
> index 2e101da83220..1cc05956ab6d 100644
> --- a/drivers/staging/rts5208/rtsx.h
> +++ b/drivers/staging/rts5208/rtsx.h
> @@ -40,17 +40,17 @@
>   * macros for easy use
>   */
>  #define rtsx_writel(chip, reg, value) \
> -	iowrite32(value, (chip)->rtsx->remap_addr + reg)
> +	iowrite32(value, (chip)->rtsx->remap_addr + (reg))

These would be better as functions instead of defines.

>  #define rtsx_readl(chip, reg) \
> -	ioread32((chip)->rtsx->remap_addr + reg)
> +	ioread32((chip)->rtsx->remap_addr + (reg))
>  #define rtsx_writew(chip, reg, value) \
> -	iowrite16(value, (chip)->rtsx->remap_addr + reg)
> +	iowrite16(value, (chip)->rtsx->remap_addr + (reg))
>  #define rtsx_readw(chip, reg) \
> -	ioread16((chip)->rtsx->remap_addr + reg)
> +	ioread16((chip)->rtsx->remap_addr + (reg))
>  #define rtsx_writeb(chip, reg, value) \
> -	iowrite8(value, (chip)->rtsx->remap_addr + reg)
> +	iowrite8(value, (chip)->rtsx->remap_addr + (reg))
>  #define rtsx_readb(chip, reg) \
> -	ioread8((chip)->rtsx->remap_addr + reg)
> +	ioread8((chip)->rtsx->remap_addr + (reg))
>  
>  #define rtsx_read_config_byte(chip, where, val) \
>  	pci_read_config_byte((chip)->rtsx->pci, where, val)
> @@ -131,8 +131,8 @@ static inline struct rtsx_dev *host_to_rtsx(struct Scsi_Host *host)
>   * The scsi_lock() and scsi_unlock() macros protect the sm_state and the
>   * single queue element srb for write access
>   */
> -#define scsi_unlock(host)	spin_unlock_irq(host->host_lock)
> -#define scsi_lock(host)		spin_lock_irq(host->host_lock)
> +#define scsi_unlock(host)	spin_unlock_irq((host)->host_lock)
> +#define scsi_lock(host)		spin_lock_irq((host)->host_lock)

For these ones, the name is too generic.  probably the right thing is
to just get rid of them completely and call spin_lock/unlock_irq()
directly.

regards,
dan carpenter

