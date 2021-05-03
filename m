Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5863E71
	for <linux-staging@lists.linux.dev>; Mon,  3 May 2021 07:43:11 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id j28so5182523edy.9
        for <linux-staging@lists.linux.dev>; Mon, 03 May 2021 00:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hrCmHB7eZzrZs7b3fQrpekvADCkKbdVi0YzMuWkAuxk=;
        b=tuoLBZ2CNndbqSbbL6JAW1hgkKpDXJGKvv9cxbXMO5swkUG5Jh/lFHFVjj8EQCtoDV
         UJY49DvS73BeTjhrlT1gxtXvfdg3nzDitxsUXCqZzw2EcjLBs/z5zzKhtgxxfMsiw9Ju
         WkSPFR1Rp9+FecO+qGpq+WwBAJ6t29B8cF1fNlkn2gHTOMvA/eNqT6AN7ETz9EqmBCTG
         C5ntzK1n0ylSD+/3VsiJSn0IpJryc59oy9qD9xM6NzwgjMEay65pHRZesxQulwwHNcr+
         qteFTiYDFIT9hq49+WgObUfTbwj5B43Dc2ll2nzdLIbeKFWi+aOUYUSR/HcmWG8kjpCA
         xI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hrCmHB7eZzrZs7b3fQrpekvADCkKbdVi0YzMuWkAuxk=;
        b=F7epgmkq3Cx0SuI9U9stYMh8iyOO45ybUYyamG0fCcPRoZeNrRnm+Z28pqO8dRWDVQ
         5cWL4ptswXyeAwCMUmRmug2pm4q40ekzclmPB7LmAUOuPslU2NAxpctAWp64fiVd1jkR
         c1tze9SZA1tpi2wvdagv0QtpbjZIuTo8MhUfJdf+5srf1Iqh5KhIDhtXBIPuS32E0weo
         ca6+uBar1Rxcwc10V6ZCH210gyZRgAvJInWoLCqw8vfapncdW32catBMfihlgJyM5eNy
         HmEJ/QXb9sPYAf20IXzq1Wag3YvK6tdVXKx5n5Ph+DCQcHJ2Ul03SBj5p3ZGCAgVGjNB
         OqyQ==
X-Gm-Message-State: AOAM532ovDdMTeQhPH/P4J5G/2stPZJLlzroomZ3a3WV+MjEIvdTJawC
	muf4mh+sBO1m3A6oPOP9WDE=
X-Google-Smtp-Source: ABdhPJwKnxZuuVMoZ4L4wMs8acOl3yBPwWaS1VUpyA/eIqu5alpYMNuIvu55plEsLwnipKrW3G/yQw==
X-Received: by 2002:a50:d782:: with SMTP id w2mr18436682edi.346.1620027789899;
        Mon, 03 May 2021 00:43:09 -0700 (PDT)
Received: from agape.jhs ([5.171.72.252])
        by smtp.gmail.com with ESMTPSA id r18sm10554881ejd.106.2021.05.03.00.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 00:43:09 -0700 (PDT)
Date: Mon, 3 May 2021 09:43:07 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 16/43] staging: rtl8723bs: remove unused ASSERT macro
Message-ID: <20210503074306.GB1557@agape.jhs>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
 <f13bc57cc3a821c40443dddc38258b87962774a7.1619794331.git.fabioaiuto83@gmail.com>
 <20210503073132.GM1981@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503073132.GM1981@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, May 03, 2021 at 10:31:32AM +0300, Dan Carpenter wrote:
> On Fri, Apr 30, 2021 at 04:56:38PM +0200, Fabio Aiuto wrote:
> > remove unused do nothing ASSERT macro definition.
> > 
> > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/hal/odm_debug.h | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
> > index 8ae9948fb0c6..78b9b4548dcb 100644
> > --- a/drivers/staging/rtl8723bs/hal/odm_debug.h
> > +++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
> > @@ -92,7 +92,6 @@
> >  	#define RT_DISP(dbgtype, dbgflag, printstr)
> >  
> >  #ifndef ASSERT
> > -	#define ASSERT(expr)
> >  #endif
> 
> Presumably you're going to delete the #ifndef/endif in the next patch
> but it should have been done in one step here.  (No need to resend.  For
> future reference only).
> 
> regards,
> dan carpenter
> 

ok, thank you,

fabio
