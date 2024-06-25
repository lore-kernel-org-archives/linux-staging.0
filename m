Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A100D45BE3
	for <linux-staging@lists.linux.dev>; Tue, 25 Jun 2024 20:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719348326; cv=none; b=fpKTCpKSRNw5JizvkZsO2XuPmXjH/GbF3RyzWpgL0mMcs8z23EnnB3m8eh+v72uJ0rxNeNS4T22Or1cYE8SQimDOLOUVBjZPzIiBWEgubry/GsWjx+S3e6jhPNsJos8p4VuXdDMYBSzqTHug2cSvnKX8aADhDB0Frlpojouic8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719348326; c=relaxed/simple;
	bh=/nsH//Z58Fd2Su+RbE5/otjnSFauqQGQOzv899HhbUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X80g4ja4xcZemVO+ZOrfkeYw2eykW82sgg7pG71e7g7etBFV9jBbsatH7sgaI+qwqChcd8HAl05AIpiNVPVctMmN+6nLA4rkWWaDHABoJurVAJ0DdJJyMYKTRP5PAJuSmKYszovAEZJSzanA9eBSOSTOJ15eJD9HJKPx2Ljh7+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6+bLKD7; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6+bLKD7"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57d106f4025so878198a12.1
        for <linux-staging@lists.linux.dev>; Tue, 25 Jun 2024 13:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719348323; x=1719953123; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQ3OA/LDSmF2zaAN/8y+noIQOtUwx5jM6T2eNySOdXk=;
        b=F6+bLKD7qPKCUiLMCbcZE3M9ofKxFpV0WOXU0iAeKZPilss8b7xTPo7WO8GG1Iloo5
         4WdNzCFu1QJqzjvsjshBb4xU89coVCVWXp5WYwdYUJ+x8iGuwDzaVNaUDFJbH49oYBpT
         zmMQV+to+vQxpy4DIdjFWjSgcI+4BAOCvEoFYh226fMI41jX63+kpzPPSkQLX8fCdE6I
         9QAU59gNdi75/HgWRxoLt5pjlKEvv9sv5fbBKYk1uvDvoWWxOtBW59vLHsV69Q0gEPVp
         jyy27V5raiKrru+zVfFdpR2MoELuA1/3J/CyG984FOAVQ2/YYNycIbYLYauKDX9HX4zp
         Q7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719348323; x=1719953123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQ3OA/LDSmF2zaAN/8y+noIQOtUwx5jM6T2eNySOdXk=;
        b=X8r1ty6ZAp17MHFEZdfVKxGbBpYU8lqCpCjdSNsclTw0iYpwkmbWBqydstkGTOcTaq
         kwXIc+3G9jWr0pRMGf9MuvLMry7v90fHs8/rLSVbvLLMjlw897oOVHCdfj9zam/wGzju
         bXFJx2Q6N21W7MsfTKTmWWwaBuasvLndBG27d7IHIFKssdLneYLLO1Ab/PVRwxfiRXGP
         x9ful5CLUdwhOnaRaYw5LTDKdGh+zr3Tyeyz6jb70SO/3ictda7Y5l4yS64BgnPdjIZ0
         DIBnZL6kcDCE5ty4EDHLBasnyQJlQ4OmhTr8xyOCFNtphEmsASDOYKZYHD4qfy2ZCimr
         V5oA==
X-Gm-Message-State: AOJu0Yy3PNZHPWT/mSxhhmG9f6sT1TDCzlv1M1BfrWV+snt0sRRxzB7j
	n2pAWccLqrcPhn3AQQUpznFxNOnYpOKr42V0Tydg9omJZNtJ+R+aDxEXIQ==
X-Google-Smtp-Source: AGHT+IGBK4hVsbAAo4sMicnCRuHFBADiR353JtC4ouwVvbn9y9bJCYaZXXkBTyjCrp37mv2tH6tDXQ==
X-Received: by 2002:a17:906:4f0d:b0:a70:4217:5c8b with SMTP id a640c23a62f3a-a70421765b2mr661333766b.0.1719348322594;
        Tue, 25 Jun 2024 13:45:22 -0700 (PDT)
Received: from [192.168.0.103] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf4ba625sm547783766b.93.2024.06.25.13.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 13:45:22 -0700 (PDT)
Message-ID: <b3d9f694-77c4-45f4-a436-c00a7d6df61a@gmail.com>
Date: Tue, 25 Jun 2024 22:45:21 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Staging: rtl8192e: rtllib_rx: fixed alignment
To: Yusef Aslam <yuzi54780@outlook.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <CWLP265MB651697C43A8A396DE8989CD8FDD52@CWLP265MB6516.GBRP265.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <CWLP265MB651697C43A8A396DE8989CD8FDD52@CWLP265MB6516.GBRP265.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/24 17:28, Yusef Aslam wrote:
>  From 3acc0622bca28c1a00696e7abd7c305ca5ad1f72 Mon Sep 17 00:00:00 2001
> From: Yusef Aslam<YUZi54780@outlook.com>
> Date: Tue, 25 Jun 2024 15:03:08 +0100
> Subject: [PATCH] Staging: rtl8192e: rtllib_rx: fixed alignment
> 
> Fixed alignment.
> 
> Signed-off-by: Yusef Aslam<YUZi54780@outlook.com>


Hi Yusef,

OK the emailaddress of greg was wrong. But you cannot just resend. You 
need to make a change history.

If you send in a third version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Your next patch will be a v3 as this was v2.

Thanks

Bye Philipp
