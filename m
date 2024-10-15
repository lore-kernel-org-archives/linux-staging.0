Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BF41FAEED
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 19:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729019971; cv=none; b=OAegD7RW/3wPC3ClUBk3r6OTfwpNd9MZJokw5raQ32dn6+outAeFFmjtDhMHcaILgzJFdKWyiYX3WF27zvZCHKUEm/9dsAekdzfGFJWR0m/3QskHJ9fF3V4F6qODpiXLKhNhcOvB7htDUAim4u1qwQpsX8ySVLBj6wOYaDAV0Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729019971; c=relaxed/simple;
	bh=F4H3asjfD3zzqq/Ba/peDr/Tv8WbT65hIqSh3QI/+EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RTjpb0kRXNI/NKkFesOiofN5RuFqcqoVQXD0uCwDzGk7IX1WuOwJzNNgnHnLhvgoghFqs3tL8apHkqwfCa5InyYBxiHHN5bTDPc3UA4BZw5/tg5vtTaKbldEhTPMHeraeYjORFXOSSdfGdS6Qq7ZNYQEVCELz9MOgt7LsZaojmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRKNPvex; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRKNPvex"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c9552d02e6so5317754a12.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 12:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729019968; x=1729624768; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBVljLM53JfPGRihYqkwAXqRX7+sk8Hf9PcEHrvrWw0=;
        b=WRKNPvexMRBzdD23kBjFYDP25a0p1JE4mnJC/6mDxpUB6HVYOyHXm1w/0+jTSgG/24
         hpTQaKnH05VWg63oPUH53oIftDXirO2fnggUbE1b9/QjOtMKPhXeQbguDQ9d/iyWAREW
         nFaoksWpF+i4qka8txY3yOy3InDO8Ol/87/EBMRbkhjZjrINVpeyDe74DnurAG+/IqJf
         rPItoPNRft69TkG7uwdJfHTBBtBlr7/RJwxk2HSHuxK25wMM8esKTOVtI6DX/AteeITV
         OWXjE6yx7S/yYxuF+/Sy9whrxo6a5jC+iEI01iWx8XtQnTp6EWZfIdq6VCdNQ+OyIWG5
         f2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729019968; x=1729624768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBVljLM53JfPGRihYqkwAXqRX7+sk8Hf9PcEHrvrWw0=;
        b=v4+/7C9c58wdhC/23WHiQ8STdkeBNGjlrWeEMqGlpFvHMwu/XjJKHGk036YgGuUFmE
         FTKK/EeYBEBoH2cit9wlZzxxX8x5wYdhTeVNnm1fOn2Lm4m+ZI9KM8tDmsPGO58xCggL
         qBixoleG9jXYCuV5UtnjGOfatetNcvotG21G2DjJuYdCKvPbTn/BAcSvaSW61g1w3Vv+
         9l9W23vA5x6VA1Oz+0/pWgJAbo13tNu0pbpDBH5hatGTHRo8vHvk1jAAp096HsJrWxwa
         b9lCDzAVmwEdloExRCQoiBoRCpKLbGGvqQN6sXciUe/tjU9jq/6rOeJq1l7QLXCzHCtI
         Js1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjsGyk2a45LhnW9VUrqyR5ezGmLy6ar6G9Vc3gUzf12sGr4E3khtPKYUKw0Uvs2C7Go3VCcPSb/uqUyJ9P@lists.linux.dev
X-Gm-Message-State: AOJu0YzYG1yt5LOoFEzw4dZexh6KK/iMgBpFx0T2J7rQe+rxY9lny5f2
	9XpaqA4VGSmaM2F3SSOoBNgkUrCzKkOvsvJ6zebyGIbQBn6nauCaX5NR8g==
X-Google-Smtp-Source: AGHT+IHAjmrlYnHeeDWVeJAUwyg7yniKorbiL6KpuL+pdyYE7YaTO1VpAB90LCt6WTkIP4fthnDaww==
X-Received: by 2002:a05:6402:34c9:b0:5c9:76b6:d14e with SMTP id 4fb4d7f45d1cf-5c9950d361fmr963233a12.16.1729019967668;
        Tue, 15 Oct 2024 12:19:27 -0700 (PDT)
Received: from [192.168.2.105] (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c9918c0978sm746343a12.33.2024.10.15.12.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 12:19:27 -0700 (PDT)
Message-ID: <0b009357-79a1-4af8-ac44-7b5ad3369899@gmail.com>
Date: Tue, 15 Oct 2024 21:19:26 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: gpib: Add TODO file
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@protonmail.com>, dpenkler@gmail.com,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20241015191522.14713-1-dominik.karol.piatkowski@protonmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20241015191522.14713-1-dominik.karol.piatkowski@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15.10.24 21:16, Dominik Karol Piątkowski wrote:
> Add a TODO file stub for the gpib driver.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@protonmail.com>
> ---
>   drivers/staging/gpib/TODO | 5 +++++
>   1 file changed, 5 insertions(+)
>   create mode 100644 drivers/staging/gpib/TODO
> 
> diff --git a/drivers/staging/gpib/TODO b/drivers/staging/gpib/TODO
> new file mode 100644
> index 000000000000..734eab691924
> --- /dev/null
> +++ b/drivers/staging/gpib/TODO
> @@ -0,0 +1,5 @@
> +TODO:
> +- checkpatch.pl fixes
> +
> +Please send any patches to Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +and Dave Penkler <dpenkler@gmail.com>.

Hi Domenik,

Please do not add the last two lines as the maintainers are stored in 
the MAINTAINERS File. This information is redundant and leads to issues 
when the maintainers change.

Thanks for your support.

Bye Philipp

