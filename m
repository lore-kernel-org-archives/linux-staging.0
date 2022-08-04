Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEC66AA2
	for <linux-staging@lists.linux.dev>; Thu,  4 Aug 2022 22:37:14 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id z12so1302668wrs.9
        for <linux-staging@lists.linux.dev>; Thu, 04 Aug 2022 15:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=gD7k4L101xf65kVYpVp72EaTKRlJXNgHEKS9UB26QDY=;
        b=prhDln7XMn+JfGF45/ZO6FzvNAqVS5NjZpydPq6PuWKFy4y6UnvwQEFzs7L50T3/Lq
         O+6pNsmStP6XPYNCbMSavtYEWtPLwuoKrmN9pc5yiyjy6TO6ZSOkJJDdFKLtAzFI83gi
         gx5mTiB9YqeXK3/qDn6FrCU2wd3mQO5tcK+HDRmUT6tIQPXfF0+MZYhEzYfGy1jTMZmu
         vl5UxJDwtxxsJobkQGwqV206CHuJuzw30JdvanGqYdOAdyEpImTdm383Z3FLnkYzXt3k
         a7VLHPLXkcsjzIRjPfpJZE5sk/6pLa9aKq+VZzIO7GIzOLvZ0B5FbZh6ubNtW746qMUn
         0OPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=gD7k4L101xf65kVYpVp72EaTKRlJXNgHEKS9UB26QDY=;
        b=Cc+wKYs3gsHTWbaDlMkKHUSN7nJr/l90pwhXVCyDF8u0o9Pch/oCimg+h7e7gbb9QU
         oDJ5pOdUxwq4bdlHWpCqas9TlUCdIoGdCl4xjAKHLdu3F4imLVbS4wv0FZ+wRpIA7Lcd
         H4zZHPcV3NjT3V9+gr5YqgCNX9VrGWppIMal74IqJPMBsm0TslfTQcZpPRTNx9gQumkE
         VlgoIc2SO/sc9dcQ3vmf0kL18+RPcGTBOdzAfic/3yVw32yFKBgL11/WCKKAS4dPUobP
         /ZbDjFkf/8yAlVcHOQeO3+bAn/rI7Jlswb6DVs4pCRStZ6Lu2+e6HnWPS0utCoPoWjsu
         nK0Q==
X-Gm-Message-State: ACgBeo3deoPJnebPkBwVqpaewuYbbRtlHLWRH3f6z2FKnsAwe0uorMCy
	MQpzmLOyVV6ib1XewEpFqDkk7Q==
X-Google-Smtp-Source: AA6agR4/wIoyA0JmKzCTEH8SLXk3PsghmO4ipfU4t+y34q0gqF3vvxm+bXoI4zsPYd7zIQ3bQ7NG9g==
X-Received: by 2002:a05:6000:1b92:b0:220:7d86:2e30 with SMTP id r18-20020a0560001b9200b002207d862e30mr2647027wru.530.1659652632689;
        Thu, 04 Aug 2022 15:37:12 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id b21-20020a05600c06d500b0039c5ab7167dsm6683458wmn.48.2022.08.04.15.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:37:12 -0700 (PDT)
Date: Thu, 4 Aug 2022 23:37:10 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	paskripkin@gmail.com, straube.linux@gmail.com, martin@kaiser.cx,
	abdun.nihaal@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: convert rtw_p2p_enable to correct
 error code semantics
Message-ID: <YuxKFpcdqW7Sq1c/@equinox>
References: <20220802234408.930-1-phil@philpotter.co.uk>
 <99ee7f1d-62fa-a873-403a-445d8d8b096a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99ee7f1d-62fa-a873-403a-445d8d8b096a@gmail.com>

On Thu, Aug 04, 2022 at 10:26:39PM +0200, Philipp Hortmann wrote:
> On 8/3/22 01:44, Phillip Potter wrote:
> > Convert the rtw_p2p_enable function to use correct error code semantics
> > rather than _SUCCESS/_FAIL, and also make sure we allow these to be
> > passed through properly in the one caller where we actually check the
> > code, rtw_wext_p2p_enable.
> > 
> > This change moves these functions to a clearer 'return 0;' style at the
> > end of the function, and in the case of errors now returns ret instead
> > of jumping to the end of the function, so that these can still be passed
> > through but without using a goto to jump to a single return statement at
> > the end which is less clear.
> > 
> > This change moves the driver slowly closer to using standard error code
> > semantics everywhere.
> > 
> > Signed-off-by: Phillip Potter<phil@philpotter.co.uk>
> > ---
> >   drivers/staging/r8188eu/core/rtw_p2p.c       | 19 ++++++++-----------
> >   drivers/staging/r8188eu/os_dep/ioctl_linux.c | 12 +++++-------
> >   2 files changed, 13 insertions(+), 18 deletions(-)
> 
> 
> Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150

Thank you for testing Philipp :-)

Regards,
Phil
