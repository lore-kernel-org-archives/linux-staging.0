Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968C768
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 23:05:14 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id n29so8079882wra.11
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 16:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P37ol+q+T9jBV9pCFTvXHQ4tG6WqpfI2FLWk5Y2/05U=;
        b=kgWiIwEVboSuLOFADgnd+gnY8/y3b2cdS22GPIK0i8QPDM9xZNd/a69SgsM30YBIHb
         fMpggpvqyDnRHpemdM4qLposR4+CTeKPt+ShB6ECkFsoVLfB+Vld3n5Bf9C5FdYCTYV8
         VuR52j99g8Y82tgeo8IvGT+bEM2pSQUdNXJgOxpIIVsW2Pu1sQp9RXHNs84f+GAJq5da
         j+gTftkvze+rCqnXd6Q8DA9GJOsbMEEkDyu/oW+cwrVlnbTU+N2HK2/uGOox1Knyq5p7
         jHJUOhbYlEs22vsK5T/psnLQxUkDe9RSsvop3mbwkvsfLkOHLtOmaUiUtUghUxn62WUo
         XEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P37ol+q+T9jBV9pCFTvXHQ4tG6WqpfI2FLWk5Y2/05U=;
        b=qBo9/LXSasZCV4ZnLRcM1Bp227XanNYiT7mu+Tgubvl1fBO9Q8Zz2u1mCvE1yasy/J
         XHZ1E4FBnZxdMQh1q1RDnUuIjxKJALByfnqo/Pawmk0ol7vyq6oQrxiPrDl+MEE++kUY
         8ca/O0Wg8tStehZd8lapJTZ/GlqJOiYKUUfbnIdwedAFSCLyEIkZ66fd8MYNafONnXR0
         ddq3OgSm5O81JbK/mPmtFH05IdSifsqUlHojqQxDL4FNhBO9hQ3gUB6UXnCI2BSmBiBF
         K4dtxJ+RRvCNgECw0/M6FixJViwrrxT19IULUhVkUGmLiABLy+esFQNdEDsvAEj9FX7O
         +cuQ==
X-Gm-Message-State: AOAM5331d9FHPk6hZZuL3ZJ+oevR7GQ/STIcNI85dQ1LsXdkEF5yQ+r9
	4D20jBw82kvobNuIxS9Z5QAf+w==
X-Google-Smtp-Source: ABdhPJxReR9chBpYS2ZbfNbiqO+5SxJ3SZbYj0sAaJ2zk/mEJ/JQgsUcWvEMNMYuOBT6G9MUCQ779w==
X-Received: by 2002:a5d:604a:: with SMTP id j10mr14503486wrt.93.1636239912943;
        Sat, 06 Nov 2021 16:05:12 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id p12sm14010947wrr.10.2021.11.06.16.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 16:05:12 -0700 (PDT)
Date: Sat, 6 Nov 2021 23:05:10 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Zameer Manji <zmanji@gmail.com>, Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
Message-ID: <YYcKJrFjPvP/tN2u@equinox>
References: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com>
 <CABtXzjSOXiZW5J3-k-jkFS3N9p9k_X=F2JrvJc9_T+By8FJc8A@mail.gmail.com>
 <4f40be0c-1989-fd36-2d40-2e896d8d944f@gmail.com>
 <1977263.McJW3uIAVl@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1977263.McJW3uIAVl@localhost.localdomain>

On Sat, Nov 06, 2021 at 11:17:44PM +0100, Fabio M. De Francesco wrote:
> On Saturday, November 6, 2021 8:26:35 PM CET Pavel Skripkin wrote:
> > 
> > We need to review code better to prevent accidentally regressions
> > 
> > Thanks for bisection and your report
> > 
> Hello everybody,
> 
> I've just read this thread and I'm sorry for introducing a regression with 
> commit 221abd4d478a ("staging: r8188eu: Remove no more necessary definitions 
> and code").
>

Dear Fabio,

This is an honest mistake, and you shouldn't worry - anyone of us could
have done the same thing. You have contributed hugely to this driver,
and we are all better off as a community for it :-)

Even with all of us checking each others code, things like this will slip
through, this is just the nature of the process. We are all human after
all. I am looking forward to seeing more of your excellent work! :-)

Regards,
Phil
