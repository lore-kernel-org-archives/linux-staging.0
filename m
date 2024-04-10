Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB7B172BB6
	for <linux-staging@lists.linux.dev>; Wed, 10 Apr 2024 13:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712756482; cv=none; b=G0E8yvLwkJqbseb0y6srKboDIQXsq7W+ZIzck+aZrmUy79fV9+VKIetuGRZ6/d9eJtcYDvZ4wYlk5dpiQ52Duu1BDw7/YX5kVgD1vHKC84ldecg1JP2fXp9ORnUJz7K64AQEoLB5KhrAlt237wAX5Nlh9uLb8d7UT9OiubMqx5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712756482; c=relaxed/simple;
	bh=k0CH/a1jNKnCDIQuOguNEBZ9OLWpbwWqoxiSC22YPsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyIw1NU1+yyQT3f6xjTKHMDcptZrGNGqinG+5ke/UP2tVGfqEGlW3OFpd/Vkd1R1J8dmurwviyudLItoLc9vdDRlm0G4nPg0JShrDOtcpCzMVtdN/9zGCRaJ1e+T7BSpgGcFkK0yLhEA5yQuepw97aGb+D/B3kwAk+9e6eY3T9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sijbo0wB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sijbo0wB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712756479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ab619jrMzt5I3ibFPcgw5mCCVGGcuTpmLYw+UMQ/Irk=;
	b=Sijbo0wBznl7AgRPgBRNMkwjDvyo1zcy96GDNrjcpmG0fWbqGIhZZKk2MV47WynwusEE4+
	NBjiOQGwEJoN/DABUWOO0pr797pDJz3nd0CyFDCZ1gE/E6vwbmg+hxdCINKnyDjbS4q33k
	r92uWl00A4/nmsdYUKKxcHKIwwNBeI0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-BnZB-aOYMz-ZzudzeZEkgw-1; Wed, 10 Apr 2024 09:41:18 -0400
X-MC-Unique: BnZB-aOYMz-ZzudzeZEkgw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a51abd0d7c6so369723866b.3
        for <linux-staging@lists.linux.dev>; Wed, 10 Apr 2024 06:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712756476; x=1713361276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ab619jrMzt5I3ibFPcgw5mCCVGGcuTpmLYw+UMQ/Irk=;
        b=m8tl5DpwuH42FeXmUeJOA5zf78wVmidnqGK2t20GbCLMhm4Y1hDY6AQ+ICJs5kpWgS
         IRPyFfYDMAIesblTTY2SAEzi36Eg1u1JZF4pJ/qbKTnrQmerkYRHq/7MdRynwta0+Cyp
         SKaR31yMcpxSMOfZ4E+JXvVaC/HSvq7Jz2fcFu9JByndPr37PLSFay7JCwN7J+rOCuoj
         2IhqdiQSuV8YsUOItwxDEQjjFGG2MpqAbFCZwKKMRzmuoh6OOdjKOcaWDItz1lkGYnHB
         EaxmDm3P7ibdm2QxO15l3waOF0bCk5+awWz2+ZjMn/AfR7M+p+WYVY7KTNIj2Z4Hmt4B
         9Hcw==
X-Forwarded-Encrypted: i=1; AJvYcCXLdiBgEllzU8HSu75UU4qtb0tIbVLSsIr2TmuxGwOxxpX4vEHOdfTC/+7RClufJ11ns8PHa2qymu77qFH/2qcT8p5lWm8dWYIU5qQSzg==
X-Gm-Message-State: AOJu0YwMvj+MfF25C62u0DrPVYbsCeIHWVOfiljVrGnia03ckCX8xTmF
	xCHY70AOIYigYjVPAAFI0QSb05SP4USLxvTKgCYKiqa6d4U3JiXnMlRvbCS6FiEeKgNDm1UCOES
	qMvBnR4cJ/LRYVj62t2GHT4nzpx0pLaoxgqKRKcEySegMkOCKxWul2Wb7i8U5u8s=
X-Received: by 2002:a17:906:af1b:b0:a51:9304:19fa with SMTP id lx27-20020a170906af1b00b00a51930419famr1415219ejb.70.1712756476593;
        Wed, 10 Apr 2024 06:41:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdjpMtdgVHK4SQs/9xte3kBf7W5yLaCB8xMVEkp4VrQrxxyFyhsuMGpRk8TEtW9ItXtZpaGQ==
X-Received: by 2002:a17:906:af1b:b0:a51:9304:19fa with SMTP id lx27-20020a170906af1b00b00a51930419famr1415206ejb.70.1712756476292;
        Wed, 10 Apr 2024 06:41:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h1-20020a170906718100b00a51bd3bfec3sm5553700ejk.121.2024.04.10.06.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 06:41:15 -0700 (PDT)
Message-ID: <911d84a7-cb3b-4ca5-86a1-334e7b3f85c6@redhat.com>
Date: Wed, 10 Apr 2024 15:41:15 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] media: atomisp: Replace open-coded
 i2c_find_device_by_fwnode()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240326202813.1425431-1-andriy.shevchenko@linux.intel.com>
 <20240326202813.1425431-3-andriy.shevchenko@linux.intel.com>
 <c9741df0-6c12-4ff5-90b4-5a13f0bd9b51@redhat.com>
 <ZhaVnYtFoTaFOKD-@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZhaVnYtFoTaFOKD-@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 4/10/24 3:35 PM, Andy Shevchenko wrote:
> On Wed, Apr 10, 2024 at 12:35:29PM +0200, Hans de Goede wrote:
>> On 3/26/24 9:27 PM, Andy Shevchenko wrote:
> 
> ...
> 
>> I'm going to merge this variant into my media-atomisp branch
>> instead of the orignal.
> 
> Thanks!
> 
> This explains why changelog made the commit message.
> Was it done deliberately?

Oops, no that was by accident. I normally git send-email
+ git am my patches and then git am cuts it off...

I just send out a pull-request with this minor wart in it
(after testing), so unless there are other reasons to respin
I guess we'll have to live with it.

Regards,

Hans


