Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736E020EE;
	Tue,  7 Mar 2023 07:13:11 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id da10so48538252edb.3;
        Mon, 06 Mar 2023 23:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678173189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Zm7VLfvc/LZ8fV8dJrpBs77JoX+4gvTkNsNk9slxrA=;
        b=f4ifeYFN1uE/+TmGqxxuUenoNBn9IeERD8SLLTgBAF/C+jQH3ykMn/4cgpuvXEH8sJ
         bkVWamV8aUqpDS6poCRCpCariL99xSw2hs9mz9uPwsjetAF6CqoODdivbykNXmYN8OsY
         TJCbVKCpHJGUdqSmNCdAB3uB7/Q2PmrDU9TdEwmUTEXLmrwNMNFqF3RFhGpYv2pW1LVC
         MErp6U7lFAsAcaVGjUuhUgIwDHw6l4diT6v6hk9f0P2VmN1JD4PUbrqDNj0OWdOr4r40
         jRsMQy822hJlCx+rPcIVEECYJS5TJNuuTK14qBL4pRzGfNVs7d2vi7tvXKehhU11Fxku
         d9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678173189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Zm7VLfvc/LZ8fV8dJrpBs77JoX+4gvTkNsNk9slxrA=;
        b=x/E3+hoRPWRIyUMnodTUDQsSk4JLutrG0nYetlfDs8EXL44+61xYN3qi9+eIv1pMHj
         YqewNYM2jSWDfib7BYY8fYe2dvz6RRQJE/LBzs0cgRUtlbmtJ9O8ZIcSTFTy3DpQc8/u
         GMpatAspKSFdPjl2OHceJv1uW9StcRxojlM8Z4F4nSsk5pGtePLIbExLDFTJo+RA7b+a
         xCwn56Uh8glOM4yl+tiO83GzViAUnGlM2e0yXXHm3Na/ZiERhA23kzWsSME38PwI6ZGw
         SHxgnVvSXv3hHdNFg7fSGsXQ8BvCm0Iad+0Z3Ubh3wT9Mee9X8pL4JJ29jy0xlxmn/sD
         AAFw==
X-Gm-Message-State: AO0yUKXwuuMwIXG/sybNfpzaxiHaJ/+zxqADrq7knjrcHQrgrxpPbflQ
	DqCwpIXSwlYqS5NYONahXLE=
X-Google-Smtp-Source: AK7set/ZkaXxcAzXMmAJWtfYqKGZ2dGkYPmnrtMIvCs5sfPgVAkTtx7KDiXFMPFHCsiv0tf+PB6eyA==
X-Received: by 2002:a17:906:6a1e:b0:8b1:fc58:a4ad with SMTP id qw30-20020a1709066a1e00b008b1fc58a4admr18342715ejc.11.1678173189660;
        Mon, 06 Mar 2023 23:13:09 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ot18-20020a170906ccd200b008e40853a712sm5626807ejb.97.2023.03.06.23.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 23:13:09 -0800 (PST)
Date: Tue, 7 Mar 2023 10:13:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: alignment should match opening
 parenthesis in axis-fifo.c
Message-ID: <9543f943-759f-4e87-8f88-4eba7c1e4785@kili.mountain>
References: <ZAZSmPpB6fcozGa4@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAZSmPpB6fcozGa4@khadija-virtual-machine>

On Tue, Mar 07, 2023 at 01:52:40AM +0500, Khadija Kamran wrote:
> In file drivers/staging/axis-fifo/axis-fifo.c the alignment did not match the opening parenthesis. So, a few tabs were added to match the alignment to exactly where the parenthesis started.
> 

Run checkpatch on your patches.  ;)

> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index dfd2b357f484..6e959224add0 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -383,7 +383,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  		 */
>  		mutex_lock(&fifo->read_lock);
>  		ret = wait_event_interruptible_timeout(fifo->read_queue,
> -			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> +						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
>  				 (read_timeout >= 0) ?
>  				  msecs_to_jiffies(read_timeout) :
>  				  MAX_SCHEDULE_TIMEOUT);

Checkpatch is just guidelines not rules.  wait_event_interruptible_timeout()
is a very long name so sometimes aligning it up with the parentheses
doesn't work very well.  The most important thing is not checkpatch but
how the code looks to humans.

regards,
dan carpenter

