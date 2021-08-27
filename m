Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532AF3FC2
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 06:46:49 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id e21so11593381ejz.12
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 23:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=udzHFNPd++YD0eVLDswSdAc73k4r2+aTjGa5bpUcLHY=;
        b=OKk3RmDtR1XuUdmnk9L+oWVj0snzZyozr8kxLQUb2TM8pLa32ggU/Rl9dUAHarIlau
         OjdTpBgAru88ElxFS9hRdjGuKbqLG0NFJ5FXouaMYS+suhEwElTRAFRWsgpYJCTRgbWu
         7+HaxtjVYlLS3bODm7oPAs/+kvgd04A994M7UZjlrHjCBWGn6MmBb6UdRDng71WWNGCr
         LT1mKenqbWstNC0upgqiTByuX9HQyRAZF/U/ZFTVhNOB9YH1ByWL4mXG2w/bFoxmROvO
         FFjalVQilk2U1F5upHSC1Q5T45CUsS4GE/ROw9FVMI/j765AupUQ2au5bx8jwi3XdEE/
         AKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=udzHFNPd++YD0eVLDswSdAc73k4r2+aTjGa5bpUcLHY=;
        b=gv/kVNdn3nC1xogCcZyB596JCzrNnsRbh+UiUuTWW9rS2N40RJyUJ3NZMo0TvJCbOC
         R4tUG6DYKdrnqFU3eykASKFw2LYNL49oXpJaZewzEzdnBbaxb/cMGGIMpl7/GQCDMHuG
         AFlLwxZTZOT1iFdvg0TXtPwAdseXNSnLniKGWKV3X+4sM1GbljexHH9V99o0jvRSIgmW
         /UVYOPmZ1+CU8NhY3gCMOjxXXMGIhCmXVB1WMe/IXK1XzcWJ9wQzSfNFJe+M+ZIk5zW8
         bfTfrm5K7YIlIpFlriRNLnurGfy2MoCZlOHTr8r+luvhwxJ+h9tNIw7VymIJNHNUpvc1
         3gRQ==
X-Gm-Message-State: AOAM533sYgkjyfb+GMRoZljAC3e27th8lalVm7NvEla0OOWza4iG7D1o
	zp4Nqp+bNzbbyG+wUaW6suI=
X-Google-Smtp-Source: ABdhPJxZTriywfP9b2pKZqjIM3uJmmIr8wC7uaiJFoG1V2pr7GF/m615HWUAUveP6D1x/sGGznbUJw==
X-Received: by 2002:a17:906:584b:: with SMTP id h11mr8497974ejs.209.1630046807722;
        Thu, 26 Aug 2021 23:46:47 -0700 (PDT)
Received: from agape.jhs ([5.171.72.0])
        by smtp.gmail.com with ESMTPSA id l19sm2802849edb.86.2021.08.26.23.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 23:46:47 -0700 (PDT)
Date: Fri, 27 Aug 2021 08:46:44 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wenlong Zhang <yixiaonn@gmail.com>, gregkh@linuxfoundation.org,
	ross.schm.dev@gmail.com, marcocesati@gmail.com, insafonov@gmail.com,
	cyruscyliu@gmail.com, yajin@vm-kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: prevent ->ssid overflow in
 rtw_wx_set_scan()
Message-ID: <20210827064644.GA1408@agape.jhs>
References: <20210826154622.55361-1-yixiaonn@gmail.com>
 <20210826172618.GB1423@agape.jhs>
 <20210826181648.GC1931@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826181648.GC1931@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Aug 26, 2021 at 09:16:48PM +0300, Dan Carpenter wrote:
> On Thu, Aug 26, 2021 at 07:26:19PM +0200, Fabio Aiuto wrote:
> > today the patch which removes wext handlers has been accepted
> > (commit 174ac41a7aafb31041cba3fe54ccd89b9daeef5d)
> > in staging-testing so maybe rtw_wx_set_scan is going to disappear.
> > 
> 
> From a process perspective, in staging we don't track things that might
> happen in the future.  We look at each patch in the order that they
> arrive and either apply them or reject them.

Wenlong's patch will be applied on top of staging-testing first,
and it won't apply due to wext-removal patch.

> 
> And from a practical perspective this patch might be something that
> people want to backport so it would be nice to apply it.
> 
> regards,
> dan carpenter

thank you,

fabio
