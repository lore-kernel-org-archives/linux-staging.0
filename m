Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5D22FAD
	for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 09:36:24 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id ot16so10276051pjb.3
        for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 02:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Jw5wI2CtBuQpPL0rk8AvkdZs5+SsBTEiYW7PK+KIv7M=;
        b=JJAVaVV8sFuPv+bfBqkpTzrdKfnmhlX4xlqfSprwIPTdCF9PSs12raKxz6tx/o0OeH
         TFwqWcz4DFGMX/hm2elK6WrnGGAtlVDlr+3vyZsVzi/fc0oCDvA8AklA1mv47peVSLBj
         aUJ4L01UOkh7oZWEg8+GkIriKy/i+X1h66WmxH7upPAUUAGx5SPsVnTaa0i5bIkoAh+T
         hn2BYec75/brlLZZKnspO4V71b9sAcRvVATtrFLtnIgL4PgkUYkUBgxnOVZ0HULG0X79
         bzY91oB3fq+Im7LCoK9t8P449h7pitZ01WI4ydxllHLtJbgyJGWCWGoFzxkXLU/raKOs
         xC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jw5wI2CtBuQpPL0rk8AvkdZs5+SsBTEiYW7PK+KIv7M=;
        b=gDnbv8k0axJpA6SGmeyVQ4oUS9jHUe4nVat+nk6EOGmSi7eRHVID2QN9PtYu9nARvJ
         zdZnCHcksuH0OsAIxl/k7lbjOOMhuwi0zxHgknfMDzQ8vAv+hMTLGqVu2WFLpmoWb1YT
         zNy1JE4e6TnQ4ghYE7ZQj98HM1Ql5ose6mLhmjdAfXffEZ73s8heK34gsVazYRPOkum0
         6GWX/HpLDzJ6qe6KKxcQOqt0tVwBv3FIE0/7Jf6AMgfGdg9vCdi9m+vZq23jMrRbPi20
         c7nkyIPVMHiMTxWBhJUUuOy6AyVDJnqPjW/IeFhi4H2OAr+BTiMAYcSN5Kl5JjmtRcOo
         xP7Q==
X-Gm-Message-State: AOAM530+cPe5WNvlP/5PSrZTLK8kQGkBGx8kYxqYkKDhYd4ZRtXk776H
	I+Vb/xMqQEj7B9VzHbaohmw=
X-Google-Smtp-Source: ABdhPJzakmGjbjjwFSgaxMnbZdRP5Rp19c4vvN3SrrbpPi+bM/ZvXWDlKWl2ttlGTrDPIxpvztz8lQ==
X-Received: by 2002:a17:90a:7306:: with SMTP id m6mr15379236pjk.217.1621676183955;
        Sat, 22 May 2021 02:36:23 -0700 (PDT)
Received: from fedora ([2405:201:6000:a04d:2131:362f:d566:c9d5])
        by smtp.gmail.com with ESMTPSA id g13sm6541406pfi.18.2021.05.22.02.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 02:36:23 -0700 (PDT)
Date: Sat, 22 May 2021 15:06:18 +0530
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Resend] [PATCH 1/2] [RFC] staging: rtl8723bs: refactor to
 reduce indents
Message-ID: <YKjQkrb8Haky5UXk@fedora>
References: <20210522092024.65018-1-chouhan.shreyansh630@gmail.com>
 <20210522092024.65018-2-chouhan.shreyansh630@gmail.com>
 <YKjOWtwarhM99dXc@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKjOWtwarhM99dXc@kroah.com>

On Sat, May 22, 2021 at 11:26:50AM +0200, Greg KH wrote:
> On Sat, May 22, 2021 at 02:50:23PM +0530, Shreyansh Chouhan wrote:
> > Reduce the number of indents in rtw_wlan_util.c file by refactoring the
> > code.
> > 
> > Moved the part of code that rearranged ac paramaters in the function
> > WMMOnAssocResp to a separate function named sort_wmm_ac_params. It takes
> > both the array of ac params and their indexes as arguments and sorts them.
> > Has return type void.
> > 
> > Moved the part of code that checked for the realtek vendor in the
> > function check_assoc_AP to a separate function named
> > get_realtek_assoc_AP_vender. It takes a pointer to struct
> > ndis_80211_var_ie as an argument and returns a u32 realtek vendor.
> > 
> > Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
> > ---
> >  .../staging/rtl8723bs/core/rtw_wlan_util.c    | 108 +++++++++---------
> >  1 file changed, 56 insertions(+), 52 deletions(-)
> 
> Why is [RFC] in the subject line?  Do you not want these merged?
> 

No, since I wanted to ask about the names of these functions I sent
these patches as RFC. If these names are fine, I'll send another patch
series with a couple of patches besides these that fix other much simpler
coding style issues in the same file.

> confused,
> 

I hope this clears the confusion caused.

> greg k-h

thanks,
--Shreyansh
