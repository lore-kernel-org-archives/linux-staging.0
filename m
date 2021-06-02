Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08E572
	for <linux-staging@lists.linux.dev>; Wed,  2 Jun 2021 14:40:13 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id h9so2868184oih.4
        for <linux-staging@lists.linux.dev>; Wed, 02 Jun 2021 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RWVAxqbt2ragLnej0S2guhkFqxl9f5X2TG9vofPgr5g=;
        b=pIK5I0OJGNcUZKY6fYRPbWFjK/lbB/dhyRXSbbm+CTTMFSRjrlWjvL5G5XGfbhX3K6
         CGKXNujPs93Tr1f+duXmLRro7Rtvvd3PeoeSAXXamUOCFow3NZdJtOCk5nQkQ2yerRhJ
         lAX7VU/YBPjMjMeh1RioPTnUaliC6N+lg0eaH0xWmF9VxYspJTWHZjWx1kX9HAPNSlMQ
         33kL5izgAkE9rx0Rp6qUuU8yFyE8JEVfvqBSI5MjHgAdwniQ7cKoSUlr/71XclJ92/G3
         A13Bxker1PmlMbws/jkuzEZs0rumjVtvDPb5kh1183ZsbwmdsA971Gu2+kYYPbWqqoes
         5fdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RWVAxqbt2ragLnej0S2guhkFqxl9f5X2TG9vofPgr5g=;
        b=toggkUhDgbyUZFyEMl8j53dAbMDxgtypcTzXUgF2KeKdEYVVKfHM/JTGuX3zZxttR5
         b+IEIpLUVn+BJdb/7UgvMJcHh0jjkGKZYU43CiQeVkFAwaxk1T5Gn7utTnzxhiPqae+5
         0S+qwYOeIBP53iS3Z2O8PxPafDtg6LlMT/sSz2RErgSGQBZ2Ubq0GqH//FrlXyRXTsEJ
         apjLuBDmTE0wAychWIRag6bfaJxv+hCGahL0yeW2zyxLxkRALwTyeMZV6X11G5i98BLn
         mSG5oCZ62dfMYuIToKWPWpvLckG/e2mogeOmA8jfQmjng8dECdQRsk9w0+5THacifHfh
         nVkQ==
X-Gm-Message-State: AOAM533olDPh0HQ7kiEt0uhTkDQ8u56RtyCW5D9uxL5qUMVjg7+RPg/8
	Kc39C1cPfmQthrDeojsL44alc1bU9YhSMw47YAc=
X-Google-Smtp-Source: ABdhPJw9W8YmUacJHRTLRKCSRcE6AT1Zu3kRNDtCEpiYsKWDEmet6F863hn0P5W2iDFQ+YX04vhuiOFjMdEZ014wjcU=
X-Received: by 2002:a05:6808:244:: with SMTP id m4mr3971937oie.37.1622644813198;
 Wed, 02 Jun 2021 07:40:13 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org> <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
 <YLeXoQH2/iJjxkc+@kroah.com>
In-Reply-To: <YLeXoQH2/iJjxkc+@kroah.com>
From: Manikishan Ghantasala <manikishanghantasala@gmail.com>
Date: Wed, 2 Jun 2021 20:09:27 +0530
Message-ID: <CAKzJ-FPZeM1QettgDyNaXy4xXpXX0YVm1TNVaKHOopiYevALjA@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: fixed the coding style, labels should
 not be indented.
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Elder <elder@ieee.org>, Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>, 
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,
Thanks for the clarification.
Regards,
Manikishan Ghantasala

On Wed, 2 Jun 2021 at 20:07, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jun 02, 2021 at 07:57:35PM +0530, Manikishan Ghantasala wrote:
> > Sending this mail again as I missed to reply to all.
> >  Hi Alex,
> >
> > I agree those are called bit-field member names rather than labels.
> > But the reason I mentioned is because the ./scripts/checkpatch.pl
> > gave out a warning saying "labels should not be indented".
>
> checkpatch is a perl script that does it's best, but does not always get
> it right.  In this case, it is incorrect, the existing code is just
> fine.
>
> thanks,
>
> greg k-h
