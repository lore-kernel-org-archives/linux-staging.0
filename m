Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249543E47B
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895773; cv=none; b=u6crtNNp7DidUguuWqJAEAh3TBrrevoWqBYsNSgNn7QoEbAiXVds8ZT52XsHuSZupgWmzpGKxvx/Xk92QT8UjI+AUuXJYjnVWTLUVaU90maMGlDyFRLBM5n5SyVTwE2jFD28kSH1Wh7/8HYg9wRH7YwXXPE03c4u9Vp5ST6czi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895773; c=relaxed/simple;
	bh=0FnX3kslkJmARMtmR5XzRR5CxoTQbloPjTXJKUtr1BA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YSZYT7H6hWilDBNsDsAr78lYNZitkodCPYVc98EH3gdHXVvvBGyZIfWt5lTm/ad1DVa0GAtsuFKpIYXbOJ1EJ/tPEFcA+gX7A7LU7RHwu+vgSCUkO3OE8aPBQGXsJ7dc11sIWHNTmm7kGBu8tAWKp92qshGsVFtL0uBPI95WI6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQMYGmvU; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQMYGmvU"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c9850ae22eso284096a12.3
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 01:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728895770; x=1729500570; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/pc6u088b0sZFymIkJ7ThisTP08fpmM8RFfE7zodyE=;
        b=aQMYGmvUHVCGwlNZlKHrFpiFqhl4Bqu0wchmKFKAmCEqwxuFP/qgInsHKBfnHCTt8Q
         b76HmbxtwO94FZSps+AtJT570GdegE4IUihxfMx6oas+Li1jsUdwoVbIhUgA3hbckF8W
         wjNy8YUh7QolxUGamjvfjmz+ktDRVFyw5YEkSn6Xfj8VS7tvn15+747UMLdk3I4igrtD
         uVqyEzZYOxuVjJykcxEEyo7hwtEeRKwQDiLsOR0helhzgxhZkH3tUkHtvy5lHBh9b3kt
         CtF9B0fQVht3GrNZ+JTddVYwKaVI25rSmQ6TgRYJ1/lIG2qanhRlPV0qqEibMAIzP8IB
         7CTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728895770; x=1729500570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/pc6u088b0sZFymIkJ7ThisTP08fpmM8RFfE7zodyE=;
        b=XBEoQ8opjT+G/eT3W/DJ0G9OGLucXZj9DaevT4v+QMOp0T9+3+EWv8qx6N2HM39t/m
         rtWrSIObfIIIGlxEc5v2ElzVfdkcA6oQZ+6oxDOnYCHwgvhNr4cRDKGD1tL/jdxyBYug
         B4ShgJFcpXUiW0RGPb9o9FoNXsUdLrZbVcde9wPLMWf2Vx81fTVpRUXtOBe9VGwCPxCU
         LHdYKbdrdgA3O/dSJqxu8r84RCsgC0glwciEm1YHp/wQ+DIitFtDAYg3W5pwTwvmyc2Q
         5kneS/w8NxYmFgpLRT53PtADNr/C5AjzzYaTMJCsqFJmf9KPxcS+NdShvFXsVjAR8nLx
         HY+g==
X-Forwarded-Encrypted: i=1; AJvYcCUnTOGo2WguNJpUOzNUloARn5Lb6kLGSRJB82j4r1clWG42bCT7KU5d3JdP0iXS6VtwIyEZhzSxHq4t+Rmo@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2CPRc5q1XUGCTgb40OicU9nIR7YnokNDlt1rmzU/N7D118g44
	8yHvj91JAGk2T5z3FZ7iER7u2QcSQuALHcUIcGUhg95NN/CkxNSgpnYB289+
X-Google-Smtp-Source: AGHT+IF7onz7xq/lQNOnFDIr2wn5OnIJSIVfCPqEkOhi3dcJunRv41jwKHXl3xS+WE+yHR/3TgQkHQ==
X-Received: by 2002:a05:6402:1e8c:b0:5c9:806a:c921 with SMTP id 4fb4d7f45d1cf-5c9806ad393mr940321a12.32.1728895770364;
        Mon, 14 Oct 2024 01:49:30 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937260964sm4639710a12.69.2024.10.14.01.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 01:49:29 -0700 (PDT)
Message-ID: <a3a8418a-57f2-4f3e-80a3-011de2af1296@gmail.com>
Date: Mon, 14 Oct 2024 10:49:28 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vchiq_arm: Fix missing refcount decrement in
 error path for fw_node
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stefan Wahren <wahrenst@gmx.net>, Umang Jain <umang.jain@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241013-vchiq_arm-of_node_put-v1-1-f72b2a6e47d0@gmail.com>
 <a4283afc-f869-4048-90b4-1775acb9adda@stanley.mountain>
 <47c7694c-25e1-4fe1-ae3c-855178d3d065@gmail.com>
 <767f08b7-be82-4b5e-bf82-3aa012a2ca5a@stanley.mountain>
 <8c0bbde9-aba9-433f-b36b-2d467f6a1b66@gmail.com>
 <20d12a96-c06b-4204-9a57-69a4bac02867@stanley.mountain>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20d12a96-c06b-4204-9a57-69a4bac02867@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2024 10:39, Dan Carpenter wrote:
> On Mon, Oct 14, 2024 at 10:15:25AM +0200, Javier Carrasco wrote:
>> On 14/10/2024 10:12, Dan Carpenter wrote:
>>> On Mon, Oct 14, 2024 at 09:59:49AM +0200, Javier Carrasco wrote:
>>>> This approach is great as long as the maintainer accepts mid-scope
>>>> variable declaration and the goto instructions get refactored, as stated
>>>> in cleanup.h.
>>>>
>>>> The first point is not being that problematic so far, but the second one
>>>> is trickier, and we all have to take special care to avoid such issues,
>>>> even if they don't look dangerous in the current code, because adding a
>>>> goto where there cleanup attribute is already used can be overlooked as
>>>> well.
>>>>
>>>
>>> To be honest, I don't really understand this paragraph.  I think maybe you're
>>> talking about if we declare the variable at the top and forget to initialize it
>>> to NULL?  It leads to an uninitialized variable if we exit the function before
>>> it is initialized.
>>>
>>
>> No, I am talking about declaring the variable mid-scope, and later on
>> adding a goto before that declaration in a different patch, let's say
>> far above the variable declaration. As soon as a goto is added, care
>> must be taken to make sure that we don't have variables with the cleanup
>> attribute in the scope. Just something to take into account.
>>
> 
> Huh.  That's an interesting point.  If you have:
> 
> 	if (ret)
> 		goto done;
> 
> 	struct device_node *fw_node __free(device_node) = something;
> 
> Then fw_node isn't initialized when we get to done.  However, in my simple test
> this triggered a build failure with Clang so I believe we would catch this sort
> of bug pretty quickly.
> 
> regards,
> dan carpenter
> 

Yes, the only pity is that GCC (I guess still the most common compiler
for the Linux kernel) stays silent, and it happily builds a buggy image.
But as you said, the patch will trigger some alarms as soon as it is
sent upstream.

In this particular case, and as Greg pointed out, that is not a real
threat anyway. My digression comes to an end, and v2 is on its way.

Thanks and best regards,
Javier Carrasco
