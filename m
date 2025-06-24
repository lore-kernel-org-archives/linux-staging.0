Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA64256D
	for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750782057; cv=none; b=AWiBZHIkc14oaizfZUMgpj9YvC9n0QYCVuHQysmAn0R1a5dBHQ8Gt2c9F4GAztN8W0eewePTal5w/AgxkTqg3xYzC7ANB/y3HDWYYQrMtrPyrQQUFlRVwLif441yB9+cmgj6yd7ZZ3dS0l3/03JyqduEbCkXNpA+skX3fAcCzd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750782057; c=relaxed/simple;
	bh=QBZg28W/fBUTxa5iv7HE7VIvLqKke02D7Qw8NzurT3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQgcDqki2aG7AzVZINOwy3O4oyFCesYYrjKeSdU9rT8zCxq6W5IdEk1hBY/cTOUk/emAct+czcSWmm8Ip6WCWxsnbDlF1bwPSuQtekyvGR8DCFpyOrOMYM37FOnKR0zsQhFkNWUmcZybTo0woKh39x7jDUerZhDyHSpnJQX0Gwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEMGHXC5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEMGHXC5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso2826975e9.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 09:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750782054; x=1751386854; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBPEC7Udike9uc6BfC0QMKbP5KqggcKqpjSgmkMdnKY=;
        b=jEMGHXC5/Ii/gqq1CUSeFhYJtPDqVQyobPCpowzkcHMKK8om3VuexGAth9/Y7OWrP9
         vI2sD0yasVoeen7PkQjyRpU6xyNbsCE2CNDtZsSFRYYbvZIJQm2WWSoK1OymEeV3fN2P
         I8mscTI4DIFN38G/yrM+XRvd+3B0H/LoHRKc95RSlS5dAQNvHySctqTQw6uSrIYEgEiv
         QPsh/Xf4pn9JeyV8qo/V3/4ZY3DMADTzXrl+iy1Rr6MUpOe++/P54/sGrFIfhCwz8Hn2
         BZySG8DG4F0RSVinK3Yr/l63ty5HMwjMTinacF6wIVweN7cMJ1Q5LbqTvyP9/JC5X6CM
         ++9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750782054; x=1751386854;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBPEC7Udike9uc6BfC0QMKbP5KqggcKqpjSgmkMdnKY=;
        b=T/mEgacdvQbTGhexLgrrl2DQGel8FTj8TXlxBJM8u1u9ipKhC2ZQQjcfRO2p52yjzG
         HI3LTKuCt76dimEj65s3V7SVqom9ZbQdXQtECpgety6NAczL28TEBQAbvaEZClRJmlAE
         z4JVpQD/+nDOuZ/Uzukc73tlzbnK0lSMUx15H0jIIS1MfhvEz7XNHpp4QtCIwPDTj6f1
         LgSmp7MXQrMQ77HDH7WUUftZd5iIYL2AIjGncGDPD8wQligacFDxGmQq8tFNbW3LM9Jf
         b9HG+Q88eJWq3zSO9MmYgYQRq5WCM+OlBF0O5jBtdcg2kM5Bctn958LcSZ4MMakniAnl
         xENw==
X-Forwarded-Encrypted: i=1; AJvYcCUYhe5xI0nhTsiP3rpJknMKWnZwkfWjQ7CL1x6cjna/JJHxiJ2ZZvvEubl1UJmyDb5JGOc/cvj6BkiNC+a8@lists.linux.dev
X-Gm-Message-State: AOJu0YxpIzxiipL3cMHFkuqWlj8Ll/BSktWTOiJP4zBRwL9oHqf1KAe5
	/GWxKg2pvNC4NiDcsbnk5yza7RyXlENCqs6wwruA/gBSpk0mnwfgxZr4T5KaCg==
X-Gm-Gg: ASbGnctgWlcYTCY58J+fdKXVidk5OWY8Nx3/uDjQ2voqppw5dUi5am/tLCFGZOHno3h
	4Cnk4sKZB7uP1zWVwa6YU3HQLODNdsa5amBh+NGqmQSOWGsJhFMTDWTCwmecQqm3144lAQkEXIZ
	R689127Uh72HaxK5utar6qqL5AyWhjUzMnEWtXwbX1roHrg/a+Lcgw84AtNikBA7iA090qG2pDc
	PC4UWCbaFmDo7hdKJ5FlZPHTDmPcEupYOpgBajKi8Y82qWzJr47niiNiqW8mRKTikqDgm0g+hEt
	juyogxIPX9EIW3k1Ov3gufNGxxJofMopD9HwkOfRn7jJMixNdqZWTU3q1RMooeZcBMrA
X-Google-Smtp-Source: AGHT+IF6pE2IAJ7Y1LDV5YWms/8jtl6+meXsDEGvoE2TkHeD+D5JYR9IpOTJZUfa+CipAih/vfpv8g==
X-Received: by 2002:a05:600c:a016:b0:450:ceb2:67dd with SMTP id 5b1f17b1804b1-45365a0026dmr149159215e9.33.1750782053900;
        Tue, 24 Jun 2025 09:20:53 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8c41sm183195695e9.26.2025.06.24.09.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 09:20:53 -0700 (PDT)
Message-ID: <f6847b24-aa57-4ce5-995f-03b3056f88a1@gmail.com>
Date: Tue, 24 Jun 2025 19:20:48 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/19] dt-bindings: media: i2c: max96717: add support
 for MAX96793
To: Martin Hecht <mhecht73@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS"
 <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 open "list:GPIO"
 "SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)"
 <linux-gpio@vger.kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-7-demonsingur@gmail.com>
 <49977010-65a5-4ad7-b86d-5e779d0de3de@gmail.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <49977010-65a5-4ad7-b86d-5e779d0de3de@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/24/25 7:14 PM, Martin Hecht wrote:
> Hi Cosmin,
> 
> I'm preparing a test with Alvium + max96717 + max96716. I can't see away 
> to overwrite cfg settings to force pixel mode or tunnel mode. Any plans 
> to add this? Sometimes it is required to force the other mode than set 
> by pin-strapping.
> 
> BR Martin
> 

Hi Martin.

Pixel/tunnel mode is chosen automatically based on HW capabilities
routing, formats, etc.

I don't plan on adding a way to force it, since the presumption
is that the serdes framework will pick the best use case available, as
long as all the data can make its way to the PHY.

Forcing pixel/tunnel mode shouldn't be done via device-tree since it's
not related to the way hardware is wired up to the rest of the system.

> On 6/18/25 11:58, Cosmin Tanislav wrote:
>> MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
>> links.
>>
>> Document this compatibility.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>   .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ 
>> maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/ 
>> maxim,max96717.yaml
>> index ab46a5f0bd7e..23f611177a87 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
>> @@ -30,6 +30,8 @@ description:
>>     MAX9295A only supports pixel mode.
>> +  MAX96793 also supports GMSL3 mode.
>> +
>>   properties:
>>     compatible:
>>       oneOf:
>> @@ -39,6 +41,7 @@ properties:
>>         - items:
>>             - enum:
>>                 - maxim,max96717
>> +              - maxim,max96793
>>             - const: maxim,max96717f
>>     '#gpio-cells':
> 

