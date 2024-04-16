Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CEA84A5F
	for <linux-staging@lists.linux.dev>; Tue, 16 Apr 2024 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713259526; cv=none; b=PasYVxT7RQm1WWrbi0IC7H1e+CKehSlnxf0s8kbNuVHMdMK4DAL+TEfkWSr/HUKk+tgMMbMK0KGJizxax2g3dpfzSlxMrEYcOIqATVmtQ098yRBk8Wue+jczQo7DBncng0mJgKpFIwHwMCnO9yaKt9v7ydqv/NLqkICEGDm2RxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713259526; c=relaxed/simple;
	bh=VepDZcY2eTQP+WtI7Tu5jIbh15nahrwfxbgZSV0hGY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PwlvsbkV04B3NNwQukmDI2++tzg6DG6hIpxg8LVBkH1qUUTeP2BkprsbXVlsH6dSCR0RsrpJMU2994Py+EnU0XuEW+yJi7Dy/LkSY3dskLxpR+q5H+7mcYS4n90Ztkm0gK8qUoeU8qk0mllq8HZfhFtz+Xq1Jg+b0RJZjEKvkZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UJ+/t0Fs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UJ+/t0Fs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713259523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FRE7xnN3DPvJ0uPhLpdtosRFGMPJeqCTZUsQYW1ove4=;
	b=UJ+/t0Fsz1+FqxCMD38O72/dNogtNIeCGBhhtAYt/vXrJme4fjYfQm0omscjMO0HJvTPIH
	fvUNMed8pZPMM5B/ujgzYedluzOcN0Ti2hWTF/F2LMLfn7bbp37+JOfaG9jO1TDvXDrXn1
	8uO/e+B/95/2fhINstGJceQtkqYck4s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-jkmrZMVQMBaik310QvKbbQ-1; Tue, 16 Apr 2024 05:25:22 -0400
X-MC-Unique: jkmrZMVQMBaik310QvKbbQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a54c11dccfaso95612366b.2
        for <linux-staging@lists.linux.dev>; Tue, 16 Apr 2024 02:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713259521; x=1713864321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRE7xnN3DPvJ0uPhLpdtosRFGMPJeqCTZUsQYW1ove4=;
        b=TBtnf0H1dF04AVJEM5Hz++TsCduf2vovmbOPgEUiPHWOLAycf5+GQ7NtSJlFCPJ1Fb
         noeGLICk5Djpp93iVfhJsaxjHp+KiTNc80+hTxkAa/NebA6oQyVCrp08sCljleUMtAZ7
         Y2O88YvvSyqNvfm9HGoDc1GiiplryfPQX71+4YXd8F2PJ0OaWQwKZNYNhQegmHWs6fH+
         fWum+oZYoFgI5C6H6khq6P1aY4NbD7pMwZlHd+eUZUhgejRyv7cwAqFh5jXB9dPN4vdd
         krsphqe2dhgKGVUC6omDi16caKEez2THPMbQFm0NS5q2/vxY3e25aUYKDaXq7J1H0aTc
         n0hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg+1LwhHW+sSsvdxg8SFhaAiJbMl9WJiVTWSoFfbF5DSEUf4kVuA6XCiHBHY0ipcT9zzHf/Bfk8KMG3nr0a813KqiqQqdMI0qjhI1CtA==
X-Gm-Message-State: AOJu0YxwRRkOGs4GGpRtu9pP9IOId7xcDcn8DLDEGJuYPxLAtCpPebbv
	x9yHL2WuVgXXujMG1iNU9akdG34dMMSu3WiwoMazGzyjkP9YcllnxCV3n/r79ZLBxrJ7r6VH4AW
	G73TxMBn4IINgsRzAPIO2u31zXip2AsQHaxl0YUoSwyLYJV71e5VyIvm7gDrUX+U=
X-Received: by 2002:a17:906:2932:b0:a51:b3cb:cdca with SMTP id v18-20020a170906293200b00a51b3cbcdcamr10724471ejd.26.1713259521380;
        Tue, 16 Apr 2024 02:25:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmtUMeOk0F7211QUFXI0CbDNFq2sZ7MSVeKORfLoc2Cpjr5pGkDak4go1DMOeWzc3J/5PWTg==
X-Received: by 2002:a17:906:2932:b0:a51:b3cb:cdca with SMTP id v18-20020a170906293200b00a51b3cbcdcamr10724456ejd.26.1713259520996;
        Tue, 16 Apr 2024 02:25:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bw26-20020a170906c1da00b00a52222f2b21sm6441401ejb.66.2024.04.16.02.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 02:25:20 -0700 (PDT)
Message-ID: <294058a6-72dd-4973-95ee-eaed0c908131@redhat.com>
Date: Tue, 16 Apr 2024 11:25:20 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/23] media: atomisp: Remove test pattern generator (TPG)
 support
To: Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240415120220.219480-1-hdegoede@redhat.com>
 <20240415120220.219480-12-hdegoede@redhat.com>
 <Zh08SP60QytSz3aQ@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zh08SP60QytSz3aQ@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

Thank you for all the reviews!

On 4/15/24 4:40 PM, Andy Shevchenko wrote:
> On Mon, Apr 15, 2024 at 02:02:08PM +0200, Hans de Goede wrote:
>> The TPG support registers a v4l2-subdev for this, but this is not part of
>> the media-controller graph in any way. After manually selecting the TPG
>> as input using the s_input ioctl it does not work.
>>
>> Several supported sensors have their own working TPG and using the sensor's
>> TPG means that the same data-flow is used as with actual sensors rather
>> then the quite different data-flow from the ISP's builtin TPG.
>>
>> Remove the broken TPG support, when a test-pattern is needed for testing
>> a sensor's TPG can be used. Using a sensor's TPG is actually better for
>> testing since then the actual normal data-flow is being tested.
> 
> ...
> 
>> +	if (mipi_info)
>> +		fc = atomisp_find_in_fmt_conv_by_atomisp_in_fmt(mipi_info->input_format);
>>  
>> +	if (!fc)
>> +		fc = atomisp_find_in_fmt_conv(
>> +			 atomisp_subdev_get_ffmt(&asd->subdev,
>> +						 NULL, V4L2_SUBDEV_FORMAT_ACTIVE,
>> +						 ATOMISP_SUBDEV_PAD_SINK)->code);
> 
> While it was in the original code, this is ugly. Can we split this to two
> assignments?

Ack, fixed.

> 
>> +	if (!fc)
>> +		return -EINVAL;
>> +	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
> 
>> +	    raw_output_format_match_input(fc->atomisp_in_fmt,
>> +					  pix->pixelformat))
> 
> Now a single line?

Ack, fixed.

> 
>> +		return -EINVAL;
> 
> ...
> 
>>  		unsigned int hblank_cycles = 100,
>>  		vblank_lines = 6,
>>  		width,
> 
> Urgh... These comma operators probably is subject to replace with separate
> definitions or being grouped on a single line (as it suppose to be in this
> case).

That indeed is ugly, but fixing this is out of scope for this patch,
so I've added an extra patch to the set to address this:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commit/?h=media-atomisp&id=48d93af9d9b0fd40a21a656cb8cd8e25700bfed5

Regards,

Hans


