Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59525A93A;
	Thu, 23 Mar 2023 15:18:04 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id ek18so88158157edb.6;
        Thu, 23 Mar 2023 08:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679584682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MBwq3BW4HlZEmBseQtXAXl8EFNqS/eNm63K00dbmNLc=;
        b=IwPhYCSiXpEn/7oH4Y06x8ia2NkRizr3JtOfl8bLyKesMolLcV7JRjnbTUElLLHO5B
         PuzNDr2y373Fa7IZNiop7hoEmCYwnFxzKAEy5WsP9CfdK5mTdi5wy9IGKmDEQ0WZK8ib
         3CprGBgEGxrbKaIcyuobx+WGHP9Mz5GI8Iyvb2PE2GJI7u65xqXm4R/ZwqrLqi6YpwNI
         A9PYN/dg9YtK064Kqv7SdUoo5Os9Igf2wIdTT3S4G+Q+2c2dgQ251ip4B/q5Znuzy0D5
         6qDo8/3PCq6Flnwj7g1FLtKUWJp4U3jlWr3ccmpVbWKQR4htQ56zcQ+utWIaK8obTYC3
         aVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679584682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBwq3BW4HlZEmBseQtXAXl8EFNqS/eNm63K00dbmNLc=;
        b=hW5E96HyqtXARz5UqVFLWqPTig8Spg+yG4PHXLW7lY7luIfzmugYZm3A0JiNzZbTNZ
         Js2RlilbC/cHp3ZT2E/RmpZU95WHIyGMPPEXFneF07RYYdbD+0Jak2VW5CBYHOcUJXsn
         GUvuEdjVxqy6BLnB5HmahAc7a1KzVPKZnmRrp6dnletDxKoHoJAQ4sGwNYVEp3H61eTy
         nfxyYE2f//0qCU87TzV8oNGSaY88++eMiVKZ+PlxUtCQfdBThHL9eiHKK7HMCft1VACx
         83CRAoWGQ+bBtBr6GA95qZv0jiGpLhnKwVbG9snduhFoRmpYWelXqAwv/JSX68pSccav
         3OFg==
X-Gm-Message-State: AO0yUKXUEgcUxYmE2VCwE1jjtobv57o7KscoyrlIOyGrP30Upm5jx0wa
	qzOoI5YNgS2xpaMBs5+V4YE=
X-Google-Smtp-Source: AK7set+YHIvRXnbmUnStAXNi7Z05tZWUuhh+8J3HFnhcXRS5hhRheXjJnTDoU2XE7X2e4J9WnLYs+Q==
X-Received: by 2002:a05:6402:31fa:b0:4fd:23c9:11ed with SMTP id dy26-20020a05640231fa00b004fd23c911edmr9926599edb.17.1679584682346;
        Thu, 23 Mar 2023 08:18:02 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id x28-20020a50d61c000000b004c19f1891fasm9417328edi.59.2023.03.23.08.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:18:01 -0700 (PDT)
Date: Thu, 23 Mar 2023 20:17:59 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: fix line ending with '('
Message-ID: <ZBxtpyT8she++602@khadija-virtual-machine>
References: <ZBsSOlPbaGZcAaSY@khadija-virtual-machine>
 <ZBvbP8ugDFjSoVp/@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBvbP8ugDFjSoVp/@kroah.com>

On Thu, Mar 23, 2023 at 05:53:19AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Mar 22, 2023 at 07:35:38PM +0500, Khadija Kamran wrote:
> > Splitting function header to multiple lines because of 80 characters per
> > line limit, results in ending the function call line with '('.
> > This leads to CHECK reported by checkpatch.pl
> > 
> > Move the first parameter right after the '(' in the function call line.
> > Align the rest of the parameters to the opening parenthesis.
> > 
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> >  drivers/staging/most/dim2/hal.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> You have 2 patches here with identical subject lines, yet they do
> different things :(
>
> I've dropped all of your pending patches now for the most driver as I'm
> totally confused.  Please resend them all as a proper patch series with
> updated subject lines.
>

Hey Greg!

I took your message literally and sent a RESEND PATCH. I should've sent
a new version of the patch instead.

Would it be okay if I send patch revisions with changed subjects now?

My apologies for the inconvenience.

Regards,
Khadija

> thanks,
> 
> greg k-h
