Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFD83FC4
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 13:39:20 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id n27so21152334eja.5
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 06:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xNtQ1ARmV5D+fRgpV2FNt+0W8ArnaPaQlO7L2peESTE=;
        b=RvxWi5/tXCdLO7VqGQL3V9uryQuY7gHxKhcjKavKZ+Pyj1nKnLSEfRBRLyR+ho1P0j
         j6xAGprbt/YeW3sGKbdIpwmUKQHm61eevNX4ipY0UX4wjWp8v4NjQ+22NbcqHk36RLhI
         3xQQCWOZXwX3NkC5qEjbocVVwy9t5nKA5bhdfzWZPjusJtsV2CMSySLZH52EQj8B6mwe
         OY3ii4BH9Djyyvl/gLNkzpDwvgGhXTc5M2F3hU0Rt3WOZKnKe2H/fziX1D+UeRsK0Mit
         cdLToHwhiaiFEfjIgYxjhnqHNGJZN/FACz8VPKp8qDyCBGilgjBRHt6MhKc7yMAO3Bmc
         36Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xNtQ1ARmV5D+fRgpV2FNt+0W8ArnaPaQlO7L2peESTE=;
        b=OMJdyYvDWjRNccDH69bKzvV84x/e2yyiz34OE4XFxUBhhbl6YnxQ63/I2FCnQACVcF
         7TwviheyYbH18DNtOZHF3qt6HrZqiHna4iKlpkGw/B5TxG060Dw24ZivmZMFtNj4qU5c
         uZn88UVaEs2FGH03aSjlVLHIIAGymXYmBcngx3pxE/snT07LdNlUg7ByAx+svu2nUxKA
         IF4jIxYfaFYUJP9h++eELAKIViBvUJvVZjVsYuPl2t1dZxOpxe5QGIZFqskOjOaFNVJD
         qkgoyx/DjYKPkWBLb0is6poiK/cRT3LO3NNyKVq7JlxQfeMd8/9acp96ZOr6SNd//98D
         VnIw==
X-Gm-Message-State: AOAM531PHNAZZhg9hgNRzyRJ6U0PjIdaJkYSK1BKHvK+/PpI3ZA3FeuM
	RPFsLlkhO7FJWatfydlhaBE=
X-Google-Smtp-Source: ABdhPJyht4ntrEK4VNA0hVeDb0PzwJk+HkwTNDL1GhPLqBX2U+F/hHPKuTs7dFjpfVLAv4oOVw5GOg==
X-Received: by 2002:a17:906:318c:: with SMTP id 12mr12950913ejy.28.1631540359147;
        Mon, 13 Sep 2021 06:39:19 -0700 (PDT)
Received: from agape.jhs ([5.171.73.21])
        by smtp.gmail.com with ESMTPSA id dj8sm2818163edb.53.2021.09.13.06.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:39:18 -0700 (PDT)
Date: Mon, 13 Sep 2021 15:39:16 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: protect sleepq_len access by
 sleep_q.lock
Message-ID: <20210913133915.GA1414@agape.jhs>
References: <20210913130346.2390-1-fabioaiuto83@gmail.com>
 <d6d6c6bf-b787-aac9-4767-4bf54c5437ac@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6d6c6bf-b787-aac9-4767-4bf54c5437ac@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Hans,

On Mon, Sep 13, 2021 at 03:24:44PM +0200, Hans de Goede wrote:
> Hi Fabio,
> 
 
> > Note that sleep_q.lock is already taken inside
> > rtw_free_xmitframe_queue so we just wrap sleepq_len
> > access.
> > 
> > Moved pxmitpriv->lock after sleep_q.lock release to
> > avoid locks nesting.

> >  	rtw_free_xmitframe_queue(pxmitpriv, &psta->sleep_q);
> > +	spin_lock_bh(&psta->sleep_q.lock);
> 
> AFAICT this needs to be above the rtw_free_xmitframe_queue() ?

as I wrote on the changelog, the sleep_q.lock is already
taken inside rtw_free_xmitframe_queue. If I put the
sleep_q.lock above that function a soft lock occurs when
I disconnect.

So I put it just below rtw_free_xmitframe_queue.

Things works fine this way.

Please tell me if there's a best way to do it.

> 
> Regards,
> 
> Hans

thank you,

fabio
