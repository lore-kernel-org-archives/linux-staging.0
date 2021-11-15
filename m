Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466872C83
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 14:34:50 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id 1so36025016ljv.2
        for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 06:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZpPEZqJd2To6lUjg28UQdB87eU7/8VpSq5XWX7MIjkY=;
        b=BD3EH+/6iAoMU0as28T1uFfMyoto9HdkPjPVtXTSSOCtUL+d4iY+gPJsCICkkkMJZ3
         Fj6nU18j0yMLl2YB25uSEETy5BxlRZfRyQ6eV7+hNQOp/c4bgrPQzoIPzrN8OYywH76N
         o+Ai8larHnuIv1b9VPGnTqfBa/ODrJmdaxv3pXrRf6t8mqCS12sAQQiI04KYT00fTAqX
         EHWGksaiLDzQsPf6brKsQj8w08sh3fSUflP33LTYPvx8hvGb5lFaSokQP39cnQdbQY6x
         0zyL0yWt0ZpR6XQwGhcoCxfACD9Vj0Y93oOlf8JU7GtBFzvgDWQjsmvOpbAXnfE2jbTa
         wxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZpPEZqJd2To6lUjg28UQdB87eU7/8VpSq5XWX7MIjkY=;
        b=IDJu4HCi93NksYV/NkIajZ7RbTJw9+bx9haehv2Kt351LiabFMV71Ci84ugWXeeadr
         odXWhZF5KegjpB0sQ8YhklzrYsIVPfvY3ptREuS2iQvGUirPQV1cYCXRo5oNDlhilrh8
         IabkYoUGBh2v3vJZFz7cFbm79tY/Y0sYYT2JmuaAhQutPdavugr+54zfNa+ePL8/70tc
         Sg8oQ3hPZW5W9lumqJ7UZsF5QQaf9qFwOBIKkvn3ZSVQ5XNjOz1Be1X/fk5FAQHmHINo
         7qsD2xbvWuxe+GxzpLt6Wh7PMrsIAgal1EqrCvqXmmirxi22e1H1mFjleEIZrGw5q/ru
         xf/Q==
X-Gm-Message-State: AOAM533wswWxqE5GrvuZissaDPxXBp8qSyANY4T12lqUXLP0LFRQIxM6
	+5CuFmS/k3HE1R9gapfnc6g=
X-Google-Smtp-Source: ABdhPJwEKuBXdYXq5DhlVGPueFviqpJQ5pSvxJjMJzOh/ZO6vd5sjZJeTbmqyxx5SlyE0ArDXI+1ew==
X-Received: by 2002:a05:651c:98e:: with SMTP id b14mr10702207ljq.180.1636986888356;
        Mon, 15 Nov 2021 06:34:48 -0800 (PST)
Received: from [192.168.2.145] (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.googlemail.com with ESMTPSA id r13sm453347ljn.99.2021.11.15.06.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 06:34:47 -0800 (PST)
Subject: Re: [PATCH v1 1/3] media: staging: tegra-vde: Support reference
 picture marking
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anton Bambura <jenneron@protonmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211114222353.22435-1-digetx@gmail.com>
 <20211114222353.22435-2-digetx@gmail.com>
 <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
 <20211115124402.GE26989@kadam>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e4b9d596-d206-71d1-6ec5-1a41af579836@gmail.com>
Date: Mon, 15 Nov 2021 17:34:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211115124402.GE26989@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

15.11.2021 15:44, Dan Carpenter пишет:
> On Mon, Nov 15, 2021 at 01:34:18AM +0300, Dmitry Osipenko wrote:
>> 15.11.2021 01:23, Dmitry Osipenko пишет:
>>> +	vde->secure_bo = tegra_vde_alloc_bo(vde, DMA_FROM_DEVICE, 4096);
>>> +	if (!vde->secure_bo) {
>>> +		dev_err(dev, "Failed to allocate secure BO\n");
>>> +		goto err_pm_runtime;
>>> +	}
>>
>> My eye just caught that by accident err variable isn't assigned to
>> -ENOMEM here. I'll make v2 shortly.
> 
> Smatch has a check for this so we would have caught it.  :)

Whish smatch was built-in into kernel and I could simply run "make
smatch". On the other hand, I know that you're periodically checking
upstream with smatch and patching the found bugs, so maybe it's fine
as-is. Thank you for yours work on smatch, it's a very valuable tool.
