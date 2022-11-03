Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39331A23;
	Thu,  3 Nov 2022 08:53:50 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso2802904wme.5;
        Thu, 03 Nov 2022 01:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOgQFHfI3FUkZp+SFcOLsJI7My5Qgr1wTpnF6i/fSWY=;
        b=fIKx4ewmJf287Iu8uN4y/xhHfot1VI89fFN/3KlaM8fECdrogbyKERSZ/YD+LTjoTl
         ROgD6h5yog1Ak/q4//See7U7HGaAsbGAuxCB1pM4SnjRtF+v4yrudux+cW54r5weDqWL
         Rg/hTjne8SHuuLGG7+oqPOEgPs+7s441uLy14E76R3U9cBmWGzAum9pPH3HlDKyJ47Ti
         DxOh8OPt0sYpgm2YpJn+TlqxWKG9KK+gJjgb+/siDNq5YYus4G9W6UUKULa5EuCYmnjC
         GiIm8rXCHYpybr/ScWmK4So5Y9PCWpKG4LEikJdXLYgD5AuX+TRDIrwffayTk8McVKWg
         MbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOgQFHfI3FUkZp+SFcOLsJI7My5Qgr1wTpnF6i/fSWY=;
        b=HWhojTnFbRV1eclFWaQAS/yUz4YxvlgegY+ADU08Pf7d6PVL3Wv4Jn2Ig2LmHU4gQZ
         Kzi5rZlvbvNKFbmEnvL3zT6qtp9JQ/iMkSc493ugUbevbCfSZ92LEe/sBPk6HFqOHyi+
         ty0vQWjfuop9QTyFFizQOnD+8eK1485dnESTtFaMfZJwtUCI++IeIZDpOczFMSsj529C
         CeTN/oYROq7m10JjIVN8dmsuQ+TjRK6HRPqLDe5v0V3dkp+M6DOV0+yFL4O5bPCUNIWL
         GwXvfTchjCqgip1Iie5x/FUtk9KViLYWuMxneg+ZPWOdgzPk+nzsgYNCCXOndXCrn26k
         C87w==
X-Gm-Message-State: ACrzQf1UITi/VYAvoOCSL8xuuC3WoYhdRTFor3NLithc2kppDEgaGORh
	xN6qi2wM6kA/c9dd7MUSsVlfQiWpvZeb+A==
X-Google-Smtp-Source: AMsMyM5K2qMRj/kYgqg7rjbL1TGqdFcfBD713qZdrL/2D3XWo31y5LgPmC5PP/EOSmEgw5Jzrtcqew==
X-Received: by 2002:a05:600c:474a:b0:3c6:ff98:624c with SMTP id w10-20020a05600c474a00b003c6ff98624cmr28678624wmo.26.1667465628294;
        Thu, 03 Nov 2022 01:53:48 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b003cf47fdead5sm623498wmq.30.2022.11.03.01.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 01:53:47 -0700 (PDT)
Date: Thu, 3 Nov 2022 11:53:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: David Laight <David.Laight@aculab.com>
Cc: 'Deepak R Varma' <drv@mailo.com>,
	"outreachy@lists.linux.dev" <outreachy@lists.linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8192e: Use min_t/max_t macros for variable
 comparison
Message-ID: <Y2OBmWIwhRMOk6V/@kadam>
References: <Y2LxC2kziM1TznhO@qemulion>
 <d8fa86bf71694f23b8f175245722e86f@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8fa86bf71694f23b8f175245722e86f@AcuMS.aculab.com>

On Thu, Nov 03, 2022 at 08:24:15AM +0000, David Laight wrote:
> > --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > @@ -587,17 +587,12 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
> >  			else
> >  				pHTInfo->CurrentAMPDUFactor = HT_AGG_SIZE_64K;
> >  		} else {
> > -			if (pPeerHTCap->MaxRxAMPDUFactor < HT_AGG_SIZE_32K)
> > -				pHTInfo->CurrentAMPDUFactor =
> > -						 pPeerHTCap->MaxRxAMPDUFactor;
> > -			else
> > -				pHTInfo->CurrentAMPDUFactor = HT_AGG_SIZE_32K;
> > +			pHTInfo->CurrentAMPDUFactor = min_t(u32, pPeerHTCap->MaxRxAMPDUFactor,
> > +							    HT_AGG_SIZE_32K);
> 
> For min() to fail there must be a signed v unsigned mismatch.
> Maybe that ought to be fixed.
> 

u32 is the right choice here.

I'm having a hard time understanding your email.  You might be saying
we could declare HT_AGG_SIZE_32K as a u32 so then we could use min()
instead of min_t()?  HT_AGG_SIZE_32K is an enum.

pPeerHTCap->MaxRxAMPDUFactor is a bitfield.

	u8 MaxRxAMPDUFactor:2;

We will never be able to use min().

> >  		}
> >  	}
> > -	if (pHTInfo->MPDU_Density > pPeerHTCap->MPDUDensity)
> > -		pHTInfo->current_mpdu_density = pHTInfo->MPDU_Density;
> > -	else
> > -		pHTInfo->current_mpdu_density = pPeerHTCap->MPDUDensity;
> > +	pHTInfo->current_mpdu_density = max_t(u8, pHTInfo->MPDU_Density,
> > +					      pPeerHTCap->MPDUDensity);
> 
> Using u8 with max_t() really doesn't make any sense.

Using u8 looks wrong because you would worry that one of the types is
larger than U8_MAX.  But it's actually fine.  The types are u8 vs another
bitfield.  I would probably have gone with u32 here as well.

> The value will get promoted to signed int prior to the comparison.
> 

That's sort of true-ish but I don't understand what you are saying?
#confused

regards,
dan carpenter

