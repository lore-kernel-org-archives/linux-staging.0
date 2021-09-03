Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D043FD5
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 19:11:39 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id x27so259265lfu.5
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 12:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=fH6jqwVBe0NEbZ73+S4/r93qnMDjNx6WeBjuJx+zyag=;
        b=cMufVRiCIy1AD4HPiIrT972Gn1eMD03WDiJ8dto3CP0aYHdNW6G5Ruo4VmJDi1IuJB
         /NMdSsq4Fis80Oj9e5EeD6m/pbQW9CYG9PzdpE98D2htbnqJWT6mStTJLrJfq1zeivo5
         IAFPVbKNGDYMMndOaiW+Y9DN+IcKJZAT4mPrR/qx7MkRhYERUKmFtnU4sZd+ilklEzBi
         z3HZnmkxDKu4rk+wD2aJcivnHt63WdCA/ZCf6Xfj5OHY6vL0GvUuhvEB/hYlm+Yw5caQ
         5jJXIA3WTpShwsMWNgFXgyLz+vT1NcuHQ1XQ6zbAQm/NuFF5A4RSzgdXpAo+PHVeWF2i
         /l9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=fH6jqwVBe0NEbZ73+S4/r93qnMDjNx6WeBjuJx+zyag=;
        b=WGM5rqWhK78854GsQfZ+E6Vnvor8PT32PoxNPKnD+o5CleX+N4yJzkL7ikfdzpvdSP
         8hDUcM6x/KHbIJeLdjWC++NUp28hW6d+cqo5SMsnE+5g+himS+8MCdSZRUm1qI3E3mcy
         9trkdLjH5csyE12sG18zAJJ6TJJ3LCPA1VV7y1TL39x2lfik2VV/T9JlvhA+JEc2nuQ+
         2IwCGkR6JAte7uDQAuW+YDvLWfyccaoP3XHBCguD6Us4Me+fjIqmeJsBZpiOJHJJznvT
         hD94LZ2j8+qluCk/WpbdQFNgGvvWTYgbZoH5ymzFf7yIH2vLx6V5vQOB5KT5HqTTZx30
         GLFQ==
X-Gm-Message-State: AOAM533VpKyjPDwaaXLDaIaaKkMDduHypuTY8wy9+seH1ASQQE5BsO1p
	+VwPlhutlmAKljyZqPHD3FY=
X-Google-Smtp-Source: ABdhPJyM3/P23e7kTmk04TbWVNlw8on4L5YXxNGjSFmRf/9vy4ykChAAxogWqUEe4bNVyCXdBKRfRQ==
X-Received: by 2002:a05:6512:1082:: with SMTP id j2mr291236lfg.83.1630696297820;
        Fri, 03 Sep 2021 12:11:37 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.70])
        by smtp.gmail.com with UTF8SMTPSA id s14sm5463ljh.38.2021.09.03.12.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 12:11:37 -0700 (PDT)
Message-ID: <1b16a9d0-2d6b-8e12-fc9b-cfe664f623e9@gmail.com>
Date: Fri, 3 Sep 2021 22:11:34 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH v5] staging: r8188eu: Remove _enter/_exit_critical_mutex()
Content-Language: en-US
From: Pavel Skripkin <paskripkin@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Martin Kaiser <martin@kaiser.cx>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Aakash Hemadri <aakashhemadri123@gmail.com>
References: <20210828113656.6963-1-fmdefrancesco@gmail.com>
 <YTCaF5Ure2tjfbZB@kroah.com> <cd1e8e38-29e7-3565-fb16-baa6c320100d@gmail.com>
In-Reply-To: <cd1e8e38-29e7-3565-fb16-baa6c320100d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/21 18:09, Pavel Skripkin wrote:
> On 9/2/21 12:32, Greg Kroah-Hartman wrote:
>> On Sat, Aug 28, 2021 at 01:36:56PM +0200, Fabio M. De Francesco wrote:
>>> Remove _enter_critical_mutex() and _exit_critical_mutex(). They are
>>> unnecessary wrappers, respectively to mutex_lock_interruptible() and
>>> to mutex_unlock(). They also have an odd interface that takes an unused
>>> argument named pirqL of type unsigned long.
>>> The original code enters the critical section if the mutex API is
>>> interrupted while waiting to acquire the lock; therefore it could lead
>>> to a race condition. Use mutex_lock() because it is uninterruptible and
>>> so avoid that above-mentioned potential race condition.
>>> 
>>> Tested-by: Pavel Skripkin <paskripkin@gmail.com>
>>> Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>
>>> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>>> ---
>>> 
>>> v5: Fix a typo in the subject line. Reported by Aakash Hemadri.
>>> 
>>> v4: Tested and reviewed by Pavel Skripkin. No changes to the code.
>>> 
>>> v3: Assume that the original authors don't expect that
>>> mutex_lock_interruptible() can be really interrupted and then lead to 
>>> a potential race condition. Furthermore, Greg Kroah-Hartman makes me
>>> notice that "[] one almost never needs interruptable locks in a driver".
>>> Therefore, replace the calls to mutex_lock_interruptible() with calls to
>>> mutex_lock() since the latter is uninterruptible and avoid race
>>> conditions without the necessity to handle -EINTR errors.
>> 
>> Based on a recent conversation on the linux-usb mailing list, perhaps I
>> was wrong:
>> 	https://lore.kernel.org/r/20210829015825.GA297712@rowland.harvard.edu
>> 
>> Can you check what happens with your change when you disconnect the
>> device and these code paths are being called?  That is when you do want
>> the lock interrupted.
>> 
>> Yes, the logic still seems wrong, but I don't want to see the code now
>> just lock up entirely with this change as it is a change in how things
>> work from today.
>> 
> 
> Hi, Greg!
> 
> I've retested this patch with lockdep enabled and I actually hit a
> deadlock. It's really my fault to forgot about lockdep while testing v4,
> I am sorry about the situation.
> 
> Actually, the disconnect here is not the problem, the problem was in
> original code. Changing mutex_lock_interruptible to mutex_lock just
> helped to discover it.
> 
> 
> The log:
> 
> [  252.063305] WARNING: possible recursive locking detected
> [  252.063642] 5.14.0+ #9 Tainted: G         C
> [  252.063946] --------------------------------------------
> [  252.064282] ip/335 is trying to acquire lock:
> [  252.064560] ffff888009ebad28 (pmutex){+.+.}-{4:4}, at:
> usbctrl_vendorreq+0xc5/0x4a0 [r8188eu]
> [  252.065168]
> [  252.065168] but task is already holding lock:
> [  252.065536] ffffffffc021b3b8 (pmutex){+.+.}-{4:4}, at:
> netdev_open+0x3a/0x5f [r8188eu]
> [  252.066085]
> [  252.066085] other info that might help us debug this:
> [  252.066494]  Possible unsafe locking scenario:
> [  252.066494]
> [  252.066866]        CPU0
> [  252.067025]        ----
> [  252.067184]   lock(pmutex);
> [  252.067367]   lock(pmutex);
> [  252.067548]
> [  252.067548]  *** DEADLOCK ***
> [  252.067548]
> [  252.067920]  May be due to missing lock nesting notation
> [  252.067920]
> [  252.068346] 2 locks held by ip/335:
> [  252.068570]  #0: ffffffffbda94628 (rtnl_mutex){+.+.}-{4:4}, at:
> rtnetlink_rcv_msg+0x1e0/0x660
> [  252.069115]  #1: ffffffffc021b3b8 (pmutex){+.+.}-{4:4}, at:
> netdev_open+0x3a/0x5f [r8188eu]
> [  252.069690]
> [  252.069690] stack backtrace:
> [  252.069968] CPU: 1 PID: 335 Comm: ip Tainted: G         C
> 5.14.0+ #9
> [  252.071111] Call Trace:
> [  252.071273]  dump_stack_lvl+0x45/0x59
> [  252.071513]  __lock_acquire.cold+0x1fe/0x31b
> [  252.072709]  lock_acquire+0x157/0x3c0
> [  252.074445]  __mutex_lock+0xf6/0xc90
> [  252.076294]  usbctrl_vendorreq+0xc5/0x4a0 [r8188eu]
> [  252.076651]  usb_read8+0x68/0x8f [r8188eu]
> [  252.076962]  ? usb_read16+0x8e/0x8e [r8188eu]
> [  252.077287]  _rtw_read8+0x2d/0x32 [r8188eu]
> [  252.077601]  HalPwrSeqCmdParsing+0x143/0x1de [r8188eu]
> [  252.077979]  rtl8188eu_InitPowerOn+0x5a/0xe0 [r8188eu]
> [  252.078352]  rtl8188eu_hal_init+0xe7/0x1008 [r8188eu]
> [  252.078989]  rtw_hal_init+0x38/0xb5 [r8188eu]
> [  252.079317]  _netdev_open+0x282/0x4db [r8188eu]
> [  252.079653]  netdev_open+0x42/0x5f [r8188eu]
> 
> 

Ok, sorry for noise. It's 100% false positive. Why?

There is no pmutex in this driver. But! *All* mutexes are initialied via 
private _rtw_mutex_init() API, which has a struct mutex *pmutex argument.

So, driver registers all mutexes with the same name to lockdep map. Of 
course, lockdep will complain about _any_ nested locking...


I will prepare a patch to fix this *completely wrong* approach...




With regards,
Pavel Skripkin
