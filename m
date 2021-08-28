Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD313FC1
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 11:13:52 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id e21so19616613ejz.12
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 04:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X9J7QVqkb+h1L05qRuxksgd8BRKIzsS4rtSxbcYkOD4=;
        b=OxQ992I2XLDfyUuoDMcDx0GG7HoIKgDw6t34rTb8L/oK5Fn+A+l/69XFjPCtS/rny4
         nT1AB0DSPZld7ajPDHhM/ChEDGIK6BzfctFyV9iZyiI5GZpPeMjd6P7O3Zmfl6DM+XkG
         +KQLnMfYU27JKHmJP2VcpS4XGNZUplHluwUh32kR28rNg5cigfSNmzlcHhxuzR3YkEga
         XUf+S6U2CKJdZzZvo3uXj7Y4dBrq7hfDzcMIiXv41NkMtQ0MUm6VHJxjyRnBy1yFBxEE
         HSTghpynyiyTEC9qmwSFHiXQPKCrPYxDR6opN6wZjLlafubWOBuANewP8XRo4/+IjAN4
         CtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X9J7QVqkb+h1L05qRuxksgd8BRKIzsS4rtSxbcYkOD4=;
        b=OX7unFCfaBjY2ievZHV75rglmyW60b2eZGA1AovEyRN5nciDC3iQw4X1UOqTlze/3c
         SOwce5QGknecxxCxpkM6398GdXhiQDhieRC75rpPWB7R5pYUGaTgDxipc80qdNIC8IoF
         lpykRbqJRuloY62r7u2np2DwqYDl8K2KyhjB0L3PiMek+5gKn2qX/3qxYEO63TlcOwSn
         36IL3dy6WwgvZdHNaMsRGHohG2eav/JDZWAyFasQXjWhklmJASWR3uIGy6jUzHdVY7If
         vcTMIaIA/TpMn+XkAlfay7l/cEOOizGheTZPYYOwsqv993TK8civUEF5DObCovFdjDrr
         kb2g==
X-Gm-Message-State: AOAM532Be6KZgiO+EpbQbemx7niQ1E/mK477vHq1GmVt4lqgm5+1vqpU
	3YdIrh5M0m2sT/aysNsK2Mw=
X-Google-Smtp-Source: ABdhPJx9jsrDt8mfFxjJLaxsSOvVtrqWSB4mp6B9fllLK/dRpf+L558OCs0oAjPp6GVN4BoleYXfvg==
X-Received: by 2002:a17:906:93e8:: with SMTP id yl8mr15215967ejb.524.1630149230999;
        Sat, 28 Aug 2021 04:13:50 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id y10sm4642649eda.47.2021.08.28.04.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 04:13:50 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Krish Jain <krishjain02939@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Declare the file_operations struct as const
Date: Sat, 28 Aug 2021 13:13:48 +0200
Message-ID: <1720585.ZkIvycaLSE@localhost.localdomain>
In-Reply-To: <CAPGkw+wcZRcr0W2ay6ZJY5yW7-EEMpK-yH-3j=UkDpj3kA-ySg@mail.gmail.com>
References: <CAPGkw+x+B1731SL=afoSKiWwH-n-FA5YJ+WOwYdv8iyFhWk1zA@mail.gmail.com> <YSoF+VcDuW/2ojjF@kroah.com> <CAPGkw+wcZRcr0W2ay6ZJY5yW7-EEMpK-yH-3j=UkDpj3kA-ySg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Saturday, August 28, 2021 11:52:39 AM CEST Krish Jain wrote:
> On Sat, Aug 28, 2021 at 11:46 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > A: http://en.wikipedia.org/wiki/Top_post
> > Q: Were do I find info about this thing called top-posting?
> > A: Because it messes up the order in which people normally read text.
> > Q: Why is top-posting such a bad thing?
> > A: Top-posting.
> > Q: What is the most annoying thing in e-mail?
> >
> > A: No.
> > Q: Should I include quotations after my reply?
> >
> > http://daringfireball.net/2007/07/on_top
> 
> 
> Now I get it. I've never used this style of email ever before so am a
> novice. Forgive me. Also I didn't get what you mean should I include
> quotations after my reply?

No, Krish. Greg placed the lines you read above only to let you understand
how much confusion we get with top-posting :)

> > On Sat, Aug 28, 2021 at 11:37:50AM +0200, Krish Jain wrote:
> > > Hi. Thanks for your response. Changing to  "const static" would fix
> > > the first error but looking at the second error indicates that it
> > > can't be a const, right? So checkpatch.pl was wrong?

You misunderstood my first message in reply to your patch:

(1) that structure shouldn't be "const". You broke the build with that so I
guessed that you didn't build the driver;

(2) You should place "static" as the first keyword of a declaration. It doesn't
change the semantics, but it is better style and so it is used in the kernel.

> > checkpatch.pl is a perl script that does its best here.  You always have
> > to then look at the code itself to see if what it is asking you to do is
> > correct.
> >
> > And you always have to at the very least, test build your changes to
> > verify that they do not break anything.
> >
> > thanks,
> >
> > greg k-h
> 
> Thank you so much. I didn't realize that I could have tested it by
> just building the driver and not the entire kernel. Anyway, I'd still
> love to learn more and contribute to the kernel. Where can I find
> "small fixes" I can make?

Don't expect that someone here says to you which "fixes" you should
address. Read the code and find them on your own. Get hints from 
checkpatch.pl and the other static analyzers too (Sparse, Coccinelle,
make that-driver-you-chose W=1, etc..).

Thanks,

Fabio
> Warm Regards,
> 
> Krish
> 
> 




