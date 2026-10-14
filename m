Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8FA2D0C72
	for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984785; cv=none; b=epdp5rEvbsHw1lwsEwZ0oC6axK1ESlVpIRQUfOOHxEZCy+4E7nNOtvePSFHWfIaVl/gUdc+nGbkIT1h2UOzvsmuPLe9ZOPxMm0VglTsE3VB0smSfyT+TGkZ+hu+2TTlSz9ZW4vdfdUJ4ZCFQ8AkM4qa79utlgbhIdGFxe9Auffg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984785; c=relaxed/simple;
	bh=SPu80Je3dTPDgjXd/xtDzro2TjdOg+amy0NWrDljosw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NPX6L3dh23BFoMIGgnN3tA04JLB80CbCEVo9IRejkZBXcbtMV99FfgQlpmd5FXw4k0cmBQEQBRF8qzak+o7bu2XCO8ccX/TQmqy69ABiLhMQjn8egHTgYIykkZjVYgsZuJmlxiy+GeyVZQH2Tvep3LZGTb4DiE3gqDMJZBRdnAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=CFUoMUq9; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="CFUoMUq9"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-917d595138fso2654496d6.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 06:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1791984777; x=1792589577; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73j1Xe+ZfqaJi3on6arYGnmiJ9i1fPqoI4qWuMUvRuk=;
        b=CFUoMUq9mwNB6eRycjyvZV39J84fWGzW7QjOprnZijcbx/JrHTx/4Nbegw7QOnmecc
         BjhV3uhDtLJuoJMB0QKsZ7BVLCriA4Z9ZMngFcKWAEK87nbysEuFvjgJRy6r/clr+wmu
         opzZaqhi/6sRkOC+GVOCOrQvcrR6GgdIOC01Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984777; x=1792589577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73j1Xe+ZfqaJi3on6arYGnmiJ9i1fPqoI4qWuMUvRuk=;
        b=gTWcokGto6LxdFVf7EHOOqatqGmc4IDP0zvBQhZmokSPJWEtEOkInCwaTpjH+urVVa
         hmrXXyq7kIzV+0grWr4Htp8Kn08oDxvQajNZk1t8kVSxWnhBPDaNo/1b8JcbWWs5HaYG
         4rIHSJNb9aUYVEWC/6HsHsQPKF/i01WT4walj3vifqZriTa5Mig+N7B4UEg5ujB5yY7s
         6A9hkKrxE+QLi9YJDHY5+x5WCU8JdXbudo0ORd7umT6XwfDSeQP8EX+hoUc+xtKlIF6O
         420wTYT7AopYtxWXnDxdU9y4jFwwhhBOO5i9cYImi4Cd/yWXu6sn4bxMFG/w93VtqNAv
         wTYw==
X-Forwarded-Encrypted: i=1; AKwUvBwBGfhwivmV9QQzknA/ZrnJfpj4lGNiRUekj2cRO80VXg6So1ZlFZ36MDac/AjlSBHOkpN68ZdK0XvqUl3e@lists.linux.dev
X-Gm-Message-State: AFq9FYK7U+nmMcqBn1+Cxdcbqd4gVsjMWVPGmWfg2l9qxRzI8oDzsbEf
	TZJNfBPenglOfxF3OUqUgwCZMiCII1WjUjGIcS85Y3KKIMW2xCoktC7kyugFdL+5zg==
X-Gm-Gg: AYBFou3vlBCgRLGFzyTAK4r6gUMkUPZly6X74DDcdJnUQQ+xIhKgA0GS6HxZNplQ+6/
	oVwMb/BkkXh/hfoOInyC2gVpGxaZx+eQXyuMaPUsegyLVqI7FI8PN1ZgU+dIEAMHoHM8Ka0hb6M
	eB86a4nTUjImAmg/Y/ovTjI5rr3UqtIJppD9R2gXXB+30gdXHWSf9iFrTc3YoMczff/C4GMv4Lk
	N+dNmkN4KvENk2CVyvqixdFNdbfeawKDLu54qR7Vb2nyTXMzhwROlaec78KQb1baNk+xdT9Z5ux
	tVogyEXd5S22+xVaLJODrU9+NkHM9JC3om74LX9yi9f7JVeottryDIb63WKeqMta+1vbd/qvKrW
	z2KFddrayGGDA7qCjA7D3pUjLsOo5aGhYBZ6/YlK+BLezbZokxhNmEMFZLS2bggFj1dyBDwsK8i
	5AZHR7JucYgXsBXsihUXvyLOMLLcEPFvO0XPIvZS6FrgX7Lok525YpVsGF/57Mz2yN+w==
X-Received: by 2002:a05:6214:f62:b0:914:4bd3:d98a with SMTP id 6a1803df08f44-91b554ec1admr254244676d6.14.1791984776796;
        Wed, 14 Oct 2026 06:32:56 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-91b97b62225sm53259996d6.19.2026.10.14.06.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:32:56 -0700 (PDT)
Message-ID: <26a2a4af-5d27-4bd5-b284-3758fa7a67b2@ieee.org>
Date: Wed, 14 Oct 2026 08:32:54 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: greybus: replace PTR_ERR() with %pe in error
 messages
To: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Cc: johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org,
 elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev, gservice341@gmail.com
References: <20261013022402.6322-1-pavankumaryalagada@gmail.com>
 <2fd23f9b-7eab-4afd-aa77-93a5b9ff0c75@ieee.org> <as6mC7sZnpqIKxN6@user>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <as6mC7sZnpqIKxN6@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 4:43 PM, Yalagada Pavan Kumar wrote:
>> I think your suggested change is a net positive, but
>> doing it in some spots but not others means it is
>> adding a bit of inconsistency.
> I agree that similar cases elsewhere in Greybus are worth
> checking to keep error reporting consistent. I will look
> at the other Greybus files for cases where using %pe would
> be appropriate.
> 
> Would you prefer me to extend this change to the other
> relevant Greybus files, or keep this patch focused on
> fw-core.c and submit a separate patch for the remaining
> changes?

I guess I mainly wanted to understand your intent.  I don't
really mind your proposed change, but I would really prefer
to have it be part of an overall plan to upgrade all error
messages this way.

Ideally error (and other) messages are done consistently,
and so changing them in just one file sort of raises a flag
for me.

Can you survey the messages elsewhere in the Greybus code
and get a sense of how much work it will be to do this
comprehensively?  Your current patch affects four spots in
one source file; how many others would there be?

And if updating everything is a task you're willing to do,
then I think I would prefer you extend this change.

					-Alex
