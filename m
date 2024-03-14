Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D94B1A38D0;
	Thu, 14 Mar 2024 18:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710441932; cv=none; b=k5ZNhho12Wmej3WN6qFgOkRAu4IeQTlWwAjeJufMkIA0mqnldQJl8FOm6TwPBYPdiQQ/FUP/ixR2kUuYgr9yd/mB/CRcFJgPcC4onL4d5iV4os258BhgAbaaPEeW1QmF6QRa//Jys2dRlmdSy04wfylxBeZqFATmvDjXQyZo34E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710441932; c=relaxed/simple;
	bh=IYDfz6vna48Oep/TD3luBPA5A4E5ugq9Q2sKgpeWW3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iGJ8nPwMBIKvUhdwy5I+8A9Ei0/RJPtt5kQK0KUMNWoUob9ClAliQvyfcx5XrJ1z1aC8MhUDJLwbNU5YsH2hrBcWvdCxKeLCVPSzAFyBbA5OMJFQ7WuXia3KqX+0PEtAIzRL279fQ5NiwuFeXdtI8t7avFk2d8K0nsTwX/9qfZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldk8m4tH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldk8m4tH"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33e97e3d97fso349568f8f.1;
        Thu, 14 Mar 2024 11:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710441929; x=1711046729; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V1SApxyil37K7oLWSsMHe52szzCiayoprtM1nK3u3M4=;
        b=ldk8m4tHPJ10OKZu06ocZ7jqp12NYn6ftzlDJ/qm88kG8ZkykMjsHMFxPtNXBiqTHi
         KN5dner/Ifw2NwWCg4N5c54BFg5LeAIa/Hsvo0S0WCQTndRow6pQfYvY8sZLDLxEaj0t
         kCrRJBR5caVFn8AltgZA9+fWrDYA5m891sOeO0F/N4QnzGDUDFBEFneaGCdMgsQ+pG2E
         XX2zBMe5z1e1GNjPLxzz3MH0BPkpkg1vGgC3FC3VY8q3hR2D8YHMFos7Dm6OLqU3IKEN
         nC+zmAgG0PnoHr6zsI6O2Zd4u+f9EUPHy7l/rTzHk5+vIDFQcSB13WG8c51CHH7KPzp9
         fAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710441929; x=1711046729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1SApxyil37K7oLWSsMHe52szzCiayoprtM1nK3u3M4=;
        b=aSjJMRqOQjYnZeLDzMadxZj9ulumtUGB871KlzgnL02Og2WSZLbPVNkMK9UBnUhahI
         /cQ8UP7oe3z6MaqecVjucbk9wEsX148cFnhEMnrCKH82X4qfNnIj+5Tf0xsPdWKZVC0F
         6PX6Vl6xCtFq0RAI/trn14I02CbHJmJ2+MCWyiuug0kxIVDqtfKG169R9ABSTCIDdgT5
         5UYDup1SBq49uY4fpKDsMTyi90n56H/NcEH7iwaaA6t5HfVd7fmPyCCHoaw5ujCHZUp+
         JtNy/z4eC7iAFwgvTdtZDlmqkSecsj5Jm2+NAFDim82m1a2GTkGbGfR16X3vWybBtaPS
         WBrA==
X-Forwarded-Encrypted: i=1; AJvYcCUkuJVDwJb6J93lLx1VLuutjUh7rJtlimG7g3QYm3+nWa+xBlRwEYNiXnOuCIAVXuXbL+vPJC8vkpcL4FKDZBcjb8aAWBqhtfA8/fSCo+fzYETsVKta/8gTsgjlerE649GVBqfo/4fE0g==
X-Gm-Message-State: AOJu0Yxj/1UDuG2qMZ7O/nFrI0B6Q4MoyfYAkrJSvkdADKLutIG3VaHN
	aeV88+Z4CWZHK5948dlm5tDJgsh0VxFnmyB44I7hv2UI5EpRarPg
X-Google-Smtp-Source: AGHT+IFnC9bJWifBudq/TiBKXN0zb+XoN48+W3tYjqz273eReouEU6HPjDEdZfuyHHSaN68cMwkbLg==
X-Received: by 2002:a05:600c:b87:b0:413:ee4c:6aeb with SMTP id fl7-20020a05600c0b8700b00413ee4c6aebmr2032951wmb.3.1710441929039;
        Thu, 14 Mar 2024 11:45:29 -0700 (PDT)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id ay25-20020a5d6f19000000b0033e3cb02cefsm1330577wrb.86.2024.03.14.11.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 11:45:28 -0700 (PDT)
Message-ID: <66b9d80f-94f2-44f5-8ad9-b73caa14bb44@gmail.com>
Date: Thu, 14 Mar 2024 19:45:28 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: vt6655: Remove unused function
 RFbAL7230SelectChannelPostProcess
To: Dan Carpenter <dan.carpenter@linaro.org>, forest@forestbond.com
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, outreachy@lists.linux.dev
References: <20240311035649.25043-1-dorine.a.tipo@gmail.com>
 <20240311060747.32876-1-dorine.a.tipo@gmail.com>
 <36c92e00-213e-4f25-9720-66912b4da56f@moroto.mountain>
 <d0f975e8-3ce4-4a2b-b52e-51b748a8601d@gmail.com>
 <4e162fac-078e-4a37-9a6a-fad186b0d27a@moroto.mountain>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <4e162fac-078e-4a37-9a6a-fad186b0d27a@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/24 07:36, Dan Carpenter wrote:
> On Thu, Mar 14, 2024 at 06:33:58AM +0100, Philipp Hortmann wrote:
>> On 3/11/24 08:31, Dan Carpenter wrote:
>>> The main issue with this patch is that it doesn't apply, but I have a
>>> few other comments as well.
>>>
>>> Why is Forest Bond not on the CC list?  Please use get_maintainer.pl.
>>
>> Hi Dan,
>>
>> reason why some omit Forest Bond is that the emailaddress seems to not exist
>> anymore - find below. Can I issue a patch to change this?
>>
>> Who is then entered to the M: in MAINTAINERS?
>> STAGING - VIA VT665X DRIVERS
>> M:	Forest Bond <forest@alittletooquiet.net>
>> S:	Odd Fixes
>> F:	drivers/staging/vt665?/
>>
> 
> Yeah.  His current email is forest@forestbond.com, but let's mark it as
> orphan.  You actually have this hardware, don't you?  Do you want to
> take over?
> 
> regards,
> dan carpenter
> 

Hi Dan,

I do have vt6655 and vt6656 hardware.
But I have no idea what commitment I am entering into.
Please send me a link to a description of what my obligations are?

Thanks for your support.

Bye Philipp
