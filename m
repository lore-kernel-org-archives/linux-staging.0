Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26C3402B97
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 17:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774461464; cv=none; b=Mi+W/cBpeOhO7/IjXPAZ0mK1cQF60jyCrwCl9mOiUvip0KmVeUV5qyWaqvv2e8efolf8cX/tkX9LB2TxLnO5v25VLJa0YAbF3GzXwD/FHYfY+pEmA7ghLZDHs8UjpYBEO5mNqIT9XNZ8EFicxu7k22IUAZemvt2WdBsfCkFcFXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774461464; c=relaxed/simple;
	bh=xvWzPN1nkIFRgvFzDtwDvedSGADAfcokxKB4Zsn6aik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndG+iWLago8GX7Us71XD8o0gr6GxUu32Bk7KpbTIunsFcgfhTvnOuCcC/DxIoQX9lywix5HYBpb96VHU2zYRKBOlmqlh2IiDsxErx181UMomFAEI9zRvvozam/818p2QCcvuxJ9i19pKjijzwq2dT8DKtJK1uhwJEzYAieygAKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=if8z5+TP; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="if8z5+TP"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d4be94eeacso53780a34.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 10:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774461460; x=1775066260; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eY0l7UxVB7jzGuePFfO9KnMG27VpQ3QH8tZoP51PR3Q=;
        b=if8z5+TPuJvNipARSOm2GuFkQUHTjFri/HL+bLihspTLtst+2BwTv+mKL3I6Z6xAca
         QZ/Z4Intr2zL6oN7UfFZidUXb0YoQ/Wjj9AK29ouSH1zClBswUHTEjo5++3GVvDUCC1x
         Tn0fwToQa3jptrMljEK9TlALOrcJ2xybB5fPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774461460; x=1775066260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eY0l7UxVB7jzGuePFfO9KnMG27VpQ3QH8tZoP51PR3Q=;
        b=lyaONRK7F3bHm2ybgBhl7Y5h6wCy+DJEpHfrwRkONFItLg9DiRXLmX61UNgEJ3VJCW
         aiivjLFcficGzimR/erzmbh7aB58IchyXTDIBchiEFYPEfqD4/HLFUM3LNbYGfKR60Zh
         E7nA+qRCW3YSndB+7fqsvQSEegtjQbI7kT56tFhLOR2+1LylsJSsAnjuRwRCvQuXIiCJ
         W8QdCMEsyvyxxokJgrn8H70w8oRLLUX+c0gbz9juG8f/mvZ2zbcdl68q9n+XR6fHnCm0
         nY8+hVhlA7E63YcbMhxCi/I3jIYovQx/3/M07e1Om0AN+Dy2blNH8bedOlRtERehIAbS
         wZwg==
X-Forwarded-Encrypted: i=1; AJvYcCW+KSLUXmYHbPm4JFT+5ukJaXodOHs6ZYyq2KMAhrScVDUI7El2XGmZoOE7VmkrFZNq+EBJYgIHKYJt0/31@lists.linux.dev
X-Gm-Message-State: AOJu0YwXQmGtujtTyBjoTYT3wGGeAS2ES3y3YfkAQeTk4UxWaqPcFfRi
	JpHn6jw6ptYLeQA5tYNpZ2pzemO9kysi9EFOZld2/kPWZN2u8+Tmmjeb+ku8FJFcU4Y=
X-Gm-Gg: ATEYQzx7l4fnNDH/mjvC0/PaGMi4HiTgDlqEFdqC7OcyB3A5ieY1K03tjvkm/RC1oaS
	V9GB/xQ+ur9XJAUUTUbA5MG8Y2QWtS644I7panpGmXHb8gr5jLtBUF3m8pzN1PnID6eCi0qgUyJ
	HrcFKdudAWL38OfAF01B3t2IJR8FdG4LcNoG3IgxXIQkXCYYQP/KdKIkkh39mzgHeUBT6lhH2ix
	rNNs3ZWzo/kX2RrbT7y41xRBD/zWy9FFTl9d2DJSMpxO1iPPBE+LTT9VUtNYm01e6V1buJAYNFF
	aIBOEd0Gh2mWMb4RltgJOyzdJT6qnqi4IAMDs20sRH98Uk53R9xgo8O0J8I2AWTo8z2yLjR5chj
	Srcd+lDZNdxvOKz26cE6tkcugkHaqwgceWWnohq7VHm43qKXmCRUzgnVf3hQ2CjX/524cfukVjz
	N629sGkWUX5AXj5RkV2Xa2wJZbKtvaWdwJ9/o=
X-Received: by 2002:a05:6820:228a:b0:67d:ead4:cf42 with SMTP id 006d021491bc7-67dff57f599mr2161417eaf.62.1774461460434;
        Wed, 25 Mar 2026 10:57:40 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41cc7ad3403sm212627fac.11.2026.03.25.10.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 10:57:39 -0700 (PDT)
Message-ID: <ea43143b-a880-4d15-9fd6-1a4a25abf187@linuxfoundation.org>
Date: Wed, 25 Mar 2026 11:57:38 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Prithvi <activprithvi@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
 straube.linux@gmail.com, b9788213@gmail.com, ethantidmore06@gmail.com,
 weibu@redadmin.org, knavaneeth786@gmail.com, ignacio.pena87@gmail.com,
 dharanitharan725@gmail.com, lukagejak5@gmail.com,
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
 <656d3bf5-8d97-454e-9691-540cdb79dab4@linuxfoundation.org>
 <acONUF2nLAk6uhQs@stanley.mountain>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <acONUF2nLAk6uhQs@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/26 01:22, Dan Carpenter wrote:
> There are a couple of different things happening here.  The mentorship
> program has its own rules.  The rule that people should test their code
> seems like a good rule.

Correct. The goal is to avoid introducing regressions.

> 
> In staging, most of the patches that we apply not tested.  I assumed
> this patch wasn't tested.  Patches like this are not a big deal because
> we can easily review them.  Sometimes, patches change runtime so unless
> it's a security issue, we want those to be tested.
> 
>>
>> -	if (0x00 == PathAOK) {
>> -	}
>>
> 
> We normally wouldn't merge patches which do multiple things at once
> but it doesn't really make sense to reverse this condition around since
> it's dead code so to me it falls under the "related change" category.

My primary concern with this change is that it 10 files changed, with
26 insertions(+), 32 deletions(-)

It can be difficult to find any regressions unless the changes are
tested. I understand it is staging repo, but if we relax the rules
for staging irrespective of the scope of change, it becomes lot
harder to find regressions later. We are essentially leaving the
job of testing to users. Also if ans when the driver is pulled into
mainline, it will inherit the regressions that crept in.

thanks,
-- Shuah

