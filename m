Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E6E3FD0
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 15:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631545942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y8vuImHpLHsUuz/CiYzXbPCx1krBVQwZHILgxE2iSiQ=;
	b=KSht9KgBl39anH0T+3VkE2ZEitm2ZZXFln5ahyAEJ0IxVdt4t4cRPFgpP67lHB8pX6Ubw2
	fLocWR5VOraU4vdf/eOe72DsGFqXbZpnCMV/SlutwPjAZedglpU57Yic83A+4uSWJQYgt+
	0EwaR1HZlNpW3cQYDaCjUCE3p1U2PGI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-7RMHJ9tMO7a9u-4bCj-g-A-1; Mon, 13 Sep 2021 11:12:21 -0400
X-MC-Unique: 7RMHJ9tMO7a9u-4bCj-g-A-1
Received: by mail-ej1-f70.google.com with SMTP id z15-20020a170906074f00b005ef9f1d0e97so1809299ejb.19
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 08:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y8vuImHpLHsUuz/CiYzXbPCx1krBVQwZHILgxE2iSiQ=;
        b=xtZFW62lRjvQ34ib0owlmHl8IBeG1Ca1uQrfEfL1bAAgzRrDV4lgKqCI2Ep1zaFuYd
         8nT0mn3WnO43Bql3is4MfNnegdCyiREX4KhXPCffX/bWbSARkfxbwTO37gg5LLISqhdj
         DtCl9lYGgPUy1bWQWkfpyrRGa27XZrL7L4W2ZApQutXjJIpoMrg2kbqge0+yLiXaMlE/
         yJ8B1EiZRfekhhYQY8I9mVGjejhFsVutJlCTz25RXB7PlnPfaOL/52FyuwwVrC2i7H8L
         UuR7k7+EssPT3EzE8o9cYw1C3a/I2h7Bi76p58cxYguB0Fw1Aq5YeSiunB9nFaMKF2DH
         jW5w==
X-Gm-Message-State: AOAM531KEBSVHJD7elRHmpvQUs8zTl58jskvt/6H2Dwija+0hmH06QEE
	xr+CrpXuSBS9+nl/z8J2eTHFEL8LfxlkzM3ZtVGpMO7mt09qU8zCOgx7Xf75+8CqH2JeGMs0LLE
	Eqe1FntQJBDpFqeb3ul/u47HW0g==
X-Received: by 2002:a17:906:cc57:: with SMTP id mm23mr13277959ejb.540.1631545940535;
        Mon, 13 Sep 2021 08:12:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmC7zS+f8GRA8zaPm3asjDVXcYgExJu946U7Ki08njDOojCPAnl4NWRv/aT/KOCQ9XRGMOmw==
X-Received: by 2002:a17:906:cc57:: with SMTP id mm23mr13277943ejb.540.1631545940364;
        Mon, 13 Sep 2021 08:12:20 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id b8sm4058631edv.96.2021.09.13.08.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 08:12:20 -0700 (PDT)
Subject: Re: [PATCH] staging: rtl8723bs: protect sleepq_len access by
 sleep_q.lock
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210913130346.2390-1-fabioaiuto83@gmail.com>
 <d6d6c6bf-b787-aac9-4767-4bf54c5437ac@redhat.com>
 <20210913133915.GA1414@agape.jhs>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <30e138d5-fc51-bbcd-4dfc-3264c258c0bc@redhat.com>
Date: Mon, 13 Sep 2021 17:12:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210913133915.GA1414@agape.jhs>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Fabio,

On 9/13/21 3:39 PM, Fabio Aiuto wrote:
> Hello Hans,
> 
> On Mon, Sep 13, 2021 at 03:24:44PM +0200, Hans de Goede wrote:
>> Hi Fabio,
>>
>  
>>> Note that sleep_q.lock is already taken inside
>>> rtw_free_xmitframe_queue so we just wrap sleepq_len
>>> access.
>>>
>>> Moved pxmitpriv->lock after sleep_q.lock release to
>>> avoid locks nesting.
> 
>>>  	rtw_free_xmitframe_queue(pxmitpriv, &psta->sleep_q);
>>> +	spin_lock_bh(&psta->sleep_q.lock);
>>
>> AFAICT this needs to be above the rtw_free_xmitframe_queue() ?
> 
> as I wrote on the changelog, the sleep_q.lock is already
> taken inside rtw_free_xmitframe_queue. If I put the
> sleep_q.lock above that function a soft lock occurs when
> I disconnect.
> 
> So I put it just below rtw_free_xmitframe_queue.
> 
> Things works fine this way.
> 
> Please tell me if there's a best way to do it.

Hmm I see, this may work, but the sleepq_len access
really should be protected by the same lock as the freeing
of the queue is without dropping it in between.

That rtw_free_xmitframe_queue() takes the sleep_q.lock
then to me that signals that other (higher-level) functions should
not take sleep_q.lock at all, since this is then private to the
functions operating on the sleep_q.

I've an idea how we we can possibly tackle this, but I'm not sure
yet I will try to make some time to look into this tomorrow or
the day after.

Regards,

Hans

