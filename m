Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E68539F
	for <linux-staging@lists.linux.dev>; Sun, 31 Dec 2023 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E5boHKnj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704016191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LzeRvvr6PcK562pOiCTaP/NWOnFMQFaodp7McccAjT4=;
	b=E5boHKnjqem72o/Nkx4Ai+MTOWJBUciso4UzhR20jbf/5nr55J0JWwCAzO/9Txx0Q/Vmdi
	fse6eENMw0bXizISqpjQfXc/cNStsbzhx2oqcjzAPsVzlO/BRCVgCONSprdbb7zpa+XG2Z
	f6h3oQ7fseG2K1CxQWpABd9++kt5jmk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-e9OQ2UoiNWGCzRLhNwvQKw-1; Sun, 31 Dec 2023 04:49:50 -0500
X-MC-Unique: e9OQ2UoiNWGCzRLhNwvQKw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5555a856794so1398315a12.0
        for <linux-staging@lists.linux.dev>; Sun, 31 Dec 2023 01:49:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704016189; x=1704620989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LzeRvvr6PcK562pOiCTaP/NWOnFMQFaodp7McccAjT4=;
        b=Hpgeqfd5JqmjR9KgBF9iO/m4ZGsQ7HDLaRWba+NuJIktuJpu7g2walS7iwaTf87rat
         5e9soDxbknV7Jb3Wa0Iyf1SRl7VcRySn3jfZ/hPr3obNwUIPfSLgPWrXVa79jNWcfgOb
         3m5CJVMdpdlFSVbj5RFi3wx97BJczN7CYHoOMOJQdwDqrV0GzPfcEvMCnD7pkGSZpMnz
         cYE65Kc0d8lwl0Y1nilAfUDIGYhlvZVLTD0WAAN0pYDTST3LyyJoqNMkyI1Qk0n721UR
         MVleeIeTLuig0pYXdj0yK/2LoCajI3ziKm1npqRggwKpfMiz8JTHFmMKctoe2TQwOFlX
         ed/w==
X-Gm-Message-State: AOJu0YwCFxoTT8fj4gjzeuBKf7wxRCorHCHQ9ct/D1SfuXuoP8nseGrM
	RLXDMCDxsQLwf4rqmrncO6FNTNSy4ETECoCwea+INw+hJYI0BZiFKbGobfMQXzVEvElAneqB/PQ
	MGdZarD62kWlq1THo5dY5sQEj1A+XXJwp3g==
X-Received: by 2002:a50:c305:0:b0:556:3e61:6a3e with SMTP id a5-20020a50c305000000b005563e616a3emr159492edb.28.1704016189096;
        Sun, 31 Dec 2023 01:49:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+ITI+p//BsGpxCh0Zo2X1NLbCYwNJTGnqiAk/HzayN9xEYRBkI2k1taRCTVOqlRqQR+xALw==
X-Received: by 2002:a50:c305:0:b0:556:3e61:6a3e with SMTP id a5-20020a50c305000000b005563e616a3emr159481edb.28.1704016188871;
        Sun, 31 Dec 2023 01:49:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p12-20020a05640243cc00b0055493aa8905sm9894390edc.63.2023.12.31.01.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:49:48 -0800 (PST)
Message-ID: <fba7dcdc-6ca6-45e4-813a-e1f908876a4c@redhat.com>
Date: Sun, 31 Dec 2023 10:49:48 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media/atomisp/pci/runtime/queue/src: Fix
 spelling mistakes in queue.c
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231223071157.81082-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223071157.81082-1-kdipendra88@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 08:11, Dipendra Khadka wrote:
> codespell reported following spelling mistake
> in queue.c as below:
> 
> '''
> ./runtime/queue/src/queue.c:126: uncessary ==> unnecessary
> ./runtime/queue/src/queue.c:183: uncessary ==> unnecessary
> '''
> This patch fixes these spelling mistakes.
> 
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
> index 2f1c2df59f71..2c6c8fffc4e2 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
> @@ -123,7 +123,7 @@ int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
>  
>  		/* c. Store the queue object */
>  		/* Set only fields requiring update with
> -		 * valid value. Avoids uncessary calls
> +		 * valid value. Avoids unnecessary calls
>  		 * to load/store functions
>  		 */
>  		ignore_desc_flags = QUEUE_IGNORE_SIZE_START_STEP_FLAGS;
> @@ -180,7 +180,7 @@ int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
>  
>  		/* c. Store the queue object */
>  		/* Set only fields requiring update with
> -		 * valid value. Avoids uncessary calls
> +		 * valid value. Avoids unnecessary calls
>  		 * to load/store functions
>  		 */
>  		ignore_desc_flags = QUEUE_IGNORE_SIZE_END_STEP_FLAGS;

