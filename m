Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33B371
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 16:29:29 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id l7so35398701edb.1
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 09:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EjCa/Y8fPjm4VNptwpoJ6doa9lNqw0SSL7+evAimqKA=;
        b=uq1b0TRBSGV5y3N9/LBzSnoEsVO9A4VNXUPGgt2SF2QyjAzBGMVXPf+EZgdA3r4r84
         30BwxNO+4v8pi6gCotag91xtXPTy+Rng3OTGiuadS8F1nZkKXDEGMZ1aPsoBrFUmuv6x
         kcIUjyF6k2z8zaNiQmtKhnwFcA8tsXYs1gDLZlnXDysMxSHFkJe+1jw8MVkzug7c7Vf+
         qSC1cgDMqP/PpkaVnfh3qG/aK3wYMkYtSBWS+RBf/bRQOSWyKfbtDjmF9c7xa64gkkUu
         cKCJlcveSvHvwX+VNzJYcuFC0T3i8nao1kxsa1I0hCZvKAARxnwNvrV5ueylWnp6AaV1
         kuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EjCa/Y8fPjm4VNptwpoJ6doa9lNqw0SSL7+evAimqKA=;
        b=k0esscXZ8ghht0bgnGao/iuNY2YMxgNA/pVy5A+cA9iMSCkegC6Ca6n4vVo2u1xBg4
         AdGpIBOQ3QGEj5uPopCbQI+F3SCvLVkIsklcq0HHuso9cy8Z0Rk8VaP/iHU4s2aSgzI9
         0TAJuPwPDr/8KenQ09YrCMLFqWgSiwQPhdSTP3+9MN4TtdvtqYXO48532Ay3xDVy4KNh
         Fzpq9gQs99NG9WqpKLZD3qaAE4tr0u2Mat81uSJh81ll7imlQVhmVHqybEeBmQlSV5hi
         i7x7P5Ts34Y9bfFN/NNfXo1WAe/+qvRFR78Gce6BnO9uV50Gor8MGOBRrzvgk471oiQ+
         EJwA==
X-Gm-Message-State: AOAM531jsrOiXSuFqfaaF3Car+vo+f5IcqUgg9ZcTuRSsMZhsLrnOjNo
	ZWwiNvP27QrkSY5vjLOXSr4=
X-Google-Smtp-Source: ABdhPJzJQzM7qSR6YpKntCTFQHiOYUxGKL8R0Pl2TzZ99ffjN6gbUsMr1X0dNhgI7+WBTCHsk4wKMQ==
X-Received: by 2002:a05:6402:176f:: with SMTP id da15mr12000926edb.380.1621009768472;
        Fri, 14 May 2021 09:29:28 -0700 (PDT)
Received: from agape.jhs ([5.171.72.183])
        by smtp.gmail.com with ESMTPSA id p25sm3859345eja.35.2021.05.14.09.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 09:29:28 -0700 (PDT)
Date: Fri, 14 May 2021 18:29:25 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: hdegoede@redhat.com, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: staging: rtl8723bs: questions on TODO list
Message-ID: <20210514162925.GA1568@agape.jhs>
References: <20210514083856.GA13800@agape.jhs>
 <YJ44mtOUVZwhxW4m@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJ44mtOUVZwhxW4m@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, May 14, 2021 at 10:45:14AM +0200, Greg KH wrote:
> On Fri, May 14, 2021 at 10:38:57AM +0200, Fabio Aiuto wrote:
> > Hello all,
> > 
> > I'd like to have some clarifications about rtl8723bs driver.
> > In order to make this driver ready for moving out of staging
> > I would like to know:
> > 
> > - find and remove remaining code valid only for 5 GHz. Most of the obvious
> >   ones have been removed, but things like channel > 14 still exist.
> > 
> > is it possible to remove all 5g code, even the one related to power
> > regulation when on band 5g? As far as I know about this card is that
> > it doesn't support 5g, so may I just delete all 5g code or there are some
> > constraints I'd take care of?
> > 
> > - find and remove any code for other chips that is left over
> > 
> > Ok this seems clear, are there some suggestion to do it safely?
> > 
> > - convert any remaining unusual variable types
> > 
> > Ok (but feel free to suggest anything)
> > 
> > - find codes that can use %pM and %Nph formatting
> > 
> > Ok (but feel free to suggest anything)
> > 
> > - checkpatch.pl fixes - most of the remaining ones are lines too long. Many
> >   of them will require refactoring
> > 
> > Ok
> > 
> > - merge Realtek's bugfixes and new features into the driver
> > 
> > Please, can you explain what one could do that?
> > 
> > - switch to use LIB80211
> > - switch to use MAC80211
> > 
> > I think I need a few details for these last points as well.
> > 
> > Do you think that one will need real hardware to complete
> > these tasks? I don't have rtl8723bs card at the moment, so
> > I think I will focus on those TODO activities which
> > don't need it.
> 
> I recommend getting one of these devices to do the more complex tasks as
> described above.  Otherwise it's going to be hard to verify that your
> changes are valid.
> 
> thanks,
> 
> greg k-h

got it,

thank you,

fabio
