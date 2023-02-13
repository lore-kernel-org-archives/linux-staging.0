Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3439A1C26
	for <linux-staging@lists.linux.dev>; Mon, 13 Feb 2023 05:27:43 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id m20-20020a05600c3b1400b003e1e754657aso1978841wms.2
        for <linux-staging@lists.linux.dev>; Sun, 12 Feb 2023 21:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d0i8yyIm+gGF9ZBg2Jv4kyt1WO1dq4pAI/4blUIxBss=;
        b=FwrbHQrd1rLSIbDm6SzojQjzwesCLRr61Pm5udUaORLjg6Oa4zW5UDChv0XHXhp2QN
         KWgDvHbORXtH90Ot9w7C1DY0827qQxUfiE3lvEn1MLP5f2/zz4+gHiS1aFaVozW/OOOd
         S83r+Dz7IMyHbCyfa2bJ7xIWq2cXizWEoPSH4EuKT81hBobeTZcKQew5J8S2BwSSCSCH
         Y1C5XQfymXwu2Z3wf2EZ7JakkH6mpm6mIh9CwB8LhN5IJ4NgNbH0Ma8tWt4RjTX5dsUV
         FNA14mZW5+YI3ynIAfGCz8hTnvryEKigZdXhuUIwZWIYI9mEzlfTpxytUIOqzoJzD+dq
         SHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0i8yyIm+gGF9ZBg2Jv4kyt1WO1dq4pAI/4blUIxBss=;
        b=SHpd2M9iO854jSnVi3CL1p2frGKlNeuWDJD/96joCS2WX8QjjcxSTLGBiNtiK0YOgs
         8rOdvj+ib+4NzWGvscpvH/hh3Etu1VfKQQv4UVr1X7P1/JrvLLS4ggic34eiDbi5uhgS
         qqwxFBif2dEfE4sFGjQP4cdsA5AXMak0T1dKm+s1Cmqfo0XuEACQJZBJ2eGIswc13OMm
         RzMZuaVPGAgAOGOCglmzf+oB7n1DxUEdoIjKykQP/1ekenu6Uc+ar2AMNdS+KsYY+IIe
         DToxjsswziqDtRYeTTbXo1Xwy0+BQUZH8F6ow+mfNi9pLVwSt8aPIWE9MYKEHe0VjMVY
         c2MA==
X-Gm-Message-State: AO0yUKUnK5c4mMzw9YjWDUi6zYT7IMHqYOh51hcj97gRcW/nKRncEdTW
	FyHKfD5uq3rtN1/8GJ7G9Co=
X-Google-Smtp-Source: AK7set+B6jDm2d1ZqDtLGONP9jZueVno76liDBoh/Hm6c2bxVtjLXpZIiQHTXG9nMYbtx1h6KC6yYQ==
X-Received: by 2002:a05:600c:a295:b0:3dd:1bcc:eb17 with SMTP id hu21-20020a05600ca29500b003dd1bcceb17mr17970915wmb.28.1676266061450;
        Sun, 12 Feb 2023 21:27:41 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n22-20020a05600c4f9600b003dcc82ce53fsm13960099wmq.38.2023.02.12.21.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 21:27:40 -0800 (PST)
Date: Mon, 13 Feb 2023 08:27:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "staging: r8188eu: simplify rtw_get_ff_hwaddr"
Message-ID: <Y+nKSc6fPf4E1Y2S@kadam>
References: <20230211183205.426820-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230211183205.426820-1-martin@kaiser.cx>

On Sat, Feb 11, 2023 at 07:32:05PM +0100, Martin Kaiser wrote:
> This reverts commit fd48124e09825797bdc8ff0120f2401030c618ee.
> 
> The cleanup in this commit removes the qsel to addr mappings in
> rtw_get_ff_hwaddr. The underlying assumption is that rtw_write_port
> uses its addr parameter only for the high_queue check.
> 
> This is obviously incorrect as rtw_write_port calls
> ffaddr2pipehdl(pdvobj, addr);
> where addr is mapped to a usb bulk endpoint.
> 
> Unfortunately, testing did not show any problems. The Edimax V2 on which I
> tested has two bulk out endpoints. I guess that with the incorrect patch,
> addr could only be 0 (no high queue) or 6 (high queue), both of which were
> mapped to the first bulk out endpoint. Data transfers did still work...
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> 
> Hello Greg,
> 
> sorry for introducing a regression in commit fd48124e0982 ("staging:
> r8188eu: simplify rtw_get_ff_hwaddr").
> 
> Could you take this revert before the 6.3 pull request?
> 
> Thanks,
> Martin
> 

I feel like the ancient `git revert` script is not at all in line with
current standards and sets people up for failure.  This one at least
has a commit message.  But
1) The subject doesn't have a correct patch prefix.
2) "commit fd48124e09825797bdc8ff0120f2401030c618ee" is not human
   readable or how we describe commits these days with a 12 char hash.
3) There is no fixes tag.

regards,
dan carpenter


