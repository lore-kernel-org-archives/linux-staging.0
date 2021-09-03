Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C893FD5
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 18:54:45 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 2so212215pfo.8
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 11:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JPPn+kbAlZ1MWLNKQ2tdH9GpmK0cO7Zw1ZlJsYJztcY=;
        b=KBsVJ6KYy89BuFK894h9wXPGIq87RDblxdrT2/9PZ80BTtsp3eOVQnf7cYqLafvd+i
         1pE284lLXCWf5Qea5zwusPs+wMQ7C9mGaHau5Ori/iLePtdBDrzUKAQlHCw8ECfIiU4f
         CR8rZGHQ7d5gTyMnFqHxqq6bOtX0eqOseRFWeYh4jTko2V3xQ+8Q+/yR+oAcwwniEECh
         GVjeXYM30sc8Ho22U1SSgcodhwsbJ1begO61V/9XLus3De+zgEixJW6iltSqz+apd4Da
         FCSnrl0oPzIcVlPZ+L4UB34PXtypzkhK9EL7IgyfAw55ufSZzLlGgu1bmAZisTAYfn6A
         RaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JPPn+kbAlZ1MWLNKQ2tdH9GpmK0cO7Zw1ZlJsYJztcY=;
        b=gjJ2HtpNQiIZ9z7RlezKCZfn70eDb++wTQqCCwV0XHvJM824FZ4Ly0YIc3ouOxpQJ5
         YbdDSi0PeRjlA+oKZqUIOA34rX4QGHDeFKBxP7iCivKYIFf3gPz7InlsEImYErF4y1cr
         /kx6Z6TSNjS4fvp1gUFilU8X7vnzzrRvu9wsu56c6uzHfwa2YJHDvNb21Y4Fi4dabJk6
         WBcNLiVsyYWefiHXO/EE26CvDw0A4Z2Ok91brKmFot31beNeQVgsWHZRyqshI+aUgU4e
         exT7Gpse5gzjS8Dx80FCfM7zUL+IwxSqNyK0QCN0RSWCXUup29DnTXO62YjOUx9C/89w
         VkJA==
X-Gm-Message-State: AOAM531RmQyqMtKclBXbeVOo+2tNDcwEt7BuPD6y8CO1XcF5RXOjQeRe
	Gb/ME/91ngo/ceWjD7EERs5/iLsQEde73jInw2Q=
X-Google-Smtp-Source: ABdhPJwOZWoo+bJfQutYdoVNvoWpxY148cF+BXFbI3o0M9DnpEFNvnlm18W6NFY8LB/oQVWHK496M+SRMpQN5fjsBbs=
X-Received: by 2002:a65:6554:: with SMTP id a20mr420257pgw.107.1630695284688;
 Fri, 03 Sep 2021 11:54:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210902111339.GA577108@panther> <YTCU3SpFgyFbxXs3@kroah.com>
 <CAPGkw+xhPfD0acY1GcwPpHg=kHw7o2+y94-r3AxfzsfyqG4bDw@mail.gmail.com> <YTJXOFlkLTBTg9rl@kroah.com>
In-Reply-To: <YTJXOFlkLTBTg9rl@kroah.com>
From: Krish Jain <krishjain02939@gmail.com>
Date: Fri, 3 Sep 2021 20:54:33 +0200
Message-ID: <CAPGkw+yKQx+O3yfxxMgv9oyH2-pun5-g=+mFWQ_YwbfXp1Y6cA@mail.gmail.com>
Subject: Re: [PATCH] Fix formatting for file "hsdma-mt7621.c"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 3, 2021 at 7:11 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 03, 2021 at 05:49:46PM +0200, Krish Jain wrote:
> > On Thu, Sep 2, 2021 at 11:09 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Sep 02, 2021 at 01:13:39PM +0200, Krish Jain wrote:
> > > > This patch fixes the format of the code. It properly formats lines that should not end with a '(' as suggested by checkpath.pl.
> > >
> > > Please properly line-wrap your changelog text like your editor asked you
> > > to.
> > >
> > > Also, your subject line needs work, look at other commits for this
> > > driver with:
> > >         git log --oneline drivers/staging/mt7621-dma/
> > > and notice how they say the driver name and the subsystem.
> > >
> > > Please fix up and resend a v2.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Do you mean I should line-wrap (at 72 columns) the entire thing or
> > only that line?
>
> Your whole changelog text needs to be wrapped at 72 columns.
>
> Look at the 'git log' in the kernel tree for hundreds of thousands of
> examples :)
>
> thanks,
>
> greg k-h

Hi, so you mean only the change-log text (as in the text telling what
changes have been made) needs to be wrapped at 72 columns but the code
itself (the git diff) doesn't, right ? Because then the entire purpose
of my formatting the code will be lost. Sorry for the confusion.
Learning


Best Regards,

Krish
