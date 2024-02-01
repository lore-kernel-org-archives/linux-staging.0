Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E4E53366
	for <linux-staging@lists.linux.dev>; Thu,  1 Feb 2024 12:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706790794; cv=none; b=JkFNYoTXF+9sRlxqxnC15VyUiIuS5SGTmDyXVcN7CFDreUFmAVhFrY87ddhR5cIrHRvDFofSJ5lgUHyc4Y04Cxv1ez7QgSHdxwvOipZlmZURv/1TCvhMyqMAWh8L5TfYNN3mJuf9ep4x4uspV9EIZr2WbOaJIUfQXCK59P1jlZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706790794; c=relaxed/simple;
	bh=vztFMk5uuEh38jenc7+zX5epdhHN3eiCXzKX1f1ISFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NvrwXBVr3Auorqfxp25m/8BDvNvKwAyg5n4sJ896PHSl7evcZ/bz8ZJQg5Y7WmFG8A/TBm7IwxN0AeykEBz5mHm/m0e1nUadlDhzW1gUusHGBUn5U1XCkG+/KN9LRgvEg8IF6U+S+bdIsd/36uf6eP3BYC5Q9MQeibnXTFX/27s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=inAgxRXM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="inAgxRXM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706790792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VykzFS/A4gtaHJ5yZrvwMMrgvKzQbIZs+sazS0I9kak=;
	b=inAgxRXMv/pSsYbzaazz0H3kkAfoejSiO16T7Cv7UtZGfPSmW3XfPUfaTqdaH+DxNeOPvM
	x+fUg53Fj8sE2k3MxQ9aYHOCdlIGhlTzLKSDv+mgA/N5jyFpheivLM4nsoCVddEx2YzMnR
	wjYNj38tliCUjmXhZ9V5kH5uW2uJxsg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-JjNR9qKWNY2Xcoj9PYgGwA-1; Thu, 01 Feb 2024 07:33:11 -0500
X-MC-Unique: JjNR9qKWNY2Xcoj9PYgGwA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2bc664528fso53153466b.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Feb 2024 04:33:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706790790; x=1707395590;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VykzFS/A4gtaHJ5yZrvwMMrgvKzQbIZs+sazS0I9kak=;
        b=bOScrviI5Ldj/Q6wUFBzpMrQyVvTsWDtn5/yMn6F/dp5ZerZTQzrLFiG68qetf+cK2
         cSmMW5TI+GahpYBNHnRVaOdW5DBQzbaYQD/G+qjfQZbpT9ab4VM16ta0Jthic1nYxxfj
         nksX3j6wElIeIad3RTIXNV/Ukw2vitfylF4VVvw5x8ENYuFONQwtMUP5QBnfjU4JuHHN
         ZC8RaVFWaKoPLrv+pcBzrJla/zfZycWf8DwwzE7cJAKKJiZraVHthaSefhs7tYFvcPvY
         V6c3Pu20t8IV3PsfrLnNSNahvcWbOHrepOGHXmUYsqRUCmAz5YqbsPU+Db+B9MdgYwF1
         jwmQ==
X-Gm-Message-State: AOJu0Yxzs+uRGCeI6fbf/6zlK27drIspFq7Cg6dkUxVigWtIC4l4mmbU
	SohyeR0G8xlXmre++jgiKyqTFI/4Y952AAjbQbAwASBJUHolInBxKkWI8qsBfeBDYH9UcAzNRKY
	WspgXrg7q3Rja1pT13/eIrd3ht/Pe3SpZh+kGpJMTwY4FWvbCvkxZzaaKr8VwqCw=
X-Received: by 2002:a17:906:e9b:b0:a36:741e:a5 with SMTP id p27-20020a1709060e9b00b00a36741e00a5mr3637731ejf.70.1706790790071;
        Thu, 01 Feb 2024 04:33:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG24YEwQkEJ9vizn3D6WUrihJuxwFM1DrqNfiUXQJnJ0eGcsdi1ConwFQ7h1xVfblGwtTtwNw==
X-Received: by 2002:a17:906:e9b:b0:a36:741e:a5 with SMTP id p27-20020a1709060e9b00b00a36741e00a5mr3637711ejf.70.1706790789773;
        Thu, 01 Feb 2024 04:33:09 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXk93JY4fPpdN7OjqvVkFatc+yT/+REOzgP4mJdD3AiA7IteyTRYwbPXvSpSEtkDQM5Hu7G8tp4Jobh6WbCWNf1+1zgCn1fr9YqOxzTnVoYLo4+ONTQfeOdyn8eKxx0LKCTSjDftFTBcVRa810kogGx/e2B0c3xX0w5/jvmjPGEYSh4MA4ygM1bo3Ng0lqXqpDtbvMWiB1C6tZjesKjWQ==
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ig11-20020a1709072e0b00b00a36834a6c0dsm1411188ejc.19.2024.02.01.04.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 04:33:09 -0800 (PST)
Message-ID: <3d0d2d3e-f991-4261-83f8-e4fd813e0804@redhat.com>
Date: Thu, 1 Feb 2024 13:33:08 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.8-1
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>
References: <d5059986-0329-4e6a-a7a5-30da8ebd58a9@redhat.com>
 <20240201071017.6032bba8@coco.lan>
 <508f2b4d-5fbd-4389-b98f-31b9525dd7cd@redhat.com>
 <20240201131826.7d8502ae@coco.lan>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240201131826.7d8502ae@coco.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/1/24 13:18, Mauro Carvalho Chehab wrote:
> Em Thu, 1 Feb 2024 12:46:19 +0100
> Hans de Goede <hdegoede@redhat.com> escreveu:
> 
>> Hi,
>>
>> On 2/1/24 07:10, Mauro Carvalho Chehab wrote:
>>> Em Sun, 31 Dec 2023 11:39:18 +0100
>>> Hans de Goede <hdegoede@redhat.com> escreveu:
>>>   
>>>> Hi Mauro,
>>>>
>>>> Here are the atomisp changes for 6.8.
>>>>
>>>> My patches in this set been posted on the list, but only a couple of
>>>> minutes ago, leaving pretty much zero time for review. Sorry about that,
>>>> with the holidays the timing did not work out very well.
>>>>
>>>> If you don't want to take this pull-request because of this it
>>>> would be good if you can at least take the patches up to
>>>> the "media: atomisp: Fix spelling mistake in ia_css_acc_types.h"
>>>> change. There are only 2 unreviewed patches from me in that
>>>> set, which fix the atomisp driver not working at all with
>>>> the latest media_stage/master code. And the rest of the patches
>>>> in that set are from others and have been reviewed by me.  
>>>
>>> We typically close the media merge window at -rc6. As I was also
>>> in vacations during those weeks, this PR was merged today for 6.9.  
>>
>> No problem, I know I was late with submitting this PR.
>>
>>> Indeed the first two patches seem to be needed to fix an issue on 6.8. 
>>> Could you please send them to stable after their arrival at linux-next?  
>>
>> I'm not sure what you mean with send them to stable ?
>>
>> 6.8 is not released yet, so these need to be send to Linus this
>> cycle. What is the process for media bugfixes for the current
>> kernel cycle ?
> 
> Heh, sorry, somehow I was thinking on 6.7 :-)
> 
> If the bug only happens on 6.8, I can just cherry-pick the two patches
> on my fixes branch.

I believe you only need:

"media: atomisp: Adjust for v4l2_subdev_state handling changes in 6.8"

And as the subject says, that is a fix for 6.8, 6.7 is fine AFAIK.

Thanks & Regards,

Hans

