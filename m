Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579D970
	for <linux-staging@lists.linux.dev>; Wed,  2 Jun 2021 17:35:31 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id x22-20020a4a62160000b0290245cf6b7feeso734559ooc.13
        for <linux-staging@lists.linux.dev>; Wed, 02 Jun 2021 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vo0Dg4bNuKJwo4nsGc+3dTQHi6trR9CwbCHIFpRvYTs=;
        b=XCl55SvXTjI217am7uNX6tchL7K2HRkFscrE7e3kl8Kk7gmi8wta4Fg9Jol1NlDUXG
         GNbi2hVwjOs9U3+JSozSr34bx4MsjKDnnI3/71Zeq9YRRKSoaZf7UZavx12Iuzi5ELQE
         26iamZgpcfIx7j0jFDFIiZjZ7zOX9l/2m6bztPRRSqoep3bBmrdDo2zGgQ6GJ49opBjI
         z21UtkGQbttC15w8VypNrqWZmIN3GbQrz49FpNFXqvf2vi2TLUCCAR23LHHE+Q0+YGXf
         VuzCLgylYtcyAVWL/iSOTQk+fowwP3PNE7sPfhq/S3leskKxaIl58P3ojqplrWBOOW5P
         ubdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vo0Dg4bNuKJwo4nsGc+3dTQHi6trR9CwbCHIFpRvYTs=;
        b=Fz0Yg1qQ0hNTCPFvC+m10pezQKmIktqbYaDo85fVRDQBN9t23DMky0F+A5Mi53DUG4
         q2PQCzFTZULULqC/7yt9o2m4GW76WmffKB2AryaWZmW6KUIHNQY0dwKvQ4X8Urfwx6kA
         0w1W+yCp8JAOpGmAKH7wBv6qaMWXaGbCG8SQis+Zp1OjkeK33J/XGQohihXYOSEPuLbd
         H7f7ZK3cjrAw9j7IcgN7DVtMB+noXqOGe7x8OqpFtAgzXWHP67IHdVVldEE6bnvFEqrQ
         Q3V5rjJlbSSC+mEquCMXi7KgVe2r7Z7LpDyse8jtmhC5ClgtsAjTu6lTQ7hXmL5aeRd3
         WsPg==
X-Gm-Message-State: AOAM530L9NA8b4gvVsA31mAiARmR+qjruixb1BDNX/dPH3kcEdeirqp0
	wIGSHnPcZrS4FiamZGZFnvHCN6arxA//uWvo9wg=
X-Google-Smtp-Source: ABdhPJzXtY55/blnpzkUvI/XEwAGea+QX3r6Avjyclj4Oel9wdgN+ymS83scKqqL/CgSzGs9cN8PHNaU+KGXWGebcbI=
X-Received: by 2002:a4a:e084:: with SMTP id w4mr25103329oos.59.1622655330563;
 Wed, 02 Jun 2021 10:35:30 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210602160333.62163-1-manikishanghantasala@gmail.com> <YLe8psfQLCb5bn2W@kroah.com>
In-Reply-To: <YLe8psfQLCb5bn2W@kroah.com>
From: Manikishan Ghantasala <manikishanghantasala@gmail.com>
Date: Wed, 2 Jun 2021 23:04:53 +0530
Message-ID: <CAKzJ-FNm-uYoSFvMmNjAtsXmOQ-_P=o3JhpZhzk0tuuNRDTB9Q@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8192u: fix coding-style issues in r8192U_hw.h
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Jun 2021 at 22:45, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jun 02, 2021 at 09:33:31PM +0530, Manikishan Ghantasala wrote:
> > staging: rtl8192u: r8192U_hw.h: Clear the coding-style issue
>
> Why is this line here?
>
Added it as description and I put a break due to char limit.
> >
> > "Macros with complex values should be enclosed in parentheses"
> > by enclosing values in parantheses.
>
> I can not understand this sentence, can you please reword it?
>
I meant, I cleared(fixed) the error in quotes by enclosing them in parentheses.

> > Modified spacing around "|" and removed a space before tab.
>
> This is not related to the first thing, please break this up into
> multiple patches like the bot asked...
>
Okay, will do. Do I have to make one for the 'space before tab' too?
or can I ignore it?
> thanks,
>
> greg k-h


Thanks,
Manikishan Ghantasala
