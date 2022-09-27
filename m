Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D11C36F
	for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 06:30:42 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id o5so5880862wms.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Sep 2022 23:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date;
        bh=GQ4pbtBCz/8lQCGInNclU//gVnxU1GodOeR4lrlBCS0=;
        b=nOCtEzeutM+hdIH+Gdu8JuXx7H6Qgr1WLOIWAZCxZX0OngnOAJHYCvX91KTlUYUUoq
         ikgEtDRgMJVtynuzM702tKqIQdgP4G6dgiMnEsSHS8+T5snk6KzAEsRb1OhizueUFuya
         qejCcBVDCClOtFZSXlTNZgMr070aC6MheIl2iQrmqpUDNtUn0FJCUE5qdx8HgbOD8l+4
         5A575kTpZE1e0f33Pcft3mtFEjYeljYsNCQBFh9f37BIEQmLJ2eQv4aZP6UTuT+yMiNe
         pC8GNep9AryCLRqjfeCb5pPY3wQxXNYO6wRWcseOk/8n1Uoaa7BmE5kTpXC3MpQpucpF
         R2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date;
        bh=GQ4pbtBCz/8lQCGInNclU//gVnxU1GodOeR4lrlBCS0=;
        b=26LPYkLBdgWEpslE0XMM3QVkCP7Olg6SxE4GXh0pR2BeIp/8L8qK5FsJMAJdQTaCxG
         sUFaCZO/CQXyCt/2mF+5fyK3ONIsOQUex8GwigQlOjOYu6tE1/3lXpdqIfBHfGxEmg8D
         2yznwgTqPvjVJrjSZhKNV37j4KPcY0mUexMaauFg13eB1ISz41/6N5PYLq8FrMySu0ZN
         3pEyFsJdtCA2VGyFpMK2/dFgCywjs6oSExD1bmCFbdP0/m2MT5Uu9CTOn1mGC10tsoSW
         sxlPo1pxTiVG20P5xXOYXkECeIKbfMiExckUFDSDuIa3mA4Bl7cmcw1jQQH8BL7awPK2
         4utw==
X-Gm-Message-State: ACrzQf3YIozamIo5CcIhqGqx+4Mmiq6DNco22TP8d+ks3qDeuxFeHCwl
	B+95GzvbYejphp5bCCu0MuGEsMpH2uw57Q==
X-Google-Smtp-Source: AMsMyM5XPwg92WTKlgIboyJe1903k3rFmXq1w0osWXx663E1pEwE7YOEhhL5MvmHurYj3YBMEmJ0Ww==
X-Received: by 2002:a05:600c:19d2:b0:3b4:a4cb:2416 with SMTP id u18-20020a05600c19d200b003b4a4cb2416mr1413443wmq.6.1664260240169;
        Mon, 26 Sep 2022 23:30:40 -0700 (PDT)
Received: from localhost ([105.184.140.234])
        by smtp.gmail.com with ESMTPSA id p16-20020adfe610000000b00225239d9265sm852418wrm.74.2022.09.26.23.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 23:30:39 -0700 (PDT)
References: <20220919132310.1494-1-joash.n09@gmail.com>
 <Yy7kON0jNecPXN/k@kroah.com>
User-agent: mu4e 1.8.7; emacs 28.1
From: Joash Naidoo <joash.n09@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
 dan.carpenter@oracle.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: r8188eu: fix too many leading tabs
Date: Tue, 27 Sep 2022 08:24:01 +0200
In-reply-to: <Yy7kON0jNecPXN/k@kroah.com>
Message-ID: <87y1u5xrkh.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed


Greg KH <gregkh@linuxfoundation.org> writes:

> On Mon, Sep 19, 2022 at 03:23:10PM +0200, Joash Naidoo wrote:
>> Coding style fix. Fix too many leading tabs and line length.
>>
>> Signed-off-by: Joash Naidoo <joash.n09@gmail.com>
>> ---
>> Changes in v3:
>>     - Fix flipped condition mistake
>>     - move skb NULL check before dereferencing it
>> Changes in v2:
>>     - Flip additional nested if conditions and don't reverse 
>>     the last if statement
>>     - Move declarations to start of function
>>     - Separate converting __constant_htons to htons to another 
>>     patch
>
> Always test-build your changes before sending them out so you do 
> not get
> grumpy emails from maintainers asking why you didn't test-build 
> your
> changes...
>
> thanks,
>
> greg k-h
Hi Greg,

Indeed building and testing is a vital step before sending
changes. Is this message referring to my V3 patch not building? Or
referring to my earlier versions?

Before sending I built my changes with:

make M=drivers/staging/r8188eu clean
make M=drivers/staging/r8188eu

I have a TP-Link Wifi dongle (Model: TL-WN725N) which I used to
test. I enabled the driver as module with make menuconfig, built,
installed (make modules_install && make install) and booted the
modified kernel image (vmlinuz-6.0.0-rc5+). Then I  ensured my
wpa_supplicant service runs fine and then just checked if I could
still connect to Wifi and browse the web. (I understand this is
limited, since I didn't catch my error in V2) Furthermore, I also
ran:

dmesg -t -l crit
dmesg -t -l warn
dmesg -t -l err

I have only gotten the following relevant warning:

r8188eu: module is from the staging directory, the quality is
unknown, you have been warned.

If there is anything I still may be lacking, please advise. Thank
you for your support.

Kind Regards,
Joash
