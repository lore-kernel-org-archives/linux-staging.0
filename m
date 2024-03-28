Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730B240852
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 21:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711662285; cv=none; b=DfOicghDXO6nZcHxzMU93cUSucg0siCLNeku7Ylr5AVtHrba/HTbetN/c3/JvdbixaVYi3wGuTOqM33pt/3opw2suE8oVFM8hnTJTR5Lc/5wUoSoszOwOTYoAZpR0t9PdMDrn9g1R4MEQVIhTLpsUfNkjOSi7GJ3HOgA7ZclBc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711662285; c=relaxed/simple;
	bh=vgncJ12bPOEKNn+P6UNocQm/1RyRBEr539fqesou12g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHfmM9vJuK8ix6bJUFLLYTbNhUKvbLTgScf718ZyisRfwkmzm9xF7fbL6q7eaf/XIO9pe3NIlnsJRDe83MORvHQQn3kUU+XeJ8+hMFnFqOvnu3LtCcfXbYwVEJPRCJ3AHzbFgYUiS7KnlcdTYkh4I+Uklqp9W2aCdaB1pSnyg/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAZWxHLk; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAZWxHLk"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e4e36c09cso471257e87.1
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 14:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711662282; x=1712267082; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00zSfVR5n/E7ASw56UXmOmJHpf1s4deJDOOGHOzNx/A=;
        b=aAZWxHLksUq48E7RuKTIcrrbzisBju0atH/K+rm0wRzn27Una+YgOb5lMVYpU9ebSJ
         hi3+zdYdqB75QagWHCZX8atCUSQ5J/QgniJxN7idOD8ogOI/C3qg7wG3aXHsOARdH3a7
         k3X90qZdlv+uxed3OpigDlfy36VphiWAJfEWyYyF6t9HLIVr8AbZRXB+7OAaaaitLSK1
         dv3sl0n4Iv1+44X+4gdDWIAqKeanmbGNemx+pAjaZRqhHep8XX2zAj6C0FSEeSEVjD07
         gsVbwlqRVUq/4vBu4eBuOv85p6Ge2IZ699nX1gLnbfFMktQ60ltb6bFdlUym4CqoSv2u
         rcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711662282; x=1712267082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00zSfVR5n/E7ASw56UXmOmJHpf1s4deJDOOGHOzNx/A=;
        b=d9b8/lLYv+7hnCaFgdsEyAU5LIvKCidV37eNdAllCMVivbWnB4M77uMwZGmaG/x9TD
         vAkjjvyz6Mg8Dy+PTCEZEsTqJAYRIyGNlFEWcNfrza5ZhGheZ/bElX3xoYD0BxfO4Yik
         MVm1Dkm6pJVUuNuZwJqdzuGJ8wwwnXgBN/w1nLeonDBO1cSS24ohYqb9BXWOIkIbvx7G
         imCtW2UMS+YixyRxPulJ26+Mi+AcBFSu+mKxufd5aKPR8EV9YftpMdmP0zg65mAFmECI
         CQWnVXoQ1vLiPfHl3UOPUbz7jBcRCPh6R+vA2LhOt1K8LeeGzYECHmDluqPBfVRkYmvS
         o6PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwn58aeXYfixU0PE9vZ1McNxiR26HDaHjnj6B0/2qwjD5fE64O+IleEpIzfGIKkvIC5BYXrU+xcZtPV1BVlXKC9aUU8GsJ1gz+2Rw6uQ==
X-Gm-Message-State: AOJu0YwrZIMFdadHGtwIhc5+KXVXdcehubFvmCxWRcaCadru8/ZmVj2a
	vUUL2K3MnsAhpNkjChDf/sZX/iVaHX/bayHRHCKTk4fvaQONG2wc
X-Google-Smtp-Source: AGHT+IGsA3Mym1ynkHCg1Jmo+MF6x3uqCVPaWZwhuEPdX18nfgIQrGLpfb4vb/+0JjdZUIssKVIlDg==
X-Received: by 2002:a2e:9bc2:0:b0:2d6:b698:968 with SMTP id w2-20020a2e9bc2000000b002d6b6980968mr241372ljj.1.1711662281405;
        Thu, 28 Mar 2024 14:44:41 -0700 (PDT)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id q14-20020a056402248e00b0056c5515c183sm959340eda.13.2024.03.28.14.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 14:44:41 -0700 (PDT)
Message-ID: <b3b033ac-0fe7-4a89-a7f5-ee96d5c806d7@gmail.com>
Date: Thu, 28 Mar 2024 22:44:40 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] staging: vt6655: remove redundant assignment to
 variable byData
To: Colin Ian King <colin.i.king@gmail.com>,
 Forest Bond <forest@alittletooquiet.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240328111557.761380-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240328111557.761380-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/28/24 12:15, Colin Ian King wrote:
> Variable byData is being assigned a value that is never read, it is
> being re-assigned later on. The assignment is redundant and can be
> removed.
> 
> Cleans up clang scan build warning:
> drivers/staging/vt6655/srom.c:67:2: warning: Value stored to 'byData'
> is never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/staging/vt6655/srom.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/vt6655/srom.c b/drivers/staging/vt6655/srom.c
> index 1b89d401a7eb..e80556509c58 100644
> --- a/drivers/staging/vt6655/srom.c
> +++ b/drivers/staging/vt6655/srom.c
> @@ -64,7 +64,6 @@ unsigned char SROMbyReadEmbedded(void __iomem *iobase,
>   	unsigned char byData;
>   	unsigned char byOrg;
>   
> -	byData = 0xFF;
>   	byOrg = ioread8(iobase + MAC_REG_I2MCFG);
>   	/* turn off hardware retry for getting NACK */
>   	iowrite8(byOrg & (~I2MCFG_NORETRY), iobase + MAC_REG_I2MCFG);


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
