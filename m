Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB7220E8
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 08:42:12 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id hr39so11659467ejc.7
        for <linux-staging@lists.linux.dev>; Tue, 07 Feb 2023 00:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=in76c8S8fSHEkzSgNC46+ZyJ2Ulckc+1+nkJb7rGNiQ=;
        b=QAuT9smPx+ABLKx68eg6riyZlkfMu21inRNGxaCEvXEmazzgkG5OKoiIwr8GEIJFRL
         24APkDXVLqczs8Rm5fcAgmICkEKR47NAag8UGV7Af6C7T/0uKI7GCTveUQZGVk4gRv5D
         HzX4MAT33xb7TOcwUqPPhTEYwRdKKvGHMW4cjjoqWaoD7ujsX1BLW+ea7raJMb0SoV3S
         gha0p2kKHVRN73BTcnJRYs+bJip34t0PAf2A2xTA7op9g35i8o/EhgP4t2Fyi72OY/XI
         uBqdyUE1AMFAzVg53GK+gP9ZAyT01B1HFW+3a8DdYZfCryLYzuxa8X76t9WqjBvtqc8c
         8DAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=in76c8S8fSHEkzSgNC46+ZyJ2Ulckc+1+nkJb7rGNiQ=;
        b=cLOpzn1m/bPHnbEfT7b1Xre21dgs9SxmoehC/5BYNrFwW0gTgg5rCWdErQ8rWReQd+
         s3PZzAYOdF1Dp+fueD2gR7ceKCg/fdSAxT4oNofmilsEIRwr+WqoQRMmp0+JN8PSwXzq
         10H30xJvJfk8f3Qbk+4v/uQf2F7H8R6b3PMWv9tRF4CvgAcxTL1/7conMb0XNEytCcHd
         0ugkY3+o8WuYlfDJhInO5MvfDNS4gUNUxJR9TYlJ5mjav7Xv02rHlaLWfbYcCDFROVQj
         J+5WoZuP0oa3YPjutstDaiGxm7qUbwNqVJfLh/YuriHFbsWBHhLiJx4ESL3RpQXdrYqG
         4k9w==
X-Gm-Message-State: AO0yUKVzTKNYYpfF77/JKo4eGqkvyCC4+IX2cK/ZiUXNlF0mV9E0Akcv
	zP/pP7I/OeN/UJgAX7drpqwmYnmOjZI=
X-Google-Smtp-Source: AK7set9CZSqvB6MEjdRDF7yjU2yCqXgjyrdra4+ltFAX42w4mA/VrPBkdn9f1nCi2int/YqRuqdKxg==
X-Received: by 2002:a17:906:d0c8:b0:878:5f7a:7aab with SMTP id bq8-20020a170906d0c800b008785f7a7aabmr2631269ejb.39.1675759330439;
        Tue, 07 Feb 2023 00:42:10 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id y14-20020a170906448e00b008787becf3a8sm6590578ejo.79.2023.02.07.00.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 00:42:10 -0800 (PST)
Date: Tue, 7 Feb 2023 09:42:08 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] staging: vt6655: Macro with braces issue changed
 to inline function
Message-ID: <Y+IO4L0+1QsA0K3L@combine-ThinkPad-S1-Yoga>
References: <cover.1675753094.git.gurumeharrachaputi@gmail.com>
 <Y+IAZxQTkZpgD1+I@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+IAZxQTkZpgD1+I@kroah.com>

On Tue, Feb 07, 2023 at 08:40:23AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Feb 07, 2023 at 08:14:26AM +0100, Guru Mehar Rachaputi wrote:
> > 
> > This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
> > as '(iobase)' to avoid precedence issues" changed to inline function. In
> > relation to this, names of the callers of macro are also modified to call
> > this function.
> > 
> > 
> > Changes in v4:
> > 	- Modified commit message to be clear
> > 
> > Changes in v3:
> > 	1. Whitespace error from checkpatch fixed
> > 	2. Should be applied together with changes in v2 for testing
> > 
> > Changes in v2:
> > 	- Macros with one statement that is to call 'iowrite8' function changed
> > 	to inline function as reviewed by gregkh@linuxfoundation.org.
> > 	In relation to this, names of the callers of macro are also modified
> > 	to call this function.
> > 
> > 
> > Guru Mehar Rachaputi (4):
> >   staging: vt6655: Add braces to macro parameter 'iobase'
> >   staging: vt6655: Macro with braces issue change to inline function
> >   staging: vt6655: Macro with braces issue change to inline function
> >   staging: vt6655: Macro with braces issue changed to inline function
> > 
> >  drivers/staging/vt6655/card.c        |  4 ++--
> >  drivers/staging/vt6655/channel.c     |  4 ++--
> >  drivers/staging/vt6655/device_main.c | 12 ++++++------
> >  drivers/staging/vt6655/mac.c         |  8 ++++----
> >  drivers/staging/vt6655/mac.h         | 12 +++++++++---
> >  5 files changed, 23 insertions(+), 17 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
> > 
> > -- 
> > Thanks & Regards,
> > Guru
> > 
> 
> I only see this 0/4 message, no actual patch in the series was sent out.
> Did something go wrong?
> 
> thanks,
> 
> greg k-h

Sorry, I sent another mail with all the patches.

--
Thanks & Regards,
Guru
