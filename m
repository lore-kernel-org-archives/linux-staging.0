Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C833214AAD;
	Wed,  6 Mar 2024 05:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709703609; cv=none; b=Usv45BSJi6I43fSPTra2msAaYXICMjNpvnuZME5bEtNMI7GvrYo14jJq4OQPUM+omPnJxYGtp9q6AqZo+QorF14F3mrc2Z1Th0o97Y2AA1BbBng6TZrCVhn3i9ev5M1c47zqq8mYCoV+w6A/7uVYVCBfpvqByQalQQLZ3/adLZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709703609; c=relaxed/simple;
	bh=1EhWttxDjBUO01yxjjzBzR8Hxv+IQuEiuVgkvjLJR2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jm58PiOP6/e6xe5vOShSyvXbdEUnNfhxc4nccvo2W6RR/tfWbTn1ittOEDTw1StElPWn1xpqmGk8N4/n0Z9IH4lfV/vKb3qHig8vdJ9NRpzrXoc1KNbdEAf0oQ8r8cLWN9Kx7AzpjtRY6ZW51dtpIw+WizJ8/yP1kmF91vRrjzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/u1nmLq; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/u1nmLq"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5663da15a86so1067415a12.1;
        Tue, 05 Mar 2024 21:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709703606; x=1710308406; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AIMzFHVpAJ8WamzqrCrxK0e3Ww2qspLuG4G6c3YXewQ=;
        b=N/u1nmLqRCtuYJZsYVDNmlf5AQZ+yU1TttNwvP8uWufRiTbHQlxKOdARPYdjfrnGBG
         oonA2C3iWYv9q6wSsCtti13VxFC2Bi8sw3O11VTVxBnyWXFlatrioJa5mGz188b+QbYd
         cXh8ZfaqrHWuHfkMIKdmjCHC2L40M+7s2qFC4LjN4VecQzXw7JqTgU+SSdm8W3tJ5VeG
         U5cOkijsdzL3yrBY5ikArrHtaKBJ422L2coQwmcxLq0IfiQo4vM2MZezuL40LpcrmVp+
         airFZHa6IaAuMkZvyUKRrhDla/cy2Uv0/7vJR3I4NqESphxDUx+sHeD8abWbTsMCuFn+
         6RSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709703606; x=1710308406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AIMzFHVpAJ8WamzqrCrxK0e3Ww2qspLuG4G6c3YXewQ=;
        b=CNKb1zDOnzBnXX2U0CFALAMMBq9fewDEbs1ir0Y2UwDCEGHQyfaaRy8+iTdJed8ypC
         nfIns6Xb1i31YnKovUXne/aO16FKOEIL3P5runQj2A7Kg2nG0pZBHXz66UMuINeM6JyO
         vjOGCpOc1QuYuQ9c1L4bIeqZ8aFfwfwJ0gCAusxtsWO9Ici/L/Fc0GURuZ/+Z/g3SVw1
         6v7jRUZpsHqtGm3Z9jMZyrYUnAiOgLHv5pMHyQbItO3NHwajzLCsyvh4ctuIV8LBJXLI
         FKYhbeoUCxjqks8lwf7yM4720Nzmuh0+tAyw1go+690k0R04ygDLs9zkpv5kB1EcD2uL
         2D1g==
X-Forwarded-Encrypted: i=1; AJvYcCW4A5Egb6UyGlvs7Pd+7xq21oIf7rQBEa5ThKagK/wMz3TYQzTmSkmzwYUlfTBpPseiImxZCBC7mesijQJt8vyUBWZqRdTGkl0+LnfQYFDWFPgeGhXL+Cw8BgJbM16YTOmtOR///obiog==
X-Gm-Message-State: AOJu0YxvtH0+HpywoIikZDBDFyD9Z3DCSRH6En2nYN4RD9XpyaCJKfQU
	KpR1ofhmNZKcNogrnCEUajWxP1A3XH/ghZuELHAmqCen68b2Q9Mh
X-Google-Smtp-Source: AGHT+IHnbf0D7IdyT1bf1okQhvgPLU49bxY2cg+R2wKUDaBI2F/IwBFgW/dP0oGopFlFHtzYlzciRA==
X-Received: by 2002:a17:907:1603:b0:a45:be6a:f600 with SMTP id cw3-20020a170907160300b00a45be6af600mr191172ejd.1.1709703606079;
        Tue, 05 Mar 2024 21:40:06 -0800 (PST)
Received: from [192.168.0.102] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id lf7-20020a170907174700b00a44d66a16efsm4655326ejc.2.2024.03.05.21.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 21:40:05 -0800 (PST)
Message-ID: <66564bca-3f9a-4848-8453-c2ecd5f061ac@gmail.com>
Date: Wed, 6 Mar 2024 06:40:04 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] staging: vt6655: Match open parentheses
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, outreachy@lists.linux.dev
References: <20240305091410.2798-1-dorine.a.tipo@gmail.com>
 <20240305093213.4280-1-dorine.a.tipo@gmail.com>
 <f76416c1-157f-4c31-8443-a63194a630be@gmail.com>
 <8add5a04-baab-49b8-b1b0-7b85131902f3@moroto.mountain>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <8add5a04-baab-49b8-b1b0-7b85131902f3@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/6/24 05:59, Dan Carpenter wrote:
> On Tue, Mar 05, 2024 at 11:01:09PM +0100, Philipp Hortmann wrote:
>> On 3/5/24 10:32, Dorine Tipo wrote:
>>> Align the function parameters to silence a checkpatch warning.
>>>
>>> Signed-off-by: Dorine Tipo<dorine.a.tipo@gmail.com>
>>> ---
>>
>> Hi Dorine,
>> I tried to apply your patch but it failed. I do not really understand why.
>> Have you edited the patch manually or was it created by git?
>>
>> Thanks for your support.
> 
> When you resend, could you start a new thread?  We used to advise people
> to reply to the same thread but these days we always tell people to
> start a new thread for a new version.
> 
> regards,
> dan carpenter
> 

Hi Dorine,

one more thing would be nice. Could you make the Subject more unique? 
Just think about the many patches the maintainer and reviewers have to 
read and recognize for some time. Please add a filename or one of the 
function names.

Thanks for your support.

Bye Philipp
