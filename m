Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9FE3FC2
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 08:14:32 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id m25-20020a7bcb99000000b002e751bcb5dbso8786809wmi.5
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 01:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=C9dk2+VCltyEEkDv8wQBAPoWCNIY69Z823DPo+nBLdc=;
        b=afedxgOLpJNwFJh2CpeczYHooEtygK+OZpghWQFMhQGKW9f3oosVxuKQLfw5yjFfAu
         P+i3LEQUik40cXAYmtKtVyR06ugLIxkhi1/lvSkLJZIEi/DuRMdvhkAuRUrrx8BCPLo2
         86RryPT6y780RZHFx2BvFpnkYDCW3RBF12ca/1v8ChI4veUxBn4wOfksU4CgxN//9XY5
         1GyUjzKHWgVCNggPOgI98e6ygM2dnmVld6lIcYI+Vao2z7AM/PeWJP4XGyY1u5oHQwoD
         /3JdZ+OsGq9IjAbO1eqzO48/BUYV03HZncUUQwrGeI+68W3s3/eCkT2SZ8M2P3IuicI2
         dPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C9dk2+VCltyEEkDv8wQBAPoWCNIY69Z823DPo+nBLdc=;
        b=cNDA+n82+YGJfJKteTMXt+g/Dvj3OWK/GLLgKnEa1wnxyxRjZXeJV7Ya6Ujb53grYV
         pEVPV5WsYBbXeLTR/miQULWNk7wg0y09saKlxJLWlaLdeFSqiS90u8ZwKk8/UvvU6wcU
         J/qWf8fjYAJ3l7tdQnjxs7NwfXlsqWf0jl9w1P76I2EDBJ9ahpM5xCxd2htTB5ap6Gzb
         atkI+Z/ppeoZ1o7rAM22Lic99ZhYJNPFRyGWDbCZ0E/eGWAYkWlolOACPIdZGi/kSFif
         HruEm6wzS2D/RyuMr0+g6CH5z9fqtqv5VX20euevLxVWOdnDAeaTgX1n4Rb1FJaefPbw
         2LPw==
X-Gm-Message-State: AOAM5304DiHi7c23xHnCX3r19yxbldHrF1Nm96ArF+pj0IaDQskJgNTL
	4rrYaLhCnJiFyEnluRTXeV0=
X-Google-Smtp-Source: ABdhPJy2gFfXJviteh0Qp5UT5bwpI3yQrfsp5IyTjhc7I+bLutyE7Y7JsTiGBbvVRhPAv/AmiaWQtg==
X-Received: by 2002:a05:600c:4999:: with SMTP id h25mr31317552wmp.175.1630311271439;
        Mon, 30 Aug 2021 01:14:31 -0700 (PDT)
Received: from agape.jhs ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id l124sm14381278wml.8.2021.08.30.01.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 01:14:31 -0700 (PDT)
Date: Mon, 30 Aug 2021 10:14:29 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] staging: rtl8723bs: remove lockdep warning
Message-ID: <20210830081428.GB1416@agape.jhs>
References: <cover.1630307025.git.fabioaiuto83@gmail.com>
 <85ef4038-24e7-fdd4-fe42-35416f705b99@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85ef4038-24e7-fdd4-fe42-35416f705b99@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Hans,

On Mon, Aug 30, 2021 at 09:44:01AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 8/30/21 9:09 AM, Fabio Aiuto wrote:
> > This patchseries removes a lockdep warning that turned out to
> > be a false positive.
> > 
> > All "lockable" queues in the driver are initialized by
> > a single function. This confuses lockdep which puts all
> > locks in the same unexistent class.
> > 
> > Fixed it by doing the initalization of queues in place.
> > 
> > Done a small code cleaning and removed the no more
> > used function.
> > 
> > Tested-on: Lenovo ideapad Miix 300-10IBY
> 
> Thank you so much for fixing this.
> 
> The entire series looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> For the series.

Thank you,

fabio

> 
> Regards,
> 
> Hans
> 
