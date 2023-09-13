Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB131E526
	for <linux-staging@lists.linux.dev>; Wed, 13 Sep 2023 11:46:54 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c3887039d4so37945405ad.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Sep 2023 04:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694605614; x=1695210414; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t8G7CBFVeKBYWJi3/h4tOeDyucqZ1aEGQkR5n5w67CE=;
        b=DzGfdn+yO23tys3o6+g40o0lRWtS+qNl8yLk30dWYMrFnILTbSPyGt/J/6lor1HTNR
         YVQBWEGH7n28ldDT2dKWBNxc5x3d50L9rWQ+G17+gYGpKRMRDWW4dpW7Bv0IyHZA6uU6
         13w7ew2w1v2KuCTNYeqLTrMPhbpDV+HJHFRV7RnwrRI/h6T74Fuhq+o340WlJvd3TixF
         DIrUWV6D34auAPvyoYGBU9A9TDTNGaGix/SJvinR/gfSlp1zD9UIkQ4GCBwxUMmyuOF3
         SnIAq1t6XqG2OdZSiAQ/PPyDryFz43uA3j0AE+dFa5Es9AC9ued6dxXzeRbB+IPgKYgJ
         slxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694605614; x=1695210414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8G7CBFVeKBYWJi3/h4tOeDyucqZ1aEGQkR5n5w67CE=;
        b=jp9Y3Q8P1xtmBPZxrKNm8LaQJ2l1lWcBk1y/b3SFJtffMCTE3wTgj4rhHdgMRL1HoH
         ceUjad/LNvAHHbKBA4n6+/rkf0WDNIieVwTOQVuqtTtzWrLp7fumpirOyCPi/lM6vxSL
         6dPzSvc6lnLHhi7Luzg1U7hoKXmM06TpQ24JtAb4K0cjU0qTU8Od+W4yfN3f2jgbKwA9
         vs631GZ44UWKdTwzAf3BYVYa+sn0tECb07/HUd/BfJlCQXoiWi/Ygrn9IzNsqe3i7DMX
         TtWofvZ/ZEmZy91GJmfXua+NMmz4SqvmKCxI16IX1LeZrkVOkTwJQU3y6h3rKQahSccL
         0+Nw==
X-Gm-Message-State: AOJu0YxpTPD1vGkQBwMsgA5duHepElHKO8jzBfYI3McT1ignkvjkKXZT
	I/FoTmQDOnSm/kUiXR7B6E0=
X-Google-Smtp-Source: AGHT+IEuFaFLKsJwuEVKSOqqT8tBBTn1CG95mnBnNPn5WZFZi74cXWpTD+xF+pEYnzAuND8luPllBg==
X-Received: by 2002:a17:902:ecc8:b0:1bf:22b7:86d with SMTP id a8-20020a170902ecc800b001bf22b7086dmr3001733plh.3.1694605613617;
        Wed, 13 Sep 2023 04:46:53 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([106.205.101.29])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001b869410ed2sm10220458plj.72.2023.09.13.04.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:46:53 -0700 (PDT)
Date: Wed, 13 Sep 2023 17:16:38 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: vt6655: Type encoding info dropped from
 array name "byVT3253B0_"
Message-ID: <ZQGhHj0q5ISLkfzN@ubuntu.myguest.virtualbox.org>
References: <ZP8Iu+Hh8YD+VhYH@ubuntu.myguest.virtualbox.org>
 <2023091210-wok-laziness-b64e@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023091210-wok-laziness-b64e@gregkh>

On Tue, Sep 12, 2023 at 03:58:32PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Sep 11, 2023 at 06:01:55PM +0530, Pavan Bobba wrote:
> > Array names starting with "byVT3253B0_" updated like below:
> > 
> > a.type encoding info dropped from names
> > b.camelcase names replaced by snakecase
> > 
> > Issue found by checkpatch
> > 
> > Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> > ---
> > 
> >  v1 -> v2: Name of the tool added in the body of explanation,
> >            which found this issue
> > 
> >  v2 -> v3: subject modified to more specific detail
> > 
> >  v3 -> v4: changelog modified as per patch submission guidelines
> > 
> 
> I see 2 v4 patches on the mailing list, sent on different days.  Which
> one is correct?
> 
> I'll drop both and wait for a v5.
> 
> thanks,
> 
> greg k-h

apologies for the confusion greg. second v4 patch i sent since 
in first v4 patch mail , you are not there in mail receipents.

anyway, i will send v5 to avoid confusion

thanks,
pavan
