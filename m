Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84DCC8D5
	for <linux-staging@lists.linux.dev>; Wed, 16 Aug 2023 06:47:00 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so8306448a12.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Aug 2023 23:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692168419; x=1692773219;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=flBgap3vzzGdFevXRucCRqflcEL0jD8swhhmKI1hQQY=;
        b=HQHmvVzV5s48OWjrt2NiTVENlXQTaFqN3kC7or1Tu88f0DwlApll4jYVmfEa3SvvJC
         PfhjELUDJL9SirCgiAPmSvIF7H1U8raTDNqzkZ7knQjoyWmjMulvZxwcPkod4WpdOW/L
         Ltrl/Gy02HSWI0NtnyHmPbSi6kSHqTWcR281qz/IxgpsWF7exYsiQrPleEQEwZlWMeNd
         YzwnGDpZeigPOZE3cddevqDUaOLbR92muzHiQarRMFydrXaDZXGFCJGEZYm7zQjKylmV
         I1hWN+K6lT8HErc4+MSeag4B0/7PYHbJ3seNFsRrQttdrbXDtte9PlEOcs8HASZSAiYu
         fJxg==
X-Gm-Message-State: AOJu0YxkQn8k8AAsWHjFmbrI9VdQtdwy+1pJvgX1qHpJ+PcVXcSgJDW1
	mC77SFVIPwAYJMv9eabAm2Rcz4Zt07zgcw==
X-Google-Smtp-Source: AGHT+IHk1j7bDGF56TgxtNjesYi+XBzxyCQfAzQoy6P3Ibwn2D7+FycXYkdJ0WsN783e3Ch9dRCapw==
X-Received: by 2002:a50:ec8b:0:b0:523:f91:fcce with SMTP id e11-20020a50ec8b000000b005230f91fccemr844810edr.13.1692168418700;
        Tue, 15 Aug 2023 23:46:58 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id l2-20020a056402344200b00525658b7d3fsm3749337edc.45.2023.08.15.23.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 23:46:57 -0700 (PDT)
Message-ID: <937e14c1-d884-0b6e-595a-e8aaa3d09025@kernel.org>
Date: Wed, 16 Aug 2023 08:46:57 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 34/36] tty: gdm724x: convert counts to size_t
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230810091510.13006-1-jirislaby@kernel.org>
 <20230810091510.13006-35-jirislaby@kernel.org>
 <20230815172247.GA1690054@dev-arch.thelio-3990X>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230815172247.GA1690054@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15. 08. 23, 19:22, Nathan Chancellor wrote:
> On Thu, Aug 10, 2023 at 11:15:08AM +0200, Jiri Slaby (SUSE) wrote:
>> Unify the type of tty_operations::write() counters with the 'count'
>> parameter. I.e. use size_t for them.
>>
>> This includes changing constants to UL to keep min() and avoid min_t().
> 
> This patch appears to cause a warning/error on 32-bit architectures now
> due to this part of the change, as size_t is 'unsigned int' there:

Right, this is my brain fart thinking ulong is the same as size_t 
everywhere. No, size_t is uint on 32bit.

I will fix this -- kernel build bot seems to be slow -- it didn't find 
the issue out in my queue, nor in tty-testing.

thanks,
-- 
js
suse labs

