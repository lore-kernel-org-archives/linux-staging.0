Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD70A3481
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 13:35:33 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id y7so10971626eda.5
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 06:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nLxc1jc3feOHhz7WBeAx0UeYJk853JxA+UhIeYOmLsg=;
        b=vGYtC+xatjVO9a7TE1NC52YzEjpr2glEYO2CFpnpeE+wsfIXvFvkzppM7o1B9Wjd82
         IERqTP3thMUnY9N7WMJrlEnXGVe7efOrKIwBygiz1MM8neNT3SKcz3n7ktBSjXwr6ibk
         Inb6kkJcC8Oxx75jPqhSTbZ3isb7lejJFsZYW32sb8MUOqJYWjWbVPp39L+zMsyvbpFW
         QtbClYod0ZFZnpIzAPkioxjrlVmDWkijB34y6gYqa/p3sY4U4hGnvUkmv/ii/dDpnZGV
         CU815gpbcJEoEsBuUK3o7qbMHvi0Hp/C/u0YnBdBCXLGXzHYbnPzM1PtbMdQ1w1E4R2T
         GcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nLxc1jc3feOHhz7WBeAx0UeYJk853JxA+UhIeYOmLsg=;
        b=UrrJscsnTtSDm7smidk97Zcoj8IDsGOT8wDa8Ej3Og9EfyLaI08tq9f+6VoaQ3nCja
         ixvBQBJBWR2WdjYJkKo1EyvRcz1n3KjQ86Z4PFqM2chu8s1keSikv1qf8j1xWobXZIEj
         pNmGhAnR8WGpd/XZze43IYRlGQWnIsB2bcEvH7TvkVJSlwTqtoLP3Ci0ayB2KOmgeHRY
         vJ+zzCsfN/3Q+vIXZoTyRYlpx/scvTbfowdAEFjziTYktXtKSuTdjtF1lEwV02AK79io
         8C7K4ICaFFWCDs3grkB1OccoCyMhQlRKYysVuR/nrxDmjVyqHVpvf7qn08Dsmt3lm0tr
         MuTw==
X-Gm-Message-State: AOAM530AH++ACHX/ckrSIPLF/woxTszQSYLp1D2RsTLLdBweO/s6V4N9
	qKlW5IGItkYr2LT6Ui66poY=
X-Google-Smtp-Source: ABdhPJx3r8u/i1roSHt0Vytz2NfyK2xo4IhBTgVTzp54fHigaQ4kHpsO0ytmXO3unteuGw7qFvOv7A==
X-Received: by 2002:a05:6402:3094:: with SMTP id de20mr2350772edb.272.1627652131890;
        Fri, 30 Jul 2021 06:35:31 -0700 (PDT)
Received: from agape.jhs ([5.171.81.215])
        by smtp.gmail.com with ESMTPSA id m3sm702103edb.7.2021.07.30.06.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 06:35:31 -0700 (PDT)
Date: Fri, 30 Jul 2021 15:35:29 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: hdegoede@redhat.com, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.cz>
Subject: Re: [PATCH] staging: rtl8723bs: remove unused BIT macros definitions
Message-ID: <20210730133528.GE1433@agape.jhs>
References: <20210730132103.4996-1-fabioaiuto83@gmail.com>
 <YQP/dFZJiEcOb3yH@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQP/dFZJiEcOb3yH@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Greg,

On Fri, Jul 30, 2021 at 03:32:36PM +0200, Greg KH wrote:
> On Fri, Jul 30, 2021 at 03:21:03PM +0200, Fabio Aiuto wrote:
> > BIT(x) macro used all over the driver is defined in
> > include/vsdo/bit.h as
> > 
> > - #define BIT(nr)	(UL(1) << (nr))
> > 
> > which is safer than the local BIT macros declared.
> > Local macros shift a signed integer which brings
> > unespected results. For example:
> > 
> > (unsigned long)(1 << 31) => 0xffffffff80000000
> > 
> > shift.c:
> > 
> > int main() {
> >         printf("%lx\n", (unsigned long)(1 << 31));
> >         printf("%lx\n", (unsigned long)(1U << 31));
> >         return 0;
> > }
> > ---
> > 
> > $ ./shift
> > ffffffff80000000
> > 80000000
> > ---
> 
> Don't put "---" in a changelog text, otherwise the signed-off-by will be
> cut off.  Can you resend it with that changed to something else like
> "---------------" or anything else?
> 
> thanks,
> 
> greg k-h

sure I'm about to send a v2,

thank you,

fabio
