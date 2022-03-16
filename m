Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D0290E
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 06:56:47 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id p10-20020a056820044a00b00320d7d4af22so1660099oou.4
        for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 23:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=03ikOjiFLTHp41pT60Qg3JjmZZJXzhQSeRVEBNJlZuI=;
        b=cuDMqO1rJIvTSe/v6Cid0kPzJUA0VCDgYHQP/w2H7G0+v6lnDsgdcup/mz6Qhvy5eT
         v75fks/9buw4lQiUOC5k8w/9DxW9UT0By/6m6QUPY77MNYvpX0688YYTljAvo4u+gSn8
         sRM7ixP7Ikh1HNDp+VHkmt9Irac3KCxtDgZ4wMnEnnAgeeh0Sk5twZd/4F2GpcQ1FJIV
         BNQB3a5CbHZyg1s1LaK4fEm0hZsVKXV+Z91xcuueYVJpd77tBIRAdKlJtxWQDVCgY85r
         Dzv10zNJvQMGlPxN4zepWgfDe4LKJALvPL4QFDYQUpsvR6VG3chrfpv5rOctRXdgDdGF
         lcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=03ikOjiFLTHp41pT60Qg3JjmZZJXzhQSeRVEBNJlZuI=;
        b=v8R9QqpNzS3o2kzzSNVjdWAWKBqrXJNM+V6AEEwFPIfgFSO/MZaHCLJbb19gkh4Qn5
         4l/J59n1mSUCp6kfHoU0E2dWES8HcegekfNDuHxJcwPYHwjQtTCo8RkrqekmLXY+DmYa
         yNZtZNutGdADOI7JmLWvXf8ljM/lbzsQWcRBVIwhYqT+wjzMNI5Syr/ClTNh9wxiSR31
         NIDOMOrB0RTkTOOVhb899bhp26DTL8F8+xy4tzXzlrXqF2SJI3XG8Azq/x4cNKIM3wlN
         tz/TNIr2ZbsqMbeY0XsgjjZdxpNB8RYe664PfP5gRaTJ4IrhldLS5KjadUbRMgNZckR2
         Ir5A==
X-Gm-Message-State: AOAM530ELXZYIz8aiS8ugYyytQcyobruurIbpx/tY3fpuURUy0Yzuwnu
	6dIBCWA2UQSgyfkFVomf2p5+KWTO0lvKvCQALlQ=
X-Google-Smtp-Source: ABdhPJw3iDPUCU+9U+Qa2X5jmPQCw4YAOTjruitw9Cf7jHdUxzHngQPzbI4c+QfyZLZ6rrbxC3vQ3ccM6S0gpnWJrVg=
X-Received: by 2002:a05:6870:89a1:b0:d2:ca93:8797 with SMTP id
 f33-20020a05687089a100b000d2ca938797mr3099953oaq.112.1647413807028; Tue, 15
 Mar 2022 23:56:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220309205047.45981-1-makvihas@gmail.com> <20220309205047.45981-3-makvihas@gmail.com>
 <YjCgXS990UNB/oQG@kroah.com>
In-Reply-To: <YjCgXS990UNB/oQG@kroah.com>
From: Vihas Makwana <makvihas@gmail.com>
Date: Wed, 16 Mar 2022 12:26:35 +0530
Message-ID: <CAH1kMwSopeQ-mnFAhfCkGtwGxbCx3q8DPtAS4k9hjMD0Wur=bQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] staging: r8188eu: proper error handling in rtw_init_drv_sw
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, 
	Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Pavel Skripkin <paskripkin@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> On Thu, Mar 10, 2022 at 02:20:47AM +0530, Vihas Makwana wrote:
> > The code inside rtw_init_drv_sw() calls various init functions to
> > populate the padapter structure and checks for their return values
> > respectively.
> > But if one of the functions in middle fails then it simply returns
> > _FAIL instead of proper logging and calling freeing counterparts
> > of previous init functions.
> > This leads to various memory leaks and can be found in
> > /sys/kernel/debug/kmemleak if kernel is compiled with DEBUG_KMEMLEAK=y.
> >
> > Fix this and keep the success and error separate.
> >
> > Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for
> > RTL8188eu driver")
>
> Nit, that needed to be on one line, and no blank line before the next
> ones.
>

Oh okay. I will take care of that when submitting patches in future.

> I've fixed it up now.
>

Thanks Greg.

On Tue, Mar 15, 2022 at 7:49 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Mar 10, 2022 at 02:20:47AM +0530, Vihas Makwana wrote:
> > The code inside rtw_init_drv_sw() calls various init functions to
> > populate the padapter structure and checks for their return values
> > respectively.
> > But if one of the functions in middle fails then it simply returns
> > _FAIL instead of proper logging and calling freeing counterparts
> > of previous init functions.
> > This leads to various memory leaks and can be found in
> > /sys/kernel/debug/kmemleak if kernel is compiled with DEBUG_KMEMLEAK=y.
> >
> > Fix this and keep the success and error separate.
> >
> > Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for
> > RTL8188eu driver")
>
> Nit, that needed to be on one line, and no blank line before the next
> ones.
>
> I've fixed it up now.
>
> thanks,
>
> greg k-h



-- 
Thanks,
Vihas
