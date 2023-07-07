Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117F8C123
	for <linux-staging@lists.linux.dev>; Fri,  7 Jul 2023 14:54:57 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-314172bac25so1928624f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 07 Jul 2023 07:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688741696; x=1691333696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nCmV7fiGs17vOoW6jQ+gtcQefFmrmAwZGHtezQ7LSc4=;
        b=JuOBcO/9/pHIs2DWjQ8kkQYNIMrKI9j1xsBNroiY2DU36g2Fr+8iQ/p4lTSKvOEXqA
         1rOyNViNDwukx2/yFEac5y27u9s24NUkZI8nkrALQt5YbN+nbLS3SIyUE0H3P+1fT+Lf
         Or5pEBJ+2YCH4LLrI59X03tvu8kr7k6Gdt+sGZolcp5Nntq45VIE36W39tcAIKz4Z7w5
         4AH+IjteCQxliNp7+bVbkOOOnroBCW9r6ZoCsxBOPuKIypmWMXp3ONDuC4HjihV+ZYIY
         Pbx1MXRn5cyPAlFmd+8cdkcjnxfp2c6mYLmYqhMoapJO0N5c/tqZMCUGKX3jbnEIe0Kb
         3unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688741696; x=1691333696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCmV7fiGs17vOoW6jQ+gtcQefFmrmAwZGHtezQ7LSc4=;
        b=c4LzIZQxIDJuHPRNxrY7JkRqQxy5JA8OaWGDmAJfjIxl9FOOKW5I6yXhIIDm3U6RyO
         LDhOOJwv1MDX5GHFR3QM8sxRVvWK8nZyoO7532rsB42RDmJGrexdfkFl+GfG7SFYpG6Z
         EGuCH4cPIMubXU12xaJX0C9ayENO2tgKeFLMYnSZzvicB5OA9hmvotjqNUmkHAzhd4gY
         22D9VTHRy2DML5CxHtYsI4f+ZpTMTcvcWaio1vMxfrm+LhPcLSpgb3J3DlkxttpjZwhl
         h1y287dqk4001kTQWs3X2nPBjXZgeholwJklB8lDmHe0Tl956CiBlsvrI4FyANjZKUtW
         NApg==
X-Gm-Message-State: ABy/qLah4oVP5XFPFyZ8lTr8X97gzS4gNo/6RxHuYNYD+Oos+rJk7L+H
	pqQ7LwNrOmkeJXD3M6Hz2lUXkw==
X-Google-Smtp-Source: APBJJlE54HhnEzV14Ro51KZN9jsYR3sloJY7vtXytRjG+Swaa0Wo/wKiHlX+oDAk24UMOg0TTkK6Xw==
X-Received: by 2002:adf:ed8f:0:b0:312:74a9:8262 with SMTP id c15-20020adfed8f000000b0031274a98262mr3881800wro.62.1688741696095;
        Fri, 07 Jul 2023 07:54:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d5608000000b003142c85fbcdsm4699004wrv.11.2023.07.07.07.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 07:54:54 -0700 (PDT)
Date: Fri, 7 Jul 2023 17:54:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: hexingwei001@208suo.com
Cc: hdegoede@redhat.com, mchehab@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, colin.i.king@gmail.com,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com
Subject: Re: [PATCH] soc: ti: smartreflex: void function return statements
 are not generally useful
Message-ID: <e13aa236-45f5-4d29-866a-999c04ef3be2@kadam.mountain>
References: <20230707133447.28102-1-panzhiai@cdjrlc.com>
 <d4b290f08da0c2435f3fa4676e7a5f25@208suo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4b290f08da0c2435f3fa4676e7a5f25@208suo.com>

No need to CC linux-staging@lists.linux.dev.  Use
scripts/get_maintainer.pl to find the appropriate lists.

Your From header doesn't have your name, just your email address.

The subject is too long.  Change it to:

[PATCH] soc: ti: smartreflex: Remove unnecessary return statement

The patch is corrupted.  Take a look at
Documentation/process/email-clients.rst.  Send an email to yourself
first to verify it applies.
> diff --git a/drivers/soc/ti/smartreflex.c b/drivers/soc/ti/smartreflex.c
> index 62b2f1464e46..20abfb0b8f26 100644
> --- a/drivers/soc/ti/smartreflex.c
> +++ b/drivers/soc/ti/smartreflex.c
> @@ -955,7 +955,7 @@ static void omap_sr_shutdown(struct platform_device
> *pdev)
>      if (sr_info->autocomp_active)
>          sr_stop_vddautocomp(sr_info);
> 
> -    return;
> +

This introduces two blank lines in a row which is a style violation.  In
fact, there should be no blank lines before the last } closing brace in
a function so delete the other blank line as well.

>  }

regards,
dan carpenter

