Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF7A70
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 09:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623058018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rLG+N8IISSaFXHv3nYYz+LhfYko+7EiBVIOp5Vbf2Pg=;
	b=dO3Kr7mioL+8UyzXcY/6RigueoiEjzzPw/PzEQyKam8srKfCReZJg5TD0S+jbHS5GJbgbf
	FyShpne0667O1P38i2rSbSGtmdGOY+tfdiZZOt9OQajFqnP+O9TZMaNroNPv8UoUunCUiW
	sTzDefqYRkSV+N/VYYYQ+/gvaUb6T4A=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-0yOqQoh4PeKUB5zqJHVXoQ-1; Mon, 07 Jun 2021 05:26:57 -0400
X-MC-Unique: 0yOqQoh4PeKUB5zqJHVXoQ-1
Received: by mail-ej1-f72.google.com with SMTP id z6-20020a17090665c6b02903700252d1ccso5038647ejn.10
        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 02:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rLG+N8IISSaFXHv3nYYz+LhfYko+7EiBVIOp5Vbf2Pg=;
        b=sG/HPf5VOL5Gaf6EehwIbWwygTfZU89FDKqjKo1AKSbUiip7AesNG3/UclNWJHeOP7
         e5+GCNDczxp51OVY31NLu9eLXebYVYZfp1Pj09/YJd7kfd8k9x3HXBH1Mmn06Df29wGM
         nc0xAU06eY1XZih5Y1H6ynqf+mevIe4k7GaV8Tn3RcnujiHW8kmDasa9pAKyAEiTZ/U0
         8VZ9CrQIQlMW6uKY7JmnQoZaGw2kTV1XqYZAVEv8ZEbWUt2v6qdTLPEH1SyO1BOMhqfu
         6eA4NCtP+6yL4KOj3vqc78miDTnvXamJNru2pTeRjk0mCKHXZa6zEqWZSNzEYB8EqDlc
         2t4g==
X-Gm-Message-State: AOAM530U5XzvnMDA1tS7Rm0ilI89kRtpEGnSI0ks+42+u9tsxRdI/1lj
	r7QX+Z4xdjQJ437mY+mK2gtaE+y7gR1xyxZlMzkTvnTChGpl1miDQMyFu9gGFgDyrpmfvQ7GIxe
	luEq3GpxB55+BhmiD2eIDVI0tag==
X-Received: by 2002:a05:6402:344:: with SMTP id r4mr18715826edw.226.1623058016028;
        Mon, 07 Jun 2021 02:26:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFfhavJFHdQ0RKGYOsgN7g81GMm8nIP2xjlhqS5rI+K9scmNRhByfsXa0QCbAO2iTUJkXwBg==
X-Received: by 2002:a05:6402:344:: with SMTP id r4mr18715814edw.226.1623058015891;
        Mon, 07 Jun 2021 02:26:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f12sm2001800edf.72.2021.06.07.02.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 02:26:55 -0700 (PDT)
Subject: Re: [PATCH] staging: rtl8723bs: Use list iterators and helpers
To: Guenter Roeck <linux@roeck-us.net>, Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210428173301.149619-1-linux@roeck-us.net>
 <20210604172632.GA1526@agape.jhs> <20210605005422.GB255680@roeck-us.net>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <34498620-be3b-7695-8d46-954d7673eeb8@redhat.com>
Date: Mon, 7 Jun 2021 11:26:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210605005422.GB255680@roeck-us.net>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 6/5/21 2:54 AM, Guenter Roeck wrote:
> On Fri, Jun 04, 2021 at 07:26:33PM +0200, Fabio Aiuto wrote:
>> Hello Guenter,
>>
>> On Wed, Apr 28, 2021 at 10:33:01AM -0700, Guenter Roeck wrote:
>>> The rtl8723bs driver manually re-implements list helper functions
>>> and macros in various ways. Replace with existing list helpers.
>>
>> I'm testing rtl8723bs on a baytrail tablet (Lenovo Ideapad MIIX 300-10IBY)
>> and applying the tag staging-5.13-rc4, loading r8723bs makes the whole
>> system freezing while trying to connect to local AP.
>>
>> Only a power off is allowed.
>>
>> I found that commit b3cd518c5abd42fbc747ef55a5fdc40bf7bf01c0
>> (staging: rtl8723bs: Use list iterators and helpers)
>> introduced the bug.
>>
>> I'm trying to find out what's wrong with this patch, have you any suggestions?
> 
> Some of the iterators needed the _safe variant which I didn't take into account.
> I thought that was fixed, but maybe some locations were missed.

Since 5.13 is already at rc5 now, maybe we should revert this and try
again later ?

Regards,

Hans

