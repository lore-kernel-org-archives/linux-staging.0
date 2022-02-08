Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4812F2E
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 03:57:04 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id g15-20020a17090a67cf00b001b7d5b6bedaso1368674pjm.4
        for <linux-staging@lists.linux.dev>; Mon, 07 Feb 2022 19:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YAAGEC4mtQgehGhRBxSWPNV/ixDQrX/TJPLjD1uwYuw=;
        b=N+pXg7HxURr5h7/2FeoEzeb/HQTtFUPcnvKaFm9GuOZ7/hpjqnW8AAYcCl1uo4XyKH
         8AMYTSZBMvyeVQBxwzV4IJYH4SUv201rUnv1VF0kNxAHiLxnTtWlMN5To4rdLDPGpjLi
         QW96FN0Qk9w4P0Pr11wyf8FGiCRgMDJlu6zrVk7I6LX+kUah0zPQqEJYITDOKZ0fSrYD
         Bu1t9UgZtK+UNNqUiHXVYXDmxefT4DDyNdwY+AdJOM/h8rOsUZsqOySaAbh/dg/NyUVU
         0QP0URDn5xd+wQFGoCL4MFLqalHVIGpNOh/c0tJMbwT4JXUcHYVL6cObCsVRI4HmbHqL
         fZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YAAGEC4mtQgehGhRBxSWPNV/ixDQrX/TJPLjD1uwYuw=;
        b=ZJZ+8EuhUXSOb8y+vHvzSRgFuPulvCGGxaaq1YJfBesdT/UxmabjfTSSjY5SgI6u3r
         VJDiNwhJWf5JTKf+E+pKodoMttV01ghiywK9HjbLBRcKKWFo9MXmm9/zofI0hPMjLnrb
         HRyTUVQiPmVLjK4yrO2zofvxh1QBRPk9GdPCX+ati3n2cg/Shd8VgcFHA9PHi6s2+XiS
         WfGq2Y1dlmaoHeYjowgTIfBnlNMnvgDjKyHFkrzajBCroMujHQ8K/l2BEst1LU953EJn
         pUdSDC3ahXbvUSi5mTrd4zz0cWpa7+5sBh3BthH0sNugX27floAppCkAQ2k6gYxieLVQ
         UtIg==
X-Gm-Message-State: AOAM532iFCxbb9YObRGQsOrpJ6HfayWBTbFKU9bBtduOU1TeJIx4eeg5
	2XhKHHVpb2x0paGTjgE2JAE=
X-Google-Smtp-Source: ABdhPJxSTiMQVE6NwGg0rJ19aZ0pF8F2J5f94lIkrCMugk+QWpmysGVRV3aUe1uz9u+/ojcNeccDjA==
X-Received: by 2002:a17:90a:744a:: with SMTP id o10mr2299408pjk.39.1644292623929;
        Mon, 07 Feb 2022 19:57:03 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id g2sm13531007pfj.83.2022.02.07.19.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 19:57:03 -0800 (PST)
Date: Tue, 8 Feb 2022 16:56:58 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, realwakka@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: remove need to recompile code to debug
 fifo content
Message-ID: <YgHqCpet2TMQAz9L@mail.google.com>
References: <YgCj2P59AbFFmnbA@mail.google.com>
 <20220207100601.GF1951@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207100601.GF1951@kadam>

On Mon, Feb 07, 2022 at 01:06:01PM +0300, Dan Carpenter wrote:
> > #2
> > In the past, it's been pointed out to me during code review that I tend
> > to add code comments which could be omitted. In this case, the for-loop
> > seemed a bit odd without explaining why it's in there. Let me know if
> > you think I should keep/remove it.
> 
> Remove.  Everyone knows what dev_dbg() does and the "read from fifo"
> vs "written from[sic] fifo" is built into the function name.
> 

fair enough

> >  int rf69_read_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
> >  {
> > -#ifdef DEBUG_FIFO_ACCESS
> >  	int i;
> > -#endif
> >  	struct spi_transfer transfer;
> >  	u8 local_buffer[FIFO_SIZE + 1];
> 
> You did not introduce this but we are potentially printing out
> uninitialized data if spi_sync_transfer() fails.  Please initialize this
> with:
> 
> 	u8 local_buffer[FIFO_SIZE + 1] = {};
> 
> Do that in a separate patch, though.
> 

good point, will do. Thanks a lot :)

thanks,

Paulo Almeida

