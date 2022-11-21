Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151812CAB
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 12:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669033776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/hWYzdY8pp69gJAN6Ao8jjyimu9MRzFcxQpQWDRT5hk=;
	b=AP0W9YTu+OhAu3/rPKzIVy5a0adxs/0wah0np/gQhqOMlQ1AKk7r3pG2ja7XCHK85nHm/d
	o9q+TkdBpIWFO4vE8nB7U8j4p+ya6qzmHflwhxqLQmKBJYJz25tkpWI+qROLaXxtm53zRJ
	nbsESuz0WJcvwxRtzHgHgqe7qnDvcic=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619-cq5cAYOAOHSWJi8KO4xvbQ-1; Mon, 21 Nov 2022 07:29:34 -0500
X-MC-Unique: cq5cAYOAOHSWJi8KO4xvbQ-1
Received: by mail-ed1-f72.google.com with SMTP id y18-20020a056402359200b004635f8b1bfbso6770820edc.17
        for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 04:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/hWYzdY8pp69gJAN6Ao8jjyimu9MRzFcxQpQWDRT5hk=;
        b=efofPIlGGJhmZGzJYyRtyry64Jqtf7n/ZOsbpdYL64FrvTz6pyDySO8W00qBkK+GlJ
         1zNkIZvpd41rPGeP49pe0mohiRI3Z/xQdsa52jMlitCLPrnm58Is4Q22BLHmFdg14wzI
         a9C5qmTvY5ypk9r5ViFafOUjKMvLZxDIKOQXZSoZFXUbhPFse87X3rmyM6JkWopIEDF3
         BkIMIbIn1j+MFPvXq/sfsEHQvy6gabyi8d94uW/kCAdQkI7lnX2HPrNvnhljGo/fRSU8
         aNW4Y8HHu5dofJZPJXvdlzHoUOC+yUT2VQso7ic0fQeoliLbWUjaQxVQPEGUYk7Rps9c
         6emQ==
X-Gm-Message-State: ANoB5pksv3NSzG/7Ri2Znx/P686lbblwD5eIULYyrA3CIVy5IX3jW0dj
	JnjESQIRNcv5LDtgnBofONJbbsnMEZ6N/8fyQY10DekDiRuwtxxHxUnTWxtVHjYF+/QzGek4Bdx
	qWHjBXkd5BqISC1jhMvI0Ed21xw==
X-Received: by 2002:a17:906:81cc:b0:7ae:4373:c8aa with SMTP id e12-20020a17090681cc00b007ae4373c8aamr15574118ejx.466.1669033773643;
        Mon, 21 Nov 2022 04:29:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5iTHPCffdDV1lG7rCc7HhYezcsaBiBmHzgqsviLz35yyEF+pLC+yeuGaXVTX9aqaw5T0xzzQ==
X-Received: by 2002:a17:906:81cc:b0:7ae:4373:c8aa with SMTP id e12-20020a17090681cc00b007ae4373c8aamr15574096ejx.466.1669033773463;
        Mon, 21 Nov 2022 04:29:33 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id x20-20020a170906805400b007919ba4295esm4978724ejw.216.2022.11.21.04.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:29:32 -0800 (PST)
Message-ID: <96be9818-4c97-b9fc-a694-7a46e4b8f108@redhat.com>
Date: Mon, 21 Nov 2022 13:29:32 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 05/20] media: atomisp: Log an error on failing to alloc
 private-mem
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <20221120224101.746199-6-hdegoede@redhat.com>
 <Y3s9wLqlHojRq8jS@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3s9wLqlHojRq8jS@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/21/22 09:58, Andy Shevchenko wrote:
> On Sun, Nov 20, 2022 at 11:40:46PM +0100, Hans de Goede wrote:
>> I managed to trigger an atomisp_css_start() error by pushing my test
>> system towards an OOM situation, this resulted in the following errors:
>>
>> atomisp-isp2 0000:00:03.0: alloc pages err...
>> atomisp-isp2 0000:00:03.0: hmm_bo_alloc_pages failed.
>> atomisp-isp2 0000:00:03.0: stream[0] start error.
>>
>> But it is not entirely clear what the root cause of
>> the "alloc pages err..." error is. I suspect the root cause is
>> alloc_pages_bulk_array() failing. Add a log message to make
>> the root cause more clear if this is hit again.
> 
> ...
> 
>> +		dev_err(atomisp_dev, "alloc_pages_bulk_array() failed\n");
> 
> I would put it after calling the below function, but I'm not sure about side
> effects (if the below can hang or something else).
> 
>>  		free_pages_bulk_array(ret, bo->pages);
>>  		return -ENOMEM;
> 

Fixed in my media-atomisp branch.

Regards,

Hans


