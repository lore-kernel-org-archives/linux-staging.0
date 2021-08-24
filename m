Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5263FC0
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 16:24:57 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id b4so2624575lfo.13
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 09:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/xd7Ft3z6AfgdBMUUGrTVeHJirMdGU4DzFsT8Tnm9iE=;
        b=fm0jkOLnvxsLB+LtmDIo9dIOdBzNOXNrIHyvfgv2nIkhFgAsqUfnB5CVy0KUgn5bOs
         2iAH7X/jWR3pviMYvoCtFatgFjBsIxYCHEfArD5cJLDn2cGZM/BNWe/ELxLFIssjNEwt
         jt+hvmPdlw8tjs9BIipZloh8bWcQjvQtH8KUQzyNqTkeO29zORprx6wkbfmA9eMGYOT1
         jZXWmVy+bFz37x8gOkoqSy40ppBoTNBcO0YHaVjHm1OipD2XCWhFc8L0g//S8/1qY1AG
         l2KHPzv26mfVye0pJrtlZM6I+eqe4no2FQwgtMxwXmeKuglk4hjvWExf/wi+OEDzU+Zi
         0fAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/xd7Ft3z6AfgdBMUUGrTVeHJirMdGU4DzFsT8Tnm9iE=;
        b=qeCs+TQStooqBdh31Y1LhAQEZEckIy2wM4O4/RUB4TzIp5I1mY1HCD/R8LWfSlWgXg
         QvadeXzqwS39f6UDN4LvHwK6vG+UoGRBr8Sy7eQtbD4VFfEadbKTiSd81GD9Tuq3XDWt
         xdcLt1U2IDJn4Q6486Ii6WP2v/fzR1TpLPaQ5s4fDGoksq5UzAIcZl3R2oOpWa/u1o3y
         7AmLYD7W2Xb23nRy2iUINmbqLJSyfCSHAydGQY00YOLiyetMdnQYFuBKtUFf9n24DjY/
         F8gcT0BP3iK1RcIqXtvxTb54jW8xwN5f8VLeSCW2HohAzKYYE0zEA2vyzLx+1X4tLLyn
         75/Q==
X-Gm-Message-State: AOAM530k2iapwhUErSEJz+QoH8taheWLdvM6X0UCNYUUWJTMRpcdpvNg
	bX07qQ6OU3ZlXzck9dWOE3s=
X-Google-Smtp-Source: ABdhPJyZZZV+wfrsLmGyU9/XBeGLC39SSrF3yJ5eezzfne8kc8pLLB7b7R+sPXVfEDZ31n3kyDjrMg==
X-Received: by 2002:a05:6512:3190:: with SMTP id i16mr29343846lfe.340.1629822295922;
        Tue, 24 Aug 2021 09:24:55 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id d1sm471217lfh.209.2021.08.24.09.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 09:24:55 -0700 (PDT)
Subject: Re: [PATCH 2/2] staging: r8188eu: Make some clean-ups in
 usbctrl_vendorreq()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20210824142823.16845-1-fmdefrancesco@gmail.com>
 <2327592.S5L5zkRU50@localhost.localdomain>
 <a5bfab84-16cc-52ad-5cdb-038765bf0b36@gmail.com>
 <1730935.6n1DRfr91A@localhost.localdomain>
 <8984a400-0d1a-07cc-cff4-c0eeef81fc79@gmail.com> <YSUb1BPAGmP9wngU@kroah.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <9f4a66c8-73e3-199c-5d4e-7b6ea495a850@gmail.com>
Date: Tue, 24 Aug 2021 19:24:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YSUb1BPAGmP9wngU@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/24/21 7:18 PM, Greg Kroah-Hartman wrote:
>> It can be easily fixed. We need public fork somewhere (github,
>> git.kernel.org ...) and we should ask Greg to add remote-branch to his tree.
> 
> No, not going to happen, sorry.  I will catch up with patches when I get
> the chance and then all will be fine.  This is highly unusual that there

Ok, sorry for this idea, I am not familiar with maintaining process :(

> are loads of people all working on the same staging driver.  No idea why
> everyone jumped on this single one...
> 

My guess is
	1. It's new
	2. There is a lot work to do

> relax, there is no rush here...
> 

We don't try to rush, just discussing. Sorry to bother you :)



With regards,
Pavel Skripkin
