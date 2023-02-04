Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E121B107A5
	for <linux-staging@lists.linux.dev>; Sat,  4 Feb 2023 23:46:29 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id gr7so24902846ejb.5
        for <linux-staging@lists.linux.dev>; Sat, 04 Feb 2023 15:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SU4sr6Rv4JHucUmKgKWNj4LgU27LyAb+SvnHwp1wjd4=;
        b=V5kpmwW+rSp1Sjx5X9cmrwhFbSO45xrFyDqi5LgSXI+RAC+0JJ2Sg1u180Nx+lslcE
         br9tsNInhbPx8HjYjKWw+cYoAIAKgDGFQU3sGlSqcyCVi00OF61/f+vwTc9afcWOM08U
         N7V/rHRH06P23VMNsJN3Ezjjf2UhH2ZMMJKwWDrqJf+o3o8DULRKOP9WYiCI69Btg1Mu
         Mf12965sbE9rJY2PcH4JzW97OkYHH1bnvAYUQROCB5lXKwgx0BkwvgRgmL3XgA/bUiDO
         5wqRVqHigILDdsPQi1v0Zw1vI1rqAO9M5+x2whXJjtadJv+Mt6dQRWD/NtLIGiM782Yy
         l0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SU4sr6Rv4JHucUmKgKWNj4LgU27LyAb+SvnHwp1wjd4=;
        b=ayQ/vHesOIwbpzOrAjYLELptt7bYDnJ6/B3XTG8yABEHN1mVA8zEmZPm6pHOpMyknK
         4fi1wu2rz9FKS5RIely11wsqDr49tyNDpJZv/tHpR8zfULFNYdr4WSlRlGtVpTX0er4L
         lFotvuUDiIoeEypQRApeL18hEXsYSbfoGnzu1oeWq4sSxJ17FiOZ6f2xjkDAfMkhE9VZ
         HeUsvM5UXbX8SCeae2cxEac6+Tl6fMUyjWG0HR8vezuRxbPUw6Gj9PSBijbclC6CZQF/
         qWHy+nHVIZpvrXFcTwkH8EiWS5gXYE2njkhJPwLw32cNn5FS3AyfadSA5ePGvQCsecyV
         cvMg==
X-Gm-Message-State: AO0yUKXPIzaR373TNJNTXsuMZjIsVDG0V2NR9hYIkHW4s8aMl6jKSi/Y
	PjHiHat9xfTXt1Rb549dZak=
X-Google-Smtp-Source: AK7set/mu5BHwC+20dHoMIeyFfe1BxAb06FRLKjRkUAs8EQ7fr2uhQO6lLYWg7qn8mkJBuP7S2kHCQ==
X-Received: by 2002:a17:907:72c1:b0:871:178d:fc1e with SMTP id du1-20020a17090772c100b00871178dfc1emr18460669ejc.77.1675554388139;
        Sat, 04 Feb 2023 15:46:28 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id me17-20020a170906aed100b0083f91a32131sm3414516ejb.0.2023.02.04.15.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 15:46:27 -0800 (PST)
Date: Sun, 5 Feb 2023 00:46:25 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Regarding checkpatch camelcase issues
Message-ID: <Y97uUeB6OfO469SY@combine-ThinkPad-S1-Yoga>
References: <Y93eQqaYdL146Z65@combine-ThinkPad-S1-Yoga>
 <Y94L+WNGGfvrg6Mg@debian.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y94L+WNGGfvrg6Mg@debian.me>

On Sat, Feb 04, 2023 at 02:40:41PM +0700, Bagas Sanjaya wrote:
> On Sat, Feb 04, 2023 at 05:25:38AM +0100, Guru Mehar Rachaputi wrote:
> > Thanks for your support.
> > 
> > I wanted to confirm if each checkpatch encounter for camelcase issue should
> > be fixed in a new patch?
> > 
> > For example: If the issue is with same variable, then multiple
> > modifications can be made in one patch.
> > 
> >   -> above example is OK
> > 
> > 
> > For example: If the issue is with multiple variables, then multiple
> > modifications can be made in one patch.
> > 
> >   -> above example is NOT OK / NG
> > 
> > 
> > Please confirm me if my understanding is correct?
> > 
> 
> I guess you have generated a patch series, then check it through
> checkpatch.
> 
> Indeed, if checkpatch complains at a particular patch, you need to do
> interactive rebase. Make sure that rebase todo list contains "edit"
> lines on commit you want to fix up. After that, fix these complaints.
> 
> When you're done, regenerate the patch series and make sure that there
> are no checkpatch complains on it.
> 
> Thanks.
> 
> -- 
> An old man doll... just what I always wanted! - Clara

Thanks for the reply
I guess I was not clear. When I run checkpatch on a driver there
were so many camelcase issues in each file. So I wanted to know if I
proceed to fix them, should I submit each change as a patch or each file
as a patch?
Since each file has many camelcase issue and the driver has morethan one
such file.

-- 
Thanks & Regards,
Guru
