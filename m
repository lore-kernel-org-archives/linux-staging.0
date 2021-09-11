Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DC83FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 10:53:13 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id q11so6451381wrr.9
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 03:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O9g1h57WR+cWFjB9mDMaUTM0AGZhj7ugykY0nD7rqH0=;
        b=Pc2u8Ke3uj6l97Zkw5TCF+tmqFtPQUAjBLYANW4h4I3BlJ/vO+zMrXD4Kh69hmIKOP
         MOrHSgc5czssNqaUjXCi05fMVQ1OYeumBJra/FGEuxP9N6advWcxRwArKI16IOLwJ0vs
         evsrqJl5ouM9DPhAVmcA44xLAcRqXzmBcmPSV5nlIXpt15NKtBCg9VNW2sNPVRbROI39
         3tl8g8s95lqgnyEEUQ7+0scZsnScP939mLqgbbb4MPo42vQjGmEPDrTPV7Ad8Rvvlxx2
         yzPP8ODaf/CUbv2EBKRW2iEJImrF06LSPO3Sbi626mnogotnDu+b92lCelftx0FrhJ5n
         AZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O9g1h57WR+cWFjB9mDMaUTM0AGZhj7ugykY0nD7rqH0=;
        b=hdpv/iplQs82IM73UXchgb6j/MSuRD5dI6MieLBvlRyyRYNvlvWpNqIz/0uZCdyEoc
         MlnmhkPCeKonJBy7tE3bjEKhBSROShooHFAhUPiBkNyiIwBdBR4Ka/47q4o8JP/SQorx
         1YsuDRKQzbw0oYdJp4VMwy/VkyJqa5n05CyMh0oZ70FWxZAIzeoeToRoWhRtnCNjjXfo
         G0CD7YJ6OQZV4NpgOctQBipUNruRKOqJbM+S/y31V/dGhGWl/SWoNe30o8TMwyCl9mr8
         wNQ9X348hX4JAkPL6nij/p4pYTIZ4Uz8gMiMnhglA0sKtjk5Hg129JZI4L+f2NZxRTPY
         ujRA==
X-Gm-Message-State: AOAM530UjdJUfaHPIbSx48x//nkaGLNGdP46DOhehug2p6Xd4WJP8Tef
	wrtwCv007ckoue6NPod18Qs=
X-Google-Smtp-Source: ABdhPJyQW/a10cROwyhkoxZfR6fReG9TtRJaD7L1bcs/diDzAqFT9ef0nfBESA9Gq6eRtGoihH4mDg==
X-Received: by 2002:adf:9e4d:: with SMTP id v13mr2606136wre.26.1631357591595;
        Sat, 11 Sep 2021 03:53:11 -0700 (PDT)
Received: from agape.jhs ([5.171.81.52])
        by smtp.gmail.com with ESMTPSA id j17sm1326397wrh.67.2021.09.11.03.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 03:53:11 -0700 (PDT)
Date: Sat, 11 Sep 2021 12:53:08 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove possible deadlock when
 disconnect
Message-ID: <20210911105307.GB1407@agape.jhs>
References: <20210902093559.9779-1-fabioaiuto83@gmail.com>
 <c730848c-3c8d-1e49-fa74-b956400a5d3d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c730848c-3c8d-1e49-fa74-b956400a5d3d@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Hans,

On Fri, Sep 10, 2021 at 11:06:58PM +0200, Hans de Goede wrote:
> Hi,

<snip>

> 
> Thank you for your work on this. Overall this looks good.
> 
> I have one remark, since now you are relying on the
> sta->sleep_q.lock to protect the sleep_q data, you also
> need to update the sleep_q accesses in rtw_free_stainfo()
> specifically you need to add a spin_{lock,unlock}_bh(psta->sleep_q.lock)
> around these lines:
> 
> 
>         rtw_free_xmitframe_queue(pxmitpriv, &psta->sleep_q);
>         psta->sleepq_len = 0;
> 
> 
> Note there also is a:
> 
>         spin_lock_bh(&pxmitpriv->lock);
> 
> Just above this which needs to be pushed down to below the
> block which takes the psta->sleep_q.lock, so that the entire
> thing ends up looking like this:
> 
> 	spin_lock_bh(&psta->sleep_q.lock);
>         rtw_free_xmitframe_queue(pxmitpriv, &psta->sleep_q);
>         psta->sleepq_len = 0;
> 	spin_unlock_bh(&psta->sleep_q.lock);
> 
>         spin_lock_bh(&pxmitpriv->lock);
> 
> Other then that this patch looks good, thanks.
> 
> Regards,
> 
> Hans
> 

good catch, thanks a lot for review.

Greg, I see that this one is not in staging-next,
would you drop it so I can send a new one?
Or shall I send a Fixes: patch?

thank you all,

fabio
