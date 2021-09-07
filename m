Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5115072
	for <linux-staging@lists.linux.dev>; Tue,  7 Sep 2021 09:00:32 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id q3so12900923edt.5
        for <linux-staging@lists.linux.dev>; Tue, 07 Sep 2021 02:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PkchqnGuk/ySbXtKvms/C1zLk07yrgFVpU8DdG8eDpo=;
        b=lpLnjtplZ4AEqR5dI8A/UQmsGmpa/mqxc/rzXJP5J6dsILvr+NH+14qGhNsWUDWsVq
         cfiZzwaeUP7mECV9kcyx539TwbVjmwZvP/7+2cAeUxPxjM1Ohb60uP6WDYpQ1gzwRJWX
         2IwnWwZMzQTYfssLtKFAYn/mStMpnut/LoyvHMF42EeoPSsW4Rs1yBzzWrsYP+90HQ/B
         5iN+LUpv1o/LLKHLERO40XFE5f7yHeOE9P7HUTZ4rGm6b61DbIHbF7IRuSl8nmPVHbwy
         Qs5Aj/r93GyJW+fTqQhHHzlgOiTf/72+pFcUtEhIkzWEg+su7Skofbcpl8S8bnHcvRgR
         y5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PkchqnGuk/ySbXtKvms/C1zLk07yrgFVpU8DdG8eDpo=;
        b=ltbfMw6+g4KLd0TH7gTq4D7Sl3x8FDGAMMj/6lLFh5jVVM72+xgLFB16vFjPHjDRHJ
         1Ylo5oGLTaHDxAbsYbLxE9wMClV4oNPnePawmT1AJVR5VUeKulWM1S9IEQC0Go0jGsVB
         069dUtdmuSrFnvjGlhxYkpKByxGGlOi9hdP8YY1aAmlo93H2UfTz3n7cwE2SbYs+PFRG
         tWicoUTTZ0VjdNlz2p27LOy5TuEwswUX1XcHLiKNvs/6PB4g1UwKREn6WYUTKNGbc6o9
         oVtDTrhTHPgnFa44CemXen/0KxN9xj0ivZV5zrdgU0/CtuWmO2WTc0P2jP07qKIRpNK+
         j1SQ==
X-Gm-Message-State: AOAM530yumdDo295km68wRuaCROJcx1C+2VVlfHMvofG9dCpef4uURv5
	ZN6rUYXcfEiQ9fb1Yp9UWCs=
X-Google-Smtp-Source: ABdhPJzAmbWB12ZMlTcLWv3h0vQ8aTQubvSWSTWVS3KiXh9j5VNtknE3tBewnAcSOepciIOiz6vqXg==
X-Received: by 2002:aa7:d7d5:: with SMTP id e21mr45189eds.27.1631005230714;
        Tue, 07 Sep 2021 02:00:30 -0700 (PDT)
Received: from localhost.localdomain (host-79-23-101-208.retail.telecomitalia.it. [79.23.101.208])
        by smtp.gmail.com with ESMTPSA id j5sm5137485ejb.96.2021.09.07.02.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 02:00:30 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org
Cc: paskripkin@gmail.com, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, larry.finger@lwfinger.net, phil@philpotter.co.uk
Subject: Re: patch "staging: r8188eu: Remove _enter/_exit_critical_mutex()" added to staging-testing
Date: Tue, 07 Sep 2021 11:00:28 +0200
Message-ID: <3355001.phisWU0qcP@localhost.localdomain>
In-Reply-To: <1630997812180231@kroah.com>
References: <1630997812180231@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ANSI_X3.4-1968"

On Tuesday, September 7, 2021 8:56:52 AM CEST gregkh@linuxfoundation.org 
wrote:
> 
> This is a note to let you know that I've just added the patch titled
> 
>     staging: r8188eu: Remove _enter/_exit_critical_mutex()
> 
> to my staging git tree which can be found at
>     git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> in the staging-testing branch.
> 
> The patch will show up in the next release of the linux-next tree
> (usually sometime within the next 24 hours during the week.)
> 
> The patch will be merged to the staging-next branch sometime soon,
> after it passes testing, and the merge window is open.
> 
> If you have any questions about this process, please let me know.
> 
> 
> From d3c6dfb00bd9fe75f3a44246d6db7991f6443bac Mon Sep 17 00:00:00 2001
> From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
> Date: Sat, 28 Aug 2021 13:36:56 +0200
> Subject: staging: r8188eu: Remove _enter/_exit_critical_mutex()
> 
> Remove _enter_critical_mutex() and _exit_critical_mutex(). They are
> unnecessary wrappers, respectively to mutex_lock_interruptible() and
> to mutex_unlock(). They also have an odd interface that takes an unused
> argument named pirqL of type unsigned long.
> The original code enters the critical section if the mutex API is
> interrupted while waiting to acquire the lock; therefore it could lead
> to a race condition. Use mutex_lock() because it is uninterruptible and
> so avoid that above-mentioned potential race condition.

Dear Greg,

I've just read this message. Thank you for applying my patch. I really 
appreciated that you trust the code :)

Unfortunately it makes me wonder if I should have added a "Fixes:" tag 
because it (among other things) prevents a (possible while remote - I guess)
bug. The code entered the critical section if the sleeping of the 
interruptible mutex were interrupted by signals and so it could lead to race 
conditions.

I have this doubt. Please let me know if I'd better redo the commit message 
and add the above-mentioned tag.

Thanks,

Fabio
 
> Tested-by: Pavel Skripkin <paskripkin@gmail.com>
> Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Link: https://lore.kernel.org/r/20210828113656.6963-1-fmdefrancesco@gmail.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c     |  4 ++--
>  drivers/staging/r8188eu/hal/usb_ops_linux.c     |  4 ++--
>  drivers/staging/r8188eu/include/osdep_service.h | 13 -------------
>  drivers/staging/r8188eu/os_dep/os_intfs.c       |  4 ++--
>  4 files changed, 6 insertions(+), 19 deletions(-)



