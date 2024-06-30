Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B16839FF3
	for <linux-staging@lists.linux.dev>; Sun, 30 Jun 2024 07:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719732987; cv=none; b=RYuBocdUN7ayphCbNOqLdgvna6S/00PXF4PitlBq1ug/dQWEp3hMUK5dEW4mvV9NEhjCX8dpIQz5leq4aIu1zm8vi0E9kdKY7vWQz1SlqqmlkGj8ttggkCJ0Ege35/OikZxvNFhMQN6kRRt2fRUSOkRC5Ay2hsy+suVkm9uWEJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719732987; c=relaxed/simple;
	bh=K1yqXabSmtFTytE5tJ/NwZ60gj1gIUj2rF6t5hWQhb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tpYVaNUpPDkW9p5ZY2HKUeHBPs3/zFJMbvmMc9sB3poppTGL4WzqvJGT0idVSfoYBvIStepqjMjNPxC/Sv5pPs4TzNR2045tObHUCEPRe4YxIUFCGQZ+n6jObNgGR0fayWs2IleL2L1y7aHS83Ob6zNhEfnKSYPWR4rd2194mFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsx4aPiJ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsx4aPiJ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57d16069321so295878a12.2
        for <linux-staging@lists.linux.dev>; Sun, 30 Jun 2024 00:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719732984; x=1720337784; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVieZ92jBl/CzR6Z48+iNSy4zfBATYYDszkc1x7Stus=;
        b=lsx4aPiJRTBtMu1hs8MRRbsqBNiD+xpKOLBwTQEiJE2k3xpEaLu1L8MBozw2uy2k9j
         ai16AkqjscqFb7tgVYxTSjyKXadfCKK80yM7tP2T2lgJW1YG413l3CwX/NIzW4y/YcY+
         FogUTgNsTtsJvb7APPG6McQEAFXst534OuFnHdQCGO1dGUeNbsC87eBr+PxXjrMhCEbj
         XtXlylKvxsGKnFyO0z1KMBBSfBTNo9CpfLZ6291sJMbQWyQ6TiOeKgGk1WgOihkd2l70
         r68UEWIvzztAFx6SkB0RE+onU8/zfR46zCf2cOV0mFa3SViGnSVHrUiexjlLg9CBhV9x
         sqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719732984; x=1720337784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVieZ92jBl/CzR6Z48+iNSy4zfBATYYDszkc1x7Stus=;
        b=XyhZz6PrSiuDYXaM8fe7wLa2iGwYOfJNUKbvIMm3P9oB0E+ZRlmr8V3o7gJfys97D1
         jU7Iyhxs3XnCUHZEGU50sGJgdGZ1DlSeR15fhbP60QBSKZjl3Va5ilk8NqrJzgCv7aNh
         vN43H9OMdea6ST3+24WZVwOiPm8j0+9CiaVcHfjjomGUIfkmvCiDRTYdjQ/fW/jNHjSJ
         sMFgouuBpTzknvNmapC1yLzx1+8sHvd6Fgmb3emdvHFJDiOJaWLx7K0ltg+16lQ9gw1h
         ANWzN8JjHGRTvNZ3R6NUderrDk6qL/yYyqn6k2/MsropDSHIz3xmERUyn/cxbwOfqd1u
         UXAw==
X-Gm-Message-State: AOJu0YzUjsnTjrf4l5zio1KcJHUTWE0e3dSemp9erkbMnOQN8x16onLh
	fuDA3Anmj53A053wIMmw/YFqHqG/UYADf/+kf9V/oqED8gjwy3w1
X-Google-Smtp-Source: AGHT+IGfd4k2I6+RoqvedQxvg5gbs6CEm3OyhzbhPXQ1ph2NJ25JDEw0LI2JIhi4R/tL3Y12XcOmgg==
X-Received: by 2002:a17:907:7213:b0:a72:b5c7:d635 with SMTP id a640c23a62f3a-a751459c4f1mr168176166b.4.1719732983559;
        Sun, 30 Jun 2024 00:36:23 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7315bc5185sm134339166b.41.2024.06.30.00.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jun 2024 00:36:23 -0700 (PDT)
Message-ID: <43cae9ee-e05e-4447-a62d-eac8307e9670@gmail.com>
Date: Sun, 30 Jun 2024 09:36:22 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Staging: rtl8192e: rtllib_rx: fix alignment
To: Bagas Sanjaya <bagasdotme@gmail.com>, Yusef Aslam <yuzi54780@outlook.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>
References: <CWLP265MB65165E806F938F87CB67BF87FDD62@CWLP265MB6516.GBRP265.PROD.OUTLOOK.COM>
 <2024062727-diabolic-lusty-7baf@gregkh>
 <CWLP265MB6516AB499D407C0AB0CF106EFDD72@CWLP265MB6516.GBRP265.PROD.OUTLOOK.COM>
 <ZoCeul3pAjZLOT8E@archie.me>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZoCeul3pAjZLOT8E@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/24 01:54, Bagas Sanjaya wrote:
> On Thu, Jun 27, 2024 at 07:09:50PM +0100, Yusef Aslam wrote:
>> On Thu, 2024-06-27 at 15:43 +0200, Greg KH wrote:
>>> This all should not be in the body of the email, please use a tool
>>> like
>>> 'git send-email' to send patches.
>>
>> Oh k thanks, I was trying to use git send-email but in the end I just
>> copy pasted the email into Evolution as msmtp was not sending emails
>> for some reason.
> 
> Authentication issues?
> 
> Confused...
> 

Hi Yusef,

I use gmail. There I have 2-factor authentication enabled. I am sending 
my patches in via mutt. To be able to use mutt I have to create a 
app-password especially for mutt. I have no clue if you need to do 
something similar for outlook.com. I recommend to use gmail for sending 
in patches.

Feel free to write to me directly for further questions.

Bye Philipp
