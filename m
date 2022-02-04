Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B642F23
	for <linux-staging@lists.linux.dev>; Fri,  4 Feb 2022 18:36:32 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id e145so1207597yba.12
        for <linux-staging@lists.linux.dev>; Fri, 04 Feb 2022 10:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+5Aj1KjYxfLdKjI/WZUbvXzI5x0t228gk/N8Q28NwXc=;
        b=m2yPocPkciKFGCCbvaln3VxAlvAsooZ724bmD/N4oVRNvlL0VoMSE4qNXZ6Dp4VN84
         TMskNSAHGDldEClw1PdUHIrN0kRP0kI/yqSHpPMNihmGdy2UxKXS8Gm5Tq18MkRAinRe
         EdWn3NlqWh12+3X55hF/jc2PCPBonzObBRf0sM/j8oKsDhKedcOjCciXuiAW1EruLmtY
         mBdSkQd1/NxxDo1jv6dDI1lM9SuAS+WEZ9LRGBAiYNqt+tQBpU0N0/fAxT7BMIY4QQMu
         xY1sTyYSg6fr4V+QxtOFxy9rhjoa8sFwIhSkXK2ImsPcFnvdbFhgBmG7iWv7XNtP885n
         D1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+5Aj1KjYxfLdKjI/WZUbvXzI5x0t228gk/N8Q28NwXc=;
        b=VZNKHA40brpt7cjwTArvoMYiq6UHbh2kabpNgog2jTplsMYs9bYiztJ/Ma0mHcblTe
         hWPMzqt7a9DXz2FuDloAvBnvr6vHCT5PwnfoXjLivGKqeokdLlz4hwgKyi/jEnReLpPp
         kMFmulHsgSIyOIWBnfXuiBkUQ66xIRtWpqcZQ8Sjepz+JywysHRfUA3Q0WIK9eLIwEix
         q5qaYaccc3i1doLirf7s0lyZm390Q4iTRgpUZyLejG2exp2NA1bz69LEySWO9FLtC/rI
         SHopBSGzhZrxGmIfqhiJpQi7nT4pca78O8ttJagtK9FLShiMYZAt/DIQSqHdBKVbKq5W
         +NwA==
X-Gm-Message-State: AOAM5336DP0eARDEHYMMKc1f0Gif3frmIKUfk397d/bmztvj1nEDq2UC
	pVek9zZTeTD6Y3fFw9oayDBdjxt/1t+QwmPiwF0=
X-Google-Smtp-Source: ABdhPJxcSUbvJwDw+JlzrS/bulYbjADv05HysQJPJATVorWp5WCcH3QqAPDjvAjAGc8SvpMHCNCL8XrxA9N1cb+TU3s=
X-Received: by 2002:a25:1809:: with SMTP id 9mr434289yby.633.1643999791205;
 Fri, 04 Feb 2022 10:36:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220204054028.3123858-1-ztong0001@gmail.com> <Yf025dphJw2rUVR5@kroah.com>
In-Reply-To: <Yf025dphJw2rUVR5@kroah.com>
From: Tong Zhang <ztong0001@gmail.com>
Date: Fri, 4 Feb 2022 10:36:20 -0800
Message-ID: <CAA5qM4By97L-QEjJd3HhzJ=9XLve7Fuj_Wo-uO8Lp94XWJDx3g@mail.gmail.com>
Subject: Re: [PATCH] staging: gs_fpgaboot: revert removed board specific code
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, linux-staging@lists.linux.dev, 
	open list <linux-kernel@vger.kernel.org>, insop.song@gainspeed.com, 
	devel@driverdev.osuosl.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 4, 2022 at 6:23 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 03, 2022 at 09:40:27PM -0800, Tong Zhang wrote:
> > Loading the driver will always fail since
> > xl_init_io() always returns -1. This driver is broken since 2014 and I
> > doubt anyone is actually using it, we could either remove it or revert
> > to the previous working version.
>
> Let's just remove it obviously no one is using it.
>

I am on the same page with you folks. We should remove it. I sent out
the patch to see if
anyone in the list is still interested in keeping it just in case. I
will send another patch to
remove it from the staging folder.

Thanks!
- Tong
