Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03488523F
	for <linux-staging@lists.linux.dev>; Thu, 28 Sep 2023 18:34:49 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5331059360fso3159953a12.0
        for <linux-staging@lists.linux.dev>; Thu, 28 Sep 2023 11:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695926088; x=1696530888; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F8YCZOrXCtY9QJc+2PHdkCvZcfQzxTrikDnrW4s8264=;
        b=QEpqW8JQUi7oJBVcCqbg22AFvC0mQamLfNZb7AwbL4aonNwmZcic0ZVi9hYhQiH9mK
         aeDcK9LTkJjIivywHVX+EvMf13rzpX9Pt0MKH9kciN8/iPY0YM70qUYFcKpZPeZfvlLy
         jeR3roJBv4N8ozB30U/Zvz5xxFaUQjkRZx+4znegtJMXNTx2dYSqMz2q1Q1cDjdYdbny
         HS04uW4WVFXZor5SmhnoRhy/dO4EIoSdMTHgMCatDZOqbTDwiom7tP7WOC2DLzoBHUQa
         irwwJNRFiwvrzEv0dftayDSZ97TcdWvqf+jHEt9IiHIq6SFrjm36dkArgjM5k8VKPd5n
         UtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695926088; x=1696530888;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F8YCZOrXCtY9QJc+2PHdkCvZcfQzxTrikDnrW4s8264=;
        b=sJShAdR6Br4/TgfTxen3PhCdB/+eRSXTbyTYM1RR2dIuF4bNVK+7CUTDb6aVnuHaMx
         49zyNlCRy+BPtzBW5ASlvkv9w7z3aK5TJPjGQvdHWZGrcsNSzSOFDwrFdOqd64L0ntBA
         9lNTdOUTuPr0JLnBFf0+bpCbHyWi8SqJ1kCpFs1HPrZKWDxAjufDkho3ttehNbeeKZEz
         Z5WxI8ygj8wj8ov9Ft7l7OKl5zmDfN91RS0+4mAX9xOKbKqRv6pxeexALQp7pIg99HUk
         78gjlM/gCCfuATZjf5nCLm1AYT4SY8LnMro+0PN7dLinSuG76BJ/1DfT9aG8k0/Y494X
         9hLg==
X-Gm-Message-State: AOJu0YwMqzKUGUkqW2lTtl2yVlMzjIpJ0bLRjuhVE5QFnPCokBNDzEST
	q8n8Kq3rpMZJVfpf+tvPdUc=
X-Google-Smtp-Source: AGHT+IG+R6r6uVFSHt81A5+xmTYS0oUuXl/0ult+laZt34ylx/+aTK9Zt3AjV2HBBkCOd7bjp3PLTA==
X-Received: by 2002:a17:906:5352:b0:9a1:d79a:4190 with SMTP id j18-20020a170906535200b009a1d79a4190mr1603063ejo.2.1695926087816;
        Thu, 28 Sep 2023 11:34:47 -0700 (PDT)
Received: from [192.168.0.106] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id p7-20020a170906140700b009829d2e892csm11535641ejc.15.2023.09.28.11.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 11:34:47 -0700 (PDT)
Message-ID: <29dc3df5-f313-f194-7f73-3207215e0864@gmail.com>
Date: Thu, 28 Sep 2023 20:34:40 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] staging: vt6655: Type encoding info dropped from
 array name "abyBBVGA"
Content-Language: en-US
To: Pavan Bobba <opensource206@gmail.com>,
 Forest Bond <forest@alittletooquiet.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZRWWcGiySdLbCM3z@ubuntu.myguest.virtualbox.org>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZRWWcGiySdLbCM3z@ubuntu.myguest.virtualbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/23 17:06, Pavan Bobba wrote:
> array name "abyBBVGA" updated like below:
> 
> a.type encoding info dropped from name
> b.camelcase name replaced by snakecase
> 
> Issue found by checkpatch
> 
> Signed-off-by: Pavan Bobba<opensource206@gmail.com>


A coverletter is missing.

I tested all three patches.

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
