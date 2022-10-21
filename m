Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0B88F4D;
	Fri, 21 Oct 2022 06:11:16 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id 8so1461266qka.1;
        Thu, 20 Oct 2022 23:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4TDVEecvJ/SyUgNeYkrUsV7GwIq/acYXERijSp1ev9I=;
        b=af+XHWpH2wFmLESBvoDa53/Ahgt8ffIl6QGSwnrtokuIRg/3jRps7FrEa4rWTzzk6O
         hdg3enDxjfSk0bsJWevvglz+TrZHs4tHrW0cFUDPrr41FAlyt203JnzvIGZ9p2K8KZX8
         AbMZsczY4IsDZHUgoHwvDMC7vMC94CDGQbwcMh4h2XqngsAdWdZ/pa2UzxU5nzJysEkW
         Bw00aouawlA5J5rNTMTFQS9Jl0qc18SR6tgSQwxVaiIdZQ7Axmn0ZygbslzsNpB+EZIE
         lURoYnIoE3c5QrwkN/s+dVQvtNvHjvMGsXfqUR8IAdA8PKNa6G8S0wALt3Sssq+/TDJa
         AjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4TDVEecvJ/SyUgNeYkrUsV7GwIq/acYXERijSp1ev9I=;
        b=iexUR+oq0lfHqqAFoBrnGSgHSAoZqVa2cuGjBr9I82TXeEUgU4JH+96mAyRH0Gg+AA
         as+MjOMBGRHoAMCLq1gVDoj81/wc0C7iz/SJ8vKVsDDzirklsWARBjnzucE/ziGaS1uR
         KV9Kg62R9uO8Yv3+GD1k7SSqHlQwARL3LluGtLCIMNGI3JYPioy9jJLtoLrmKcXe/8ZY
         i4tY2pQwTJOE85WL4FLn3KlGOoM9RRF9xr0loNBroZlen7WcL6z3oOSXALltDbojWvyR
         Qj/8nnuPCRj7mKEIZWE5BubwOurQrC5I0OSKMtzSME06r+cTNwN4VIZjoz+OU4AnNuBF
         Ix6g==
X-Gm-Message-State: ACrzQf0aiQth9d1Py4p14WMm1kTTXbE/SG3B44QayJ+RdGfIU84xiCt2
	xaYJ6+QyClRTdeK4aqWGKBGge7CwQh/ZnHOgmXM=
X-Google-Smtp-Source: AMsMyM4KFK7vhngr/End276m/Ke1VLWd6CSQzc7IjKQg45J57OCw0TjBWsZmBaJPhSDIeAUpkVh9FKOvIY97lUZRkSs=
X-Received: by 2002:a05:620a:2699:b0:6cf:3a7f:5fe6 with SMTP id
 c25-20020a05620a269900b006cf3a7f5fe6mr12797372qkp.103.1666332675621; Thu, 20
 Oct 2022 23:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y1Eqa7uKB+Wk+Mb+@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
 <CAOkYk0iU0B98JsH77avky--AS19V=GhQox2f_b4PAG3ZBB+SVQ@mail.gmail.com>
 <CAHJEyKX=yyuyYFajs880CuPdc019dBOm_LCkgXHzjFaA-Jgt2A@mail.gmail.com>
 <Y1E6qYkzkRxlloNp@kroah.com> <Y1Fds7BJjY/OcwU0@mit.edu> <Y1Hby38PE/QVlRhF@Slackware>
In-Reply-To: <Y1Hby38PE/QVlRhF@Slackware>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Fri, 21 Oct 2022 07:11:01 +0100
Message-ID: <CAHJEyKU7dH6HQW4rrd3gq5pnYUxOA0MGRUqtnC_yExt3PBok1g@mail.gmail.com>
Subject: Re: Request for assistance
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Greg KH <gregkh@linuxfoundation.org>, Tanju Brunostar <tanjubrunostar0@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 21, 2022 at 12:38 AM Bhaskar Chowdhury
<unixbhaskar@gmail.com> wrote:
>
> On 10:39 Thu 20 Oct 2022, Theodore Ts'o wrote:
> >Tanju, some additional hints.  First of all, please don't send cleanup
> >patches to address checkpatch --file complaints about overly long
> >lines.  It's generally not worth the code churn.
> >
> >Secondly for code that *you* are writing, think about why you have
> >lines which are exceeding the line width in the first place.  Is it
> >because code is being nested too deeply, and perhaps some judicious
> >function refactoring with good function names might make the code
> >clearer?  Would adding some temporary variables that are judiciously
> >named make the code look clearer?
> >
> >The rules about "thou shalt never have lines which exceed 78
> >characters" are rules of thumb.  The high level goal is to make the
> >code more readable and easier to understand, since good code is
> >maintainable code.  And sometimes it's not just about where to split
> >lines of code but whether there is a better way to structure the code
> >so that long lines aren't needed in the first place.
> >
> >Cheers,
> >
> >                                       - Ted
> Righto!! I failed to miss it my replies. That an editor can be trained or
> customized to that way. Especially , vim and emacs.
> --
> Thanks,
> Bhaskar
>
> "Here's looking at you kid"-- Casablanca
> https://about.me/unixbhaskar
I appreciate all your replies. They have been quite helpful. I will
try to apply them as I continue on my journey of contributing to the
kernel
