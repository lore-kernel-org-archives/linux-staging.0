Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5791108
	for <linux-staging@lists.linux.dev>; Sun, 10 Jul 2022 08:27:04 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id a15so2499802pjs.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Jul 2022 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+JGyIrDFKDR5tt3yuLkl9IPyrn5UU1z3xDSAUDC2xz8=;
        b=Tq4n/l75AECE7/QAv0VPvl+liF461bSZkRnNXOUynaeNL4s7NKl6h6QBRjiQVIAM1P
         YqxIwEzXOv8fcKQ2LfV6lyCUGv27comS2RO3UujNeqEAmlCs7Wu6DnYEyYSaJOGny2LI
         7VczYfbrAue3gcw/om1tiDFaoDtgMGeBpM0QEHXnnqHhv5GdLkHWf6ym/KV3mBc4EE+P
         tNg90xgtkD3cm1unJy0YmT7cSqZXW/5gq1xmd2VjYjWK6+9ipzw6tA+bWXBIyk+2tiBV
         ZYLaekeEEIpYKgHPO34nvwiqPVEXQHw7morkKGVF9DqBH71rT2pMitMXWEN2iLpEbLUM
         8kKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+JGyIrDFKDR5tt3yuLkl9IPyrn5UU1z3xDSAUDC2xz8=;
        b=gtIcEkPRKQnBHWy5vOO465NDF5HuiFDlhmNq2KfsQjbcVq9FDkHHIJPDAmzNi/OW/F
         XPsZHcBoNNn6zG6mAGbbfD9ICkh9VewC7vSPL3Y3VWbrq9rJqLbpahFKi0Kw3j/746zu
         28Mvx29X7Rk8GR5kBoJIoJQZI/D0OSMBcESXx6gWMl7A3JtKPXJ+0hlMBMMmiW4C1V40
         rxmncQBaRysy/1tPhYu69qAMt8CSljof6joriiXnNRh61a8iqer7GyQyl5tnwsDx4pBZ
         zim3I/J6YuD/jFsp4o+8fgYHC4jiv8vFqACJtTcKIxs1vbN/E7HhDe5AK1gQSI9il7N+
         h0CA==
X-Gm-Message-State: AJIora/r2ghHvnjwbxanvZ2eViuYQQ3wTMugZcq/DuluPXOny+s+1PBz
	ie5roqDi89RUy2FxCEY5qjs=
X-Google-Smtp-Source: AGRyM1sXYmEdJoJWN5wHdoEyfeBmS2VDuEfDPLxkNS4oSJG/OLbYBSWstHCLd8vOkiPN6ziIdWfp4Q==
X-Received: by 2002:a17:90a:1c02:b0:1e0:df7:31f2 with SMTP id s2-20020a17090a1c0200b001e00df731f2mr10321229pjs.222.1657441623831;
        Sun, 10 Jul 2022 01:27:03 -0700 (PDT)
Received: from cloud-MacBookPro ([2601:646:8201:c2e0:b884:a80c:dca9:4492])
        by smtp.gmail.com with ESMTPSA id rj14-20020a17090b3e8e00b001eab99a42efsm2404469pjb.31.2022.07.10.01.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 01:27:03 -0700 (PDT)
Date: Sun, 10 Jul 2022 01:27:02 -0700
From: binyi <dantengknight@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: Fix indentation issue under long for loop
Message-ID: <20220710082702.GA2109@cloud-MacBookPro>
References: <20220710021629.GA11852@cloud-MacBookPro>
 <1827050fdadb6173118fb396ad1fead23cda809f.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1827050fdadb6173118fb396ad1fead23cda809f.camel@perches.com>

On Sat, Jul 09, 2022 at 07:23:20PM -0700, Joe Perches wrote:
> On Sat, 2022-07-09 at 19:16 -0700, Binyi Han wrote:
> > Fix indentation issue to adhere to Linux kernel coding style.
> > Issue found by checkpatch.
> > 
> > Signed-off-by: Binyi Han <dantengknight@gmail.com>
> > ---
> >  drivers/staging/qlge/qlge_main.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
> []
> > @@ -3009,8 +3009,8 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
> >  
> >  		for (page_entries = 0; page_entries <
> >  			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)
> 
> Probably better to change the for loop to 3 lines as well.
> 
> 		for (page_entries = 0;
> 		     page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN);
> 		     page_entries++)
> 
> > @@ -3024,8 +3024,8 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
> >  
> >  		for (page_entries = 0; page_entries <
> >  			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)
> > -				base_indirect_ptr[page_entries] =
> > -					cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
> > +			base_indirect_ptr[page_entries] =
> > +				cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
> 
> etc...
> 

Thanks for the suggestion. Will send a patch v2 in another thread.
