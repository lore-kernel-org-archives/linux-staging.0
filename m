Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF36A28
	for <linux-staging@lists.linux.dev>; Mon, 18 Jul 2022 02:12:44 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id t5-20020a17090a6a0500b001ef965b262eso11251496pjj.5
        for <linux-staging@lists.linux.dev>; Sun, 17 Jul 2022 19:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i78I4TE1JiOYqnZaNPr9Rowmxm+xUoOYt534dSBaRR0=;
        b=P2vUoEy9XBI+qEttU1UOVGA4SpJWQTnTp+zza1zDkZ53KQdcadas6XXAInXdMdeXah
         Mu/C1wRiNNN0Yg2XTuZK3KOFkzGGQgHOci15P/FwkmSuZxuTxQjIaGhyDGzJ9k3JoSl9
         JD9bfHLJ4lU+PguYsL8vVP6d0JBzYfTABNPDBpvqPXH4olmJz22IzqEGirlnQFH7w7f4
         QlGKOGfMnNMW55OMdySiwYZJf857N1q/vTQVr+UdIxK+5KtKrfr94oBPWEUSrtS5g72w
         60fZaeV0ro8+qStmeOfhHaJJ7wEvxDw0cP8qPormOpbvZynRq07aWhF1Kmi7ehD3Y+GP
         GMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i78I4TE1JiOYqnZaNPr9Rowmxm+xUoOYt534dSBaRR0=;
        b=uAq1AaeDGjzmIDGYJXIOnPLdIMhlW9SwrhIF0ENTq3ybYHJq7g58QkP6F1tuIZvYm7
         Zn4AuT3l5QOZh9flnA7i1u1XFKG33z7lTpeIutnh2WL/Ehjv49RBsvhu3eAJ3+nEEG7T
         ZiZS5av/t6GgxBgKEFWx2DBUMhohl5aMeYwYIz2t8qkBMmcQ43mDwanuQa9/lB5p/uE+
         2CoACq+MAXyj+GdzgVJ3Op1wO1gjXEKXTMVin/TPnhbvQe+LomgGJlz/v6+xpp4/3xV7
         17NDHgOs1Gn8mmgixn5NtWkUIBfROwUlPmzIZmuD2U65VPRGRndUbv34BFS2tBxZb+vg
         A6cg==
X-Gm-Message-State: AJIora/WZIILek1j/hm/DItX241HvPsvoZ+YDGmrcxe4i+bf4HnIv/Ns
	DR8YXuW6UbEgiKLt0I5rG6s=
X-Google-Smtp-Source: AGRyM1th9MU4wtYAqqWGdKRksVwhGB90SLKNfy7x8fq1400OGXLKjnKdikVOMIR/16OC6ZvcCp0Fkg==
X-Received: by 2002:a17:902:e213:b0:16c:4292:9f57 with SMTP id u19-20020a170902e21300b0016c42929f57mr26018611plb.143.1658110363547;
        Sun, 17 Jul 2022 19:12:43 -0700 (PDT)
Received: from cloud-MacBookPro ([2601:646:8201:c2e0:1d20:c9aa:c964:2f9b])
        by smtp.gmail.com with ESMTPSA id o11-20020a170903210b00b001638a171558sm7883365ple.202.2022.07.17.19.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 19:12:42 -0700 (PDT)
Date: Sun, 17 Jul 2022 19:12:41 -0700
From: binyi <dantengknight@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Joe Perches <joe@perches.com>, Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com, Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: qlge: Fix indentation issue under long for
 loop
Message-ID: <20220718021241.GA8270@cloud-MacBookPro>
References: <20220710210418.GA148412@cloud-MacBookPro>
 <20220712134610.GO2338@kadam>
 <1d6fd2b271dfa0514ccb914c032e362bc4f669fa.camel@perches.com>
 <20220715060457.GA2928@cloud-MacBookPro>
 <20220715092847.GU2316@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715092847.GU2316@kadam>

On Fri, Jul 15, 2022 at 12:28:47PM +0300, Dan Carpenter wrote:
> On Thu, Jul 14, 2022 at 11:04:57PM -0700, binyi wrote:
> > On Tue, Jul 12, 2022 at 07:14:55AM -0700, Joe Perches wrote:
> > > On Tue, 2022-07-12 at 16:46 +0300, Dan Carpenter wrote:
> > > > > @@ -3007,10 +3007,12 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
> > > > >  		tmp = (u64)rx_ring->lbq.base_dma;
> > > > >  		base_indirect_ptr = rx_ring->lbq.base_indirect;
> > > > >  
> > > > > -		for (page_entries = 0; page_entries <
> > > > > -			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)
> > > > > -				base_indirect_ptr[page_entries] =
> > > > > -					cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
> > > > > +		for (page_entries = 0;
> > > > > +		     page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN);
> > > > > +		     page_entries++) {
> > > > > +			base_indirect_ptr[page_entries] = cpu_to_le64(tmp);
> > > > > +			tmp += DB_PAGE_SIZE;
> > > > 
> > > > I've previously said that using "int i;" is clearer here.  You would
> > > > kind of expect "page_entries" to be the number of entries, so it's kind
> > > > of misleading.  In other words, it's not just harmless wordiness and
> > > > needless exposition, it's actively bad.
> > > 
> > > Likely true.
> > > 
> > 
> > I agree it could be misleading. But if "page_entries" is in the for loop I
> > would assume it's some kind of index variable, and still it provides some
> > information (page entry) for the index, probably page_entry_idx could be
> > better name but still makes the for loop a very long one. I guess I would
> > leave it be.
> 
> It does not "provide some information".  That's what I was trying to
> explain.  It's the opposite of information.  Information is good. No
> information is neutral.  But anti-information is bad.

I see. Indeed, being neutral is better than being bad. 

> Like there are so many times in life where you listen to someone and you
> think you are learning something but you end up stupider than before.
> They have done studies on TV news where it can make you less informed
> than people who don't watch it.  And other studies say if you stop
> watching TV news for even a month then your brain starts to heal.
> 
> I don't really care about one line of code, but what I'm trying to say
> is learn to recognize anti-information and delete it.  Comments for
> example are often useless.

It makes more sense to me now. Thanks for explaining!

Best,
Binyi
