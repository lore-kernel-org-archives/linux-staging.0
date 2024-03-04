Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBF262143
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 17:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709575157; cv=none; b=a+EsPNoM91bSldOQ8mbf+zRieGg3+gxBzk5metRrQlcviTbvgU14jvh9FdNLKUspI3igL5LYUhEkXEEVzyRzPfDLZfK41Whq4uESWIYRQT7XeqJpDj1kHY8nd5blYsMEzHJ9dprFjNc7eeEsz1ADbbvEZpUrS5VU5TiE5fLsSx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709575157; c=relaxed/simple;
	bh=QLV4otpC/iCigb560l//jVarJg6qMxWTbZBnLBsPxAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sHJxrKUirZ23EnX0FWFsBdk2Trjt8EgS8NHGpbjzfCVUI01TFWiSBR7Ypoyb9lNlhXsn2Y4wAzA4yxp9yealJgsHY5Q+Bza1mzIodRqAmp6Zx3fpEzRMgvGlq62uh4cFDrhKFzPNEmUbQRjd0v9XrtjwjaMB4I0kNm0HMSBvazI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=KmKLBGf9; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="KmKLBGf9"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so5052759276.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 09:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709575155; x=1710179955; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=thA/I2PqPVLK4SnspFOCxqgcMVG1ux25WaxY6rArXhk=;
        b=KmKLBGf9BZcac8o7aWw4UwdV1kxBox78qK2WoVooHutOdFXkwrPe9Ui9IkK0Ez8Ta5
         MFgzG5Mudzgh3Rpj3ZcQ4WJmTQtGVRpn6zXT6pk81PgH4OSeITGuE83kCB391BkopWR6
         Y+A43M2R443/ajkLtrEbenfBoEJiLlDZBQdHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709575155; x=1710179955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thA/I2PqPVLK4SnspFOCxqgcMVG1ux25WaxY6rArXhk=;
        b=pGb4HnHZCsyPtVfyO27S63cndGiP9r8y2YR7zVp8zYFAFynCl5+Z+MWUCdZhfl/wD8
         EELNvOM9dxAN7tOu6TvIWznzWv+TqPvRPHVtgg8AqXAAy7A3oVSeC3HA7yrCP24oxQZE
         Z3X8xbmEZLY458EJjR5ryQ9qloxuMtgVyNWwJKQQbMKpLMrLHD+I3NUJBM6JSVpdX0Lv
         bTARv4l0zBVK2SqRlyI2fj3ItD2ydfZ4pfCxeZ0uD0njH4OsLT2kFICwVBm8ALNqoLNB
         CBIydLWWVkgqlJeOy0CgronUhze+nVdHNmaXBjL/G4HlTU5crMWjEeEWJGn1aTv+oFl0
         YOyQ==
X-Forwarded-Encrypted: i=1; AJvYcCULQxWRsTxTkqsHhMGJJ5oWKUuxKDuVgZP3DASzbhJshn/rQpA15hR7pXg28nNLpZ2zQ6/588K52eZDAP0Yhk1gnwdLIVFEEo7PHqAcwQ==
X-Gm-Message-State: AOJu0YzEWOsR91lMtFk39eZhNV3csGfZ+Upw222zX896NLDjp6VW1KqG
	k9gXGqdDBuCi0OkRV+rifqY6G3lq5GhH9jvOgoG4MQknCGIEo8+SDJnp41MCxQ==
X-Google-Smtp-Source: AGHT+IExfeM10ZB/js7EB+v7jDmQcldpolr3vewnoOnOzAtVxGnjlDaiuVf+mmkl78AiuvoB2YKsrA==
X-Received: by 2002:a25:68d1:0:b0:dc6:3610:c344 with SMTP id d200-20020a2568d1000000b00dc63610c344mr6983088ybc.13.1709575155031;
        Mon, 04 Mar 2024 09:59:15 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id t106-20020a25aaf3000000b00dcc7b9115fcsm2365520ybi.3.2024.03.04.09.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 09:59:14 -0800 (PST)
Message-ID: <b6cee7a2-d702-4248-977e-25a91c210c93@ieee.org>
Date: Mon, 4 Mar 2024 11:59:13 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: put macro in a do - while loop
Content-Language: en-US
To: Dileep Sankhla <dileepsankhla.ds@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, pure.logic@nexus-software.ie,
 johan@kernel.org, elder@kernel.org
References: <20240225084017.418773-1-dileepsankhla.ds@gmail.com>
 <2024022538-buffoon-praising-f748@gregkh>
 <CAHxc4bsFj1=VFVDWbdwo3W3CmSyPG1585p2zBePpsD9qy6VKdA@mail.gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <CAHxc4bsFj1=VFVDWbdwo3W3CmSyPG1585p2zBePpsD9qy6VKdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/25/24 3:49 AM, Dileep Sankhla wrote:
> On Sun, Feb 25, 2024 at 2:26 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>> Did you test build this?
> 
> Hello Greg,
> 
> Yes. No new warning/error was encountered on building the kernel.

Then your build must not have been compiling your changed
code, because the result of your change produces code that
will not compile successfully.

If you look at where gb_loopback_stats_attrs() is called, it's
used only at outer scope, in "drivers/staging/greybus/loopback.c".

Adding do { ... } while() at outer scope is nonsensical.

> 
>>>   #define gb_loopback_attr(field, type)                                        \
>>>   static ssize_t field##_show(struct device *dev,                              \
>>
>> Why did you only change one if you thought this was a valid change?
> 
> 1. As per my C background, I think no other macros in the above source
> code file need to be enclosed in a do - while loop.

gb_loopback_stats_attrs() must *not* be enclosed in a do..while loop.

> 2. I am writing the patch because of the Eudyptula Challenge, and I
> have to fix "one coding style problem" in any of the files in
> drivers/staging/. The above one was one of them.

I support the challenge.  But you need to be sure your fix actually
works, and in particular (in this case) that it compiles correctly.

					-Alex

> 
> Regards,
> Dileep

