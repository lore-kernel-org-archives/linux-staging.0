Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7EE60B96
	for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 08:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716798885; cv=none; b=J44bzgq2NG9KKpxrz2HQdMhfV6rbGTi7y5NYfTKdxVjiSZn6LGpbE73+CtlF4sSRUY25A+k1+WDlOt2TWYxsVr3K/+z/WGtRJkyBbLWcXnJSN5eL7IGOUdGcA39Xh1vmsCDvYyIKdL68qrwQGhur40pYCYY7fo6R1Rp8tajqfzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716798885; c=relaxed/simple;
	bh=tXZRx81eEbuHAbCFv747A3OILagB8p7XaUeXKqNAqYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwmYm2MoFYOtMhw/h9xXDjLJ9pL5rAxhpStZEP0l4UUUCLzLoNqiyJPKwOqw3kqA4gJgfmvKSghwaQ/beZG3ReWbOA7+nnaDjNa6CznuxFE6M9ku8bhMZUrwn/71/t6peF54kynoMVuTG32mfk1OZbQEvCiZ5MepKBvCUQJpp6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDzJVCqW; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDzJVCqW"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso266294166b.0
        for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 01:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716798882; x=1717403682; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=89gTVpqQz2vQMBQkvJrye9cud+oZDcIzouNNJ3W/FMU=;
        b=EDzJVCqW9DxpSaCa7qgWcz8vsBTxe5DoOdnZoswRZggBKtDFX6nRFAXE7n3WLdXjDc
         8gDAtPO9We/ZtFYDN09/CBCS9wlsMFYsiVpGZn7gDWk6S1hBC3UOxSzb4DChDK2Ghps6
         l8r5dyqMESB5ho2oqK5VHJt0vFWHAhf1e3jn9RcACra/LacEFSkjmk2Q2vDENRih1+VB
         arICRsrdOiGarnXFtgpjlOdpFm8hpB/p7qAOKSXlQfGMN5oTIl1jfofBEZjEFAB3Y3rT
         8M7/KvyEqYwObTRKk4uoMlASLoqW8jWNmQxdE1X3KaXOsnes8wOoF40POUbApdT667nT
         cJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716798882; x=1717403682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=89gTVpqQz2vQMBQkvJrye9cud+oZDcIzouNNJ3W/FMU=;
        b=Yl6vc4N3qz/8oGLrVmlDOUhD2AcWJDGhHW6iYdBmqK55JHFW80sI5Zlz6QlvYQ7wrK
         /QiH1HRU1+cWtWk2lGq4FxogwpC+g2HOIIhBsj+i/jU/Lj0c6LDsIjNGWGW/3e+Kqx8W
         h9JHSTqsb7cIbfQ6q5GFUTaB51oRMv8bh/8fZaAqh6wEmFCIp6MJeTvUNr18PFgCkhDP
         QPylr/DFoREMTQelMdEIUlRM45CI+hsJ9r8Id8tT9n2sUW/1JPE56IMolUwLOWlfU8PV
         5saNAdZOkl3H6hHJD5snxBYWJe50ThNWY4zgh1WcUcAb44ufWTxrkPH0LvS0fWX3bFp8
         Jdkg==
X-Forwarded-Encrypted: i=1; AJvYcCUG38/11GRe2nV9lmh/9oq6aM6YoFPwlNSm+2z4Jrj4WbaNPfGeKLCHQic2C0i0Wi205wdbq1Q8IXt0RbER51UA/EcUe4lQA/yqKqAnnA==
X-Gm-Message-State: AOJu0YwR2GdHjQvktL5P+XO7mrUkq/VSSCZGWFZZXSNvToo3TV/38IT/
	cakEGeLUFmL5mABWt9cw7/4jjJE5zBaNbidE0eTXIkRBlEgbBjWd
X-Google-Smtp-Source: AGHT+IFFsAlnRfTxFBbD6kdBrEdB+GYdJ0PgJkCPnudEYrx6FH/H3dhbyckfurrAOLMPIEw+bI7VGw==
X-Received: by 2002:a17:906:28ce:b0:a52:6fcb:564a with SMTP id a640c23a62f3a-a62641a8d45mr526028266b.9.1716798882222;
        Mon, 27 May 2024 01:34:42 -0700 (PDT)
Received: from [192.168.0.101] (ip-77-25-34-87.web.vodafone.de. [77.25.34.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c93a807sm465270866b.85.2024.05.27.01.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 01:34:41 -0700 (PDT)
Message-ID: <2d1dab52-72ab-4f4d-8f77-ae54f16b9b4a@gmail.com>
Date: Mon, 27 May 2024 10:34:41 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] staging: rtl8192e: remove dead code
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Nam Cao <namcao@linutronix.de>, gregkh@linuxfoundation.org,
 philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240526111928.14574-1-straube.linux@gmail.com>
 <20240526111928.14574-4-straube.linux@gmail.com>
 <20240526143100.FmVupNWq@linutronix.de>
 <e25831a9-9913-43da-831b-d37bdc4d9dd3@gmail.com>
 <9802cc9e-5962-44a1-a384-3e5ee226cbcb@moroto.mountain>
Content-Language: en-US
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <9802cc9e-5962-44a1-a384-3e5ee226cbcb@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 27.05.24 um 09:39 schrieb Dan Carpenter:
> This patch doesn't affect behavior at all, but to me the original
> author wrote the do nothing case for readability, and I don't have a
> problem with that.  In fact, I applaud the author for caring about
> readability at all which is not a given in staging code.  :P

Then I think it's better to leave it as is. :)
Should I send a v2 with this patched removed or will Greg just apply
the first two patches and ignore this one?

thanks,
Michael

