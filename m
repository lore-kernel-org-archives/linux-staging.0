Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B312572;
	Tue, 29 Mar 2022 15:02:59 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id bg31-20020a05600c3c9f00b00381590dbb33so1659419wmb.3;
        Tue, 29 Mar 2022 08:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=moLFBme3l1MFSRqv3HwjWFIls+K2bshAzpdyHy0MNyk=;
        b=NjZgkuVQxWE5kDMvScRuxs+9TFNgXSyY+QQCXH6ML3o//up532bifrBrmytwgWxciz
         aLk0JzAznjSCGyAgCoDPBtfKxaxGFqv4E7AGvY0xm25dtMcMiuKVnHiKuklpYR4RkDMs
         wra+3Glwhas7Hs5uHVUqz3lkYqmv+Gc1IiorsAcvH4lfl6cz/3MWu6jPL7lyXoqa/8xI
         ZY8YLtPwbHgcIopLU1rWyNvQ8JhrTCkl0IhSnQ2elJ0qRfIDXq5bSwfESxE/kXGe3+l7
         baxKRnMq+OFDOTwZfyqorUsTndZ2tUNa4AwBnEXEVEQQqHIO7FAUqyWGEjJtNPX8RbG9
         Mc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=moLFBme3l1MFSRqv3HwjWFIls+K2bshAzpdyHy0MNyk=;
        b=tQadgrWV2a32hsOKi1g+qN3+mQ4I+voE7UOo191W6Yrg/ZA79YLcibBcpHAMrzmd1s
         AuKJpWRh4kLHNNwxdP09XhRHTBSndFqIgEPJJWHgH4HqFSiciwAFu6MYFIa35+jKuVNZ
         JHEhhoH5FB20YseGwTR6Bia+wkMV02WeA+EglycXtW5YZX6AkQ7VJNIMGn5Nd5s1MoCW
         DwrVnl9dIFavZdZGIMWDLtl/yPzZJx404ItHICuzLgs77LeFMKHRHe2NdyGt6yHp+G63
         g9TTuueEm3Wzc2POkzOI/xJkjTHRvq3VfS1L/Y/r7MGb3XEWbPAnpbIu0XkN7Ov81KiK
         43sw==
X-Gm-Message-State: AOAM532xJr1NJUSO0ubO0EnThhS70Xs6UPPFE5JJ4zg5suIolMZVOTf7
	6aMxAEnugszs9E3QJwcSKLo=
X-Google-Smtp-Source: ABdhPJyLlZsIm4LXUAyjPuGNL42MJl4z/IdaIzJgFCWreFpO5AzXezgcyOPB95pFjd+FJPKcKl/rgQ==
X-Received: by 2002:a05:600c:1d95:b0:38c:f943:c20c with SMTP id p21-20020a05600c1d9500b0038cf943c20cmr62758wms.19.1648566178086;
        Tue, 29 Mar 2022 08:02:58 -0700 (PDT)
Received: from leap.localnet (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id r65-20020a1c4444000000b0038c48dd23b9sm3724849wma.5.2022.03.29.08.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 08:02:56 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Philip <benjamin.philip495@gmail.com>, Bart Van Assche <bvanassche@acm.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Colin Ian King <colin.king@intel.com>, Samuel =?ISO-8859-1?Q?Sj=F6berg?= <info@samuelsjoberg.se>, Charlie Sands <sandsch@northvilleschools.net>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, ira.weiny@intel.com
Subject: Re: [PATCH v2] staging: rts5208: Convert kmap() to kmap_local_page()
Date: Tue, 29 Mar 2022 17:02:54 +0200
Message-ID: <4055501.1IzOArtZ34@leap>
In-Reply-To: <20220329091827.GY3293@kadam>
References: <20220329055539.29299-1-fmdefrancesco@gmail.com> <20220329091827.GY3293@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On marted? 29 marzo 2022 11:18:27 CEST Dan Carpenter wrote:
> On Tue, Mar 29, 2022 at 07:55:39AM +0200, Fabio M. De Francesco wrote:
> > diff --git a/drivers/staging/rts5208/rtsx_transport.c b/drivers/staging/rts5208/rtsx_transport.c
> > index 805dc18fac0a..56b6cc845619 100644
> > --- a/drivers/staging/rts5208/rtsx_transport.c
> > +++ b/drivers/staging/rts5208/rtsx_transport.c
> > @@ -92,13 +92,11 @@ unsigned int rtsx_stor_access_xfer_buf(unsigned char *buffer,
> >  			while (sglen > 0) {
> >  				unsigned int plen = min(sglen, (unsigned int)
> >  						PAGE_SIZE - poff);
> > -				unsigned char *ptr = kmap(page);
> >  
> >  				if (dir == TO_XFER_BUF)
> > -					memcpy(ptr + poff, buffer + cnt, plen);
> > +					memcpy_to_page(page + poff, 0, buffer + cnt, plen);
> 
> You meant:
> 
> 	memcpy_to_page(page, poff, buffer + cnt, plen);
> 

Yes, correct. I meant exactly what you wrote.

It's the first time that I use these API and, after 30 seconds look at their 
prototypes, I thought that either have the same semantics.

I don't yet know if I'm wrong. However, even if either were correct, yours 
would be more consistent and elegant. Therefore, I am going to change these
calls and submit a v3.

Thanks for your review,

Fabio M. De Francesco

> >  				else
> > -					memcpy(buffer + cnt, ptr + poff, plen);
> > -				kunmap(page);
> > +					memcpy_from_page(buffer + cnt, page + poff, 0, plen);
> 
> Same.
> 
> regards,
> dan carpenter
> 
> 




