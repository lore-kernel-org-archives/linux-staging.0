Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21F22C80
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 19:46:39 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id q124so20503991oig.3
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 12:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2LcuqqQoNUMmdLIho5A871+yx0G8cw4vady/RNfBv6I=;
        b=kEEVuaYR5FvbJhyGe5iX6ApwDfS8Xf6cjZzTtWNyJdusfzE3nVtAN2IXyjUa0JG0R2
         c4075l2MNBl0HgGIPDTDvGf9P11YjKwVTDPFs0oaSMpQko07IcqA7BXT7ynBhxq64kdu
         v/vpV/McgOhZe25QujZowWGBJB4se+Aq+00GTrfMnajZgZeHRc+gsXQZw7ZiGSjnu85B
         za+UoGj+CSjwlVR6cvR3v4/iAC3DDzcHKm4YrGEcuDTd8F55WiIknw4cL50LUaJqMWH3
         MIulbPeQsPmwVkqeH6ed/Ff7bLid1It2TRWblZhYLZGbLI1c1+soHkGaJMY/O38+ezG7
         zrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2LcuqqQoNUMmdLIho5A871+yx0G8cw4vady/RNfBv6I=;
        b=BZaDdugjSkbXd93AZ6SGYXjEld0vnEHmEqU/13mnzp/MNjJVzYLN4fFhBa9XFYoErU
         Yizls5lF+2hW6/OxmR0MaPiacfO4Q/SXbz0dEM9gr20Ce6RizlXFtQh7eWPDBiOSLWT5
         /ogKsVxzUeUEyKSztaDyQEgkPJiyyr9T0y1Owii7JlZW3QBvPl52Uzx+ZHYhs8GFefS9
         s8ZloB0O4w3rA5HVDDTEZ4S6K+ojrk7v1e0qvTlIE0ondzaTAsXLGq6i4NqGu/LUhKNg
         5kynXUW+w63AyXJTB/8QJbm8YfWulaArATZMh9pyWD8VqBzh6F7U2jmL7ZRTSw8AiNc+
         lt6g==
X-Gm-Message-State: AOAM530+OHfod2xxhkuxpRhHbWQWMbrWI0LwpPO/jc3nzphEEe5VFago
	GG/CWXoCxsdcMLqspJooLLQ=
X-Google-Smtp-Source: ABdhPJxdDSQoHmVXfNLvJsezrdnSlsd0hie9nHBg7lBCrLbWc19XdEAzs7H2ZcGxzLOdXLcmR29IsA==
X-Received: by 2002:a54:439a:: with SMTP id u26mr29190091oiv.49.1636227998927;
        Sat, 06 Nov 2021 12:46:38 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::1025? (2603-8090-2005-39b3-0000-0000-0000-1025.res6.spectrum.com. [2603:8090:2005:39b3::1025])
        by smtp.gmail.com with ESMTPSA id 3sm4018581otl.60.2021.11.06.12.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Nov 2021 12:46:38 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <200c2fa4-176a-c48d-ae13-08bd35e8095b@lwfinger.net>
Date: Sat, 6 Nov 2021 14:46:36 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
Content-Language: en-US
To: Zameer Manji <zmanji@gmail.com>, Phillip Potter <phil@philpotter.co.uk>
Cc: Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Martin Kaiser <martin@kaiser.cx>, Michael Straube <straube.linux@gmail.com>
References: <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com>
 <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
 <510e2388-41ea-bf66-16ee-eb282cc41405@gmail.com>
 <5ed4c9f0-111a-7a13-1426-2f9f26b9937a@gmail.com>
 <CABtXzjSOXiZW5J3-k-jkFS3N9p9k_X=F2JrvJc9_T+By8FJc8A@mail.gmail.com>
 <CABtXzjQk87ZhYcc2h5mU0mR+6zC7rKrpP-g6uE=DxE56NXQXpA@mail.gmail.com>
 <YYa0e98JTsE0PPDL@equinox>
 <CABtXzjTkER+2KzsfhcYVN+gDGWUTmpX=2smdfine_fa-b+nsRA@mail.gmail.com>
 <21b97629-00b1-0fed-a4f3-fc318372aea2@lwfinger.net>
 <YYbJxFAAFuIA8t6W@equinox> <YYbOI9DC0pYQRQVD@equinox>
 <CABtXzjTCb+Qe9tiVVoJ=3P2yTxdZgAwd7_rnbcY7N7ByOguRsw@mail.gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <CABtXzjTCb+Qe9tiVVoJ=3P2yTxdZgAwd7_rnbcY7N7ByOguRsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/21 14:29, Zameer Manji wrote:
> Hello,
> 
> I was able to build and test a kernel from Phillip's github repo and I
> can confirm the patch fixes the issue I observed.
> 
> Thank you Larry and Phillip for your help. Would it be possible to
> have this patch queued up for a 5.15.1 fix? I was
> testing out 5.15 because I read it would be the next LTS kernel.

I will submit the official patch with "Fixes" and "Stable" tags. That should get 
it propagated into 5.15.x as soon as the patch hits mainline. In the meantime, 
keep using the kernel you just built.

Thanks for bisecting and testing. I suspect that most of us are in the FCC 
domain, but that you are not; which is why you were affected.

Larry



