Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD692F28
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 14:18:57 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id m4so42628338ejb.9
        for <linux-staging@lists.linux.dev>; Mon, 07 Feb 2022 06:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tfB/zROpbDPZLG78pKHBRJBlB4fwx1ChfM+AdqDD0XQ=;
        b=pZrIanIvKRIMLV+bqgMmQkAsSfEdQjqG63Ye9+OXXvUo5mqE8v11izZJtJda1PK7+y
         7dUdLZHu7+ps05pzUgXXziVTx/B+C5SYTQy7Mtdl2bSh8S6hK8vYAOeoACg7C9BEjZVF
         DDnRZOrPI/nBwGBoSNCPFlCoeGqebUkQ6hRVfs5yGr37QE1mx660jeZZZqXwcmjfzyO+
         Zy1Lg6XyeY3KHwgRf7NTnkJqqjoqF9uh9gn0hDQQ5vIJliA3KdF7xBHzyemNwSPa205p
         NWNwcYgRJFob+HF6mGY44iSeqxHn95L0ei8an5bBUSQFnzjneFsFg4copji/vtg//x/t
         Eydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tfB/zROpbDPZLG78pKHBRJBlB4fwx1ChfM+AdqDD0XQ=;
        b=aWqHoc478kEEaFZ1mkITqxzK6Q9ok/dW+1phtnLKDNCxm+LrdE8S0EDpSVxXISHc+c
         oMNyjekuZkO/hopnG01AHmofN8yZG6Y082fYFFYKziuRzWhK9SrSEwGnA/JtD4/gk+jn
         u5egd/AquuZRUN22fO7YlKgPdGPIBfxUbjh3F9cqmibPyEhgdBD5V5hJpRIqNW8s3bFo
         WcU2oytaZhMiPnJulJPc97MD9RbbDM0LbPGlZlhKYppZvCTm0UdFh1yUWkK9k9peQg10
         EgNTnIRfu+c1Js9K9e2+yT4CSfxoxTdYAt5uwMoaH9TcmaVh/88apXsc98zkeLtT12wm
         +p/g==
X-Gm-Message-State: AOAM532x1XkrN5D0AVBK3lxvm+0uenIi3xmzRkWabXivMLBxwo6mKBo0
	Bj3Ewnvxl+LH27Tq01BhhRM=
X-Google-Smtp-Source: ABdhPJwkSTlEuTXCOARVUrk633TbxK1cwiIaELgL69VZlxplrlhknCUA8PbZxadhJj5PxhPV5/OIJw==
X-Received: by 2002:a17:907:9622:: with SMTP id gb34mr10458178ejc.422.1644243535576;
        Mon, 07 Feb 2022 06:18:55 -0800 (PST)
Received: from leap.localnet (host-95-245-2-16.retail.telecomitalia.it. [95.245.2.16])
        by smtp.gmail.com with ESMTPSA id cb18sm2267625edb.25.2022.02.07.06.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 06:18:55 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, phil@philpotter.co.uk, larry.finger@lwfinger.net, julia.lawall@inria.fr, linux-kernel@vger.kernel.org, Michael Straube <michael.straube@stud.uni-goettingen.de>, martin@kaiser.cx
Subject: Re: [RFC] staging: r8188eu: Sleeping in atomic context (SAC) bugs
Date: Mon, 07 Feb 2022 15:18:52 +0100
Message-ID: <23161490.ouqheUzb2q@leap>
In-Reply-To: <20220207092133.GE1951@kadam>
References: <2111927.Icojqenx9y@leap> <20220207092133.GE1951@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, Feb 07, 2022 10:21:33 CET Dan Carpenter wrote:
> On Mon, Feb 07, 2022 at 01:02:17AM +0100, Fabio M. De Francesco wrote:

Hello Dan,

Thanks for your exhaustive reply.

> > My first question is whether or not msleep() can be called in atomic context.
> 
> You are not allowed to call msleep() in atomic context.

OK, well. You confirmed what I was suspecting.

> The Smatch
> check for sleeping in atomic did not look for msleep so I will update
> it.

I'm glad that my observations suggested you that update to Smatch :)

> > If
> > I understand its semantics and implementation it seems that it should be forbidden.

Said.

> > What about changing it to mdelay()? Again, it seems that mdelay() spins without 
> > sleeping so it should be safe. Isn't it?
> 
> mdelay() is does not sleep,

OK, again. It seems that I've been able to understand the different implementations 
and semantics of msleep() and mdelay().

> but it's not necessarily a good idea to
> delay for a long time while holding a spinlock.

Yeah, I agree with you. If I recall it well, somewhere I read a suggestion which
says that one should avoid mdelay() for more than 1 ms while under spinlocks.

Thus it looks like here we have a problem...

The disable of bottom halves and the acquire of a spinlock is performed in 
rtw_set_802_11_disassociate(). If "if (check_fwstate(pmlmepriv, _FW_LINKED))" 
evaluates true, rtw_pwr_wakeup() (that is a macro defined as _rtw_pwr_wakeup())
is invoked. In the latter function I see two conditional calls to msleep(10).

Thus it is 10 milliseconds and I suppose that it is a huge amount of time under 
spinlocks. Nevertheless, I think that we should use mdelay(10), unless with 
proper tests we find out that 10 ms can be reduced a bit.

A couple of months ago I made an analysis of a report by Syzbot that led to a 
patch in the tty line discipline. That ftrace analysis was necessary to prove 
that that SAC bug could hang an IOCTL for more than 8000 ms. 

Why am I saying this? Suppose that one of those msleep(10) cannot recover within
acceptable time, that 10 ms argument would behave like 100 ms, 1000 ms, or 
even hang the driver indefinitely.

I trust your words (as usually): "[] it's not necessarily a good idea to delay 
for a long time while holding a spinlock". But what are the alternatives?

1) Leave the code as-is with those msleep(10) and risk to hang the driver (or 
the whole kernel?).
2) Change msleep(10) to mdelay(10). It's a huge amount of time, but we are 
guaranteed that it is safe.
3) Change to mdelay() and try to figure out what's the minimum amount of time 
that suffice. I forgot to say that those msleep(10) are within "while" loops, 
therefore they are called an unknown amount of times.

If we choose the third option, how can we test the driver and see if shorter 
delays may work? Can you suggest a methodical approach for figure out the 
minimum amount of delay that can work? I have the hardware, therefore I can 
test the changes, but I'm not sure about how to do this work.

Any other solutions?

> > 
> > Furthermore, I noticed that _rtw_pwr_wakeup() calls ips_leave(). The latter 
> > acquires the "pwrpriv->lock" Mutex. Aren't we forbidden to call Mutexes while 
> > holding Spinlocks?
> 
> Correct.  You cannot take a mutex while holding a spinlock.

Again, thanks for confirming.

> Where is the spinlock in taken in the code you're talking about?  If
> it's rtw_set_802_11_disassociate() then that's fine.  The check for
> if (check_fwstate(pmlmepriv, _FW_LINKED)) { will prevent ips_leave()
> from being called.

You're right: "if (check_fwstate(pmlmepriv, _FW_LINKED))" in _rtw_pwr_wakeup() 
will prevent a call to ips_leave(). Therefore, it seems that we have no problems
with the mutex in ips_leave(). 

I had not noticed the above-mentioned "if" test. Sorry :(
So, let's leave the code as it is.

Thank you very much.

Regards,

Fabio M. De Francesco 

> 
> > My second question is: should we substitute that Mutex with a Spinlock and use 
> > it everywhere else the struct "pwrctrl_priv" must be protected in the driver?
> 
> Changing Mutexes to spinlocks is tricky.  I can't review your proposed
> patch before you send it.
> 
> regards,
> dan carpenter
> 
> 




