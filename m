Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEF228E2
	for <linux-staging@lists.linux.dev>; Fri,  8 Jul 2022 15:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657295730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oKdAwSdJ/bJ3Bw0hAeddnXNTwTE7lsij6rfMDatygts=;
	b=Oq7nES0XGNZaG3dsXlsTtUcNZViQw2BHoi5YYhM5+m8SGZP1q1I+1Ewd0S9hEl9n58iaEw
	Zz8QoQ8hn9KeHP6IEjZnjH1GprUdsv9RsiaxJLn7WZoZqSaF0Mu4d7BKAMRGHEhgpDDI1J
	dRq/RMVrF63K2J9F2tQSYM4Kq5ZDcn0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-QwOe2eyDMAerIJTTDb8DNA-1; Fri, 08 Jul 2022 11:55:29 -0400
X-MC-Unique: QwOe2eyDMAerIJTTDb8DNA-1
Received: by mail-ed1-f70.google.com with SMTP id m20-20020a056402431400b0043a699cdd6eso10556366edc.9
        for <linux-staging@lists.linux.dev>; Fri, 08 Jul 2022 08:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oKdAwSdJ/bJ3Bw0hAeddnXNTwTE7lsij6rfMDatygts=;
        b=mwaGu8OrI5V6auMnvw8uDVlNozYPokspztFjsgrWh0Ts4M1A/SioYflc5+4rohSZqF
         7R8mVJX1qzRT3OTaq/dJzyA8XDSHsr3PC8GlABBIgiaQUVzN788UgMFaS3xSvuPEk253
         OJAulCiAPPDotNXHlKD3kBE8ce1mUchqGBIZCgJz8SOUSQRX34PWXGL5V2jykOFJOD5Z
         eMICyzO0PjBMH3lbrUwxBYtsZiWuKkYK3HQQchxTY+oM4XoB01uvpDIm2GTcXDc1OlX4
         6/0hb9X9Dbw1EKImD400FV5YZZlC/tt67y33vhDJqff838S3AP+4TRQ3qjE3TPMng2vc
         kiyw==
X-Gm-Message-State: AJIora/8EyceEg7JSSYq8a6GTyGO7FUY8e2CBbs8jgiN6N9oyznpF0IQ
	UYdq51/600YZU3iwHcZdL9P2G0DMCH3vgSGpkYHINfYXkMo0slgy2ETxZxwz4awhTaU8h7CpZR4
	MlAT2cut0RL5jjZBLKgR8wDEvNQ==
X-Received: by 2002:a05:6402:248c:b0:437:afe7:818b with SMTP id q12-20020a056402248c00b00437afe7818bmr5677238eda.239.1657295728243;
        Fri, 08 Jul 2022 08:55:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tS6ezXylb9NB8yOq946U7TpYv2hDEboyPOJ0JMfhIrtFj8VcfNQ8NXJAahocj9nZjCtYa/Kw==
X-Received: by 2002:a05:6402:248c:b0:437:afe7:818b with SMTP id q12-20020a056402248c00b00437afe7818bmr5677225eda.239.1657295728101;
        Fri, 08 Jul 2022 08:55:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id fd5-20020a056402388500b00436f3107bdasm29009592edb.38.2022.07.08.08.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 08:55:27 -0700 (PDT)
Message-ID: <becfe58a-b4c3-4ae1-4ab2-456057ac7d22@redhat.com>
Date: Fri, 8 Jul 2022 17:55:26 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RESEND PATCH 0/3] staging: media: atomisp: Convert to
 kmap_local_page()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tsuchiya Yuto <kitakar@gmail.com>,
 Martiros Shakhzadyan <vrzh@vrzh.net>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>
References: <20220707200718.26398-1-fmdefrancesco@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220707200718.26398-1-fmdefrancesco@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/7/22 22:07, Fabio M. De Francesco wrote:
> After waiting months, I'm resending three conversions to
> kmap_local_page(). I'd like to ask if there is anything which prevents
> these patches from being accepted.
> 
> Please note that these patches were submitted on April 2022.
> 
> For you convenience here are the links to the patches, the "Reviewed-by:" 
> and "Tested-by:" tags:
> 
> [PATCH] staging: media: atomisp: Use kmap_local_page() in hmm_store()
> https://lore.kernel.org/lkml/20220413225531.9425-1-fmdefrancesco@gmail.com/
> https://lore.kernel.org/lkml/Yli+R7iLZKqO8kVP@iweiny-desk3/
> https://lore.kernel.org/lkml/2d096f20-dbaa-1d49-96e9-a7ae6c19f7fe@redhat.com/
> 
> [PATCH] staging: media: atomisp: Use kmap_local_page() in hmm_set()
> https://lore.kernel.org/lkml/20220413212210.18494-1-fmdefrancesco@gmail.com/
> https://lore.kernel.org/lkml/YldNhErgt53RqYp7@iweiny-desk3/
> https://lore.kernel.org/lkml/0b04ad1a-e442-1728-ef2c-bab386a4c64c@redhat.com/
> 
> [PATCH] staging: media: atomisp: Convert kmap() to kmap_local_page()
> https://lore.kernel.org/lkml/20220408223129.3844-1-fmdefrancesco@gmail.com/
> https://lore.kernel.org/lkml/b0aed731-b56f-4378-b50e-fc0cbccbdb84@redhat.com/
> 
> Fabio M. De Francesco (3):
>   staging: media: atomisp: Convert kmap() to kmap_local_page()
>   staging: media: atomisp: Use kmap_local_page() in hmm_set()
>   staging: media: atomisp: Use kmap_local_page() in hmm_store()

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

