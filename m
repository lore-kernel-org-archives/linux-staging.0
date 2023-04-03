Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611D8631
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 06:17:56 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id t10so112582673edd.12
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 23:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680502674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sPU+k5Dii+Pl5dwm1iVz6jH2SOAHhEPucNsoSGY5PvI=;
        b=PRe6QUC3nR/2OZdR9bXdXcRvsn08hKPaw8sdWaDoplmtW9vqt5OYLYcyO38rKrL/Dn
         nU4Sw1lGkmHh76GjuHzgUycbrA9GkQoSv9Kl5HLTjsNgTUjHoT+oVlEv4dP9WzxOYl6R
         5bO6MExFkFUiEC77LcZsntbHEeVpArDeuekF47tZHrgZ6ok+xbVLiPlWzSX/7oKlnu98
         VIPnsdMK5TzEw5P7J5KGX2xXTdTqv4VOEcmRxyN8PJ8GcWRT7KxXRzvkFk5ZoM4kHC0X
         15fSd9ecTmlp5wm0mSzdVC8vDPX61hybelW+V/YLEi8g95WCws5a7BS3YLjG747Oa/cd
         O6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680502674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPU+k5Dii+Pl5dwm1iVz6jH2SOAHhEPucNsoSGY5PvI=;
        b=XON5A2wTYNp7Qcd+BF4LkSKfJ4edzJ/IxSV/x2r+OxYIrnku93RcnBB/JUtLw8Ribb
         6mD+0K8Jx9LZN0fjvHPsqV5CklWkIOWCMnyTur9TVJQGQab7CzAy4KlSZkQQhCdU/mtY
         Xjpic5vGwypV+svYTx+WKNC93WpfslC1CggOfZff2oMC/Q7JGiIpf8A4cES3OgPIkv37
         sgrbCqs0LeoWyGAfTHnG1ZKcPB0M9AUScbau4gMLQH/KhWVYj7qgiydJl10wS7CnvETW
         bHJpV8NhP7Fjk0yITzKUl+VV+N2zF1+MCcEzGJJE1WDvWWGj8quoBzH3x4OABnlH3ALq
         Qqhw==
X-Gm-Message-State: AAQBX9da/3ygOxgYpqOytPwGVQ6O832Y5I8eAFZVxMbxVrV9mBZHXLai
	giwTqSDcKvjDVhGcSuK7HTo=
X-Google-Smtp-Source: AKy350YHSbxzegcW2mkTpFZYnRIASQMU5daFkaJAvd++9Zrz/s2TZQaQYfadfF9e+ePuR/fXgHUcew==
X-Received: by 2002:a05:6402:2693:b0:4bc:edde:150d with SMTP id w19-20020a056402269300b004bcedde150dmr16404444edd.0.1680502674566;
        Sun, 02 Apr 2023 23:17:54 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f24-20020a50a6d8000000b004acbda55f6bsm4108176edc.27.2023.04.02.23.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 23:17:54 -0700 (PDT)
Date: Mon, 3 Apr 2023 09:17:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: remove typedef declaration for
 cvmx_fau_op_size
Message-ID: <ef806781-72b1-457b-bb01-570c8145ab41@kili.mountain>
References: <20230401212002.GA30519@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230401212002.GA30519@koolguy>

On Sat, Apr 01, 2023 at 11:20:02PM +0200, Dalvin-Ehinoma Noah Aiguobas wrote:
> Fix checkpatch.pl warning: do not add new typedefs in
> drivers/staging/octeon/octeon-stubs.h:216
> 
> Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
> ---
>  drivers/staging/octeon/octeon-stubs.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
> index 3e7b92cd2e35..cf560c321c92 100644
> --- a/drivers/staging/octeon/octeon-stubs.h
> +++ b/drivers/staging/octeon/octeon-stubs.h
> @@ -213,12 +213,12 @@ enum cvmx_fau_op_size {
>  	CVMX_FAU_OP_SIZE_64 = 3
>  };
>  
> -typedef enum {
> +enum cvmx_spi_mode_t {

The _t means typedef and it isn't a typedef now.  Change the name to
"cvmx_spi_mode".

>  	CVMX_SPI_MODE_UNKNOWN = 0,
>  	CVMX_SPI_MODE_TX_HALFPLEX = 1,
>  	CVMX_SPI_MODE_RX_HALFPLEX = 2,
>  	CVMX_SPI_MODE_DUPLEX = 3
> -} cvmx_spi_mode_t;
> +};

regards,
dan carpenter

