Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04901C2DC5
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 19:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726168169; cv=none; b=JPLzPOq9r13tihnlPDyiAFerO0/AVjwZ12qo3u1v8aCbCvcAJBazaq7S7BeKbm+s4bdZICQE1AXqSVkjM+3n/jORq56ChD0qtwgQ9kSzCYtmqbt3g2L7DWSTNGAUOo/Pl4gQsAanqJNnkmsF9sqMDDLNHVTMdgQG/Wq5C8JFuFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726168169; c=relaxed/simple;
	bh=RIZ6UHMWXZJemRm/+dKzRuGaErQaocw672nPCSORCRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TiqmbtZ6BUAVGKWJfS3Fbez1Y0nS30hw3PAMBcNeptR25Hy2Cm5f/tH289Do+21xSUJMDVkd4KTKTqsQ+6BH1JcLDKFV8nD/849uuQPTJj8MChQGmHb7rzhOlW7cSbHStqCHShEPcFBvGf593kGQUlBHywa1ZN1csZChgsJ6HXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIPuCQNj; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIPuCQNj"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f761cfa5e6so2808991fa.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 12:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726168165; x=1726772965; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gA1EZdK+FIlhj8yx6CB1xUSnqvOWPyr9g86P+6dBE6o=;
        b=lIPuCQNjqhysZS9A4/0Uf+G3sBIXsGBsTWYaLcGWnB3DK9LdNlX1QbxbYrns+q+JmY
         R/0ZrFm6exfionqYiNKAZaqglXsTUbVc2P5huWOv1SaNuRPM0f3cx1ItXkx96ifwMYkF
         61u4NEIEDsJoOVqYrT5N//EQNya/hWyTDUNtrj3fg26sYqAcmSiFLqLy6JvFuaCIADcW
         Fw/sJGy78LXWCGU2ecvpjrAia5jcMELHNYnrSie3KZCaaXkAKJ7Iqfhwjb5APFgaK7GN
         dO/QzaLqZviS7LRmAbVM0OvZpp4GxtBJFt74hZzkDRyDhU3k91E99U4P1cpaiHyBdted
         BCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726168165; x=1726772965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gA1EZdK+FIlhj8yx6CB1xUSnqvOWPyr9g86P+6dBE6o=;
        b=amkQiNH4fXkhLXTjNH7lb5+OsICV7UFUobIYX/3Yjj+PqabSuyIb0Falo2aw32CPPi
         dDXjurQ1NlCue6sDZ86EamqblAdvVSi8NxOb7eEzQh3+RcxWhuUVOOlg2JezyKjpAHzL
         WuQBB9feMEBKMazpxWpfAc3+UDvvU9oSElm9E9INBIaAzr7+grL3VKo8DTr6NNpfKFDm
         42hwjr9L9864NjDYA0RrHkkFcVMm/JLT8YCHEqHHT0Ve9JbXgm3EMZTP2P/hLyW1Cc1E
         L/jI+CYXCnLjHbYWhprm+0hSkUhpIqV1DnVW39vO9SnIghtxSctmT48z0LiaY3ZYt3OM
         fPUA==
X-Forwarded-Encrypted: i=1; AJvYcCXRVg2i2fTaZ7A1880GJSwHg9EedDYL9sbCoHX/RFwuTsBaiuWTTyxz6EOpim01tv61iSWZDWCxxQtDZBAC@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0QmvX/VaFWSxZyj4eTAeKAznNWrMhwxakXpY6MTZQ5j9mzKcc
	ria7ZeYmy7xJY+TMc8/PwQIQkHJeRQ/ark1+7kK42x5BpFzv3A3o
X-Google-Smtp-Source: AGHT+IHLbqMRSyfw7vNBoZ2CJ+MAXkLxljrCR57eGq3uZHtcHPjP2eILjkvD9eIW2nNJ7KE8spebDw==
X-Received: by 2002:a2e:e09:0:b0:2f6:4f17:aead with SMTP id 38308e7fff4ca-2f791a02290mr1702631fa.21.1726168164175;
        Thu, 12 Sep 2024 12:09:24 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8557:476b:8cfa:99ee:514e? (p200300c78f2a8557476b8cfa99ee514e.dip0.t-ipconnect.de. [2003:c7:8f2a:8557:476b:8cfa:99ee:514e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd76edasm6859788a12.77.2024.09.12.12.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 12:09:23 -0700 (PDT)
Message-ID: <65c67cb1-59d5-45dd-9e05-6b82a0f0181f@gmail.com>
Date: Thu, 12 Sep 2024 21:09:22 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] staging: vt6655: Rename variable apTD0Rings
To: Xingquan Liu <b1n@b1n.io>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240912162609.21517-1-b1n@b1n.io>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240912162609.21517-1-b1n@b1n.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/24 18:26, Xingquan Liu wrote:
> Rename variable apTD0Rings to ap_td0_rings
> to fix checkpatch warning Avoid CamelCase.
> 
> Signed-off-by: Xingquan Liu<b1n@b1n.io>
> ---
>   drivers/staging/vt6655/card.c        |  6 +++---
>   drivers/staging/vt6655/device.h      |  2 +-
>   drivers/staging/vt6655/device_main.c | 14 +++++++-------
>   3 files changed, 11 insertions(+), 11 deletions(-)

Hi Xingquan,

Please use a change history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
So your next patch is v3.

Please do not break lines of the description to early. Up to 75 
characters can be used.

Thanks for your support.

Bye Philipp
