Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83B272
	for <linux-staging@lists.linux.dev>; Tue, 31 Aug 2021 09:08:19 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so1497276pjr.1
        for <linux-staging@lists.linux.dev>; Tue, 31 Aug 2021 02:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CTxJXnRnnalWZJuFXpjzUKednFVCieUvYxYV8lHL8KY=;
        b=ruqckO53AblQ34q1ZT0jydIzhi6uJGo23HSI1EInQtSWymAhbRuafetOHWN8WICCQF
         OYZxIBIZYdiaQ/l9CdOYjNfBW3AzTrQu+rE0Ok3S3yLbYrNPNJp6qsV7GLAFOgoYKBhd
         xGcu9oJPrstSjbNl44T9ZEF9yp+B3r+cIlKZjGHT0GXdJ1kOONmP1/NXbMVrKgjuErdH
         +UvjdHMwSyzWmh4zSA+El+1GcVmqgJikVXnbejTlBCv5UoC5SqJ7BWvOR2yb2LGbuh9o
         vOEQLZTA89XqgYi2ff2AJaFSehPnAJ8UF4vu6XEHL0lEJzWj0F39//eaEWO2KjzuwhER
         Oqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CTxJXnRnnalWZJuFXpjzUKednFVCieUvYxYV8lHL8KY=;
        b=tXHnG4CUPMhJvPdQ+NNf/qUCOLXuGDxpmwpezvvo8QAc6tWOR8+iZVa97jTznnkUHS
         sEbpOUoUUZX0LJ+dDQ5WiDVNW0BCG6oP4Wjv6Zk0THh1e495e86Xj4z5TLWznBZ34nuq
         cjzuAy8RqzaiHchs2xvmcVdLVBIlofKzud/u831rVyeHYwrF+YfJC10GAqndEAAGZelJ
         Qh/vQND0ISlJZC/EoipTQ0S3MgjO/GBo40rwKsW9AMmaQ6X8qaKTvWe5QspT1ynDa2r+
         Sqhj5EStjYE3dcQ862gpiOC2KgPeFvKcy2TqGt/N9j4DqtwfAd+fSQvAhrqwB1miLKLp
         6XmQ==
X-Gm-Message-State: AOAM531Xs2gJO7Alkki0jKBC66wmrVzHe0UB6LyYnvWub+bk6SiUTOff
	7sbFFOsJwN6KVeqrdXDZFvNSCbqUjgYUtuE48BW7dw==
X-Google-Smtp-Source: ABdhPJwz97BCEL9VXsx86CUfQyn+MNaxhuJW5kHvtxfjg7JRj95GGdbr0jWlR+nMdcmJDK61Am0i+x1lvvw9hWjHmoQ=
X-Received: by 2002:a17:90a:10:: with SMTP id 16mr4201403pja.162.1630400899232;
 Tue, 31 Aug 2021 02:08:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <85959c1f-80d4-3fd9-f8a5-d7688e337e95@gmail.com>
In-Reply-To: <85959c1f-80d4-3fd9-f8a5-d7688e337e95@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 31 Aug 2021 10:08:08 +0100
Message-ID: <CAA=Fs0myEC51-RoTDFgW4+9KkprdKgQ8=C5Xuy9F7ta0z1fFeg@mail.gmail.com>
Subject: Re: staging: r8188eu: Switching encryption to use lib80211
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Greg KH <gregkh@linuxfoundation.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Aug 2021 at 09:40, Michael Straube <straube.linux@gmail.com> wrote:
>
> Hi Larry and all,
>
> I'm currently working on adapting patches from the old rtl8188eu driver
> that convert the frame de/encrypt functions to use lib80211.
>
> Please let me know if it's not worth.
>
> Thanks,
> Michael

Dear Michael,

Having had a brief look at the code, and given that this is a stated
objective of the other Realtek drivers in staging as well, it seems
like a worthwhile effort to me. Happy to be corrected of course :-)
Thanks.

Regards,
Phil
