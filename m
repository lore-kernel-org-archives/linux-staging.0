Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAEC71
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 12:59:48 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id a4so11924529wrr.2
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 05:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=r56wwvOkk5KtOS6qDl36Vf4/PDgdK1xTKxZ+baf0zEA=;
        b=G+bLWWrL/DSdYUiU6vaq6hNPMh7IYOYCWfeiOw3c26r+Awf+pi+7MFysvmIJ5er0Mc
         Kar+KFiFU5PwVOvFhSbNQRlLRHehj0EAOOyYimXJaTSTfgc3OhYmi3BP5OiQatajElTr
         OswiDICzt6HD3BE27W6mdi8LFdol5XDPJsm1KRvv/DtRw0UiM/kuTn4DZwmOPoQVMenc
         KuImHTY9cYhIMg6/MFBhwmFfZ587jeM/F+J6iw2k9mYPdQV0vl255BVg797BkUKn/cfu
         yGsRRwhZSUAOAIsut3Ye1KIJtP6yoJ6jEbZTGDa4wmZkNz47JH3LdA0YTHEc9J70Uq18
         4F8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r56wwvOkk5KtOS6qDl36Vf4/PDgdK1xTKxZ+baf0zEA=;
        b=hLP7iEwTeca/6u2yf5EaA9kOKjIGMDQk+mQd4VEmdYXcvICVCc3tLYchWUFKJAtHqA
         B+4/F9D/HotDK71qCk2l+VRbiJf+nVfEPKD0qTvpFLv1y7KGi2x5fP8J9uRapAMoanzG
         RQ5tFM6ehZ9JxETmPkw1NwBWzSbjRP6JB+OxB7JWdA1/sOQEkb4/zv6do2/qrlusRvbr
         naLLX8zPepeUp/5TSrdQdT03gX1vp1moU6NDrS8mMt69x70uGdEh+S145WVZJ3TrTCRP
         +Pa7FsCl7Z85+6xRS2w+ZJi78GLbWBLj15XGn5alAz9Nx06R+jpF9SLdKedzWkgcmLNN
         zT5A==
X-Gm-Message-State: AOAM532CztRbIkBc3GylLDDbtDTWChHqHvFKlGy67o8u7F+HnStqY5tF
	5uUWiI/ccju8Z/ph9FDgmWU=
X-Google-Smtp-Source: ABdhPJwW/yE97ERQ1dJIxtUww7DExYQG/2FNJPnt+FtC/WHrX4W666jEeDMTzSjhyzepvVCCZkep+w==
X-Received: by 2002:a5d:6302:: with SMTP id i2mr19205592wru.237.1620478787287;
        Sat, 08 May 2021 05:59:47 -0700 (PDT)
Received: from agape.jhs ([5.171.72.44])
        by smtp.gmail.com with ESMTPSA id s5sm11324774wmh.37.2021.05.08.05.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 05:59:47 -0700 (PDT)
Date: Sat, 8 May 2021 14:59:42 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] staging: media: atomisp: remove useless returns
Message-ID: <20210508125942.GB1403@agape.jhs>
References: <cover.1620475909.git.paskripkin@gmail.com>
 <f5b8abd8a92fcdd9b0ec49902d4363bc35c86218.1620475909.git.paskripkin@gmail.com>
 <20210508124334.GA1403@agape.jhs>
 <20210508124841.GM1955@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508124841.GM1955@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, May 08, 2021 at 03:48:41PM +0300, Dan Carpenter wrote:
> On Sat, May 08, 2021 at 02:43:35PM +0200, Fabio Aiuto wrote:
> > Hi Pavel,
> > 
> > On Sat, May 08, 2021 at 03:21:52PM +0300, Pavel Skripkin wrote:
> > > Breaks are not useful at the end of void function,
> > > they can simply be removed.
> > 
> > this commit description is not really describing the changes that
> > have been made
> > 
> 
> Pavel clearly intended to say "Returns" instead of "Breaks".  But when
> you're complaining about commit messages please write a better one so
> the people can cut and paste it.
> 
> regards,
> dan carpenter
> 

got it, thank you Dan, and sorry Pavel

fabio
