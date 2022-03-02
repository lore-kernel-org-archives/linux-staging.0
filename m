Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69DE7A
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 15:49:12 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id c18so2334295ioc.6
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 07:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YKCrWj+1zMKlxKPB/IddCWs5wzrSW0P5NglCuipbZCs=;
        b=eJxM/77B7ssFxi/0g1GKRtMpbZuhJOTlH8h19DcfwD6dL6zYrh6mfF5ZTegp7ireD6
         S+YkCiFvI10DeKstOWdhQlMoYZ28GtJblXh7FxiMKbHHFUPTug1yG9XwA/VIjY+KvJYe
         cvLD61wDFA944OtrZ73NZRdAx5JN2VLBTt0KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YKCrWj+1zMKlxKPB/IddCWs5wzrSW0P5NglCuipbZCs=;
        b=IWXHMiHOwae8935dDe7ayXriaGwW1hk8XDFeBe1Py6G5ChniYPQrkDlnoo8HoBeebi
         VJDHxad0pJ/Ug3hxohyKbMvgTCxb/eqpWuh3PVpRltL2B1g1BL2hLjHkAi4jxqHkqcWx
         /s3wUpgbhh+EZCsPGQvFYgFYY1Z3SkyNz51Had34FPfmU795Cc2aNN9zOTWH5NzqdRWj
         1kX4ZuzZLPJKP98orukr/BIsucumSO0iHmHecrFwVg0erhNMBNmx5EnszwrwY7u5c0fz
         /HgPnwjgOJiojPBGLj3terh2fhHnyqpGIpOnRJGvuHdJL27dER/P+Ojlk0DnCzMkG5uT
         Auog==
X-Gm-Message-State: AOAM533bdW2l/1Q5KjXQayGzquTAHDC83JYesN5h3d7cyS0X1F3oikSb
	97O0Op6w6Eq202HarpVj5RsyA953lHpBeQ==
X-Google-Smtp-Source: ABdhPJwtlAzsfpKnWWZ+BUdUXjOYZfh0Ht45nhh4y3ukmKQ/VxVRY+e/gtZDfVyzHk0kEB7Zl9JCTQ==
X-Received: by 2002:a05:6638:bcd:b0:314:9138:8344 with SMTP id g13-20020a0566380bcd00b0031491388344mr25620647jad.64.1646236151869;
        Wed, 02 Mar 2022 07:49:11 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id p2-20020a92d682000000b002c291ae0e1bsm9724283iln.23.2022.03.02.07.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 07:49:11 -0800 (PST)
Message-ID: <b4d057fd-cccc-571a-0941-061c6a26cbf0@ieee.org>
Date: Wed, 2 Mar 2022 09:49:10 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [greybus-dev] Re: [PATCH] staging: greybus: loopback: Fix Coding
 Style Error
Content-Language: en-US
To: Ahamed Husni <ahamedhusni73@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220217190722.44894-1-ahamedhusni73@gmail.com>
 <Yg6hcX6XK4Eu0KOR@kroah.com>
 <CAFjpAKqy908scQTRJPkMhEz8OyNiR3-N8XD2hiGa+VBLhUf0VA@mail.gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <CAFjpAKqy908scQTRJPkMhEz8OyNiR3-N8XD2hiGa+VBLhUf0VA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/17/22 10:52 PM, Ahamed Husni wrote:
> Hi Greg,
> 
> On Fri, Feb 18, 2022 at 12:56 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>> Did you try to build this change?
> 
> I am a newbie kernel dev and trying to understand how things work.
> I did not build this change by the time I sent you this, thinking this
> is just a style change.
> I should have tested the build. I am sorry.
> 
> Now I built the changes by setting the following configurations.
> CONFIG_GREYBUS
> CONFIG_STAGING
> CONFIG_GREYBUS_LOOPBACK
> 
> My change introduces the following error.
> ''''
> drivers/staging/greybus/loopback.c:166:2: error: expected identifier
> or ‘(’ before ‘do’
>    166 |  do {            \
>        |  ^~
> ''''
> I could not fix or find the reason for this error. Please guide me in
> this regard.

You should understand that you cannot contribute to the Linux
kernel if you don't understand details of the C language well.
And you really must test your changes (certainly a build test)
before you send them for review.

To answer your question, the macro you changed does not
expand into code that is itself incorporated in an executable
block.  The macro is used to generate entire functions in a
unified way.

					-Alex

> 
> Thanks,
> Husni.
> _______________________________________________
> greybus-dev mailing list -- greybus-dev@lists.linaro.org
> To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

