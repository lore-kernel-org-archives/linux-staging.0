Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8421D8839;
	Sat, 12 Aug 2023 18:29:37 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6877eb31261so2060593b3a.1;
        Sat, 12 Aug 2023 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691864977; x=1692469777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ztTMR0AzYlsaXnYSaql7TxK3S5vIp+xWvbOnSZ6CqQ=;
        b=nmlWGjPSVRTJjIxCQTFYHBlL1iQTLsg91XDFZB1mCwWhCWSvcY4DIb8/925RQsrA9q
         ioxiiToJa0XT99E1gGgrN6b28G2b556y6AEZkDBSByqwbHVQ4tscGw88RNqvOf9fmq3Y
         74xHzwsrnCtayM+Kq9XEKHSfDjKaXnTqIACHhls/E+aZVyjhOc4nq6pdaikJiIbdeFU+
         PBozMnx1PZF5imsurFgJSi8FjMpSSAQcLWEwURionk0d7CrGWEm12SMgdbyK6lBGAVDR
         EbNy0+2o7K7DD4w4H7xk8m7EvcDdHqDsadz5RFT80VL5nRQOq9ioQpJMB0Ozs998jJBS
         0t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691864977; x=1692469777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ztTMR0AzYlsaXnYSaql7TxK3S5vIp+xWvbOnSZ6CqQ=;
        b=ZWO5YWMvLLWG64DNtXMyirurtmbM30JcZrCkgHOV5qeX35y5FVhYhfKe34bHlIU45U
         V/UL4VWbIUyaopLU8fCaL+TDJBOfoUmbHUbaCsTtfrrf9btvWzdORM8RDSjsmPmtklSc
         upzRZM4go0jlmr99iXxAIbdt/VkHyF7uGmdmlZdjLtvB3OiUHIJamR6TDk+MU1UqpUim
         Y3knbrExhkeqGDAd5hjlX9+/T2cg7xaXMtv3GTNRe5wJw93p15tSiJTBOAihPBnDt8fC
         0rfZUrXJS01kJn33fjFJZojnqXnkHX9bfkgaF8Uv10qQ3Vo3kq58ToduenLSwcSD/lwS
         Kt1w==
X-Gm-Message-State: AOJu0YzfkFMKRS17kyHBOtBCfGVYh+FMzOc42ibh7TghZnsP7FkdC7/c
	RNgqM3rJ3JNlLwIa0zdcgR0=
X-Google-Smtp-Source: AGHT+IGBnzKpTmVEcN/WPHLre1KLQ8yssF/PV0BvDvymoA+XfgBshx0+um4WvO5CAbO4COp5WKEbVA==
X-Received: by 2002:a05:6a20:7291:b0:140:3aa:e2c3 with SMTP id o17-20020a056a20729100b0014003aae2c3mr5794596pzk.37.1691864976582;
        Sat, 12 Aug 2023 11:29:36 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([171.49.234.213])
        by smtp.gmail.com with ESMTPSA id s29-20020a63af5d000000b00563dfd98982sm5496429pgo.42.2023.08.12.11.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 11:29:36 -0700 (PDT)
Date: Sat, 12 Aug 2023 23:59:29 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Greg KH <greg@kroah.com>, Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linuxkernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: replace camel case by snake case
Message-ID: <ZNfPiQAL3ixA7tjz@ubuntu.myguest.virtualbox.org>
References: <ZNOK2u1sJoRAxhIC@ubuntu.myguest.virtualbox.org>
 <2023081150-hamster-sulfide-4231@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023081150-hamster-sulfide-4231@gregkh>

On Fri, Aug 11, 2023 at 11:27:10PM +0200, Greg KH wrote:
> On Wed, Aug 09, 2023 at 06:17:22PM +0530, Pavan Bobba wrote:
> > Replace array name of camel case by snake case. Issue found
> > by checkpatch
> > 
> > Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> > ---
> >  v1 -> v2: 1. array name renamed from byVT3253B0_RFMD to by_vt3253b0_rfmd
> >            2. typo in the subject line "small case" corrected with the
> >               proper word "snake case"
> > 
> > Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> > ---
> >  drivers/staging/vt6655/baseband.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
> > index 0e135af8316b..cc8793256661 100644
> > --- a/drivers/staging/vt6655/baseband.c
> > +++ b/drivers/staging/vt6655/baseband.c
> > @@ -499,7 +499,7 @@ static const unsigned char by_vt3253_init_tab_rfmd[CB_VT3253_INIT_FOR_RFMD][2] =
> >  };
> >  
> >  #define CB_VT3253B0_INIT_FOR_RFMD 256
> > -static const unsigned char byVT3253B0_RFMD[CB_VT3253B0_INIT_FOR_RFMD][2] = {
> > +static const unsigned char by_vt3253b0_rfmd[CB_VT3253B0_INIT_FOR_RFMD][2] = {
> 
> Again, the "by" needs to just be dropped.
> 
> thanks,
> 
> greg k-h

hi greg...did'nt get your comment. can you please provide more elaborate
info?
