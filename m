Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662D47A
	for <linux-staging@lists.linux.dev>; Thu,  9 Jun 2022 17:01:31 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id k4so10988712qth.8
        for <linux-staging@lists.linux.dev>; Thu, 09 Jun 2022 10:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jnwjuzj3MrO/cwr2OIkDIAaSQBe3BajVFxJznUYian0=;
        b=KXqRhtXyWnfMMh67/l7UqFNSak6iRPazY7CXKZ8kXMQ28xL6ZgU/jokUz5eYFK4Fmf
         RSP4C1zwYfySDnFihTA+aG73lcyhQC2oUpja4Q0z5PZNdMPTSBVEYPXBzvrR3kLqDuUg
         ER3zClQ+6tt0BFGJmHXW9WWL6C/D68LHpXXhtEzC4d0A960OviV85LsphNuoMihi4fFT
         YicoSQdctm46hGSz4YgrEhYfyp1IhVjilwY7hZWzC9CLWNXUqD5eVMJb2GoUnLVzr3b2
         DRSDlDXTuIhIt3SoJuqetEdNDvg+rkRNVFpE574dSoUVTyyg9zOKm2gnPxvyT2p3csIP
         iHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jnwjuzj3MrO/cwr2OIkDIAaSQBe3BajVFxJznUYian0=;
        b=VruF3CKu3WdQznKrqJ7+CJkvzkEINo8RjDfWniPOxEaoEdBo4URgC7zqZHvNV7kH0H
         1Rk/iTnuG7UmnWw/4x9nlzCtMLbKwlr2yDuqPpGfgQm1ofv6cu5yZSjDLEsRaJzeOSkB
         JIkFD77WnvA1TQ4ZC3b3FXbGOTvSws5COkK8J2VQK7Uu6UewoZqg3FI4uTr8Xcd5AiHC
         MQTf0FHUJ34R4UOT7+gzdHpxCltAN00bPOLsike6NrBJtA8R5wYwv8D9w0MU+ILzl1tP
         7DLCYnM1YPPdSnVOgdl+6mXHhuFRLBH0Xog/9fm1VrNkghIkPw+WuM2U4BkRRfKA6zDw
         hM+Q==
X-Gm-Message-State: AOAM532Z4F3faX6YSKI6Dr4fEDN1UdTCG5A3AFNNRCj6NFhOvAsz7S7B
	nZ2PO+CKoduW/blDyEQHuyI=
X-Google-Smtp-Source: ABdhPJxUnc6jx6BU5l82GJ9gkvxlowGGDi71/wPGyxGzCs8eaISpn9agirY+M5cMSde/PUqXlbAjrw==
X-Received: by 2002:ac8:5a11:0:b0:304:bab8:66f3 with SMTP id n17-20020ac85a11000000b00304bab866f3mr32399696qta.388.1654794089992;
        Thu, 09 Jun 2022 10:01:29 -0700 (PDT)
Received: from Sassy (bras-base-oshwon9563w-grc-26-142-113-132-114.dsl.bell.ca. [142.113.132.114])
        by smtp.gmail.com with ESMTPSA id w17-20020a05620a445100b006a7137330e2sm4046161qkp.132.2022.06.09.10.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 10:01:29 -0700 (PDT)
Date: Thu, 9 Jun 2022 13:01:27 -0400
From: Srivathsan Sivakumar <sri.skumar05@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: qlge: qlge_main.c: convert do-while loops to for
 loops
Message-ID: <YqInZ/KNEJFN9kNS@Sassy>
References: <YqIOp+cPXNxLAnui@Sassy>
 <20220609152653.GZ2146@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609152653.GZ2146@kadam>

On Thu, Jun 09, 2022 at 06:26:53PM +0300, Dan Carpenter wrote:
> On Thu, Jun 09, 2022 at 11:15:51AM -0400, Srivathsan Sivakumar wrote:
> > diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
> > index 8c35d4c4b851..308e8b621185 100644
> > --- a/drivers/staging/qlge/qlge_main.c
> > +++ b/drivers/staging/qlge/qlge_main.c
> > @@ -3006,13 +3006,13 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
> >  		cqicb->flags |= FLAGS_LL;	/* Load lbq values */
> >  		tmp = (u64)rx_ring->lbq.base_dma;
> >  		base_indirect_ptr = rx_ring->lbq.base_indirect;
> > -		page_entries = 0;
> > -		do {
> > -			*base_indirect_ptr = cpu_to_le64(tmp);
> > -			tmp += DB_PAGE_SIZE;
> > -			base_indirect_ptr++;
> > -			page_entries++;
> > -		} while (page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN));
> > +
> > +		for (page_entries = 0; page_entries <
> > +			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++) {
> > +				*base_indirect_ptr = cpu_to_le64(tmp);
> > +				tmp += DB_PAGE_SIZE;
> > +				base_indirect_ptr++;
> > +		}
> 
> It's better than the original, but wouldn't it be better yet to write
> something like this (untested):
> 
> 		for (i = 0; i <	MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); i++)
> 			base_indirect_ptr[i] = cpu_to_le64(tmp + (i * DB_PAGE_SIZE));
> 
> Same with the other as well, obviously.
> 
> regards,
> dan carpenter
> 

Hello Dan,

Thanks for your input

wouldn't base_indirect_ptr point at a different endian value if tmp is
added with (i * DB_PAGE_SIZE)?

Thanks,
Srivathsan
