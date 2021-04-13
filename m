Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD296D0D
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 10:45:10 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id q10so11621439pgj.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 03:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NJEs0OVIbEPu0niN8aqEV6/oMkDrOYYQ8S6g+FDY+1A=;
        b=bt+SWsRREEyZ8aGF2En2o3+UBIqn/QCQ9DJpF7VyNlNflyKIJlByhGVzBdU7aTFr58
         AD1b9sH/dahahuGyfLCJOT9VYjTjp+VZFv2Y11pMK1Zza7Pi19Pa6kHM3GSyc8i3f+um
         UIsDTBPoTll6H+73jlKzEulll3kD+ywexevz8FFliFFFKSxpMB+84PxqRi6GIPICsuXc
         rPIwHwS0xtdmOE7WDvvENu/nF0OMvVqvdeLmJbSojPjj3S6S5nQLocAVgtcSnH2WwOOj
         tSpcz6jOh1Y2urrtg5NI8Ajl74RkQkRWfMh54BVhdQMP80+R7cI5Of2VFRGHfFS0ASuA
         /H1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NJEs0OVIbEPu0niN8aqEV6/oMkDrOYYQ8S6g+FDY+1A=;
        b=XC3I/5eWrzDlRaWqbr4dqvNxB6MqODB2nnmXVMG1FT6Y7N5PdL+o86dsDyq/BaVTxk
         KHJ2/iXFBmUsIxzS1pNA9d+PH7wmC9cU4li7GSiQUqmFv15mCyPT/n+Ghcsz5U4b7pA6
         9ghXnMO1NnsqzOXY9SNQaIQIv0Unv70e8A4YArX9DeAaNXeD5bsDOviSyslYT3zEHOb7
         wx3KNFZQuLZGU3WIl0CEyoBuUU3TPywYPu/zYcXJkseeef4wEZ8R2eT6pgeOzVBbzZ7R
         L6vDLkeIq7xM/XvVXOULKjBlxAF4JlkgSYEdReSKVYvsuWMLO4hH+Tl95/ap0pqDW+xG
         uofQ==
X-Gm-Message-State: AOAM532PWH0Uaew7Xq2YscLd0Fh6YY0Fke6Awn9qwwcJv39za1/N/7FL
	K2EXEveBcUcJCYcSJ7edgSr8gyuywXnFZw==
X-Google-Smtp-Source: ABdhPJzkmnq2CdOTUZB7OPf0KEEyoGAWhwp4xVg0M2I3EF6YMyaSPr91k6VCLi9FUtkx27P1iat/Xw==
X-Received: by 2002:a63:f95a:: with SMTP id q26mr31695929pgk.25.1618310709544;
        Tue, 13 Apr 2021 03:45:09 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id f21sm1957426pjj.52.2021.04.13.03.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 03:45:09 -0700 (PDT)
Date: Tue, 13 Apr 2021 16:15:03 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v5 0/3] staging: rtl8192e: Cleanup patchset for style
 issues in rtl819x_HTProc.c
Message-ID: <YHV2LyXrJjVnMsyT@kali>
References: <cover.1618283232.git.mitaliborkar810@gmail.com>
 <YHVN0JRWqNDJYF3T@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHVN0JRWqNDJYF3T@kroah.com>

On Tue, Apr 13, 2021 at 09:52:48AM +0200, Greg KH wrote:
> On Tue, Apr 13, 2021 at 08:55:03AM +0530, Mitali Borkar wrote:
> > Changes from v4:-
> > [PATCH v4 1/3]:- No changes.
> > [PATCH v4 2/3]:- No changes.
> > [PATCH V4 3/3]:- Removed casts and parentheses.
> 
> This series does not apply cleanly, please rebase and resend.
>
Resend as v6? Does not apply cleanly as in? Were mails not threaded
properly?

> thanks,
> 
> greg k-h
