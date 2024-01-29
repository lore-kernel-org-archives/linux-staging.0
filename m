Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC594C63D
	for <linux-staging@lists.linux.dev>; Mon, 29 Jan 2024 19:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706556971; cv=none; b=toxLEcp3Dqbw7gF9XHBJ/CSrKRPE4MYnwTBFIYRfMgMcQqXhI/wUAamHKh4Hky2zMPQTwJoGzxM9ugN/rLEjOhrgwZibxZWwQ3wj3Pnul4p07MYAxbRgvw33g2IoaVgy7k4QqVgqN1aAANdrSAemp2G81+ipj4sHihFO/Oa1Z5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706556971; c=relaxed/simple;
	bh=SzN5E/OZH58tSawDcGJ226eUc9651BGKKk3nvtr8mBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OELSe6gXzHvmAgQ52+klzHa7NXc81ZpzZgYhU/C06JcrqPvkRci3sCFXLH4KY2RVgqCnWBVQ+ft57mYvhZVxFnJMf2noeZro3/OS9daUZNP9Nuh8/9tVu2j3V9tQEU/kJZUnZpmoxJp20PrdIpXoSjqF/S2SVlb35+udVFxTqLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6y6e2jT; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6y6e2jT"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2cf2c9d91a6so3889181fa.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Jan 2024 11:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706556968; x=1707161768; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YlGK1ePb/U422QxxJl0KLJ2i0g645clyMklrxQdOa3U=;
        b=S6y6e2jT1ipAGbivHWjk3qkUfQmfzrYgNNxItNQx6O3pFR3hwEv0lPU7/3JycrPOEB
         zIU3kuaVWe13TaAOLp2s2brD3TC5hdKGkDDydHV2ACquz/gnden3DvqaH8Up3UOLbt3Y
         QAdmfJoLqCGRE7kmTNbOSC1PDS7Z9Mbexk8VhJ449GeiRWIp+DVsfUFT4aVv35PxbSuu
         AIkTHXsTlW/iAR2OSzUiz346/p5yj35cjlZmJSwTQ9InsU0vLIGz6ecoNCKX6HLHmm36
         yEuhLNhNkQw8Fxiw2KlzJ2KDhx+xbCKNPyWcIcjW9QS8dlIgfGxR5pW+DnsNOjJI/JH2
         /5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706556968; x=1707161768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YlGK1ePb/U422QxxJl0KLJ2i0g645clyMklrxQdOa3U=;
        b=DJdOyRcS6WMVy18drLdZC7tRgoU+7HeQ8/3LDfxkvvPo80kTuN2NddVlK/xwqzZN0f
         mFf7p1/Z0DJABCYWR5qnr7FryNzyXFgmafho5SE+fLORXm21T7uogZN2PAyKwF26buFp
         DAEryG+/1pJwkRc48E9i4Lnivdxz4HUYsX808TEAOrIulXR9J9r/vyWGbwhhV8ci1zwk
         FlMGxsEx+hu+d54a/AWbL4n6VC2bca03EnDQYb85RknfBD/RQB1dYVv42tp+w1lcIXln
         Mkn9jffKaOlNR5a2myZo4x4O3XFUo7uV+Zjm52UONSqmj3HBtkjfAh6IpMpODCdiaA8+
         q8Jg==
X-Gm-Message-State: AOJu0YwJ200x3etyvGRrRKXEPaiUg7uYZpzve/+aEvG5BNoIPYm0rKMQ
	3aYs1mnKvK9B8c2c8gdVLiurnBgqvhTzwTmmPe3cYva14jCAZHy0omuZLxpu
X-Google-Smtp-Source: AGHT+IGmii713iV3FedHnEYM1saOhH0iI85aKCQd1F89nzbF8KfvSe7jV2KWEriLLouPAAm3X0B5DA==
X-Received: by 2002:a2e:a3d2:0:b0:2cf:4079:3ae6 with SMTP id w18-20020a2ea3d2000000b002cf40793ae6mr4493467lje.5.1706556967558;
        Mon, 29 Jan 2024 11:36:07 -0800 (PST)
Received: from [192.168.0.101] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id r8-20020a056402018800b0055f0d17f9b2sm983279edv.45.2024.01.29.11.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 11:36:07 -0800 (PST)
Message-ID: <57575e6c-afe1-4d12-82e3-61e3c7ac4a93@gmail.com>
Date: Mon, 29 Jan 2024 20:36:06 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/18] Staging: rtl8192e: 18 Additional checkpatch
 fixes for rtllib_softmac.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Tree Davies <tdavies@darkphysics.net>, anjan@momi.ca,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240126223106.986093-1-tdavies@darkphysics.net>
 <6f13d58a-f072-49dc-a9bc-f742550fc9f7@gmail.com>
 <2024012707-garbage-kissing-99b5@gregkh>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <2024012707-garbage-kissing-99b5@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/27/24 21:24, Greg KH wrote:
> You might want to respond with:
> 	Tested-by: ....
> so that our tools pick it up and you get added to the commit logs, if
> you want that.
> 
> thanks,
> 
> greg k-h


Hi Greg,

thanks for your hint. I am already on Position 6 on the world rank list 
for "Tested-by:..."

No.1	 Daniel Wheeler <daniel ! wheeler () amd ! com> 
2417(3.51%)	@AMD                             @Unknown
No.2	 Andrew Bowers <andrewx ! bowers () intel ! com> 
2386(3.46%)	@Intel                           @Unknown
No.3	 Arnaldo Carvalho de Melo <acme () redhat ! com> 
1300(1.89%)	@Red Hat                         @Brazilian
No.4	 Aaron Brown <aaron ! f ! brown () intel ! com> 
1206(1.75%)	@Intel                           @Unknown
No.5	 Phil Schmitt <phillip ! j ! schmitt () intel ! com> 
566(0.82%)	@Intel                           @Unknown
No.6	 Philipp Hortmann <philipp ! g ! hortmann () gmail ! com> 
537(0.78%)	@Hobbyists                       @German

I wonder if I deserve so much recognition. I thought you do not like me 
hunting for so easy credits. But it seems that I was wrong with this 
assumption.

Will use "Tested-by:..." in the future.

Thanks for your support.

Bye Philipp
