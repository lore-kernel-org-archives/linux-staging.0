Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911A81C9872
	for <linux-staging@lists.linux.dev>; Tue,  3 Sep 2024 09:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725355648; cv=none; b=BAqgq92CLJip9meuhDtL9lD3ngG+pLGVBg4pEkI1bsHzvZtk2gh1H/lzEv6avYmk/E93ILBs50bASpDem5Y8mLClNe+wmDhaYw5kDexfZMOZ63vuFqgnw3jH+O13W1E754+gGQOzoIh/VTscVq5tXYtTYJiUJIA4H/Iy4nIwi7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725355648; c=relaxed/simple;
	bh=u0U9XWuImxldkq5jjPE14Shyrgx3irHd+FfUzCLREBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKvS1cY0ZVpa/7++JDjo1n8kx6ELmZWN5/lUNYT0LyliJ4cHAHtYCoP60FhwDY9imasrM4gE4A5/QM7wWTXXuDOOCel56Kw9855BQAX+qBC/6QHPJkn7RMr3eqe3UXQS5Yh7ZvaRgAbyLmN581Q3e7GcfJjK/l7n1T1MwXma5aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MN+bOik2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MN+bOik2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725355645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YofodTjyQ4m+oep4pei3ai7HYeSGC9DmqIEtUoHVYFc=;
	b=MN+bOik2HUVHHfgiMPRP8jxB5ZzLXfitamudEy5wtv85RpP0FIEsHodkU7+IcDljfGVClm
	ewwJAh7KonNOMDjLct4VrrrNdUha8Nn7rF8kaFKZuCoN4cUDZ0N2xzuQ5rXi8uQPK0cnMg
	91IrBP2kSvpXjqHVE2kP4lp1/LbJxm8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-tsDNornGPLCe-2qec78uCQ-1; Tue, 03 Sep 2024 05:27:22 -0400
X-MC-Unique: tsDNornGPLCe-2qec78uCQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a86884df270so350668666b.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Sep 2024 02:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725355641; x=1725960441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YofodTjyQ4m+oep4pei3ai7HYeSGC9DmqIEtUoHVYFc=;
        b=YpnKXYXGseQDcEjtirphzv1vsEiN9wPyMFyidmDXddzUHN2F5IZ3ibP+p3Q8R3uJLF
         ErGkd4eRKVuLfZlT3JUKQrcavSxHH8nXfLx2jaq+NKpt1Q5g40qd52cBv8QgI/wNpDsk
         9AWr9cmGZgCj1eVPEsh5DCtoMTt/4zmjHpUUaz8fA32LjP5lQlJPdx9ojHddLIonXlIM
         8XUD/CC5iumdQoJ5+kQ05QdM+OM557ixil4Fs6XInWdOvQ7J1IEtybvVD5POT8NSW977
         3saCDuGJeiUGcRLoXrPksnm1gi9D7DDSIy073waFIc0MSVMax53ym2RJCaniwlSdHuC1
         48ew==
X-Forwarded-Encrypted: i=1; AJvYcCUQ9t/iH3/50q9yNG6kzVaOD0L+zTY3KQXp8cle/xYNYVpBUhi+BQj5/u4M5GyPsWAwqBpUfh2w3QesrDYm@lists.linux.dev
X-Gm-Message-State: AOJu0YzqmAwCARV5nOIdC+DQBKtnHzDPTUfvjW301cEp077fXN4y/9hB
	ezkpaaPVkVKXFsBRHZ7PLG6fYmn+omtt7MtpR3kDPphAfTJcGKs/pPSz7sZLh0nUJkkA7+9Loly
	uF/NHxFSG/TOM5iayuiN+1UTMebx0cgZqu1JftLEwRdGRIx7S07wzF+1FgTNdaoo=
X-Received: by 2002:a17:907:a02:b0:a7a:9f0f:ab26 with SMTP id a640c23a62f3a-a89d878234bmr699459566b.23.1725355641312;
        Tue, 03 Sep 2024 02:27:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEj7UOPRo6Z3q0roG0+pQ/MXcaPi0nFXO7D6Ps/9n9XFjyMzio0Z/YpayBGLFteJuWqur6qQ==
X-Received: by 2002:a17:907:a02:b0:a7a:9f0f:ab26 with SMTP id a640c23a62f3a-a89d878234bmr699456066b.23.1725355640786;
        Tue, 03 Sep 2024 02:27:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891a3e52sm650276966b.116.2024.09.03.02.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 02:27:20 -0700 (PDT)
Message-ID: <a3363c07-6595-450d-abe0-c1ff4a3e9955@redhat.com>
Date: Tue, 3 Sep 2024 11:27:19 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: atomisp: Improve binary finding debug logging
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240902095229.59059-1-hdegoede@redhat.com>
 <20240902095229.59059-3-hdegoede@redhat.com>
 <ZtWpi7_S5d7NZx61@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZtWpi7_S5d7NZx61@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

Thank you for the reviews.

On 9/2/24 2:03 PM, Andy Shevchenko wrote:
> On Mon, Sep 02, 2024 at 11:52:29AM +0200, Hans de Goede wrote:
>> The atomisp firmware contains a number of different pipeline binaries
>> inside its firmware file and the driver selects the right one depending
>> on the selected pipeline configuration.
>>
>> Sometimes (e.g. when the selected output resolution is too big) it fails
>> to find a binary. This happens especially when adding support for new
>> sensors.
>>
>> Improve the logging when this happens to make debugging easier:
>>
>> 1. Replace ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, ...) with standard
>>    dev_dbg() calls so that the logs can be enabled with dyndbg
>>
>> 2. Do not dump_stack() when this fails, doing so adds no useful extra
>>    info
>>
>> 3. With the dump_stack() call gone, remove the wrapper and rename
>>    __ia_css_binary_find() to ia_css_binary_find()
>>
>> 4. On error use dev_err() instead of dev_dbg() so that when things
>>    fail it is clear why they fail without needing to enable dyndbg
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Note the log messages could also do with a bit of rewording and
>> reflowing them to put more arguments on a single line to use less
>> lines. I consider that out of scope for this patch which already
>> enough (see the 1-4 enough) something like this should be done
>> in a follow-up patch IMHO.
> 
> Yes, but...
> 
> ...
> 
>> -static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
>> -				struct ia_css_binary *binary) {
>> +int ia_css_binary_find(struct ia_css_binary_descr *descr,
>> +		       struct ia_css_binary *binary)
> 
> ...for example, in this case you touched both lines, so making them a single
> line just reduces the future churn.

Ack, fixed in my media-atomisp branch.

> 
> ...
> 
>> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
>> -			    "ia_css_binary_find() enter: descr=%p, (mode=%d), binary=%p\n",
>> -			    descr, descr->mode,
>> -			    binary);
>> +	dev_dbg(atomisp_dev,
>> +		"ia_css_binary_find() enter: descr=%p, (mode=%d), binary=%p\n",
> 
>> +		descr, descr->mode,
>> +		binary);
> 
> So does this.

Ack, fixed in my media-atomisp branch.

> 
> ...
> 
>>  	/* print a map of the binary file */
>> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"BINARY INFO:\n");
>> +	dev_dbg(atomisp_dev,	"BINARY INFO:\n");
> 
> TAB instead of space.

Ack, fixed in my media-atomisp branch.

> ...
> 
>> -			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
>> -					    "ia_css_binary_find() [%d] continue: !%d && %d && (%d != %d)\n",
>> -					    __LINE__, candidate->enable.continuous,
>> -					    continuous, mode,
>> -					    IA_CSS_BINARY_MODE_COPY);
>> +			dev_dbg(atomisp_dev,
>> +				"ia_css_binary_find() [%d] continue: !%d && %d && (%d != %d)\n",
>> +				__LINE__, candidate->enable.continuous,
> 
>> +				continuous, mode,
>> +				IA_CSS_BINARY_MODE_COPY);
> 
> Now one line?

Ack, fixed in my media-atomisp branch.

> ...
> 
>> -			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
>> -					    "ia_css_binary_find() [%d] continue: binary is not striped\n",
>> -					    __LINE__);
>> +			dev_dbg(atomisp_dev,
>> +				"ia_css_binary_find() [%d] continue: binary is not striped\n",
>> +				__LINE__);
> 
> Now the __LINE__ argument is redundant as one may run-time turn it on and off.
> So, trimming it while converting to dev_dbg() makes sense to me as a one
> logical change. Ditto for other __LINE__ cases.

Dropping __LINE__ is the bit which I want to postpone to a follow-up patch,
the messages rejecting certain binaries as not suitable are not very
unique and the __LINE__ print is necessary (atm) to help find which check
exactly is failing. Not ideal I know, something for the TODO list.

> Otherwise it's a good clean up!

Thanks.

Regards,

Hans

