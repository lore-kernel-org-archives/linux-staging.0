Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB30127E0D
	for <linux-staging@lists.linux.dev>; Sat,  6 Jul 2024 14:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720275841; cv=none; b=ISFgQ5dtexS/S9tnYVOjrFMG8QjqX08ZbHq8FY+hCzDKJ+H5UJMhtjuuLco8G6/g+r66tDfPYjg07R9cKfzyoTczuImNngBNckvMLvJ3S4fXRK19Ad3yi4hOHKyI1k5VJ35v3+8bXtPK9XN+3pL7TinNso+FfSE3CPOE91osgXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720275841; c=relaxed/simple;
	bh=5yTgALKeZ76fdbq3u+Yz7W/eWNPyh3ZsQrQPYUpXS90=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Z0s8W2r2UJtyfenAB/0HjhGdZiDyMNSQtqtgzVUQT6XiYxOJlkw9di0DE2dQuOaMju1A+uvsxK35w74yN6ZVS/iX3wuOw1bB2gXITQjhBCH9a/ue3qGcormrA704F4y/dZ3mvyNFdPvvAAb4Fp1MBBG2+xOzNTk2kEJ5rHT11yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QODlm4ja; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QODlm4ja"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ce65e0f44so206644e87.0
        for <linux-staging@lists.linux.dev>; Sat, 06 Jul 2024 07:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720275837; x=1720880637; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MUMwLV6505BsBECdLQNLbzOn9+IIGo72PKN55IPpokk=;
        b=QODlm4ja57V1IdUkNWeOHQlnDw9KYoviEZgLp9sH5/egJaDPu7ZM3qPtVQYKwwU2dp
         my7Qh4vRbvCs8nkb1EtZ/g19D+GmITIjx8p8mcofBABvQocZ5sxyaFbXpdr3wOO5bqWP
         XLT2y18JqZU2Fvx9ilx9wpALkNyyoBibgO6sUPnULKNRMWbsJIh8uWQHNR7+x6eDLqZ6
         57bZNk8hYo9daHxJvp0LeGyJ1k3loR95PLmrVFoKF4DSRTbyS4JU7OMDJVxU3w7CLZ0U
         FOJKpaNApg4o/ZPthJA3KGGi30KGoc9F2KUmaaRriwMcIiykVZpli5dA9XrJwvyMf5WQ
         gxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720275837; x=1720880637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUMwLV6505BsBECdLQNLbzOn9+IIGo72PKN55IPpokk=;
        b=d33cptaCUK6R8leBM2Ba6NvLupYHMP/VeZYo6oSs4QMkHjRpdc6KznzTNxwHEZXXok
         IjDWtnvyBC7LTGc6ppBfKSkSseGGpy9L2meqT6WcYlDTVLuMQtz131L6v1VbV2Q9yLyL
         6gnMjMN0/tzFDs7q0N1MM95uV7jR1O1bdwUCSPvtK5EMV8agXIFT1smFO8iMdvkQPyb2
         OwOedmtz5VwEQDUmUEjKw7dNu+1U0oUgVsAb4N49hEwYCX4brCLJc749fOCSRNZxQL1U
         vxi+MQbxO++hxl2QXw9m3SddTAVZRM2cjwG72ohlAdvsbwh9DyoJbzNO4cWjvK1yBoeU
         9wLw==
X-Forwarded-Encrypted: i=1; AJvYcCWcNT4DAsG/+x/0QNoGUaytXWdB+Qww/BDYm5iiU61DKn55MznMEgcoX1A99oqCNvvq6gsiI9MfE9KEp3ruNYhDPLbp/ursYAd62DhjvQ==
X-Gm-Message-State: AOJu0Yylcx+bEsC4gUzVl8yl+mOUn5dv2mHSBCn1+hDXWGTXDujlD6Yk
	NAbumEMZTOF6h3WLpqmHff84fOWHrDysrTQJ7cfuagck6zpODAo6
X-Google-Smtp-Source: AGHT+IG+tHfLWWvemqMxOQPTvsTq+iJgAu8efvK/eJQhTgLidV+4gtztplGVeQeVkV07268jtc8uxw==
X-Received: by 2002:a2e:8710:0:b0:2ee:7e6c:34d7 with SMTP id 38308e7fff4ca-2ee8eda939cmr46691171fa.1.1720275837026;
        Sat, 06 Jul 2024 07:23:57 -0700 (PDT)
Received: from [192.168.0.101] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1dd5dfsm97633825e9.11.2024.07.06.07.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jul 2024 07:23:56 -0700 (PDT)
Message-ID: <bf57e119-d957-484b-be23-ea43811f30e3@gmail.com>
Date: Sat, 6 Jul 2024 16:23:55 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: ks7010: Remove unneeded check in
 ks_wlan_get_range()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Aleksandr Mishin <amishin@t-argos.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Zhang Shurong <zhang_shurong@foxmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20240705204434.10541-1-amishin@t-argos.ru>
 <ZolRoeaPETSmJMGJ@shikoro>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZolRoeaPETSmJMGJ@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/6/24 16:16, Wolfram Sang wrote:
> On Fri, Jul 05, 2024 at 11:44:34PM +0300, Aleksandr Mishin wrote:
>> In ks_wlan_get_range() variable 'i' which value is always 12, is compared
>> to 2. This check is unneeded and should be removed.
>>
>> Remove unneeded check to clean up the code.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
>> Fixes: 13a9930d15b4 ("staging: ks7010: add driver from Nanonote extra-repository")
>> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> 
> I thought this driver was to be removed[1]? Phillip (CCed), what is the
> current status? If you are busy, I can remove it as well...
> 
> [1] https://lore.kernel.org/all/igi27iwrzg3ovgj3sym4gsi45timpkt4vkl5ss5dbftdzat6p4@ctxcjocvunpt/
> 


Hi Wolfram,

no the driver is not removed yet. Planned to do this on the next cycle. 
I did remove two others and wanted to wait some time to see if any 
complains arise. I am a bit scared.

Please always consider: If you do not use the driver, it does not mean 
that anybody else is also not using it.

But may be you are right. I am a bit slow and to hesitant.

I plan to send deletion in 3 weeks.

Bye Philipp
