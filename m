Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A933AB276
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 17:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774374106; cv=none; b=E81atAAKspNx1EAT+BQAXuGszU9lN587f1tM19ktcFJqh+ABYdgvRThbeTyyXodPASuVwQJ82tTi45txIjYASZfYpVQfaPngzMWvZ3sofjkVAjDQ6FYqP+ubD4MNrNx8OxyvxStwFaXC81NEK3RgiaYqNrYjR8Vldqsv2SaVKuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774374106; c=relaxed/simple;
	bh=5wqAQ0bTJmsAKt8oyR53qxfzZ+5Wdt4sMMgNx4PqjDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvriFSzXzlop7LE7UUcx7GFGZ1lqoTj6AJ4ATZCHPaP4tSAosCXqxEd8GaKRJl884c77Hy0FZgsat6xSY6z3IMEvVqvt04GTit9Ahja0VEyt4IgbT6s2HFWVVJIWTk5gaD5xGJm7hqIsRlM7VrYFjNBWwaCGoG0S/iDJ2aYz0MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J45t0b+R; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J45t0b+R"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-464bc03efd8so924038b6e.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 10:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774374103; x=1774978903; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SZS7sCjvuHhpivHZjRZo+N6jfKc3vOgopKpbJzsd0MA=;
        b=J45t0b+R9iV1xYpV3fnTwfv2e1mWvk9INb9I/Ql95THqCyZScqYHySNvKxQzdX50ou
         FOcGKCRZkpdFYMV/fUvAcacaKQ9S/25gMwE8YXsbeb4iY46o0X6LfS4q94WobiyicPw3
         UeDqKZwnM01kN15kdWNBrj+J/P/KpvVE3DYwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774374103; x=1774978903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZS7sCjvuHhpivHZjRZo+N6jfKc3vOgopKpbJzsd0MA=;
        b=NIszPETUZWno3ioDGMvDz4eEpEiSQ4DXYh6cVHf0dEmE5GaEKJXwN7hVwMbrK51dJE
         VJfYsMWTsfU8LPlKv+kBFG7M8UVRFXAXPIqlMIiK2oiJjsHv+skTSu3xazV5qD84fP8q
         GgfTTFXb9ydBENcXrhAaVoWeoMb+Nl8An2LLufCNZnuVoka7EjAOiZOd1PX8zb0iTrUV
         5OCD9Qlx/w8Ujp32bDrIsNvE/czIIt6Jz9g5VrKR71tr1hEazc0Xumaw3lno54bCMLbO
         btj2g2UfEDyLKRDG4/kCkWILb2eXCZbtX8FfEJOliBYtt3Tk1XRy3R9P5w6i277bL92U
         UJSA==
X-Forwarded-Encrypted: i=1; AJvYcCVqUdT+/iW+6kwoem5J15XThFWWFpItoPdGiBA1JMQlDTNjk7JZQgtc4oAKZhz43dx0BZptyvtfazsExmbS@lists.linux.dev
X-Gm-Message-State: AOJu0YxGOyJgHBQHu2jtb6IlIPc7AMpe9xNlxzcoeNMKyYe/xofLY77R
	FCAEKTz4nT/DgCN+z2rU9oDNv4Cli8rQafJiiZXoYFN+HpOs41DfWWPStPXFEe31Y1E=
X-Gm-Gg: ATEYQzw0AM4dEdYYUpVCuFjr6p1v75g4y6rVfDqGIgtrhdEQmH4yPAJZ703QWeZnwNX
	SZHkqDdyUmHz1g9VKle6VC6kei2wiuLrycz/B4/b7ElH4u7ohp0w+o1Gv25L9FgXT/gF/hbjMtQ
	wv0fj3IXlXqekDuoGfDriEIc3ezshg5A8MWLpObuAeiq3fX9PiCVli9FM0QbBzJaBkyrybiQ4uT
	qp3aUhoDZJqQ6SwoTznQxWYoqqRTZL5J1hgw8oBuhD2fWobC88J7MlaBgBj2KKS95NxJH+kGpJl
	jVs+rUg97puaSr0iTY2guDWG46IXu3zkP90WLjRj7sHBww8crC+1+nh3XAl++A+rgCNEB9YtFs8
	xoyFZm1md/p/lH1Y6ATJc0dGfE+3+LgJSk7Fz2vQLEG1GFiroOeRwuHtfgENDAog5Rt98i4HrFY
	QfkBspm5LMehtMEAJlleUaUiIycbInZxCAQ5g=
X-Received: by 2002:a05:6808:1b1e:b0:45c:8f03:1e19 with SMTP id 5614622812f47-46a5c7bfdddmr220230b6e.55.1774374103477;
        Tue, 24 Mar 2026 10:41:43 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-467e7d18ad3sm9498867b6e.1.2026.03.24.10.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 10:41:43 -0700 (PDT)
Message-ID: <656d3bf5-8d97-454e-9691-540cdb79dab4@linuxfoundation.org>
Date: Tue, 24 Mar 2026 11:41:40 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
To: Prithvi <activprithvi@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
 straube.linux@gmail.com, b9788213@gmail.com, ethantidmore06@gmail.com,
 dan.carpenter@linaro.org, weibu@redadmin.org, knavaneeth786@gmail.com,
 ignacio.pena87@gmail.com, dharanitharan725@gmail.com, lukagejak5@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
 khalid@kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <acFtiaXTp7bwl604@ashevche-desk.local>
 <20260324130234.3776tp4ykuerffcg@inspiron>
 <acKU7JjW3OFugHXY@ashevche-desk.local>
 <20260324135551.grth7jfjyoh5krzr@inspiron>
 <acKaP0Jz-VqfmEqj@ashevche-desk.local>
 <20260324160229.f46h25ebd2mxcfiq@inspiron>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260324160229.f46h25ebd2mxcfiq@inspiron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/26 10:02, Prithvi wrote:
> On Tue, Mar 24, 2026 at 04:05:51PM +0200, Andy Shevchenko wrote:
>> On Tue, Mar 24, 2026 at 07:25:51PM +0530, Prithvi wrote:
>>> Sure. Also can you please guide if any testing would be required for these
>>> changes, or I can directly send the v3 patch?
>>
>> It's implied that the author of the patch each time before submission (either
>> a new version of the existing patch or a new patch in general) is tested and
>> validated it.

+1

>>
>> -- 
>> With Best Regards,
>> Andy Shevchenko
>>
>>
> 
> Understood. I agree that patch must be tested and validated every time.
> 
> To be transparent, I do not have access to the physical Realtek hardware,
> so I am unable to perform runtime testing. However, for this v3, I have
> performed compile testing and ensured that the module builds correctly.
> Will this be acceptable for this patch?

No -  Hmm. Aren't you part of Fall mentorship program?

We discussed this several times during the program that when someone
sends a patch, it is implied that they tested the patch. Compile
testing isn't sufficient. The changes in this patch not trivial spelling
fixes in comments either.

  
-	if (1 <= channel && channel <= 14) {
+	if (channel >= 1 && channel <= 14) {

I picked just one and there are more like this one.

These aren't just moving the constant lies to the right side of the test,
they change logic and in some cases removing the code and the change log
doesn't say anything about that.

Did you look into if this conditional can just go away?

-	if (0x00 == PathAOK) {
-	}


I am not the maintainer for this, but as your mentor this isn't acceptable.
I wouldn't take this patch unless these changes are tested on the device.

thanks,
-- Shuah
