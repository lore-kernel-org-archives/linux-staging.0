Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3025E3FC0
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 13:55:41 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id u14so6389730ejf.13
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 06:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MKfodZXZvIrrw5PPUR+bEa76zJbCXfNx6YXTzXfUQQw=;
        b=rxOj/UMHt4IkGQUbS8vaxUcs9xe+DNhh6yQ+3He8blLS69/v1A+l/FhRCknsFZux++
         owF1+1IZQjl23FpgQqOAZkli1NhfkKQAjdWVx4ymSEOEwtied/gJO3u3Ihx+cuOyxdCr
         If6pELGQBg7kI4BuAsE5fUxopKEw1yMUjsGxJ+HsKKQCLuFH9i40c3XuqNCASdl9Z0/x
         GBgXUcrXYYNV9kx9qaChCg1SSMUEp0Q8cApmLsc2x2nNOcPILbJLlX/Aiw7+bNPInyoc
         qyfclBVUZHTKcyWGVzt8gDxyxCWK5MZ87V4vhl1ZkzePYJbZWEE+x3GICEM3P0BsvE8D
         eetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MKfodZXZvIrrw5PPUR+bEa76zJbCXfNx6YXTzXfUQQw=;
        b=EhTRhRpFLMZtRcA92tqzSPYJq0jcOyvu5vEwkKV6EhXSQ3QX6wmKPIuJRWFmewM0W0
         x6xDVG8fsXzekCUgtfAspjVveltXJecoXs2Y4b1l98bqcnqjbrUjKh0NQPl9rtFZe+Tx
         4c3eXnpE3CpJjrutL11zHKxbBD1G5bGXO1+uexjiwxmAUf8Nw8Nk+Fs8cucBeStvcGJb
         pvVB/+IVoqYXy/aoMGkRg73BzsGLOI7VRNDo5pVSJGkCJaXa9ZB1WOXS2NWXdbP3zoMA
         IsKQzVz9Gb3XiCri4fi7JgpfZMIivcZZNGNaZbSPAiwJ8dgyRpXw7AMo/dxJzmorlRo1
         EDeg==
X-Gm-Message-State: AOAM533fq69KT6hV9LdVPEoFwgGOAzRXDFOrJ8ezj1sFuWqFHnl960Wi
	zgW0ri6KFwpPphoacdX2E9Q=
X-Google-Smtp-Source: ABdhPJyxG3iLa509fNGB91uafGhnLs7oLnXjRLu+JaCBTuXlQ9e39TbVNgAu5DvMRcaG/hcbObxXaQ==
X-Received: by 2002:a17:906:29c7:: with SMTP id y7mr4463890eje.258.1629986139539;
        Thu, 26 Aug 2021 06:55:39 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id i6sm1903367edt.28.2021.08.26.06.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 06:55:39 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Martin Kaiser <martin@kaiser.cx>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: r8188eu: Remove _enter/_exit_critical_mutex()
Date: Thu, 26 Aug 2021 15:55:37 +0200
Message-ID: <1729205.azBTxCciFU@localhost.localdomain>
In-Reply-To: <YSdu00zpqfGkKc1e@kroah.com>
References: <20210819221241.31987-1-fmdefrancesco@gmail.com> <YSdu00zpqfGkKc1e@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 26, 2021 12:37:07 PM CEST Greg Kroah-Hartman wrote:
> On Fri, Aug 20, 2021 at 12:12:41AM +0200, Fabio M. De Francesco wrote:
> > Remove _enter_critical_mutex() and _exit_critical_mutex(). They are
> > unnecessary wrappers, respectively to mutex_lock_interruptible() and
> > to mutex_unlock(). They also have an odd interface that takes an unused
> > argument named pirqL of type unsigned long.
> > The original code enters the critical section if the mutex API is
> > interrupted while waiting to acquire the lock; therefore it could lead
> > to a race condition. Use mutex_lock() because it is uninterruptible and
> > so avoid that above-mentioned potential race condition.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> 
> You have changed the behavior of the code here, how have you tested that
> this still works properly?
> 
> thanks,
> 
> greg k-h

I forgot to say in this commit message that I've not tested it. I said that in other 
patches I've submitted during this days (it's because I'm on vacation and I haven't
my device with me), I'm sorry that I forgot to say the same also when I submitted this.

I understand that I've changed the behaviour of the code. I did that because the old 
code had mutex_lock_interruptible() that, if interrupted while waiting for acquiring
the mutex, it led to a potential race condition.

In the first version of my patch I wrote:

-       _enter_critical_mutex(&pxmitpriv->ack_tx_mutex, NULL);
+       if (mutex_lock_interruptible(&pxmitpriv->ack_tx_mutex))
+               return -EINTR;

I didn't explain why I decided to check and handle a possible -EINTR. Since the original
code had no checks of the return value from mutex_lock_interruptible() I thought it
could potentially enter the critical section, so I decided to check the return value and
exit if I have -EINTR. I guess it shouldn't be allowed to enter the critical section without
proper locking.

Then I read another message of yours: "[] (my guess, one almost never needs
interruptible locks in a driver)". I interpreted this as: you should change the code
to use mutex_lock() (that is uninterruptible) because you don't need to use interruptible
locks here. That's why at v3 I changed again the code above and used an uninterruptible
mutex_lock(). That's it.

Now  let's go back to the question you asked with your last message. I must admit that,
although I have been working here in staging for more or less four months, I still have 
some problems to decode your quite terse style :) 

Can you please say what you mean with your question? is it (1) or (2)?

1) The code is _plain_wrong_: go back to your v1, use the interruptible lock as you did there
and return -EINTR if interrupted; in the while, also explain why you decided to check for 
errors and what could happen if you don't test for -EINTR (i.e., explicitly say that you could 
incur in race conditions if you entered the critical section with no locks acquired).

2) The code _looks_good_, however I want t know if and how you tested it. 

Unfortunately  I won't be able to test before the first week of September, when I'll be back 
home. Please, can someone test it for me? 

Which of the two above? (If you have no time to answer, can someone else give some hint?).

Thanks very much,

Fabio

P.S.: Am I pushing myself beyond my current knowledge of how the kernel actually works?


