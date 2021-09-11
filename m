Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7BC3FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 11:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631360045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yEm7cnF19/AqBzk1RSgs+u9mlG8J/Qh8RgOEQT+2Udg=;
	b=D+xhj05LLv2j373O/P8fCqrJCzKDpQ8hk/lnp7KGRsJWo8y/7sPaayBdAhU83o0j0TF9Hk
	DyOBZl7cS3mxomNoFuC5zhiFBmjhKGS6WFsZxm9NjZjdHPfUnHIiP8C4510Wwrhq9HsBhj
	pNPMDEaz49y9c5eKE+yXL+I2fyHeyRM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-zIZpLCrWNGeGtpHnehxVeA-1; Sat, 11 Sep 2021 07:34:01 -0400
X-MC-Unique: zIZpLCrWNGeGtpHnehxVeA-1
Received: by mail-ed1-f70.google.com with SMTP id y10-20020a056402270a00b003c8adc4d40cso2484992edd.15
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 04:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yEm7cnF19/AqBzk1RSgs+u9mlG8J/Qh8RgOEQT+2Udg=;
        b=0jdkgLImFoqV0Y41rw19zi1S3JO4wPY9852mLphVr9GhoTCrxvq9IUBJ/keRd2OGOK
         t/lRQ5sELzHgl5zV3xA3orsEyYWiSD7SC58kIIszMwQvH2wn70QxecmBppKbGKo8n3qa
         8WjfZf6Qaet3fFLubQQoEmLe7jIa3avGLECiF6+SBPM0Q4QB4fNHQkBzd39g7snHblxK
         TT45HJHHrCzjq64W1QN77C5l7ULUb3F4dHXwuI+Uy/azH2Z/KdrP9wz1sqIn3XChfBjT
         VrD4JRlNz1T55znQvvbME7AJdhMghb5u8XOSTEpWAtVroDdXY/dAI7tVo4okm+iBj5S3
         NWgw==
X-Gm-Message-State: AOAM5322/aheEmGMyJeVB9/AGODeDIk8stKvdGC9iyYp5E4lIADnW7kr
	G7Csrskih02ngjd/Uq7MTAqEX5QgCx0Qqw0zZ5J5tZLXlN5xUpQ7u2bpmr06dLhspbnd3ELQs63
	HkmYR11TmAZxV3fUbIUdo9JbYMA==
X-Received: by 2002:a17:906:7053:: with SMTP id r19mr840269ejj.476.1631360040732;
        Sat, 11 Sep 2021 04:34:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlCGg+Mu2jOiN1DZ6zbibuzaqaPwGGLYxveFlQGzwcliJ7Yoone2wNv43oCN41yGqfkZxR4A==
X-Received: by 2002:a17:906:7053:: with SMTP id r19mr840246ejj.476.1631360040543;
        Sat, 11 Sep 2021 04:34:00 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e11sm794540edq.30.2021.09.11.04.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Sep 2021 04:34:00 -0700 (PDT)
Subject: Re: [PATCH v2] staging: rtl8723bs: remove possible deadlock when
 disconnect
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Martin Kaiser <martin@kaiser.cx>, Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>
References: <20210902093559.9779-1-fabioaiuto83@gmail.com>
 <c730848c-3c8d-1e49-fa74-b956400a5d3d@redhat.com>
 <20210911105307.GB1407@agape.jhs>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <bc640665-2768-6add-d523-6ee80849eb98@redhat.com>
Date: Sat, 11 Sep 2021 13:33:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210911105307.GB1407@agape.jhs>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi All,

On 9/11/21 12:53 PM, Fabio Aiuto wrote:
> Hello Hans,
> 
> On Fri, Sep 10, 2021 at 11:06:58PM +0200, Hans de Goede wrote:
>> Hi,
> 
> <snip>
> 
>>
>> Thank you for your work on this. Overall this looks good.
>>
>> I have one remark, since now you are relying on the
>> sta->sleep_q.lock to protect the sleep_q data, you also
>> need to update the sleep_q accesses in rtw_free_stainfo()
>> specifically you need to add a spin_{lock,unlock}_bh(psta->sleep_q.lock)
>> around these lines:
>>
>>
>>         rtw_free_xmitframe_queue(pxmitpriv, &psta->sleep_q);
>>         psta->sleepq_len = 0;
>>
>>
>> Note there also is a:
>>
>>         spin_lock_bh(&pxmitpriv->lock);
>>
>> Just above this which needs to be pushed down to below the
>> block which takes the psta->sleep_q.lock, so that the entire
>> thing ends up looking like this:
>>
>> 	spin_lock_bh(&psta->sleep_q.lock);
>>         rtw_free_xmitframe_queue(pxmitpriv, &psta->sleep_q);
>>         psta->sleepq_len = 0;
>> 	spin_unlock_bh(&psta->sleep_q.lock);
>>
>>         spin_lock_bh(&pxmitpriv->lock);
>>
>> Other then that this patch looks good, thanks.
>>
>> Regards,
>>
>> Hans
>>
> 
> good catch, thanks a lot for review.
> 
> Greg, I see that this one is not in staging-next,
> would you drop it so I can send a new one?
> Or shall I send a Fixes: patch?

Ah I missed that this was already merged. Since this is already merged
the issue which I noticed should be fixed with a separate follow-up
patch (with a Fixes: tag, thanks.

Regards,

Hans

