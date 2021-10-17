Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7E672
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 20:12:21 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id e3so37086407wrc.11
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 13:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xXdp0yKUX2rgIYI59paHHrjt2+4bivLxdycSpCBF/7M=;
        b=nB7U2xr4jSwLzCT2bS/it9BeB6Fjjep7I3ECHrdgRsnkTq4aZfRmIAaj+B9stDAeYD
         pEhx1iniALfiV2+l0aqqjusrxgxt2trs79pEdcXEAUkRsp29hP7N330/mDdgtFuNL4Uw
         Rp96LJ3rbQCxqNZU5/kSsqjXFPZJxHiSptAVwPeUTtge3hVjk2ewaLbskqqiCIqXhXRR
         z6nxz4j1S3bmIRxpQrWyuuap89IlOta3LPSGsevhatoqZSRUUup6AqIh290hKFhvXPZk
         cTUwflMBSCJRy/I/codzuhdwlUQ2LeVXJWjS8bbANuRD43ngwik0KO/kW2LCutKdC2qf
         7YwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xXdp0yKUX2rgIYI59paHHrjt2+4bivLxdycSpCBF/7M=;
        b=ncrvyAhWlyA1Qm+H8v/RJoQAfKntOJiX4IXtIR4GIr3LKXXY3CkGWMj0/6ddEFuQn5
         D1ZJwQ7m4k+Om88xUko98bDqmE/qfGyNjuOYc3L7+wkNNeH5VFi7WPpczg+bEbhs0+Mm
         HQUhVqRdsmvTybGapohtwSwb2mJHbEvCt7Y1e20kTvvSoeP+9Xu28XVarRd65l4ObTsu
         6kR/gKyvpeiojH88H1ANKbmjQttHAjCZEF4iAq3tf8Bh3769wjvYuG4m+xvLIdxnZwXf
         lnfUnE9VBVFUfA4euPEhH5n6otQeGM3OLfIVMJcPAVaGiQAmGFPfZhlYtfyrup9JuiY8
         Qqlw==
X-Gm-Message-State: AOAM532CEex1dJjXAlJ7OgGjszCa175YgSXBaZdo3z5ZYfh9AU3JNRyN
	falGDd9IUoC6+WfxH7RuRXUucsMhqtWBHQ==
X-Google-Smtp-Source: ABdhPJz4ECDUfOOXkpO9IjIojbLMYKG7XSKYWjwinTPm+fL55DzNcu0QQSM3P57u9xEw0mlT45Wf/A==
X-Received: by 2002:a05:6000:188e:: with SMTP id a14mr29571853wri.223.1634501540034;
        Sun, 17 Oct 2021 13:12:20 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id e15sm10581504wrv.74.2021.10.17.13.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 13:12:19 -0700 (PDT)
Date: Sun, 17 Oct 2021 21:12:17 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Martin Kaiser <lists@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: r8188eu: don't accept SIGTERM for cmd thread
Message-ID: <YWyDobhWyrJx5fGK@equinox>
References: <20211016181343.3686-1-martin@kaiser.cx>
 <2409617.cBYgoVRs56@localhost.localdomain>
 <YWv67ozbJGxMa69t@equinox>
 <1957621.GeRc3qvyWe@localhost.localdomain>
 <20211017180237.bvc6spwbj72zyjhi@viti.kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017180237.bvc6spwbj72zyjhi@viti.kaiser.cx>

On Sun, Oct 17, 2021 at 08:02:37PM +0200, Martin Kaiser wrote:
> Hi Fabio and all,
> 
> Thus wrote Fabio M. De Francesco (fmdefrancesco@gmail.com):
> 
> > On Sunday, October 17, 2021 12:29:02 PM CEST Phillip Potter wrote:
> 
> > > So I myself am a little confused on this one :-)
> 
> > > Based on my understanding, so correct me if I'm wrong, a process
> > > (kthread or otherwise) can still be killed if marked TASK_KILLABLE,
> > > even if ignoring SIGTERM. Indeed, from a userspace perspective,
> > > SIGKILL is unblockable anyway - although of course kernel code can
> > > choose how to respond to it.
> 
> > Correct.
> 
> And it seems that by default, a kthread can't be killed with SIGKILL.
> 

Ah, makes sense. This was a misconception on my part, apologies :-)

> > > So in other words, the kthread could still be killed while waiting
> > > in the wait_for_completion_killable() call, even if we are ignoring
> > > SIGTERM. From that perspective I guess, it is therefore not 'incorrect' as
> > > such - if indeed we wanted that behaviour.
> 
> > No. This misunderstandings is my fault. :(
> 
> > In Martin's patch I read "SIGTERM" but for some reason I thought he was 
> > talking of "SIGKILL".
> 
> > At the moment, without Martin's patch, the kthread can be terminated by the 
> > command "kill -TERM <PID>". If we try "kill -KILL <PID>", nothing happens.
> > This is because only "allow_signal(SIGTERM);" is present in the code.
> 
> Exactly. And this is probably not by intention. It would be consistent
> to either allow both or none - the latter makes more sense, and it's
> what most other drivers do.
> 
> > I think that kthreads must also allow  SIGKILL with "allow_signal(SIGKILL);" 
> > for allowing root to make them terminate.
> 
> Probably. nfsd seems to do this.
> 
> > For what relates to my patch, it doesn't matter if I either leave 
> > wait_for_completion_killable() as-is or change it to wait_for_completion().
> > This is because at the moment SIGKILL cannot kill rtw_cmd_thread(), while 
> > SIGTERM can.
> 
> > However, for consistency, I should better change it to the uninterruptible 
> > version.
> 
> That makes sense to me.
> 
> Let's see what Greg and others say...

I've found this discussion to be most enlightening :-) I certainly agree
that consistency in approach is a good thing, so perhaps
wait_for_completion() is a better choice therefore, despite it having
the same semantics in this instance due to us not allowing SIGKILL by
default anyway. Others will know far more than me in this regard though.

Regards,
Phil
