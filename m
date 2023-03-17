Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEF8641;
	Fri, 17 Mar 2023 05:28:38 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id v21so4163329ple.9;
        Thu, 16 Mar 2023 22:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679030918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JypFrOzIO0MXDs6uCiWRo8IysoMLGN4UV2Agh/hsCgI=;
        b=Qf/pR+EyDe9bkrg2GDKSKAv6isMAEA5jNctyIkNKqRigUg4b+TgCHjBVFh0Z7yDXJN
         LtAC7l4u0AK2HBBNa44trD0yqz8KGlInXI4YnY1Kv/ybUdHdQ8rBpDvHRdSQim1Ij+Nr
         FutQB142HH9FbrLO7bNCzZ6AIyqMFfXnuaGuEqKb4wWb5uM7hkmVYZ8OnsA4tqOY4ZYZ
         85udphYuqWBb6/RkmxgZ1R9/dSapjSyxJ7lNQG+vGZk7CZ0Ec2FkD7mrA7T4uJRrQ3nv
         SAH1U/nz2EXrt3c/+gKrvUbxPvDhjdaWgcGMAG5dAC/2fTrZAHHfkDh5LlLEaXBGP0NN
         veIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679030918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JypFrOzIO0MXDs6uCiWRo8IysoMLGN4UV2Agh/hsCgI=;
        b=kjizEkD8WwrwOawQqxz7ND2muj+DVowaAl2EAexecAPVrI6mLAKgdOdcSuROfkX49j
         JFwVV0g83S+mKLJMGLWtZUbzI/5U82J5h+RnWNZ3NhKHnHKt0b3OuUvx0sHrT5ZTm74b
         WlM2bOwgOICiwYmghMUs0wn+vNpigbsSV3e75+wPid7BtW1zd5e3bqDU14blsENkgAi+
         HiH65A6IOWz2jjQcoj4f9B7pAGSrH4s9rSIqWLO2TsbzW+cxE0syp1o51g2O0EWWiDyd
         +kMx8lLateYwNEL+5lvgck8kptADRHv4xoEgAtF/qABjW6SZDBEtBBLeFnfBK4/kEmbe
         v7ag==
X-Gm-Message-State: AO0yUKUoVjxc5DZqpWIe/W5oCH+Y4x/5J12LfBiL3vf9EsmdtxQ+87j3
	7YDW9Pg/ajHE0YaJPmi9c3I=
X-Google-Smtp-Source: AK7set/qV4kZBFHdu3plDFgC2akoAcjWhNM978VMmdTluoccOCbDJz/wAe07qhfhX0Lyqrh7abcD6A==
X-Received: by 2002:a17:903:1111:b0:19e:6c02:801c with SMTP id n17-20020a170903111100b0019e6c02801cmr6256766plh.14.1679030918122;
        Thu, 16 Mar 2023 22:28:38 -0700 (PDT)
Received: from sumitra.com ([14.139.226.12])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902bb8b00b001a06eb43880sm603185pls.153.2023.03.16.22.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 22:28:37 -0700 (PDT)
Date: Thu, 16 Mar 2023 22:28:32 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: drv@mailo.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v3] Staging: octeon: Fix line ending with '('
Message-ID: <20230317052832.GA83480@sumitra.com>
References: <20230316171614.GA82631@sumitra.com>
 <92ac2441-aa53-41ad-b5b-a12b465bb826@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92ac2441-aa53-41ad-b5b-a12b465bb826@inria.fr>

On Thu, Mar 16, 2023 at 06:37:25PM +0100, Julia Lawall wrote:
> 
> 
> On Thu, 16 Mar 2023, Sumitra Sharma wrote:
> 
> > Since, the coding-style limit the code within 80 columns per line. This
> > causes splitting the function header into two lines and results the
> > first line ending with a '('. This causes the checkpatch error.
> 
> This should all be in the past tense: limited, caused, resulted, etc.
>

Thank you julia for the help.

Regards,

Sumitra

> julia
> 
> >
> > Place the function parameters immediately after '(' in a single
> > line to align the function header.
> >
> > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > ---
> > v2: Change patch subject and description
> >
> > v3: Change patch description, noted by Deepak R Varma <drv@mailo.com>
> >
> >
> > drivers/staging/octeon/octeon-stubs.h | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
> > index 7a02e59e283f..3e7b92cd2e35 100644
> > --- a/drivers/staging/octeon/octeon-stubs.h
> > +++ b/drivers/staging/octeon/octeon-stubs.h
> > @@ -1372,9 +1372,7 @@ static inline void cvmx_fau_async_fetch_and_add32(uint64_t scraddr,
> >  						  int32_t value)
> >  { }
> >
> > -static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(
> > -	int interface,
> > -	int port)
> > +static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interface, int port)
> >  {
> >  	union cvmx_gmxx_rxx_rx_inbnd r;
> >
> > --
> > 2.25.1
> >
> >
> >
