Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51EF70
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 19:53:11 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id l15so1612818ilh.1
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 12:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xnd1I+ZG+p2xZfCRtzpcp/ESI8qGAqiQnNJLNfwMGAw=;
        b=FOAstcFqxm5gMlrrmJeGQxNCe9+od1LRKLR8F7/t4K0pcuuzTJuMpORb2SqN7HryaA
         lRLKvsxIcHLPzZYLXOFgzxaU+zdms5iH9FIVR84dtjZofnHRR27OmU684HkJIzUc0uTs
         807ofQUcHjysLchT48CYfb+M87AWNoZxVqkH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xnd1I+ZG+p2xZfCRtzpcp/ESI8qGAqiQnNJLNfwMGAw=;
        b=WZSwSl/bIfwUdJRHVHUzRXVG2Z2LdRQ26Thgapq6W9mP3EaUPtDw1Lw3RpKeDstPPF
         4w06GdkTa4zwPT31wmmTu2Gu0bUuEi36vDni2tLXqSWQ2JOgJIH0LOkIw23WAx6HySVu
         XNlrV3vXSYOA9GKRPIv5949guRDQ27LdZVY9Qr+wztgy5syniSHVJwS8QWDJyts9TUHH
         GdLHea3+NJVnAT+nZNAM1B0MW8CxCu5VFBrfj4bNxrF9LCbc84ADSSXD0LrIpXWtmBE8
         JO3Qni7t3MVwGF4RxwLDkzMuq/CZViOOISkxfqaDdrCrJN24fByAEQPBB8w5is6kysZZ
         Znxw==
X-Gm-Message-State: AOAM531RJkrPcTha5RdQmY79D8UYsuOWwwtaiQbZ1vc+XncUBZiv/yzA
	x0W8mSzO3XTeDNOYrUcYnuLVBw==
X-Google-Smtp-Source: ABdhPJzySBp1/n9I0djhR7BYsNQdwVhF3x0meWR8KHdioxICxxPdj/J739UNVX45BP0D7DOUAhfZzg==
X-Received: by 2002:a92:6b02:: with SMTP id g2mr720527ilc.23.1621453990981;
        Wed, 19 May 2021 12:53:10 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id f10sm542923ioc.10.2021.05.19.12.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 12:53:10 -0700 (PDT)
Subject: Re: [PATCH] staging: greybus: spi: add blank line after variable
 declaration
To: Philippe Dixon <philippesdixon@gmail.com>, vireshk@kernel.org
Cc: rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210519193938.GA7131@ubuntu>
From: Alex Elder <elder@ieee.org>
Message-ID: <7694715e-41b9-08e2-68f5-0fd57223a3ab@ieee.org>
Date: Wed, 19 May 2021 14:53:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210519193938.GA7131@ubuntu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/19/21 2:39 PM, Philippe Dixon wrote:
> This patch fixes the following checkpatch.pl warning:
> 
> WARNING: Missing a blank line after declarations
> 
> Signed-off-by: Philippe Dixon <philippesdixon@gmail.com>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/greybus/spilib.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> index 30655153df6a..ad0700a0bb81 100644
> --- a/drivers/staging/greybus/spilib.c
> +++ b/drivers/staging/greybus/spilib.c
> @@ -246,6 +246,7 @@ static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
>   	xfer = spi->first_xfer;
>   	while (msg->state != GB_SPI_STATE_OP_DONE) {
>   		int xfer_delay;
> +
>   		if (xfer == spi->last_xfer)
>   			xfer_len = spi->last_xfer_size;
>   		else
> 

