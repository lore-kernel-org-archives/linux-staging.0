Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BA123ABBD
	for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 16:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771085436; cv=none; b=cHmti29V29W6+e2E2Iv7ljDh1IA/iQm0ZTe6uFskxCDxjSysI55M1l0SryaXaJMXZ7Wc58K33igvzIyR6ZK+w3Hq+Hh91fRRVgEF02qGFNn9yWSQ1aEI/bVMdyBM4OiURPKlIP8R3mb8cbqgUrJ7VOnHJ+YUZpm+4s/dOwx++Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771085436; c=relaxed/simple;
	bh=F5FgTWxU7pYac3GugSnay9aumCxY2FsqLuiftUknKJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCeRpWJwbzZr0JnvGNGSsgixB1/wDWi6fF0psPHaNIo8vAKl2VopjgRLKvRNxPk3Jx1ATHji4ImZjRl66D1dwMxvwhroo4e4a3RUxI3T/oUhdQzKwhFXk4MwuWwJRFeaU7YYVbohBMcAhZa6ZXVyUgI8uxHMtMUciv8hYh0GeXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO/XiJb1; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO/XiJb1"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3545d66bb3aso932388a91.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 08:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771085435; x=1771690235; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=92lZRh/2KHslCcv7ij23zRp1wlwEYwoDMHLYMduNRJE=;
        b=iO/XiJb1pjvb1cIWZoQja1btdCYOLfe+6wO27FCWayauuY3E0zSvPaB8nmVQIfbnli
         7US+OY9IHVQIC/XtuTkTWGLmGk01azG0w77GH2cAOW3d76k3/cGi6GRkXvQpDyunt8GL
         GEZJWCxB+wZ7ws7tjbHhxwjxrAEx8NRkui56WHn4H6Sh4kT5wa9UqDahi86NGCs0jVY3
         /AGfQaqIQrbJ2Xzya6lnzPN2dh7l2iD0qzaYCY/aSqx1BktmBtor139wGXaFlKM3Sezj
         8r5Bw3pbPK817DzWAkIZwl8FBSoNS6QVbiyVGYTrKFnmeFqtoyYjAXlIFTegmHNYytpQ
         8KbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771085435; x=1771690235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=92lZRh/2KHslCcv7ij23zRp1wlwEYwoDMHLYMduNRJE=;
        b=M5tITaeqBpR1UXC86ycoKIsAifcHAtR80TObXpCMbanwc0UZNhqRuk/nF9pIzWXe9T
         fEZVvkDk85qur9y5E21cHIGK0VGVA11ycI7mqfdO0oKwd6geOhdUOW2Vt3/QRion12iL
         eYZCh2l+dZLcORxRi75Z79oK5BxCazZABHZhGIm0lpHUSfdH/zO07U6tgtOcSMFcNdID
         XO4jqnCq1KAVrL5POaijx//js4USMbTWRyL7QBcyiTR7DnzE3an+NDimHHpHvoby9tD/
         KkbWqbh9xu1O4cpEWVq83JGpNExCjlR7j8GG8oliJovvaE5T13iU2D1Mv6ZqHWd0OcGW
         tpHw==
X-Gm-Message-State: AOJu0YyLznWE1lqX23ZUmDu1KBLOOOYHnXLxdm6CWdPZGfOxV30tkwcf
	Cz/yFSP/7cHEmKOo3cLvdE5ZahySNjKlKhWrCAinkMGG94phTCDQ9eRt
X-Gm-Gg: AZuq6aKfrycOSMr1SiKxmzc7PN56G4sPU0RSmHawYhWSwQEFLjG9qCF2E+264A2LcUu
	O9PXGMrH+L7usXSKAI1lMA4aefEAbJsJcgY9m3QevJ6ER6Kg6wwD758GkgDqxfUuS6/gAe+/j80
	KOB7kGsNfDFqHN9bpt4S4BZIW6Gi7bkZF9zpLCS11ikKTpaau8GosUb3izfTItm4C/2YL5WbA2T
	tGqVj+ynAtsu7WAG9qV+pZhKXTUeJxqxIpU8yOFphQVkcRuZf/vNXpf1pghU+pta740Q51y/3nS
	QU3CKHfvMrnuGxoRbJWoxdytswhad/nq/hwHglGW0CAsyZbUcZS85Vd3UBbn7IqMVunNrVnC5Yg
	PblYuK0AxPUjlylwfmHdMmgTDXFhz+47+d6ttMigt0qvhMyJxQDCcqYC/ysTT/ylezbU41tHx2q
	76nvzrwTG+JVpMhna9xIJ413zf8hTwMIHU6nE3lyi21Pl+IuIHQML+3IXXBeYbavCljDBVXF40c
	q0QAfe44VA=
X-Received: by 2002:a17:90b:33ce:b0:340:9d52:44c1 with SMTP id 98e67ed59e1d1-358450e50eamr2775445a91.35.1771085434734;
        Sat, 14 Feb 2026 08:10:34 -0800 (PST)
Received: from ?IPV6:2401:4900:8817:dac0:96bb:43ff:fec0:e782? ([2401:4900:8817:dac0:96bb:43ff:fec0:e782])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662e538d6sm15220827a91.3.2026.02.14.08.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Feb 2026 08:10:33 -0800 (PST)
Message-ID: <aa06f89b-8ec7-4ddd-b021-a5568b587480@gmail.com>
Date: Sat, 14 Feb 2026 21:40:31 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vme_user: use kmalloc_obj instead of kmalloc
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260214155157.663800-1-samyak.bambole07@gmail.com>
 <2026021417-coconut-liking-b9db@gregkh>
Content-Language: en-US
From: Samyak Bambole <samyak.bambole07@gmail.com>
In-Reply-To: <2026021417-coconut-liking-b9db@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/14/26 9:32 PM, Greg KH wrote:
> On Sat, Feb 14, 2026 at 09:21:57PM +0530, Samyak wrote:
>> From: Samyak Bambole <samyak.bambole07@gmail.com>
>>
>> Replace kmalloc(sizeof(*ptr), GFP_KERNEL) calls with kmalloc_obj(*ptr,
>> GFP_KERNEL)
>>
>> This addresses scripts/checkpatch.pl warnings and follows the preffered
>> allocation pattern.
> 
> This is a new thing, right?  Are we going to be doing this for all
> staging drivers going forward?

Yeah I'm pretty sure it is relatively new, it was documented in 
Documentation/process/deprecated.rst.
I would be happy to make this replacement in other staging drivers if 
that would be useful

> 
>> Changes:
>> - vme.c: 12 replacements
>> - vme_fake.c: 3 replacements
>> - vme_tsi148.c: 7 replacements
> 
> There's no need for these lines in the changelog text, sorry.  Can you
> fix that up and resend a v2?
> 
> thanks,
> 
> greg k-h

Thanks for the feedback, I'll make the modifications and send a v2.

Thanks,
Samyak Bambole

