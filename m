Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0B03FC0
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 17:49:18 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id d21so32004610wra.12
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 10:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=r41nUBvKpkJxALuDsSht5cDHusBvKgwOyaR4x+2DMgk=;
        b=iyB/2X7yJfWIFS6XVAnqdqZhkFcPgv6vBRc+GT3A4dmZVQnfeYIsEWES2ZF7/GmCtq
         wvWHujM9Ecega9rmx/OPdbmcj1wRc7maTxpvNF5qFyaRlU38GW2u0MBnQkwP754hB6tg
         YWRGUB14hzCbdjsXloejwAoNUHvJ3AYRvrOFRHLvDLSJWpIVo7BCS055/QKgJYh5mhqm
         C9LTUGu5/Th60rLt0BKNjClGKDxIjAjJNhAUOUIK9Zd4VV9coSAtD8td3Sh5kHewNVbW
         95xtPX/0OMbC4v7oua5Bxjy3LGd5uu5uv89KWaOhXPTx58a1B7p7TmJuUOO5HC1f4wnb
         KUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r41nUBvKpkJxALuDsSht5cDHusBvKgwOyaR4x+2DMgk=;
        b=4ttcu97g0mOrRiWjTzlAxiDY9yg0/R4wsUZNO4/q4IFANQlQ8TNEW1kBa63o3E9xJM
         bG+7E9x5Smd47jUadZ9EZ3gQOxck7lNE3lpH6kHqaHlMFOPyKA6xeaH2Barn+O0gUw0w
         favhqvT7BviWP+R59WwRurkiQnwgcK49oruaUmH4OJaTjlFwyekJaLQijLk7KY8kAI3A
         ZXqOKhPMT/HjSZDPG5afNCpkuPa+H2W5D2OGU0AxAZYr9TU98QFgkCoxQ040CIfBclPM
         HpUTev9RaM8aYd6zWgHoT9XGhgU7gvMvMz+d1U+Zk4aeVf73MPJj1UZJypW9r/kCStLD
         YpKw==
X-Gm-Message-State: AOAM533nPxMW2NQZKdi9ZiJ2OZjP0SHvCeBcsHvy04pusxlm119swdGE
	PhgrkLqTmsWM8erRMTIhz/w=
X-Google-Smtp-Source: ABdhPJwZEEhMC7DuwNUjtHn6hH16Soch/kXoQUBc3TnLXJNO8VabS2z00UXA+CIPW7eXwwe8P7eoQw==
X-Received: by 2002:a1c:7713:: with SMTP id t19mr287551wmi.162.1632160157208;
        Mon, 20 Sep 2021 10:49:17 -0700 (PDT)
Received: from agape.jhs ([5.171.72.213])
        by smtp.gmail.com with ESMTPSA id s14sm16452921wrp.84.2021.09.20.10.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 10:49:16 -0700 (PDT)
Date: Mon, 20 Sep 2021 19:49:14 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-wireless@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] staging: rtl8723bs: remove possible deadlock when
 disconnect (v2)
Message-ID: <20210920174912.GA1400@agape.jhs>
References: <20210920145502.155454-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920145502.155454-1-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hans,

On Mon, Sep 20, 2021 at 04:55:00PM +0200, Hans de Goede wrote:
> From: Fabio Aiuto <fabioaiuto83@gmail.com>
> 
> when turning off a connection, lockdep complains with the
> following warning (a modprobe has been done but the same
> happens with a disconnection from NetworkManager,
> it's enough to trigger a cfg80211_disconnect call):
> 
> [  682.855867] ======================================================
> [  682.855877] WARNING: possible circular locking dependency detected
> [  682.855887] 5.14.0-rc6+ #16 Tainted: G         C OE
> [  682.855898] ------------------------------------------------------
> [  682.855906] modprobe/1770 is trying to acquire lock:
> [  682.855916] ffffb6d000332b00 (&pxmitpriv->lock){+.-.}-{2:2},
> 		at: rtw_free_stainfo+0x52/0x4a0 [r8723bs]
> [  682.856073]
>                but task is already holding lock:
> [  682.856081] ffffb6d0003336a8 (&pstapriv->sta_hash_lock){+.-.}-{2:2},
> 		at: rtw_free_assoc_resources+0x48/0x110 [r8723bs]
> [  682.856207]
>                which lock already depends on the new lock.
> 
> [  682.856215]
>                the existing dependency chain (in reverse order) is:
<snip>

thank you for working on this, at a first look
the patch series looks good.

I will test it tomorrow.

Thank you,

fabio
