Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792462838;
	b=LJEPdCPk9dEkGglNXJGJjXY+UCZmQ5IjLMGK1atPnhSOPHLspDJr3LIJfY0vp7RlNZwB
	 HEfTKMbGIZjZTRKOn3iOR0Lm8Pul/8COIjPKGzX0hfTuWZNzlGDEe6FjyIUjewSylwq3M
	 Sc2iv2zde14K8UnkN2cypRo6GTwgS4RnyfY7pfsZXNuGsYg0nrs0oYnUsxUN7OjUd0c6v
	 ktDl0a2psDMugl7koT/XmSpcJgvLDI/qTBokQddqSlKZ/95x3pg0vRXD5s8EpVaucv4HQ
	 itBMKOTRj43xsZhkPbzzqQ9/LPzbXuDyQyS8LxoV/X3kLKiijKB+pS4wRYJWVaisc6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792462838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ov1JQi2JjMl24yFAFJ2MUTE1RthNQLp4XwRk7/4yijY=;
	b=ZYXGjeHiAtOQXzK5Yr3RQmBvzXP57XETqSglBlGKogVK5q1gGoKllh1HzY61IMPBEwtj
	 SQcebp8dky2RCqQmWWKBhHkQFt2iMbe+QnbFLsKu3QKkIlY83PgiRAVEBp/E8M/bETpfO
	 FDmaaIeofy2to/uX7mRr4uKWj06ZUCLfuwf+F2y7LNChNXs9cZNBKvoNUrjHJ4NDMJb5t
	 S5YnIH76uoyogFUTavU8aEXbmBt2S+MuYAhLhR+L2joDZ84VCpUKdeq54cKB0A5ufPePO
	 x5lVD+aAda7uYoEEhQZR5PvVRncTIiG+JmRY+Iz2Ih35gyKi0JrbuICN7HsuXnGbX1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j+5sHtAQ;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84261606A31A
	for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 02:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84261606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j+5sHtAQ
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6dd4f3f696aso1662927eaf.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 19:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792462836; x=1793067636; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ov1JQi2JjMl24yFAFJ2MUTE1RthNQLp4XwRk7/4yijY=;
        b=j+5sHtAQpyZ+B2BGjUyPDuH4iLlNjYzUpTtJJy4X1fYF9OKwWcOnfcYCAEN0JinXTb
         kQaKMDFaBuGTrTCfqREetTQzQDNWOj3Us4NOiQZncL7jkzqsaU3HuWw0NksDcgoHs3d9
         E757f7Ww55XzHvrEYvgRtz+pqNEsOt2RwTorjI9VVgbvE5zBlkQ0b19K5vgzLDYj2SjR
         LuO5ATxG9ZjvO+7XXOM6RC36aJmY671SndeV4L2KdWaYdlVy4g+hIt82B51y5Q1RHIUd
         E2vkgBRQtV2io9eHhp+vZnEFi5B3GKz9yg2JDfmn1I4WIV33QQKQX28NMDuGnesG26AS
         maYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792462836; x=1793067636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ov1JQi2JjMl24yFAFJ2MUTE1RthNQLp4XwRk7/4yijY=;
        b=wsEnNeo125dGqYgzsg24yM5QOgb69XmumKtt8o9wyg96F1M9eOjWV1RRPApCvFLPmB
         ht3DM/oSbkhcYmxXdcIglkjm/JGkGcpSUYIBjdNAN3CZp/Fe7iPowwKIpT6uFvmwLoKd
         AjcK8/de8HfCA3p7N4Joy3Wc5kjjI2kJEKoa/WO/kjdLxIgIo46ap+XNBKRf3riaklLV
         RbfoIceLysmqJuC9gAPxecgettPsvTpyzy4/DCACU2zP7+jOydVQ5m+yUqyMbkWGF4HY
         BZi9EusHaaQ4NfLNFVGvx9Nrjj1qIq2vwGuPppk71I7YjHEbyVNXt/2u+KwlpYfnRavU
         8QHA==
X-Forwarded-Encrypted: i=1; AKwUvBykL7fodg1all9vDudByYb3gOe1e8jDUO4B8cOqwuOySmf+vpYHwPK+muavbcddRft4Mk0Cu8o4mn1W8Xxc@lists.linux.dev
X-Gm-Message-State: AFq9FYK/C+Q/kdhAxrklS2ZAWvlCecBd5ofY6lx/gVHbjcZRBqKsSy+q
	prP1mZzDCkPl5iZH9kx+bUiurpLsBgjdRJcfSXTc5TNLyMxpSBu47wYG
X-Gm-Gg: AYBFou2I0+jy96080TEYQYzB2g6+kYmyxG5tg41SlwPAroiJYN5VJI0btWFCsBOEiIN
	nCBAgJvbNWrwYeRoiEdW+BMDC5cvl/19SV6//qcoLtayZlDYddGVyo41oEEcse9s3LjfNekTlN0
	LAdEe17htL4cL9NK0oux64B5o9UoEY8a8eGKYnHcwBRwQPfSdKbk5S/8tXpYINUoRDPBgmoARFa
	FHvROCEh3ODPels4Yjbzsb9VEIQYaVlo7IaBq30/fMvqueEicT/XdYDrIyjgTQ44i7vwdfzs3oe
	V358X6eMY67NFB+/NkM8zyP2flo8ZbgdCdjFc4rY0g5ol8oUNVmLUepHVA5bvpEee5Uiacijr9f
	cBi6JqzR5zbuCg4shezWZQbFIvC9aqFOMKp+GiU0AaulWS+tWR1oHtXw7zrrxmqloDA03OmHSso
	h0ZrDHcUZfhtNLxAz1AZZD8/bkIeo1oABE+UG0mklVxjWc7rDbsnhBjwJm4jXE1O/xIZ1oX1hPv
	1tNhYfj7aIAGYEfUE+VXsAcnAbda/mxtt+nnhOLqJw=
X-Received: by 2002:a05:6820:82c:b0:6f8:3d45:b465 with SMTP id 006d021491bc7-70352783f61mr5261958eaf.11.1792462836179;
        Mon, 19 Oct 2026 19:20:36 -0700 (PDT)
Received: from [172.20.5.89] ([65.141.20.21])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a0f284d1sm10247392a34.2.2026.10.19.19.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 19:20:34 -0700 (PDT)
Message-ID: <cdcaf727-4433-4f8c-8e33-42094efcc6d8@gmail.com>
Date: Mon, 19 Oct 2026 20:20:33 -0600
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to match open
 parenthesis
To: Comfort Oyewole <coyewole7@gmail.com>
Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <8a960200525367f0fadca6b83ca57273e469f225.camel@gmail.com>
 <53D6A234-940A-4B29-89B2-7EB0E459F077@inria.fr>
Content-Language: en-US
From: Jeremy Dean Clifton <gservice341@gmail.com>
In-Reply-To: <53D6A234-940A-4B29-89B2-7EB0E459F077@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/18/26 11:09 AM, Julia Lawall wrote:
> 
> 
>> On 18 Oct 2026, at 10:18, Comfort Oyewole <coyewole7@gmail.com> wrote:
>>
>> ﻿-----Original Message-----
>> From: Greg KH <gregkh@linuxfoundation.org>
>> To: Comfort Oyewole <coyewole7@gmail.com>
>> Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com,
>> linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
>> outreachy@lists.linux.dev
>> Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to
>> match open parenthesis
>> Date: 10/18/2026 02:30:05 PM
>>
>>> On Sun, Oct 18, 2026 at 02:22:49PM +0100, Comfort Oyewole wrote:
>>> Fix the alignment issue in order to adhere to kernel coding style
>>>
>>> Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
>>> ---
>>> drivers/comedi/comedi_fops.c | 4 +++-
>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> This is not a staging driver, why is staging in the subject line and the
>> cc list?
>> Sorry, I made a mistake while working on my first patch. I just realised the staging drivers are located under drivers/staging dir.
>> Is there anything I can do to correct this?
> 
> Just work on something else.
> 
Comfort,

The comedi driver isn't part of staging. You can see who looks after it 
in the MAINTAINERS file
or with:

   ./scripts/get_maintainer.pl -f drivers/comedi/comedi_fops.c

That lists Ian Abbott and H Hartley Sweeten as maintainers, with
linux-kernel@vger.kernel.org as the list.

There's no dedicated patchwork for comedi. Some subsystems do have one.
https://patchwork.kernel.org/

Drivers outside staging have different
expectations. A clean-up style fix may not warrant a change.

You can still send it if you'd like to see that change in the driver, 
but I think it could be separate from Outreachy and staging.

Good luck with your next patch.

Jeremy

> Julia
> 
>>
> 

