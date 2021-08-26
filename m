Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD2772
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 10:24:07 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id m4so4147461ljq.8
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 03:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MArJc2UXM01InVIrz+q5g7FDMglJPPlUa7D94D3Y6j0=;
        b=gqKkxyWVckmwgoU51zfz1KfobvSXFXbmtHA6oozBzHxtNBQGm+xHPnJ6F+tugH28kE
         TKsKKsQNycQVR6n5lh/bswbEyiDoBD38CY4W81mXjPEUFQtgTNZpMbljf5wEqk3f8VBt
         l5dmd3kE3N9yMLOc2n6gOYXMdWJBHLCn0znO0rj0n5PEQw2UG07aPG7t+7fKkQNiJvz6
         jKNENwjkm7hgco5RW8metbszsKAiklTX+TWpZFjfulVRud7k5d2Ung9kfDEoIhSj8Na1
         QnCKe+rI8zumvtSJJxCT+K2cJFFmRMWEDsL0R9FNiTrSi70TBjG2yel7Ef+GVj52BNem
         IT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MArJc2UXM01InVIrz+q5g7FDMglJPPlUa7D94D3Y6j0=;
        b=bSHo4ZjOzlGF8y+HUx/kACPNu92sfslJqaA2A0gG6e7ESBoVfPuBhJOFdGrjcrJ8HJ
         bQH/JZNktsC5tCEUD2Sq+AaytlMU4aCO+cxJZhMjoepUq3LniXg2P46WKSzPBVMyHA19
         lNkwD2u7fkxBjo8TbxZ19ndcXEV0ooZHZIwWsA1cRtxhNvv8NiReZAG3br7EjkeDgb34
         LY3jZ6heJw7T7hX8o225sR8EDSXgkyFO1bJ2J08xIE3wAPkcdgzXIGQsOpM9O3z2jJ1V
         ch638NjPmhdqm/xZzyWkGs6DgKEpvI3lU3s/Z3Ke2fF4JVSQQcYj83HBv98eI6EcF5mj
         rkVQ==
X-Gm-Message-State: AOAM531p9rf/keOvj3gvL72rczjZdAlN3f11QMADBmgSLN24MbAHjqob
	Lf7VLZEdKrmEkNGeyV1u6jsPcsEWE4udk7DH8KQjhQ==
X-Google-Smtp-Source: ABdhPJyoZqOiUX9Yihg0SFHx17SqsaQCPKfg5SiCXkVUhxYBLl5wdm3f3DcPjIqtScWuLLC3cHlj5FIgS05CZ3FECX4=
X-Received: by 2002:a2e:8795:: with SMTP id n21mr2435379lji.474.1629973445418;
 Thu, 26 Aug 2021 03:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210826092854.58694-1-woodylin@google.com> <YSdjgnUwt76cknQ6@kroah.com>
In-Reply-To: <YSdjgnUwt76cknQ6@kroah.com>
From: Woody Lin <woodylin@google.com>
Date: Thu, 26 Aug 2021 18:23:53 +0800
Message-ID: <CAHn4Deczc6gSSsxys6UeAMB99p1jHMZmLFj+KwZ2QhH7dx8E8w@mail.gmail.com>
Subject: Re: [PATCH] ANDROID: staging: add userpanic-dev driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Todd Kjos <tkjos@android.com>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Christian Brauner <christian@brauner.io>, Hridya Valsaraju <hridya@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 26, 2021 at 5:48 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 26, 2021 at 05:28:54PM +0800, Woody Lin wrote:
> > Add char device driver 'userpanic-dev' that exposes an interface to
> > userspace processes to request a system panic with customized panic
> > message.
> >
> > Signed-off-by: Woody Lin <woodylin@google.com>
> > ---
> >  drivers/staging/android/Kconfig         |  12 +++
> >  drivers/staging/android/Makefile        |   1 +
> >  drivers/staging/android/userpanic-dev.c | 110 ++++++++++++++++++++++++
>
> Why is this in staging?  What is wrong with it that it can not just go
> into the real part of the kernel?  A TODO file is needed explaining what
> needs to be done here in order for it to be accepted.

Got it. No more TODO for this driver and I will move it to drivers/android/.

>
> But why is this really needed at all?  Why would userspace want to panic
> the kernel in yet-another-way?

The idea is to panic the kernel with a panic message specified by the userspace
process requesting the panic. Without this the panic handler can only collect
panic message "sysrq triggered crash" for a panic triggered by user processes.
Using this driver, user processes can put an informative description -
process name,
reason ...etc. - to the panic message.

>
> thanks,
>
> greg k-h

Regards,
Woody
