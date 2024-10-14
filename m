Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D319E7F7
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728907765; cv=none; b=CtSugB3ftQk4CY/kou03WmZ1WKqAXRMV71SeS/RuwtwHlfekG1h9k1GpZLp1NwnPqmVTdVHE2qZiAkNM4FXy1Ua6520JfGy5JqaoAoxrm3xexykABFwh/sheHSYkOF5p1k4gUT9/jUvAc6Q8rvmVW+nUtThM92/tF1FBBmCxLqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728907765; c=relaxed/simple;
	bh=fp4hGq2LYG+L8l80tB2UjDKZFH9O9DONZeVIQwUvfmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otmFAbjc4Eeyzdj4MQ18MN46gDjwyPS5wVaTOWOlD7mB3Pu3U+HkqrqV6QH+sLXxyHy3PJmj+JwDdWI8t3X0Di0phiTjdJwYEVV/345wALrVk7dVe3Ippr+ClH3YQIZhCFByMML9ZkoqpJgO9SwCZ8hOO+lj+XBaOh53I171hKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SB//PJl3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SB//PJl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728907763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VinTYtg0RlHQGGVcHD0ggvc43bI3iTFnU6upGuAELTc=;
	b=SB//PJl38lR9ebzv/Qv+Fu6ij7Ow3TY82Au9UeqG7xG18JaSSaBBXOlLsKrjjIyIw8Irgj
	mFlwz+x3l/LKS42r4x2KjwZJNZmw2gCzUzI0be+j0QKLyZ7hG0W0WJ+9ckERx6GHZGwj9X
	XYp4eUBTd68nXXJWRn+xhVacmyhNLAg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-55YraAtMMvKmKu-IFIZEqg-1; Mon, 14 Oct 2024 08:09:21 -0400
X-MC-Unique: 55YraAtMMvKmKu-IFIZEqg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a995056fadcso263350166b.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 05:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728907760; x=1729512560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VinTYtg0RlHQGGVcHD0ggvc43bI3iTFnU6upGuAELTc=;
        b=FhzvWF9epr7xRTIu8ZMGx/PVUeF9zfvqAWOlHVmZ616YdBkX2W7/Rp2dgp/1R7WUtr
         Qf6z8QZsPm1lsLb0Xlab7q29GPu0kev/WBhtYgcd4ugHn8SXsen6ZJkJ0IBm7Altc9U0
         w3c9hu3FFuGN1FFpgyA/ZPKmcLg6DTPE60xSuOFbFSjCNmC8p0ef62ddQHQQq+g9Qg7U
         h0H51SG5QDbki5fLrBx2lzHSy6ped61qp9eDjGP9hXJ/jKDzUkXsrr2i4Nul8ndUjVdI
         SRzb5+wmsA+2DtLG8DWmuJykCEjLxn1Eo7G3K3HaR8p9a9mVF09s+qm7waJ3aqMfB3ut
         EzKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpWd8nKGhIGiQ6mv7YHLg0RaA3EdoMcAIO8BTQDlbQ35nBIm5QQt4u7k7J+mVUZKfhnj+sbybg/Mw7gJk0@lists.linux.dev
X-Gm-Message-State: AOJu0YwtCSr8keKRQo8wxBLblUAJfetT3qhiK+CmOB5BM0gBo8UD4JgC
	uHIVtMF+OBHliOyKwwoyvfVU49juvTTbmgacN2nIQgFc8NP6oIN1hH5Lb4M8pEbdXpVVMtHnWk9
	lnseHd3rPonrh2AV114A4x12/I8dCXPGgcs6LonuuB0+8JW0lCzItM/3B2QTTz1xJJ2yjK9SLBA
	==
X-Received: by 2002:a17:907:1ca8:b0:a99:529d:81ae with SMTP id a640c23a62f3a-a99b95b05a8mr1089769466b.55.1728907760456;
        Mon, 14 Oct 2024 05:09:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJPTMVAa38gd41Fd3ChmIHKvceQ2cvda+nBz+b2BjY/bcO1kVMNT23OXkeYVdQpoT0X4a8Xw==
X-Received: by 2002:a17:907:1ca8:b0:a99:529d:81ae with SMTP id a640c23a62f3a-a99b95b05a8mr1089765766b.55.1728907759975;
        Mon, 14 Oct 2024 05:09:19 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a0e83f83fsm149691366b.125.2024.10.14.05.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 05:09:19 -0700 (PDT)
Message-ID: <f57c0928-9d00-4a00-825e-e0a3c35b4b7b@redhat.com>
Date: Mon, 14 Oct 2024 14:09:18 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] media: atomisp: mt9m114: Make it work on Asus T100TA
To: Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Robert Mast <rn.mast@zonnet.nl>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20241013154056.12532-1-hdegoede@redhat.com>
 <Zw0BaCFy5j5bHeUA@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zw0BaCFy5j5bHeUA@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Oct-24 1:32 PM, Andy Shevchenko wrote:
> On Sun, Oct 13, 2024 at 05:40:52PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Since there is some interest in getting the mt9m114 camera to work on
>> the Asus T100TA:
>>
>> https://github.com/jfwells/linux-asus-t100ta/issues/4
>> https://lore.kernel.org/platform-driver-x86/e0c8c98f-64ec-4297-bbc8-de489414515c@zonnet.nl/
>>
>> I have spend some time this weekend poking at this resulting in this
>> series which makes things work somewhat.
>>
>> Note that for now this will only work if you modify the BIOS settings
>> to change the ISP to be listed as a PCI device in lspci:
>>
>> 00:03.0 Multimedia controller: Intel Corporation Atom Processor Z36xxx/Z37xxx Series Camera ISP (rev 09)
>>
>> If you do not have this in lspci then things will not work. The BIOS
>> does not allow changing this setting from its menu, so we need to
>> use the grub setup_var_3 command form a patched grub.
>>
>> Note this requires your Asus T100TA to be at the latest v314 BIOS version,
>> this has not been tested with other versions!
>>
>> Download grubia32.efi from here:
>>
>> https://fedorapeople.org/~jwrdegoede/grub-efi-setup_var/grubia32.efi
>>
>> Boot this once and then run:
>>
>> setup_var_3 6f
>>
>> If the ISP is not visible in lspci this should show 01 as value
>> for the 0x6f offset.
>>
>> Now change this to 2:
>>
>> setup_var_3 6f 02
>>
>> and then reboot. After this the ISP should be visible in lspci.
>>
>> For more details on how this works see:
>> https://hansdegoede.dreamwidth.org/25589.html
>>
>> Note this series is just a quick hack, the proper fix would be to get
>> the new drivers/media/i2c/mt9m114 standard v4l2 driver to work and
>> atomisp does support standard v4l2 drivers for a while now.
>>
>> I plan to take a shot at this as time permits, hopefully sometime
>> within a month but no promises.
> 
> LGTM, some nit-picks in the individual replies.
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Thank you.

> P.S. Can you consider my patch to apply (that removes GPL text
>      in the top comments)?

Yes I'll pick this up together with other atomisp patches
the next time I do a round of atomisp patch merging.

Regards,

Hans



