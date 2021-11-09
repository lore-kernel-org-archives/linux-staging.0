Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C582C8B
	for <linux-staging@lists.linux.dev>; Tue,  9 Nov 2021 12:24:00 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id z34so820822lfu.8
        for <linux-staging@lists.linux.dev>; Tue, 09 Nov 2021 04:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vXpk74Kb+HqypbiuoeMbcColw+iui5mY4cGX3uLvtyg=;
        b=pM9y+EnA6dFxkjBjibDgNq7RwHqcSlaIBmb42SOQkkEcourIUU95lpej9G5N7Vi+v9
         vtFLAh/zDIlLHAIEpoWJF8xZ3+RePKK15zBtavQeOhXNFF57bsWu6TQz3fUa1JfeaLIj
         S1HHNpF2dbu6BZP3e17564YpZ8/YFZ+DCbNc/1kJH53g4wpY/wqJyQK8X/HRVUvkCJBT
         2O6NXCNVnpw7vh7JifGDjcKlzOcnt4Ii7ob0CKa+ixS5piMZ1P4LF1arR7CoY2WPGZAG
         44IsVfjwIPbQXMZhziFkPGUGSH/eDyLxH/auAxDfBaJ10BhvKSc+nVPbgUjIPe87VjAB
         pKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vXpk74Kb+HqypbiuoeMbcColw+iui5mY4cGX3uLvtyg=;
        b=KOMHfaYc2i9O2x9uYQQ+HFIl0xoZsR98GWC66SmorqoU89TC54478nuyB9s4UCNS/W
         f1el3smECKSla9aaTMJ95qDydt4Wu0K5Ykh9rGjxx/CHK6aSraHi8XVhs+zr4wOfzjbl
         1cjDVyo6HaSxYp57zrdzZTwUIYMY8dLN+Pms8tHJ4tNHBq9+jGz/1MPL+kFyEfOVP6Xq
         EucYvynO6z09BNOEfT9Zq9XbmryoNRh9H+IrzTvQ1HypmyXUPGOLKQCmByl0o3sGNWza
         kxR8TbEnpCqffvzeZPggnG99DfFCje3UF1x5/nR7DqTFJqwoZfrk+6Y7glQMe0aQToQN
         kpgg==
X-Gm-Message-State: AOAM532HQyQZvfpbSseiAIqsX+8UeSg2NLVhDk0IWy1QpCnhvjZ0u2j2
	pihS03w+XWYUij0VE22QCm8=
X-Google-Smtp-Source: ABdhPJxo78lvPjm+MZllqIslZuX5QE92EtaeTkPAIME1Qa4zuCS7c3Nz6MK+d8qQD1WH532C10R9Zw==
X-Received: by 2002:ac2:5a46:: with SMTP id r6mr6890498lfn.358.1636460638567;
        Tue, 09 Nov 2021 04:23:58 -0800 (PST)
Received: from [192.168.1.11] ([94.103.224.112])
        by smtp.gmail.com with ESMTPSA id g11sm2119563lfu.282.2021.11.09.04.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 04:23:58 -0800 (PST)
Message-ID: <b790e108-fa37-28bf-15c2-885ddb05572e@gmail.com>
Date: Tue, 9 Nov 2021 15:23:57 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] staging: r8188eu: remove unneeded variable
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: cgel.zte@gmail.com, Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
References: <20211109115307.133100-1-deng.changcheng@zte.com.cn>
 <c2c36a95-be34-bcaf-0224-a513e33a902e@gmail.com>
 <20211109121823.GJ2001@kadam>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211109121823.GJ2001@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/21 15:18, Dan Carpenter wrote:
>> >   static int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
>> >   {
>> > -	int res = _SUCCESS;
>> > -
>> >   	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
>> >   	atomic_set(&pevtpriv->event_seq, 0);
>> >   	pevtpriv->evt_done_cnt = 0;
>> > @@ -72,7 +70,7 @@ static int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
>> >   	pevtpriv->c2h_wk_alive = false;
>> >   	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN + 1);
>> > -	return res;
>> > +	return _SUCCESS;
>> >   }
>> 
>> Shouldn't it return just void then?
>> 
> 
> There is only one caller.  It should be folded into the caller and
> deleted.  Then the caller could be made void.
> 

Ah, I see. I've overlooked, that this function name starts with _ and 
the wrapper just does `return _rtw_init_evt_priv();`. Interesting 
approach...

I agree, that _rtw_init_evt_priv should be just renamed to 
rtw_init_evt_priv() and the old wrapper should be just removed



With regards,
Pavel Skripkin
