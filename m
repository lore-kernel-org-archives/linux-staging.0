Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0492594
	for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 11:51:28 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c00a32cbb1so1427981fa.1
        for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 04:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694951486; x=1695556286; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O9xrQyEDDPF4pjN0t8fjnGLWFJ3LWmcH4FpyIlSZVAc=;
        b=gtkwzQI+vgsizAOINOYaeHjlw81spN56/09mYCb3xqWcMkO3WCQ9yKr5acNKZ01q8k
         /EuLbX4Km6wUueakSsqSSZpoRZai5SzoEXSznrlp8td2vfW6Fv1Assm/6kvrzEm/W8no
         +yt21GayEFKYVsupXniPXVHRVrVaaXvH+hrRjno9dENW9hGnUPAiPWlkPpiKikHiVlXY
         oQLWAhXu0YiYoFJYkplXAgM/CUch6i16VeVYNEazY8FnHQC3Ln9N1JSuGG14gwPRvoil
         cVdnFBw5VBTIGZawFYvOngjoHid+oD1QaLaAoX1uq4F/80VhsJsk9no9ebE0YN5n7Cpk
         crIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694951486; x=1695556286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9xrQyEDDPF4pjN0t8fjnGLWFJ3LWmcH4FpyIlSZVAc=;
        b=gwJMwR2jJn1w6fr/+ROrupXn4zt79FFvPRXXQK+W3bhwD+1e/nH9O2QFHZHiRtIMGf
         W7bAQ0dU9TiFxR3PigG1Oyx4ooB1/5geHsv9UyqBH1ALnkVkY0itaxVEnOCOMTfUsNfk
         3x6M/BefNTrtEKfJ/wLfay12OXmEmq9KtOLZ1snmpjS7z/KuP3Yh3GMoLaOgiTkrqVP6
         aaPUVA3gp9cxLTroNxvmOWzizclH7cVsrY7/sMIFPHCYiYWLZZnRSk6YrHdlxWlWSHd1
         3OW60329CGaEG/Kw7m8Q+WLaTdk+cUXvLuvRc3lio700oIzuj4zPpV2uqmEqrE4DdZ1d
         NX3w==
X-Gm-Message-State: AOJu0Yx/FupDBRPt3Z7MLrGn5Hkd7hU6Jdh19VFi7g2H2gExZmYZ+hlW
	QNMueSi3rBia0epFBMopmDo=
X-Google-Smtp-Source: AGHT+IH+qthPxv7+ASG27RAKsvysI0ixA/sFrrbszqVZbp5k3YQF1KyKecUXdsvDwO5fw4kcw5a17g==
X-Received: by 2002:a2e:8e91:0:b0:2c0:7d6:570b with SMTP id z17-20020a2e8e91000000b002c007d6570bmr210492ljk.26.1694951485710;
        Sun, 17 Sep 2023 04:51:25 -0700 (PDT)
Received: from HP-ENVY-Notebook (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.gmail.com with ESMTPSA id l16-20020a2ea310000000b002bcbae4c21fsm1581454lje.50.2023.09.17.04.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 04:51:25 -0700 (PDT)
Date: Sun, 17 Sep 2023 13:51:23 +0200
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: vme_user: Fix block comments where '*' on
 each line should be aligned
Message-ID: <ZQboO4KSoDuANDYe@HP-ENVY-Notebook>
References: <20230909184818.699987-1-bergh.jonathan@gmail.com>
 <2023091339-mountain-asleep-9439@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023091339-mountain-asleep-9439@gregkh>

On Wed, Sep 13, 2023 at 10:33:24AM +0200, Greg KH wrote:
> On Sat, Sep 09, 2023 at 08:48:18PM +0200, Jonathan Bergh wrote:
> > Fixed checkpatch warnings where lines with '*' in block comments should
> > be aligned and were not as well as incorrect tab spacings at the start of
> > comment lines.
> > 
> > Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
> > ---
> >  drivers/staging/vme_user/vme_tsi148.h | 140 +++++++++++++-------------
> >  1 file changed, 70 insertions(+), 70 deletions(-)
> > 
> > diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
> > index dbdf5dabaf90..9748b7897527 100644
> > --- a/drivers/staging/vme_user/vme_tsi148.h
> > +++ b/drivers/staging/vme_user/vme_tsi148.h
> > @@ -251,28 +251,28 @@ static const int TSI148_LCSR_VIACK[8] = { 0, TSI148_LCSR_VIACK1,
> >   */
> >  #define TSI148_LCSR_VMEFL	0x250
> >  
> > -	/*
> > -	 * VME exception.
> > -	 * offset  260
> > +/*
> > + * VME exception.
> > + * offset  0x260
> 
> This change is not documented :(
> 
> Also I have two 2/2 patches, yet they are both different :(
> 
> Please fix this up and send a whole new series, properly versioned,
> as-is, I have no idea what to do here.

Great, thanks for your help with these. 
