Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F2F173
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 21:27:37 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id ds11-20020a17090b08cbb0290172f971883bso10806724pjb.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GFuTgRXMPN7XesmqvYLjMAPBljN3gr8l3Heds4D6W/U=;
        b=wxUNqR6FR+61i7kJOTC35pHkHJL2Zza7K6i3d2JpUBfw2TAXNnWmOOkfG1p1NF/tGX
         UHk1d5nwI6aVMJiwHGb4N0C4TAKB3r8OnKyNFSAucm4Dn4LSO8wCyquEhe8Ius2Go3wZ
         wV63JbzG9OcVxu3TQcCN8PN42Odxna+2KCx1zbSBNjRByqPpSi/+Oz6YHizDWjUCNBYq
         y/XZMZ6qP2RzWYp4O7PuFfY66pTvfW9pHmBZR1cjZGKfdHdeP8wAR7jS56XazTGtFn0g
         fa5bzeOUXxvM9/7LJdO7x4W9Lpx/2/O11FAmNLcKgvezQ/aMaIABNOrBQnenMeM9RSkk
         ymwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GFuTgRXMPN7XesmqvYLjMAPBljN3gr8l3Heds4D6W/U=;
        b=D6kWgHOYqnaUkJ7Wx6eqk+AU2UZ+JrnTccFwZyXiBbc2nlwy5uldGaf+6payLYLHVO
         xcD6ajjS9CC2XdMqyuFSuQZNksPTMcREWH9il26bF81j1fNKxm7M33kj7ujMh/4Ds+aP
         ttAjvwqPuuvDQu9aLsnolCuntXy70Qkd3moD2P+tYPmtasbGR32S/WGZBFZrbD9sD6n9
         t7fbDQYAv0z0vE69QO8J2x4P1geO5Bu3CCkBdeun4h+N+TQwpSDE75Aam8N5D1nsAQJU
         RK5iurYrgBCqC6TLtr8co1jDsYjHFkPgZJHs4MwKsf5axJbOP9CPhy8U2PN5AzbyrqMJ
         BQ9g==
X-Gm-Message-State: AOAM530qNtOitDD9pqXqLQl0CEqkjS6RBcGs0XLkhPJVaDX2n4dEMr1q
	sYTVsRtlEN4ARnTrXOW95NOr7ui+TqLJFQtuhVoDaQ==
X-Google-Smtp-Source: ABdhPJz1Jvm6TvRzQ2kUhoOAIEoIyKIBW6K2ImOiY0kVwmmDwUmn0FVmom+CzKhpBmh5IHhzLHJryY8a2MNJfzJ0EcI=
X-Received: by 2002:a17:90a:a008:: with SMTP id q8mr6199786pjp.217.1627075656546;
 Fri, 23 Jul 2021 14:27:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723004214.912295-1-phil@philpotter.co.uk> <42086ca2-69b2-b2d4-893f-82418df2ec7a@lwfinger.net>
In-Reply-To: <42086ca2-69b2-b2d4-893f-82418df2ec7a@lwfinger.net>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Fri, 23 Jul 2021 22:27:25 +0100
Message-ID: <CAA=Fs0nWC2kbSgwdmUnP_RNxWEZ74KnHLBTyBYTxKDb7VCfRDQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] staging: rtl8188eu: replace driver with better version
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg KH <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Fabio Aiuto <fabioaiuto83@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Jul 2021 at 22:08, Larry Finger <Larry.Finger@lwfinger.net> wrote:
>
> On 7/22/21 7:42 PM, Phillip Potter wrote:
> > I had to break this patchset up a bit to get around the file size limits
> > on the mailing list, and also I removed the hostapd stuff which is
> > userspace related and therefore not required.
>
> Phillip,
>
> I'm sorry that I have mislead you, but the v5.2.2.4 branch appears to be broken.
> I have not been able to get that one to work.
>
> The master branch, which is v4.1.4_6773.20130222, is working quite well. It
> suffers from the problem that when it is scanning, the USB receive buffer is
> ignored, but that is a problem with most of the Realtek USB drivers. As a
> result, the ping time to my router will sometimes get to 2 sec, rather than the
> usual 1-2 ms.That is something that I will try to fix. My suspicion is that
> scanning should be left to the network manager.
>
> This version also behaves nicely with NetworkManager.
>
> None of the source files in this branch have trailing white space.
>
> Sorry for the confusion.
>
> Larry
>
Dear Larry,

No apology necessary. I will do a patch set for the master branch in that case.

Regards,
Phil
