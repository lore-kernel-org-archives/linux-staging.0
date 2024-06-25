Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD8917D342
	for <linux-staging@lists.linux.dev>; Tue, 25 Jun 2024 20:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719348105; cv=none; b=baSctt8y5e2u2p6LysDOPxgw2zmpQxANyXiQ7mhoKxOemTSHahl6SjzqUvojs7G4QKwpA9y7/QVMEGsI+b/nYTq3vd4dUEeuExxznehaFQlSJTbEMfGH9lMUNJQTdkT7RKJxCbPlhXYcSu1564GKPsGz3728g8y/7Jz5FWrHYI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719348105; c=relaxed/simple;
	bh=v4bIIXMSSC0LaXZqyDX6rTDcuqrMuULpKD9l4Xlfw2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDaeivU12sZ9WKBX9FM9vHVVrzLYUVrtqKDdUFD2mDTVc+VXdszB9S/YYNJTachnfhLU2112AA6gdqzpTMzoHuG3ObRVzJMWrjeppp+yPBZCtHzM6RKGDYtbW1N1sxvzsMXZRXa9uCbeEfAKQwcYn/qTYHq7Aw14/R8KYVVO58I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmBsJVkL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmBsJVkL"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4212b102935so5148955e9.2
        for <linux-staging@lists.linux.dev>; Tue, 25 Jun 2024 13:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719348101; x=1719952901; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/9KE0BK0ee2qg6LCrOG48n+PXoynes4UpdD40xRo2s=;
        b=QmBsJVkLzVF52Bpc3aRK5TdlIRgP/pv3AqlM7wwRVBWOed5hnx87jkOLlB/ekY8aDh
         rl0L1Q6ly1mACBMauDMMUUu6UzJueHDwZEabA+m9lrHvjOkAD38DKRbIjiuVv5sO53yr
         t97fxDphWbLJYjiqZQtzWQPVZvAJnSU1gf0rBEjnKogtWG+GbriSGN7vXx72evVUQo3q
         x/Qb0rVaghWbVpj2ZKXnIB1BBlRObOfNa3z8KcnhH8Uc4/Fg/FGsVzjp6qvrNbbv0LrU
         9jkALbXY2gS+wqcWZgVU0TJBJOvUAq81K3TNZRgYitYbwBckjI532e6MhRFIwQ/RCJb6
         sfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719348101; x=1719952901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/9KE0BK0ee2qg6LCrOG48n+PXoynes4UpdD40xRo2s=;
        b=pyhKb8ltrgbm/0WTzdzgfek0qmaAS6DcMbCamisepgTi7s+Nj1RSfCNIYBKEpTdi+N
         R49s+t5XeQZlBLTprqxqwmmlYEYhQ9BwxKTxl9gt/nc9104d3yNvwP0BSq45KG3O4+OV
         4o1HqqPQawnPU+gzCrh5FND3tD6+MAEMcOEXzblH4s+C/ybnm2utPlyd70zijfTcHvpV
         HCsd95z1hAuNLQu8aTiXFSb8ElQ6MVHsEdRAbiFYeMpVfU3HrsaB+6eVGbRMqycRrBIG
         KudBFVJGTrFTNoRjqpINOmdkmEHX1FdPeX/PYHUEo0kZ1AKmhU/DZYIN601UuoPTy0lZ
         c1eQ==
X-Gm-Message-State: AOJu0YxiOxHIV9YNuFMyro/8NuWWK9HBb5ad9Ap2Ii0u7vv9WusiI7Cr
	HgtIqgsVunc2vTJhPcSEFQ9g9k5mF+r+wNnI90CmTvy+FlxvGItA
X-Google-Smtp-Source: AGHT+IHOqxNKCJ8QakIaa6HNPUZRURWVbtfQaLA0Jy9yfw3+xWjqYZUBYRNbRPxAOYsIk2fGWsTHlg==
X-Received: by 2002:a05:600c:860f:b0:424:892e:4c4e with SMTP id 5b1f17b1804b1-424892e4f49mr73041675e9.1.1719348100971;
        Tue, 25 Jun 2024 13:41:40 -0700 (PDT)
Received: from [192.168.0.103] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c82519bdsm622985e9.13.2024.06.25.13.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 13:41:40 -0700 (PDT)
Message-ID: <eb6adf15-d56b-4a23-8833-b9340081614f@gmail.com>
Date: Tue, 25 Jun 2024 22:41:39 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Staging: rtl8192e: rtllib_rx: fixed alignment
To: Yusef Aslam <yuzi54780@outlook.com>, greg-kh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <CWLP265MB6516C4904E979DB10F00F9F8FDD52@CWLP265MB6516.GBRP265.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <CWLP265MB6516C4904E979DB10F00F9F8FDD52@CWLP265MB6516.GBRP265.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/24 17:25, Yusef Aslam wrote:
> ixed alignment.From 3acc0622bca28c1a00696e7abd7c305ca5ad1f72 Mon Sep 17 00:00:00 2001
> From: Yusef Aslam<YUZi54780@outlook.com>
> Date: Tue, 25 Jun 2024 15:03:08 +0100
> Subject: [PATCH] Staging: rtl8192e: rtllib_rx: fixed alignment
> 
> Fixed alignment.
> 
> Signed-off-by: Yusef Aslam<YUZi54780@outlook.com>
> ---
>   drivers/staging/rtl8192e/rtllib_rx.c | 98 ++++++++++++++--------------
>   1 file changed, 49 insertions(+), 49 deletions(-)

Hi Yusef,

I cannot apply your patch.

Please check against which git repo you develop.

git remote show origin
* remote origin
   Fetch URL: 
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
...
git branch -a
my branch: staging-testing

Thanks

Bye Philipp
