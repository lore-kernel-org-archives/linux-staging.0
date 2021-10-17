Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DF872
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 10:29:06 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id u8-20020a05600c440800b0030d90076dabso4132688wmn.1
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 03:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8VosDvF7EwZzUqzxcx7pxTK+08l2HWNL8LGQGEpzwAk=;
        b=KAvVdSE3Kg+JGbVm/PS0scTsA9tUPOv7fylCAxLAmUTfFDyI4ygSTMEmm7dAPlOhpj
         0vxhvngvkX8YcBydyxg7y0w6hKjG/VzigfLPvnyszIGFhCTWHyrewwNVL2fFAwLm+xX2
         c2x7j/MuTNEemo3KomqksBs0qWTJ8XItsIbq8QWdNckBO2aXlPMcbTHS16wV0L7ntUkc
         j7+42V/0V1wGTBkBJMXBmTLIwdec44KPpLsBzr0p6E3gt/Ep9jtsXlWs0Tl4E6WUvZc5
         R3kl3TZeCbx0E5Q5Y13eg1sMgWUM2g9efF+k+DmzlxznCkF8pPQ3/7Z/HFTHM8MGobbm
         HZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8VosDvF7EwZzUqzxcx7pxTK+08l2HWNL8LGQGEpzwAk=;
        b=QG+u+jql9haElSI9QIlx0G0pou5wjyxfePdROMVg9i3l11fo9GIJ1/G4ASaD6F43Rx
         5QoxxJ91QPg8wt06UDkBuK/6NnfxPGb/Ndw3QsfwbkxVSQBJZKAhCtou4IqpfDvFz2PO
         tTor9EYsspR7w7XujrHT/d741WdseH90ABgG34/DY70ga5gCqoCIlm2AIkyWZQie3GMu
         XywI9IOl13eBfzZ56SL2Bi+qgnWv6nk+fuqx4kSv9MCrxhgRi8thvsp6YOEAPQ8cbnZ+
         ru197bXNZLvqjBFH0FLbWHlBoqLsDk7Wq8XC5WiXDr1jJv6VdokhwkaCwhdN/SOiIBhT
         8vTQ==
X-Gm-Message-State: AOAM532ZmFwIgvj0MK5DtpnG42M+El3EDcLYQDI+ClLIrOJ+eu6aIaTg
	TDWYrQCIH+Y1JjQlz4YEL9YbBA==
X-Google-Smtp-Source: ABdhPJwl6mYyIYP/bhGVsBHsC8+2OSQBVsQToH+CJk10r095XEsi1tEl7wVTv1Dh/CWcpgmqaMAQFQ==
X-Received: by 2002:a1c:790e:: with SMTP id l14mr38403597wme.99.1634466544717;
        Sun, 17 Oct 2021 03:29:04 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id c7sm11941272wmq.13.2021.10.17.03.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 03:29:04 -0700 (PDT)
Date: Sun, 17 Oct 2021 11:29:02 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martin Kaiser <martin@kaiser.cx>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: r8188eu: don't accept SIGTERM for cmd thread
Message-ID: <YWv67ozbJGxMa69t@equinox>
References: <20211016181343.3686-1-martin@kaiser.cx>
 <20211016181343.3686-4-martin@kaiser.cx>
 <2409617.cBYgoVRs56@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2409617.cBYgoVRs56@localhost.localdomain>

On Sat, Oct 16, 2021 at 08:53:15PM +0200, Fabio M. De Francesco wrote:
> On Saturday, October 16, 2021 8:13:43 PM CEST Martin Kaiser wrote:
> > At the moment, our command thread can be killed by user space.
> > 
> > [root@host ]# kill `pidof RTW_CMD_THREAD`
> > 
> > The driver will then stop working until the module is unloaded
> > and reloaded.
> > 
> > Don't process SIGTERM in the command thread. Other drivers that have a
> > command thread don't process SIGTERM either.
> 
> Hi Martin,
> 
> This is _really_ interesting :)
> 
> May be that you have had time to read my last email in reply to a message of 
> Phillip P. Soon after writing of the arguments in favor of using 
> wait_for_completion_killable() (in patch 2/3 of the series I sent today), I 
> read your patch.
> 
> If you are right (and I think you are) I'll have to send a v2 that replaces 
> the killable wait with an uninterruptible one.
> 
> Unfortunately I have not the needed experience to decide whether or not to 
> ack your patch, even if I'm strongly tempted to do it.
> 
> Let's wait for more experienced people.
> 
> Thanks,
> 
> Fabio 
> 

So I myself am a little confused on this one :-)

Based on my understanding, so correct me if I'm wrong, a process (kthread or
otherwise) can still be killed if marked TASK_KILLABLE, even if ignoring
SIGTERM. Indeed, from a userspace perspective, SIGKILL is unblockable
anyway - although of course kernel code can choose how to respond to it.

So in other words, the kthread could still be killed while waiting
in the wait_for_completion_killable() call, even if we are ignoring
SIGTERM. From that perspective I guess, it is therefore not 'incorrect' as
such - if indeed we wanted that behaviour.

That said, killing it would still cause the behaviour Martin mentions -
I guess we don't want it to be either killable or interruptible based on
that logic?

Regards,
Phil
