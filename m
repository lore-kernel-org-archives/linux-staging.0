Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB5D437E
	for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 17:21:32 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id w4so21333320wrg.12
        for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 10:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AA9VriTYf3jKrZYNetwW/7xvUoB3MbpeM0Zb2dqi/hA=;
        b=TdMydTYX3pbRo19Mbk4+TDMgMVeGK3c6zUvBYHggkBkGlG9cVCqp6oqanz5J4huQ2m
         A+8u1alcWk3SdfJIGGMDl7dPZqessWliCcYUWWvQ1XwwA1UggwBElxpDbESlerXUPqYi
         qo5c1JHbBKMcpAW0scCtmpNLH3ixlX7bEBdu/8M9+YYT8bRp9+MU7pOFS9EyKTa4nYAK
         PlcV0dpwDREDDhx1+4AYzFTS+LPM0XmstcQoSwT0B6NHgYo78J6Snyro4+0ggK1+ZyrA
         DzTdvdM9z6X9ZNd890TSPJlGv2HejfGdcwfQzEHRt8HBrUeQAr7NJOTG4BY7AoUqDi50
         ztgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AA9VriTYf3jKrZYNetwW/7xvUoB3MbpeM0Zb2dqi/hA=;
        b=ruWhLbDGpkgPzdA1fBOFjTKArUgKUdZTd5U0Tixt9OHG8B4JXlFoEow+ET5vbjW2jp
         0qXgGBzyHD0b3zUIBc0ISvL6WEB1fA5w2GsA/QeIU53lcWQ349qydm6bJ09DoOYs9DgI
         kHHnT5X7YPEedpKxZXpeAN0Q7Kr8c+WhiUXhoNFF6izRbtUA3JUJBU2BrRBaUzAypruh
         q4QvnUK9kryymg6xfcm1MBKY0AeXTdteJdSWkKYHJuqw6cpgXRX+Ai8tLvaKhlVO8ybC
         mS2MGnz71AMYgMv0vE0OEKA1OlFoDAQgHQx+MLYzU4hNElnLth1cfTZ/rxPy31/q4LAj
         Gpug==
X-Gm-Message-State: AOAM532SUACCZQ9y+Q2Bhf6Kvuyhft56Y0LmX9mOFyhRSyYxb0CsYVIu
	7JwG8HU7G/6hGAZI/IdvQKw=
X-Google-Smtp-Source: ABdhPJybT//Aze1al+8a/xDU3kHsjC3Zs4UGHQYU6nb5u88vRwpBFo1985eB55KiQTGkRtX8r8ovDg==
X-Received: by 2002:adf:e483:0:b0:203:f946:396 with SMTP id i3-20020adfe483000000b00203f9460396mr24891290wrm.548.1648488090667;
        Mon, 28 Mar 2022 10:21:30 -0700 (PDT)
Received: from leap.localnet (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id j16-20020a05600c191000b0038ca3500494sm175034wmq.27.2022.03.28.10.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 10:21:29 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Philip <benjamin.philip495@gmail.com>, Bart Van Assche <bvanassche@acm.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Charlie Sands <sandsch@northvilleschools.net>, Mitali Borkar <mitaliborkar810@gmail.com>, Colin Ian King <colin.king@intel.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Convert kmap() to kmap_local_page()
Date: Mon, 28 Mar 2022 19:21:26 +0200
Message-ID: <1816944.CQOukoFCf9@leap>
In-Reply-To: <YkHXQRmExRFioEBN@iweiny-desk3>
References: <20220328112440.17756-1-fmdefrancesco@gmail.com> <YkHXQRmExRFioEBN@iweiny-desk3>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On luned? 28 marzo 2022 17:41:53 CEST Ira Weiny wrote:
> On Mon, Mar 28, 2022 at 01:24:40PM +0200, Fabio M. De Francesco wrote:
> > The use of kmap() is being deprecated and kmap_local_page() is faster.
> > Use kmap_local_page() in place of kmap().
> 
> Thanks for the patch!  

Thanks for your review!

> I have just a couple of comments.
> 
> kmap_local_page() is not necessarily faster than kmap() but it is more correct
> in this case.  You should mention why.

Sure, my mistake. Thomas G. was talking about kmap_atomic() when he wrote that
it is "faster". It does not apply to kmap_local_page(). 

What could justify the use of kmap_local_page() is that "The mapping is per 
thread, CPU local and not globally visible.". Therefore this code is the right 
context where to use kmap_local_page() in place of kmap().

At this moment I think that I might change my commit message and write something
like the above.

However, I'll research more information during the next days. In the meantime 
I'm also going to take a look at the differences in implementation.

> Also to help with kmap_local_page() there are a number of helpers implemented
> in highmem.h for things like memcpy, memmove, etc.
> 
> Check out memcpy_page() for this use case.

Aren't memcpy_to_page() and memcpy_from_page() better suited for the two 
different branches of the "if" statement?

Thank you,

Fabio M. De Francesco

> 
> Thank you!
> Ira
> 
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >  drivers/staging/rts5208/rtsx_transport.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/rts5208/rtsx_transport.c b/drivers/staging/rts5208/rtsx_transport.c
> > index 805dc18fac0a..de690d7ee5e3 100644
> > --- a/drivers/staging/rts5208/rtsx_transport.c
> > +++ b/drivers/staging/rts5208/rtsx_transport.c
> > @@ -92,13 +92,13 @@ unsigned int rtsx_stor_access_xfer_buf(unsigned char *buffer,
> >  			while (sglen > 0) {
> >  				unsigned int plen = min(sglen, (unsigned int)
> >  						PAGE_SIZE - poff);
> > -				unsigned char *ptr = kmap(page);
> > +				unsigned char *ptr = kmap_local_page(page);
> >  
> >  				if (dir == TO_XFER_BUF)
> >  					memcpy(ptr + poff, buffer + cnt, plen);
> >  				else
> >  					memcpy(buffer + cnt, ptr + poff, plen);
> > -				kunmap(page);
> > +				kunmap_local(ptr);
> >  
> >  				/* Start at the beginning of the next page */
> >  				poff = 0;
> > -- 
> > 2.34.1
> > 
> 




