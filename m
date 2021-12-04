Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0F568
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 09:23:05 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 207so10867260ljf.10
        for <linux-staging@lists.linux.dev>; Sat, 04 Dec 2021 01:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/vA1+3g8Svc4sefTqC+kMMaFu0/gR+beNxXDUxYQ/HY=;
        b=pznYLXifFUPpwNbW6Ga0WJ/nvNzklczY//vyoZNdu0N2YAvn9TUIz8KHSQu0njGAAL
         RDEBiaCaUZE8bkJaLQF8MW/l6lGHVLcP8fDNWhGZHLkUfQVvOufVjvgFau4CCOs0GpMX
         fzj6yt8hVhVnO5UlyQM974Yg57CA0LyJoEGr+6bMxcgo4IfGJK94XFTp3t2XWo32IrVh
         ZS/diQrDyWCHmWcmHzyGskkOLcaYznlbqnM/Hvt0w9ziVuqHjylHZn55suWSuEbtnYOe
         kEEHOi55tBJ+nZfG+Z5liDMs+dKX9wUMtbpzf0qDylgkdyBGFHmoI+hYZR4OIffEMNb9
         ndrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/vA1+3g8Svc4sefTqC+kMMaFu0/gR+beNxXDUxYQ/HY=;
        b=5SfXziQNW9htjJ417CY3/QTAPsF4yeroLAzdxgjlXZVSOePlHhod3HSUNKLzK2XaTL
         8y9g21rySXtEk8n79ZNIiDOrIqEyCHyAZrefN2nwsO4FRwUcaCP/jEr40lkfW79JVSiA
         5Ccb8a0WPQ4BIxqqRqvdzJN14hDOmDfltElgg+beX9CQZRWdDjMVmbnjl4gGpRKFVY7L
         QYtfQVCaKidNWae6DN0KxhyicK5tsgB816RrR+6t9EOcJ40XffLGrO4hqt1kNAoi2s6B
         8zahgd7Ymx9Qozmh9H2k9YNqF6VXXkX0pZ5isXeeld2zUafaZx6a6pzhK+DR6PpYYDWX
         F8sw==
X-Gm-Message-State: AOAM532QxDR2eCP/PndLjF8bXgi3+dQOqA04hTs76F9Q2IIL1EHTw/qb
	ggxoEItiSpsNH2yOx8qx2iK1xmaeWwMmUw==
X-Google-Smtp-Source: ABdhPJx75qgk/RIsFe2xWeB1XcY2udJoO3qcN/ImOu87iJqn9ZlZcFhA8yGmJvmnhpMsZ2rhe/C5JQ==
X-Received: by 2002:a2e:9c81:: with SMTP id x1mr24548937lji.326.1638609783836;
        Sat, 04 Dec 2021 01:23:03 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.236])
        by smtp.gmail.com with ESMTPSA id f9sm697989lfv.44.2021.12.04.01.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Dec 2021 01:23:03 -0800 (PST)
Message-ID: <a10f1013-069e-7f56-8a5b-80621af8a158@gmail.com>
Date: Sat, 4 Dec 2021 12:22:59 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] staging: vt6655: refactor byMinChannel to min_channel
Content-Language: en-US
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 =?UTF-8?B?QWxkYXMgVGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
 Karolina Drobnik <karolinadrobnik@gmail.com>,
 Lucas Henneman <lucas.henneman@linaro.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211204004041.3825744-1-alb3rt0.m3rciai@gmail.com>
 <e0fea904-1861-0003-1b04-6d2e966657da@gmail.com>
 <20211204090941.GA3805206@bulldog>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211204090941.GA3805206@bulldog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/21 12:09, Alberto Merciai wrote:
> On Sat, Dec 04, 2021 at 11:27:43AM +0300, Pavel Skripkin wrote:
>> Looks like this variable is set, but never used. Shouldn't it be just
>> removed?
>> 
>> Same for max_channel (or byMaxChannel).
> 
> To be honest, I would prefer leave them where they are. I'm only
> refactoring the code considering less the logic aspect.
> 
> I don't know if these variables will become usefull in a second
> moment.
> 
> Anyway, If you consider that this could be a good moment to remove
> them we can proceed.
> 
> What do you think about that?
> 

I think, it should be up to maintainers to decide, but them can be 
removed now and if somebody will need them later, he can bring them back 
without any pain. For now it's just useless memory usage.


I skimmed through priv fields usage and looks like many of them are just 
set, but never used. I guess, some kind of evolution removed all uses of 
them...




With regards,
Pavel Skripkin
