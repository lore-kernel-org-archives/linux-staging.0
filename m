Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7EC70
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 13:37:17 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id n38so6125855pfv.2
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 06:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QVzrjlrbODT5X6pYvA9IbhF9UE3pTeVxu5GHqVg8Uu8=;
        b=rKtFuIbE2Ox+dAQesBBbA5eLo9GXphDrdon3mFjAiHgmTrBr5MO5lxVM2f2kihlLYW
         pck5pPuT1a4EfEOihCTvGz9p2RnlE8+pTm7GOICIH4PpqapSSdFOtSn4ymn5ujVCAwKo
         kNYGJ4xTqAC40CchG2Iu1X7YcsD5x/B2mVGPQ3CTK15BHNS/Gb63F1sH26sLSIiDXywv
         aHW4wor2koQV+oyYTUQqaXAGLLU6gl1uErjbmyv55jlFsuTbrVTYAipWqwVmCFz6+JgV
         DmUuoS/LlC+FUmPnh8FUSddgKoxWHaiYae5LIxhDDqs6sIAeQ2235qFCG2fr64k65lUs
         QWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QVzrjlrbODT5X6pYvA9IbhF9UE3pTeVxu5GHqVg8Uu8=;
        b=cCsrYriQIaI75hvrjUcjIFhaHKvwwUCYnQhzqQKe4IdLGWgulHkTjWZ2iOxcGoQukW
         yJL/sTSUGnkyFOADAdjiJjA89UEJUmljH5cOY2kJ1umncDVuVFlMqTanHs1jFXC4bvvO
         83wc3CJ1LlfCTpBAW2ORoWPy3x8Z1mq176QcNljFFwOiSm49oj7GuF0Yvqi8eYaw0XWb
         V/nwZtEgJyjIjwSwlyZ+05GEg8DiQrSXGvuoxA4moWoA6bNpIsdgfPiE5pUHAvJTsA3B
         3GinI/pvq6N7vn/1mXxogsCjOSQ4Igzd1fj6wmDSTwBhYoTzNF4TVdfyAai4UWAA0UsT
         +O8A==
X-Gm-Message-State: AOAM533sIkNPUvx4cbQh6QR9+BvzBAbbcYd/nW9V8H/5tdHykYhzD8KH
	6NyzpMGVbKMGmWf03h5TDC0=
X-Google-Smtp-Source: ABdhPJyQQj0wIIEkQVhlqcjEVTN8U33Wck6nBo0R7nSYLbvUrDaRVn7aBtUQ4Fw8yMvWuI139nmd2A==
X-Received: by 2002:aa7:8dd2:0:b029:247:c334:5e6f with SMTP id j18-20020aa78dd20000b0290247c3345e6fmr5776730pfr.57.1618061837387;
        Sat, 10 Apr 2021 06:37:17 -0700 (PDT)
Received: from kali ([106.195.15.71])
        by smtp.gmail.com with ESMTPSA id q1sm5379475pgf.20.2021.04.10.06.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 06:37:17 -0700 (PDT)
Date: Sat, 10 Apr 2021 19:07:08 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v2] staging: rtl8192e: fixed pointer error by adding '*'
Message-ID: <YHGqBLS+IcHdkI6r@kali>
References: <YHGhdtldqAlRsPHT@kali>
 <YHGksKltkkmaUeAk@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHGksKltkkmaUeAk@kroah.com>

On Sat, Apr 10, 2021 at 03:14:24PM +0200, Greg KH wrote:
> On Sat, Apr 10, 2021 at 06:30:38PM +0530, Mitali Borkar wrote:
> > Fixed Comparison to NULL can be written as '!...' by replacing it with
> > simpler form i.e. boolean expression. This makes code more readable
> > alternative.
> > Reported by checkpatch.
> 
> Checkpatch did not report this specific problem, Julia did :)
> 
> And this changelog text does not reflect the commit you made here.
> 
Making the changes now.

> > 
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> 
> We need a "Reported-by:" line here to reflect that someone reported the
> problem as well.
>
I am resending this as patch v3. I have to add reprted by Julia, right?

> Ideally it will have a "Fixes:" tag also, but I can add that if you
> don't know how to do that just yet.
> 
> thanks,
> 
> greg k-h
