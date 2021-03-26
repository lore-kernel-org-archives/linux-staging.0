Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776BD5F
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 11:09:49 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id j7so5271405wrd.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 04:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yIKVLF6KJDERSfAMKhWiBfJ54F8siqVNI6LeYpNYZhk=;
        b=ttfgHqgft3ZxhVqMTdEEweo910a5cM2KeWDBNchl48LIjatmH+rJBh9i8ki9rnZjSw
         u95ZeRWTD4K/fnwLicD78h75GizNLD4X1Nx3+zLiHq5kbsZg9RczW/zgBDwfamQJj0la
         mrfXNjke2U1bJNJh5IwSEXcEHKGxn55fSOynaGiXUSsNhwo2C+8iwrazfXadNCP8lbDE
         22r56aJQpynyfWcnc9H85J4kLaG8VgPxX1jzr0JI1RW/FodEjVXRT6j20Z82Hg8bMjoZ
         xlRj/aLlp/S6UtjW8j99v90NjVW+7E+fXtXX+DCE1uB+eBKuM1jwSzKsfRVLnzzxuT2w
         RAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yIKVLF6KJDERSfAMKhWiBfJ54F8siqVNI6LeYpNYZhk=;
        b=P6nA/FZryciQOSswEW6/NiI+FZkYGWL6SfBkCbH65cDUpx+BCthnYZsJgr8mIAL05Q
         3/6wXtiK2Zi2A5Iu9i9+HPa0D89o1Mt4IygbRPxZJxVB00h87V7iujGrhmyAF/R+99Vh
         FS6PBoXy38W9tHGTkfHAWjaLpLILjmg4PAnW8l6CniCHasAkTL3P9SPSm5Vu8G+6nJWO
         TVjFZiwJT8OIqMV/sQN7O3e4DW/O6Ozv//YNZNBLoXEvvtOeWSMrVPNZEj2wR7RL09ZE
         CAsHxlzBMZC4Z01fs3MFjuU4tj7QIFMch+ZWiY3Ubn+wbpjt/HwsinrfmEjyPBhdfCpo
         mg2w==
X-Gm-Message-State: AOAM530drQyq+IYxDf1fFrdmWCGH5S8WYunX8lQYldEvAG/qfFNmL73c
	6WcXya1njXe5mMpoK8Vsf7FMPTWHfvTvcQ==
X-Google-Smtp-Source: ABdhPJwR3OsvjB+OUdvBUap+DdyHqaOflEoB/US4Xm3rVcsvma4eiG47mX53lASwwVaNPAcNU/cy3w==
X-Received: by 2002:adf:fa4e:: with SMTP id y14mr14040567wrr.170.1616756988025;
        Fri, 26 Mar 2021 04:09:48 -0700 (PDT)
Received: from agape.jhs ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id q207sm11016886wme.36.2021.03.26.04.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 04:09:47 -0700 (PDT)
Date: Fri, 26 Mar 2021 12:09:45 +0100
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/15] staging: rtl8723bs: put parentheses on macros with
 complex values in hal/HalBtcOutSrc.h
Message-ID: <20210326110944.GC1452@agape.jhs>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
 <7c734b6d796b369f6a0d23c76daa344c241691b5.1616748885.git.fabioaiuto83@gmail.com>
 <20210326095449.GD1717@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326095449.GD1717@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Mar 26, 2021 at 12:54:49PM +0300, Dan Carpenter wrote:
> On Fri, Mar 26, 2021 at 10:09:09AM +0100, Fabio Aiuto wrote:
> > fix the following checkpatch warning:
> > 
> > ERROR: Macros with complex values should be enclosed in parentheses
> > 152: FILE: drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h:152:
> > +#define BTC_PRINT(dbgtype, dbgflag, printstr) \
> > no_printk printstr
> > --
> > ERROR: Macros with complex values should be enclosed in parentheses
> > 153: FILE: drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h:153:
> > +#define BTC_PRINT_F(dbgtype, dbgflag, printstr) \
> > no_printk printstr
> > --
> > ERROR: Macros with complex values should be enclosed in parentheses
> > 154: FILE: drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h:154:
> > +#define BTC_PRINT_ADDR(dbgtype, dbgflag, printstr, _Ptr) \
> > no_printk printstr
> > 
> > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
> > index 10c021024b24..1926a1f7a7e5 100644
> > --- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
> > +++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
> > @@ -149,9 +149,9 @@ extern u32 		GLBtcDbgType[];
> >  }
> >  
> >  #else
> > -#define BTC_PRINT(dbgtype, dbgflag, printstr)		 no_printk printstr
> > -#define BTC_PRINT_F(dbgtype, dbgflag, printstr)		 no_printk printstr
> > -#define BTC_PRINT_ADDR(dbgtype, dbgflag, printstr, _Ptr) no_printk printstr
> > +#define BTC_PRINT(dbgtype, dbgflag, printstr)		 (no_printk printstr)
> > +#define BTC_PRINT_F(dbgtype, dbgflag, printstr)		 (no_printk printstr)
> > +#define BTC_PRINT_ADDR(dbgtype, dbgflag, printstr, _Ptr) (no_printk printstr)
> 
> This makes no sense at all.  no_printk is a function.  The BTC_PRINT()
> macros are super ugly and this only makes it worse.
> 
> regards,
> dan carpenter
> 

so I'll just drop the patch in the next v2

thanks,

fabio
