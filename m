Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A41C1FA2
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 21:13:59 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id t25so10695487lfg.7
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 14:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QaKZqz8gJE1qe33eHsaYAKuzr4In/J4ciy0i99MvKqc=;
        b=GAmnS0ip/T3wLkz/ApnSMSBM2P9vtOlPl0eEi0yjY4MEq6oWfRPTcCi1fxZ+wfR9Yb
         vMXaufdzR03LTtwRUN+wXDE8zBC3BO0eOZPj3HB39JABha10yb63hslqDeEET5ub+yCn
         lojCN3kzxwY3uJ4tc81jXhmvzxWSnMgX+pQcy7y91hn6KTgqXTfJ8QioBzOTp7LemkJG
         bYz7HpqRntwME02jOlnwZS3BtQakBBlQVeczbw8TQm5vQSI7vJLvdNkdn4MEExsRoUyl
         4MGsC47fsnjGg/LJDl1y9PKJESaV9hZFL3zHbKXmQGjAw+WTbenyi4qpEChBdYw6T/S3
         CcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QaKZqz8gJE1qe33eHsaYAKuzr4In/J4ciy0i99MvKqc=;
        b=UfpzOo1WJP7dRB4d2cnBYBdr+g0VnLrhIidv4GPPvZWXYoQ+agOdjhXfk7R55E5kq0
         rJfHn1bJAMliWmhdD6HJiLNbXLstGndI5ZGwefe3JutDJ0RMdG4jC53JzHFaj54H2nnV
         4OPnoSWqECI8bx0MekMsWmwGdHq3qnQAUOSNUzfnle9BJQ2fuFO7Sgh+2xu03PGWTqkX
         PbQkZ6DG20SGmjHpCRctFheGTisxKyFhrexurgHoWftXZfP4KMEKt/kn8EwNdqyziyg4
         s9UnEPRFEUq4dvUK6uL01r8o8bgnW43JXn6WDDuC8Cy9TREaviSgeW/nS//lAX9iKJ+4
         1QJA==
X-Gm-Message-State: AOAM530WYJNsXjN2+GiKxkougftvsZ3SOuZ77Fhlh9OxxOh3NQn9l0hf
	wRa29wJchSnRWfRTprxb/lQ=
X-Google-Smtp-Source: ABdhPJwXF0R9QqVwGSt8GTxxjZ1498E6u00uhTiNBNhVextQI5GgSulcWpEV23NHITec8j76XpMf3g==
X-Received: by 2002:a05:6512:16a2:b0:448:1fbb:8ca1 with SMTP id bu34-20020a05651216a200b004481fbb8ca1mr18023319lfb.125.1648934037132;
        Sat, 02 Apr 2022 14:13:57 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.247])
        by smtp.gmail.com with ESMTPSA id n12-20020a19ef0c000000b0044a2aea14bdsm616812lfh.277.2022.04.02.14.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 14:13:56 -0700 (PDT)
Message-ID: <feba8981-5568-fa2f-ccc3-c5debf3c7091@gmail.com>
Date: Sun, 3 Apr 2022 00:13:55 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: staging: r8188eu: how to handle nested mutex under spinlock
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>
References: <356c24cf-625b-eea2-2c04-ce132d881cac@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <356c24cf-625b-eea2-2c04-ce132d881cac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael,

On 4/2/22 23:47, Michael Straube wrote:
> Hi all,
> 
> smatch reported a sleeping in atomic context.
> 
> rtw_set_802_11_disassociate() <- disables preempt
> -> _rtw_pwr_wakeup()
>      -> ips_leave()
> 
> rtw_set_802_11_disassociate() takes a spinlock and ips_leave() uses a
> mutex.
> 
> I'm fairly new to the locking stuff, but as far as I know this is not a
> false positive since mutex can sleep, but that's not allowed under a
> spinlock.
> 
> What is the best way to handle this?
> I'm not sure if converting the mutex to a spinlock (including all the
> other places where the mutex is used) is the right thing to do?
> 

I've looked into this like a month ago.

IMO, this code just need to be redesigned, since locking scheme is very 
complicated there and, as smatch says, not correct.

Simple s/mutex_lock/spin_lock/ may work in that case, but one day 
locking scheme should be reworked... Or just some code parts should be 
dropped :))




With regards,
Pavel Skripkin
