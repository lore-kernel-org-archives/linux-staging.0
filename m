Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DED145B0D
	for <linux-staging@lists.linux.dev>; Tue,  2 Jul 2024 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719917292; cv=none; b=NgtEgjT19Z+ld4vjCNraBxfCkdqbLPG/jVhyrYfSieiSZQvQNwvddynOKbUKcBMaKkCYn8VYEUIAkqBEzWQtdg4v6usoMQ6gVKP8s1oz6JwBt4wsro5XVX8+y9GEK33XhqgatK7HCNraQav2uYsWHPWXRyoYoFGQKVUxezcpJYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719917292; c=relaxed/simple;
	bh=lmx62mmNzlzKSDmqFAsrE6aHOd8QVU/K+YKTTXWRB5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rrBiw7ywvr+siA9ll4v7O+DIpPoQYTF2saxIBbvsGIU56IREKevy7jF1yWHwwPs385L08qHEsk7XeP4ENejttJyQioKDvR7e3ccH9ypYEB6PAFD4uVzr1TS3vz/7BCse70YsdG6aOQRF1b0PW/H2am/7LXC+N7u5mlN15swi784=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lsya2XoA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lsya2XoA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719917287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddUEaynzSPdLAUSnF0X54jX92vwScTAP/nJccagtVuQ=;
	b=Lsya2XoAEarfhPdFErFEJYU5YpyP+rzOocN6sjixB6KqCXM6KXLFxePEKliiuKY4g1+zZZ
	7JLqyhlh/DFmGtCka05bEjU17wyzmx26vNyppZhVDIPdyw8/3BAsC1jLpHkrqaISo9AkOn
	J2ZC3SHtbgc3mMTv3a4gGPHBIuvZs4s=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-BAT1JypvOpCpPowMGyvJnw-1; Tue, 02 Jul 2024 06:48:06 -0400
X-MC-Unique: BAT1JypvOpCpPowMGyvJnw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a729da8fbf1so642814966b.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Jul 2024 03:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719917284; x=1720522084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddUEaynzSPdLAUSnF0X54jX92vwScTAP/nJccagtVuQ=;
        b=mSx1r6rCgSbIzvgQgsvu5wtlfbl+m7Pz/02bhb+AlzfTO7KvcdET5XhVT18FkXW0OQ
         dQcVFZNOxAmoIe/LEoygLPqvFSQNBAsv5MaZYPtTXvkUBFtCv50iWFI2dFPM3Di7NlE9
         OVNbJE961p2CtJYZ0HolN18lg760ivP/exHR+HeoPUs8yFTu4LrKyRW4pAfW4RkhujYr
         +wfxCIJZ3+3FaS5TtDW9W+xrKq5GSsOhnNcfRelf9yyMKfAsC3Ix5BVMqROe2um0zyQi
         BB4tG3sKn6CowVUh2rfh80MUkwTiYukiY1Dbdu6dYRRRJugL29EPINHWUWAPpkY6Bfwe
         0qxg==
X-Forwarded-Encrypted: i=1; AJvYcCVbGt8nLxJYenwxGP086Nc8km+3RUFVFz2Ajwmp+cDtYR65snQlZidQD94l5zBK4VnaJLG8c9TVYzz4aloW2tbVohi2ciTDJStWLeWRkA==
X-Gm-Message-State: AOJu0Yz6U5mXiBo8vmWZHrv+iItz+IGCi8p93S8QDUMR2Aulpm5Q9uhU
	8TRx6rffrZu3d3EODoVTMbdECyFTeO1HxMtsQtcMsg0jC60NcT97PZQ6paxm+TTZ0MQtTXEawGj
	93Y/1dorfEwaBi0dP1vRe2rlP0zUneSxCrAmLb4fcfpPpF7GpzeZu6DvNFR0tZzY=
X-Received: by 2002:a17:907:3da9:b0:a75:21d3:1f4d with SMTP id a640c23a62f3a-a7521d3206dmr548042166b.31.1719917284250;
        Tue, 02 Jul 2024 03:48:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE9MGT5mfjPY4ZOeg9i4J0MDWtNu/bF0+BnklR5EGx7o+JjjoMwvIos8X+tp+XXuVLWJRdfQ==
X-Received: by 2002:a17:907:3da9:b0:a75:21d3:1f4d with SMTP id a640c23a62f3a-a7521d3206dmr547931666b.31.1719917254270;
        Tue, 02 Jul 2024 03:47:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614d507d2sm5446929a12.64.2024.07.02.03.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 03:47:33 -0700 (PDT)
Message-ID: <bc52402d-8ebe-4096-9a8e-94fac8747bd7@redhat.com>
Date: Tue, 2 Jul 2024 12:47:33 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20240610-md-drivers-staging-media-atomisp-i2c-v1-1-c7b63464fae5@quicinc.com>
 <be4544a3-ac67-4d4c-b00b-0e2e47a7522a@quicinc.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <be4544a3-ac67-4d4c-b00b-0e2e47a7522a@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jeff,

On 6/26/24 6:37 PM, Jeff Johnson wrote:
> On 6/10/2024 5:34 PM, Jeff Johnson wrote:
>> make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/media/atomisp/i2c/atomisp-mt9m114.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.o
>>
>> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>>  drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c | 1 +
>>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c          | 1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
>> index 7a20d918a9d5..3499353f8ea5 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
>> @@ -207,4 +207,5 @@ module_init(init_msrlisthelper);
>>  module_exit(exit_msrlisthelper);
>>  
>>  MODULE_AUTHOR("Jukka Kaartinen <jukka.o.kaartinen@intel.com>");
>> +MODULE_DESCRIPTION("Helper library to load, parse and apply large register lists");
>>  MODULE_LICENSE("GPL");
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
>> index 23b1001c2a55..918ea4fa9f6b 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
>> @@ -1614,4 +1614,5 @@ static struct i2c_driver mt9m114_driver = {
>>  module_i2c_driver(mt9m114_driver);
>>  
>>  MODULE_AUTHOR("Shuguang Gong <Shuguang.gong@intel.com>");
>> +MODULE_DESCRIPTION("Aptina mt9m114 sensor support module");
>>  MODULE_LICENSE("GPL");
>>
>> ---
>> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
>> change-id: 20240610-md-drivers-staging-media-atomisp-i2c-18a7a4f883eb
>>
> 
> Following up to see if anything else is needed from me. Hoping to see this in
> linux-next so I can remove it from my tracking spreadsheet :)

This has already been merged in media-staging (the media's tree for-next)
by Hans Verkuil:

https://git.linuxtv.org/media_stage.git/log/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c

Regards,

Hans



