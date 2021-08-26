Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B893FC8
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 14:24:39 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id h9so6707739ejs.4
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 07:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DEfNjSCekdhqcVvTJ9JgfrtQOnM3bZoPdHSlk/HOmKI=;
        b=Atfeu+f6OF1pBdQf8HzJcN4LXwLffSFx7StW32M3Jmpd9388Du7A6ItnIcz09LYkQB
         fRzGncXJ2rGy1TKRwG9aIXyOiGeCA5g73Ho4+EKkPKns4y6nnQJuE0/I5cfv3U+yv88/
         uCVtt6WhSJbhuXtnh4h2pZWVAq5cEH00xRX8Pd/akAoyGIF6mI4TLGGvD6yqdblKUAUA
         a9/N761KvnaZ+391D48+Hwm/LWpQwrLUX3bBUWXpzSB49P5PFsOtPWT5OuOqczG10K7T
         cBjQgewBhynsMbZ2PmAq+VrEC8caz0HWi0KXt7wMuOEv5y0kpgy/0+JqvXDAex0Xkx1g
         ezKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DEfNjSCekdhqcVvTJ9JgfrtQOnM3bZoPdHSlk/HOmKI=;
        b=WOS99WQCV3Dq6cU7CLNpEEwMIW43n6EYPT/3Rz+/vzxaS5w3WX1uzmopWWH0i0rjA2
         qgsOq9lDxMjLXCFFdhXLzpgrf6Djdi41uie6nP5CBDnXWBPucEbox9pVa2expbqePafq
         H7DVCt64ImbgEJBuj0FDaD5Syd1cbJltN7WV+hv4L9sEB6b0QgdSofH2BrJoz10ULw9T
         4Zr6iyJKSnteaUNQEq/XxkmU3gNFjAYyZEcZtepVUIHnE0UOMLysGGhNTXd6Am7XnCqY
         HQ2f2oaMng5n+Jqspa3E/kvh8eSLiiHEhmM3QMKOlLUi2Jt9fayt+MMI265jcMliED3g
         13RQ==
X-Gm-Message-State: AOAM530+3pSy2WZFTQlm8KOKfPonqftqpwGbDkze6ftkLcfQe0S4GUZE
	iI/5XTncOuAcSHteEk5rRGA=
X-Google-Smtp-Source: ABdhPJw4xb21tXqsTxqbIP97KPLmpVha7qIK0Y6fLVYfRBGT+RHPZS8aJfoN5vG856yV5DKvORD49A==
X-Received: by 2002:a17:907:2677:: with SMTP id ci23mr4545440ejc.429.1629987877925;
        Thu, 26 Aug 2021 07:24:37 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id b5sm1487755ejq.56.2021.08.26.07.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 07:24:37 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v3 1/2] staging: r8188eu: Use usb_control_msg_recv/send() in usbctrl_vendorreq()
Date: Thu, 26 Aug 2021 16:24:35 +0200
Message-ID: <47945171.69uSEkksVi@localhost.localdomain>
In-Reply-To: <YSdxhfNjxOcJwxFg@kroah.com>
References: <20210825035311.8910-1-fmdefrancesco@gmail.com> <20210825035311.8910-2-fmdefrancesco@gmail.com> <YSdxhfNjxOcJwxFg@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 26, 2021 12:48:37 PM CEST Greg Kroah-Hartman wrote:
> On Wed, Aug 25, 2021 at 05:53:10AM +0200, Fabio M. De Francesco wrote:
> > Replace usb_control_msg() with the new usb_control_msg_recv() and
> > usb_control_msg_send() API of USB Core in usbctrl_vendorreq().
> > Remove no more needed variables. Move out of an if-else block
> > some code that it is no more dependent on status < 0. Remove
> > redundant code depending on status > 0 or status == len.
> > 
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> > v2->v3: Restore the test for success of usb_control_message_recv/send
> > that was inadvertently removed. Issue reported by Pavel Skripkin.
> > 
> > v1->v2: According to suggestions by Christophe JAILLET 
> > <christophe.jaillet@wanadoo.fr>, remove 'pipe' and pass an explicit 0
> > to the new API. According to suggestions by Pavel Skripkin 
> > <paskripkin@gmail.com>, remove an extra if-else that is no more needed, 
> > since status can be 0 and < 0 and there is no 3rd state, like it was before.
> > Many thanks to them and also to Phillip Potter <phil@philpotter.co.uk>
> > who kindly offered his time for the purpose of testing v1.
> > 
> >  drivers/staging/r8188eu/hal/usb_ops_linux.c | 45 ++++++++-------------
> >  1 file changed, 17 insertions(+), 28 deletions(-)
> 
> This doesn't apply to my tree at all.  Please rebase and resend.

This series cannot apply to your tree until another one of mine is applied 
("staging: r8188eu: Remove _enter/_exit_critical_mutex()"). This series builds
on the previous patch.

> But first, are you sure you want to use these new functions here?  This
> is a "common" function that is called from different places for
> different things.  How about unwinding the callers of this function
> first, to see if they really need all of the complexity in this function
> at all, and if not, then call the real USB function in those locations
> instead.

I think it could be fine to simply refactor usbctrl_vendorreq() to use the newer
API with no necessity to directly use them at least in six different places in
hal/usb_ops_linux.c. The only users of this helper are usb_read8/16/32() and
usb_write8/16/32(). Why do you prefer using usb_control_msg_recv/send() 
directly in the callers? I guess it would lead to redundant code, more or less
the same code repeated again and again within the above-mentioned six callers.
What do we improve by doing as you suggest? What am I missing?
 
> It's only used in this single file, so it shouldn't be that hard to
> unwind (after seeing where those calls are made from, and if they even
> need to be present at all.  Hint, look at the mess of where _write16 and
> friends are set to realize that structure is not needed at all, right?
> It's a long chain, the more you pull on it, the messier you realize it
> is...)

I've already exposed my POV above. However, I know that Pavel is working on
usb_read*() and usb_write*() and I wouldn't avoid to change those functions
while he is changing them. Shouldn't I better avoid further changes until 
my "Remove _enter/_exit_critical_mutexes()" get accepted (or definitely rejected)
and also wait for Pavel's series to be merged? Since usb_control_msg_recv/send()
don't return the length of the messages, my patch would break his checks of
ret == len and lead to serious bugs. I'd wait for his patches and then remove 
the ret == len check when we get rid of usb_control_msg() and use the new API.

What about my idea?

Thanks,

Fabio

> thanks,
> 
> greg k-h
> 




