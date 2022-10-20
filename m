Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EEE7B;
	Thu, 20 Oct 2022 11:14:18 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id df9so13247641qvb.9;
        Thu, 20 Oct 2022 04:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S5LQ5ibOgwU/Lu94muSYgBgt6tHWsp6OsYy77B2Gzs8=;
        b=X2AFDhzaoX+UhDyu6eIi0W9a5feHsZYEGcCAaBfZ/QL//eyzLfXhfsOIadWecYW7N0
         2/0lSn4HMoNv54c3p7rSy3t5zTfDH9jVzBaqWonTY5sYc/KMmTKcZL9D2GIgoq9IliaU
         AY0WdO77c+QoYi39pG42nLEmYYk++NEPGOZv5EWM8i/7lpjbNOha753HZEIgd1UATsJi
         hMOkG3cWUEDA3kzqowuCKmxNwj2pTW/AbwZw5xdoiaQGVEYW+EVVw937BqWbx00uXdle
         X2ob6nDUPTXqgKubPafyNbEwWz3+AOfN3frAnqmU07FKELPLOxpGhmwxhnXos/hlBvMK
         UIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5LQ5ibOgwU/Lu94muSYgBgt6tHWsp6OsYy77B2Gzs8=;
        b=Q/uKNak3c2oRxKNLCHfn3iVgc/Pzfll90OGEtv6h/OhQF9L/TUz/Vhhv2Rcpgyufot
         Az/UK2gBBYYVpHhRj2Zz3wlPdMPC62QdRztHxtHUYf4DM3hb+kJE29Tm9rh26dcSdnMo
         wAVbQvnPm2g981BGuq08oY9ZLgKGWt3ynrcsgFWqNHQPa3u5nUuGZvimKhVGeqUkhov3
         dyNepxGax8qtDH/t0bRJ/AmAKE19OaK8mwHaW0YBOoAEC1WtuCtvC+3t+0dPm55XHWP9
         Mgc4Eo/yGWy9VmiG22sFSgf/N6N4wkZvKgArxEDKwrfbUgR9KlD5Lp3EgTCuvy9saICw
         nxKg==
X-Gm-Message-State: ACrzQf1l8HcojYfFVqyFpmoTT/u9pY5sEFjk1Zdx/WiozYMN3IJzv3Dt
	0uNmjcNWHuLMBe0ooc2Av20LIO6akTWMdgPy1J+QDFC4r78NZe7QWiw=
X-Google-Smtp-Source: AMsMyM4IPeUUKPsJx1cZtJSYdRgd1jqIgCk6jpBz39CyoPaqFSSRY+howYatQ/Xg7ext5BTkoXfmLv+/eev+mx6CpKQ=
X-Received: by 2002:ad4:5d6c:0:b0:4af:b5e0:63f1 with SMTP id
 fn12-20020ad45d6c000000b004afb5e063f1mr10454955qvb.35.1666264457151; Thu, 20
 Oct 2022 04:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y1Eqa7uKB+Wk+Mb+@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
 <Y1EskCZF7qkiPW2O@kroah.com>
In-Reply-To: <Y1EskCZF7qkiPW2O@kroah.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Thu, 20 Oct 2022 12:14:05 +0100
Message-ID: <CAHJEyKXLFyYkz2sVxSu_GDgT878=qcHOmvT=38gBGqJvaz3tTQ@mail.gmail.com>
Subject: Re: Request for assistance
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 20, 2022 at 12:10 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 20, 2022 at 11:00:59AM +0000, Ubuntu wrote:
> > Hello,
> > I have a diffictly deciding where exactly to split a long line of code. for example, this line of code is too long
> >
> > uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
> >
> > if i spit it this way:
> > uCTSTime =
> >         bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
> >
> > It does not help as the second line is still too long. I considered doing it this way instead:
> > uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14,
> >                                 pDevice->byTopCCKBasicRate);
> > But i did this on one of my patches and i was told it is not advisable to split a line between
> > parenthesis '(' and ')'
>
> Who told you that?
>
> You are close, the code should look like:
>         uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14,
>                                      pDevice->byTopCCKBasicRate);
>
> Like millions of other lines in the kernel source tree.  When in doubt,
> look at existing implementations.
>
> hope this helps,
>
> greg k-h
Thank you for the clarification
