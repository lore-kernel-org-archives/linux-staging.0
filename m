Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4D5EED7
	for <linux-staging@lists.linux.dev>; Sun, 18 Feb 2024 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708254630; cv=none; b=Bg805cpqvb2qWFZsEOnPCVwazJ8sw/NbRKn5BaYFxNnscVxdR216pnwVn9KyHB7kF+4vXuU3bQr1QyK7CAJX1pthRWhLJaHzsPLY2qN9fLfVXnLth2qD70QiQ+Eh90xcEUnnQSKe7CgKs/pePAq66SIAnovNcMyIOtuIy6GFFd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708254630; c=relaxed/simple;
	bh=12nsYsy2ut66XifcXoXVHDNUt5GmvoKa4RT4SjvzScY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REqvB0aoC+k+fVAI2CDH1NOODh3E/wNACg//ua8K1mhoQRgXF5QOY4+HMiSBfwK6RA5GOtKTlKmKMOmDdcAYT7TSHWJl7hOftABsb7Mi7kiCCzboU92aodOfHpS9pZR7rDTwNHV3vimw8iFQmLv9n5QkpnRdZzVf5u7i1r/Wo3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yrc9hKgT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yrc9hKgT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708254627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Idax5CM/6qbkH/+u3noY31RZkg7YAD3UFUEjMGy0kMs=;
	b=Yrc9hKgTSrzJ8glg1OnA/EBKNy+pmZkIuB1mNjekUglS1lPpagd4BZpWyD/w6DY9oNbTUK
	eOlE54SPMKgJ0P2IFaHyMqguOYWy6M44mWDohPuwMH/tBDTh0Ovr45MzlckzeTWp23YiWG
	R0VM1++uSHuxww0T3XkFWZjzEPIVO7A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-XKCgWUmTOdau2DDIwQFCAA-1; Sun, 18 Feb 2024 06:10:26 -0500
X-MC-Unique: XKCgWUmTOdau2DDIwQFCAA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a3e6bc4519fso11679566b.2
        for <linux-staging@lists.linux.dev>; Sun, 18 Feb 2024 03:10:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708254625; x=1708859425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Idax5CM/6qbkH/+u3noY31RZkg7YAD3UFUEjMGy0kMs=;
        b=RNIjrrxVCBcvW0ua8oXgzmhARgUr7AeWQ8f0GKf7+OxV1BzBEbbLBeIE0a9pmRr6VP
         Jk+GzsNIPbP3Ys/y9nA/n3IN+NfFhePKKsQZSidYmsjxqBnf2HDZaCwvSC5A7Ru5BkZZ
         0We9A2qn36pettnYz0QFfm9LrAoIU1u/5JGQScZljVqc3Fe6GdCggkeKwyHNgBTU+8rB
         oLmmaRGf0DhHt3kD+q3G/FBhXqhFvlKyCu4EhofPfudH2y3KsMIfK8TFk0IRen2bwf7n
         OKaqJ+tGKZyopdQZfrCBdwsWnrRJWpJ2hE5VHnMn3b/kACKI3kMBY2WJTr2DMSiyxzUm
         T76w==
X-Forwarded-Encrypted: i=1; AJvYcCUwU8budclxtVtkKw1vleIsdWkkhYd8Tm6dBZ5YeP+6dPnubwgx3RTwpePwrJ8ZdD6q7IF/ScFLKc5PdhnQlnZ06hHaKWQ11kXucf4P8g==
X-Gm-Message-State: AOJu0Yw0bctyyu2xcDl5L8tGXTxywHoVBToNvXk7W4GXn+oRjihewcWW
	0aA1e9256mSIROER5ikCv4e5X8C1sbnKHV9XiT0PKL/ZSOx8YgmzscC2NVp+PNHfoFp8D9AtOpm
	NmJwKqNF5ovuWhM768YLI8Piz8p8iKQ4+OVCbtYKy1QiBg4WChFbj6Hql83Wrjyk=
X-Received: by 2002:a17:906:d9d1:b0:a3e:4813:d4d8 with SMTP id qk17-20020a170906d9d100b00a3e4813d4d8mr2119447ejb.46.1708254625024;
        Sun, 18 Feb 2024 03:10:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMIsEUb2pQYd8CHxglTw5vFUzUD8H2htHGBATSZWaSSzgH+GAwCXS1T4ocFr6NXEECXo+LFA==
X-Received: by 2002:a17:906:d9d1:b0:a3e:4813:d4d8 with SMTP id qk17-20020a170906d9d100b00a3e4813d4d8mr2119427ejb.46.1708254624703;
        Sun, 18 Feb 2024 03:10:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id cx1-20020a170907168100b00a3c456b0c0esm1821584ejd.108.2024.02.18.03.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 03:10:24 -0800 (PST)
Message-ID: <54cd298a-e5fc-4263-8443-95a2b8d97a59@redhat.com>
Date: Sun, 18 Feb 2024 12:10:23 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] media: atomisp: Change ISP subdev name to "ATOM ISP"
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Andy Shevchenko <andy@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
 Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240217112438.15240-1-hdegoede@redhat.com>
 <20240217112438.15240-8-hdegoede@redhat.com>
 <170818560760.1206667.14199319396527835603@ping.linuxembedded.co.uk>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <170818560760.1206667.14199319396527835603@ping.linuxembedded.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/17/24 17:00, Kieran Bingham wrote:
> Quoting Hans de Goede (2024-02-17 11:24:36)
>> Change the generic "ATOMISP_SUBDEV" name to "ATOM ISP" to make clear
>> that this is the subdev for the ISP itself.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/staging/media/atomisp/pci/atomisp_subdev.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
>> index 8253b6faf8cd..822fe7d129e2 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
>> @@ -799,7 +799,7 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
>>         int ret;
>>  
>>         v4l2_subdev_init(sd, &isp_subdev_v4l2_ops);
>> -       sprintf(sd->name, "ATOMISP_SUBDEV");
>> +       sprintf(sd->name, "ATOM ISP");
> 
> Pure bikeshedding, but I'd probably lower the shouting to just 
> 	"Atom ISP"

Works for me, I've fixed this in my personal tree.

> Either way saying it's a subdev on a subdev isn't much of a value add so 
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Thank you for this and all the other reviews.

Regards,

Hans


