Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD3A6D0E
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 17:42:56 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id k30-20020a05600c1c9eb02901d4d33c5ca0so913622wms.3
        for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 10:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YMKlpyW2/43uGs0P+FeoGQBHis6+kuFUJ6JvmkPAJ3o=;
        b=mhbhFBVtJK8c62GyU0FDJF3kT0tkdzRiSz4OQc3ivIJwjNs1dTjdwJY5SfrglAeK/3
         IFI/bGZyYtHNgyTOlSJbazLIh57Q+o++NUgDya2rfNh5awdjxOfruXfTVJRLP57wLRVE
         FvaeW9fApr706cuJgHeRzJ7ulLFWwRLo8/IEOszOWLqDXjyDoS/H9YLytGseNX8HmauK
         7tDB4ptEHvD9gh9rvcZ0ljIEFAWfQtSJgKf77CWFVDC2uQmSI3Y5OUz477Awn5g69Shh
         ovotEqtJd+sFJ6N1Fp+5ics2evGvuqb5kYfVCtnFxPPgOqDSPXVchj2PgDVKWl1IIRI0
         2TSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YMKlpyW2/43uGs0P+FeoGQBHis6+kuFUJ6JvmkPAJ3o=;
        b=lgm6twk9Db9Lo1CaCHXLi8xtssaZj6HW9NzjmrtgN4M6kJZSNGgIA5/LkIi49hLa0y
         o0iDtNDew34wZhREq3Gn1b1kmqzWIfRVau+TC4V0C+ALohvS9GyMAW5pgmOVKb3DZDgZ
         Kh9M0NN+1OHftxay2LguebvCAYmZoP45yp536IjSSol8iV8ASpYEGsYDttEYqBUPiyi7
         3Oh1naNR80FKgZ6nTxAmEj7oOUwpIB7lU3YXWlyCgomMOQIXqx2nL4nSh4GsHBJJaj6k
         8Q97w8w5XLDQcD837EjTMeecgsF1vuWfEDzaUwpCP91v0jwjj50UsPgJA3ZHC+A59cIL
         MEeQ==
X-Gm-Message-State: AOAM532SS2R8bDp5mzQo5oX2wOUJ6xDRG+WQ/W/i6MBCPTNMg4JpXY/J
	2+K3NZnGI0/sQ5iiyIftUX5H3Q==
X-Google-Smtp-Source: ABdhPJxlx4jibs6+pOrr95H3d7IW3Zr4NwfvBbIbbQ1V7v+31jKYDz7J2v5RqJAfYxc+ZEb4XQAe6A==
X-Received: by 2002:a1c:9d55:: with SMTP id g82mr11911094wme.152.1624642975305;
        Fri, 25 Jun 2021 10:42:55 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id c8sm6449973wri.91.2021.06.25.10.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 10:42:54 -0700 (PDT)
Date: Fri, 25 Jun 2021 18:42:52 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/23] staging: rtl8188eu: remove include/rtw_debug.h
Message-ID: <YNYVnHREicwAL+Jf@equinox>
References: <20210625000756.6313-1-phil@philpotter.co.uk>
 <20210625124356.GJ2040@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625124356.GJ2040@kadam>

On Fri, Jun 25, 2021 at 03:43:56PM +0300, Dan Carpenter wrote:
> Looks good.
> 
> I feel like the kbuild warnings could be addressed in later patches.
> 
> It seems as if some of the error handling in this driver is "pretend to
> print an error message (but it's actually dead code)".  Which is
> probably not the correct way to handle errors...  :/  But that's not
> something introduced by this patch.
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> regards,
> dan carpenter
>

Dear Dan,

Thank you for your feedback, and have a great weekend.

Regards,
Phil
