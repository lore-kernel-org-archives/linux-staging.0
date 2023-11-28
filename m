Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC53644380
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 22:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaVb/kNy"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40b2e763b83so7954935e9.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 14:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701210050; x=1701814850; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRvAv5IYh+L+f8RPVNKnR2nzMz01vR6z5LweeBPSxso=;
        b=SaVb/kNyjJtKM4Jd1wdudjrpaXWTZXrd+md22maqT/1BgC9hscC3nEgYPaMfiorAQG
         igqZIIiJbIXZNzXzzufRqFWuTmxb+n77yp0whizHiBUyD9HBBJxSDadoD63aqZVzE5u/
         nDuXPOWqZ4ATZvMMirvlXf4uU3Zbj0HJFH0hiWerTzsB5A8R0DEtU/rPIiUzPgvxEgyH
         G3RXQGKyE9wZ2JBD1ZT9Wtu7MOEzy1jIRALn/aIJW/XKeGcUgQq8ADdlyo5IXtvBxRPs
         Coz6/eJBo1vAHD/qbsJHT2TfudF6KO9MZr1IkaSQT0mPznOse+PNF297dfzcZ2ncWN0X
         zwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701210050; x=1701814850;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cRvAv5IYh+L+f8RPVNKnR2nzMz01vR6z5LweeBPSxso=;
        b=rdRKg+wbN4vBwc9JWWU2bYY2xPQ2iPi/3wRJQITo3YqVfDyYfk8AFidCKxEWHrxbTL
         TFVVZ0sIxc+DngNCHUu2xz1qpbmmuDoovSP3i8YPwQtO2DgZIpfr9xjDVUPRPa16nKhk
         K6x984ZB66HQs8jxoQFHAo2Md5gIeTFi7dZT0qNn6bzrHOSt0DFxwAenRsTCbyO0s9lC
         Hi+8z7llMDN0f92Pphx/+dF+MmzbFndKTa+SQHLzMl30tysK8mLhN/pOhi9it58JvMUL
         uyMsXNBBDojDv3wMTVNpNWnzk67ymPhFt7Xgw8xHNjQuPIGqB/EJ8RO+Ee+xkRNy+18E
         DTNA==
X-Gm-Message-State: AOJu0YyuuYFJNfTO9rWm6tHIkCMYKbXIbR8pfFW0BuZs+kg/uiMOr8Kz
	p/kGbdx2e5ALc/8+v9eL8IU=
X-Google-Smtp-Source: AGHT+IGbiQyKPPiP2jdk8NX4rLPKY9dmORw57Bfs1HS1Y+VH0y+v23BPROR1AjPnZfVXoyxS04aIlA==
X-Received: by 2002:a05:600c:8512:b0:405:358c:ba75 with SMTP id gw18-20020a05600c851200b00405358cba75mr11489436wmb.0.1701210049729;
        Tue, 28 Nov 2023 14:20:49 -0800 (PST)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id m8-20020a05600c4f4800b0040b347d90d0sm19436693wmq.12.2023.11.28.14.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 14:20:49 -0800 (PST)
Message-ID: <51bd23f2-034a-4e28-b275-99c1392ee43a@gmail.com>
Date: Tue, 28 Nov 2023 23:20:46 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] staging: rtl8192e: Remove action block acknowledgment
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1701202700.git.philipp.g.hortmann@gmail.com>
Content-Language: en-US
In-Reply-To: <cover.1701202700.git.philipp.g.hortmann@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/23 21:43, Philipp Hortmann wrote:
> AP are learning very quickly that rtl8192e driver is handling block
> acknowledgment (BA) not as expected.
> The log of the driver is showing the following output:
> rtl819xE 0000:03:00.0 wlan0: received DELBA while QOS or HT is not supported(0, 1)
> Then AP are giving up.
> 
> Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
> Transferred this patch over wlan connection of rtl8192e.
> 
> Philipp Hortmann (6):
>    staging: rtl8192e: Remove action block acknowledgment
>    staging: rtl8192e: Remove unused function rtllib_rx_ADDBAReq()
>    staging: rtl8192e: Remove unused function rtllib_send_ADDBARsp()
>    staging: rtl8192e: Remove unused function
>      rtllib_FlushRxTsPendingPkts()
>    staging: rtl8192e: Remove unused function rtllib_rx_ADDBARsp()
>    staging: rtl8192e: Remove unused function rtllib_rx_DELBA()
> 
>   drivers/staging/rtl8192e/rtl819x_BAProc.c | 262 ----------------------
>   drivers/staging/rtl8192e/rtllib.h         |   6 +-
>   drivers/staging/rtl8192e/rtllib_rx.c      |  33 ---
>   drivers/staging/rtl8192e/rtllib_softmac.c |  30 ---
>   4 files changed, 1 insertion(+), 330 deletions(-)
> 

Hi Greg,

please ignore this patch series. It creates a performance issue....

Sorry for the noise in the mailing list.

Bye Philipp
