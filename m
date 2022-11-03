Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8658A23;
	Thu,  3 Nov 2022 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667467121; bh=1FFyeCB1hsvWSZFVl4Cqf8cr/xeMPMTwxPelch+HVkI=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=EeZejlVQ/tZqrGfYydi+VCs7I1D4NSzQRoumLgidzbI2cgsVeO7/PKStGXl6eCgfa
	 c30K5t4HuvvqAW+06jcpqOliI5EnwlGIjSBwbpaZl/T3Zh459MBN/XCTcHhbhnQ1lT
	 o5sMCt3OmN8D9q86F15gVi/XOZ2KWKJPIzTXpG/8=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
	via [213.182.55.206]
	Thu,  3 Nov 2022 10:18:41 +0100 (CET)
X-EA-Auth: lRmrKz4m7pPIlT6G9wgNSAXAl/QL4q8IeqYV3yT3ly6KzkRBk4KKck/th0wDBHggEFJP7QaLRArA0ckubZhz+ziq/dVwzlM2
Date: Thu, 3 Nov 2022 14:48:35 +0530
From: Deepak R Varma <drv@mailo.com>
To: Dan Carpenter <error27@gmail.com>
Cc: David Laight <David.Laight@aculab.com>,
	"outreachy@lists.linux.dev" <outreachy@lists.linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8192e: Use min_t/max_t macros for variable
 comparison
Message-ID: <Y2OHVoXD82CIHL8R@qemulion>
References: <Y2LxC2kziM1TznhO@qemulion>
 <d8fa86bf71694f23b8f175245722e86f@AcuMS.aculab.com>
 <Y2OBmWIwhRMOk6V/@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2OBmWIwhRMOk6V/@kadam>

On Thu, Nov 03, 2022 at 11:53:45AM +0300, Dan Carpenter wrote:
> On Thu, Nov 03, 2022 at 08:24:15AM +0000, David Laight wrote:
> > > --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > > +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > > @@ -587,17 +587,12 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
> > >  			else
> > >  				pHTInfo->CurrentAMPDUFactor = HT_AGG_SIZE_64K;
> > >  		} else {
> > > -			if (pPeerHTCap->MaxRxAMPDUFactor < HT_AGG_SIZE_32K)
> > > -				pHTInfo->CurrentAMPDUFactor =
> > > -						 pPeerHTCap->MaxRxAMPDUFactor;
> > > -			else
> > > -				pHTInfo->CurrentAMPDUFactor = HT_AGG_SIZE_32K;
> > > +			pHTInfo->CurrentAMPDUFactor = min_t(u32, pPeerHTCap->MaxRxAMPDUFactor,
> > > +							    HT_AGG_SIZE_32K);
> >
> > For min() to fail there must be a signed v unsigned mismatch.
> > Maybe that ought to be fixed.
> >
>
> u32 is the right choice here.
>
> I'm having a hard time understanding your email.  You might be saying
> we could declare HT_AGG_SIZE_32K as a u32 so then we could use min()
> instead of min_t()?  HT_AGG_SIZE_32K is an enum.
>
> pPeerHTCap->MaxRxAMPDUFactor is a bitfield.
>
> 	u8 MaxRxAMPDUFactor:2;
>
> We will never be able to use min().

I think we could do min((u32)a, (u32)b), but it is just unwrapped min_t
if I understand David's comment.

>
> > >  		}
> > >  	}
> > > -	if (pHTInfo->MPDU_Density > pPeerHTCap->MPDUDensity)
> > > -		pHTInfo->current_mpdu_density = pHTInfo->MPDU_Density;
> > > -	else
> > > -		pHTInfo->current_mpdu_density = pPeerHTCap->MPDUDensity;
> > > +	pHTInfo->current_mpdu_density = max_t(u8, pHTInfo->MPDU_Density,
> > > +					      pPeerHTCap->MPDUDensity);
> >
> > Using u8 with max_t() really doesn't make any sense.
>
> Using u8 looks wrong because you would worry that one of the types is
> larger than U8_MAX.  But it's actually fine.  The types are u8 vs another
> bitfield.  I would probably have gone with u32 here as well.
I will take your advise and upgrade the type to u32 as a revision.
>
> > The value will get promoted to signed int prior to the comparison.
> >
>
> That's sort of true-ish but I don't understand what you are saying?
> #confused

Yes, I too did not understand David's comment. I tried to dig dipper into max_t but
it gets very complex. Can you please elaborate how you determined the promotion
to signed int?

>
> regards,
> dan carpenter
>
>


