Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B29E3481
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 23:41:18 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id gn26so1526986ejc.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 16:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O+b2W1GeH1OYn8Y9D4pMmFOGxzPzk0NT/+2kUYkJYBY=;
        b=qkriSegi629XBPIN1e7nREqlL/5v0tQnbF0hLVJtjvk1ZCq30PeDibR0tIyKPC957U
         2cDiRQsf7Xs4ZmWhHfLvwsvjW2KRjpgSfvQRRBBc6Li50UhRkBm7rqiWszCVu6iBsLlm
         DB2sP9KSE9kgLopgz/+1GbkCEF1rdpJdCrIdqebvyHbdCks2WRPwcEaD+IYo+evDXp18
         EZdgczVNR74CyXMIgeD3pjb/z0++VM0AsviXaElXPVHEVQvmPAUjPIH6nD/pwnrHop+G
         ssYh7g40n643UztSBoND2xZpbozNLJ4JP64kEYaQnah8XBB7lyp/rFklZqdUiwm2swGW
         hfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O+b2W1GeH1OYn8Y9D4pMmFOGxzPzk0NT/+2kUYkJYBY=;
        b=mu5oKsuCEvMj7ckr4kkhiXZ+Wkwx8lfGgCtYZCjqzzBRE/KrsHFwOFY0uHYv0muL1W
         tB/fLrGgRdSTLqLUyMV6tF9X6++0QTT77XgnYEZjbVoxhyt49f9Y7ad60AK4t7ahPzYJ
         +EH4ZO9pU3nMKFHo5pa+DeMp7HZqHQ0iC6treWaMEJ5u0cXgrJ0ko2BrUCE09xsRleni
         uV1mHmK/08IMB5u3iUKpDOPeAgGGq2fdolZMKY5bg36mCj9auFXu0RFfen+mOFQ+SUDX
         eS+DUWTrNQ7q44mz2sWt1mRhW0M4c9TFMvDkkOAtKXDIJLdax2M1y4fGHMTVQX3UdMA1
         j1fA==
X-Gm-Message-State: AOAM531vj3UiU7RGr59nfpz6HAWDLAU5hvMu9eXlgsglKSHTQ0f+ZxvB
	Idis5U8NAz+WPMNCf5pvCQc=
X-Google-Smtp-Source: ABdhPJyAhw3wkBU5d8bXQJ+Hxw7nU0D1AbAphz/Cn8WY8LDB3vpBI318r2Yt/HnVjjbyvSNIXJ2NeA==
X-Received: by 2002:a17:906:2d51:: with SMTP id e17mr23624773eji.500.1627429277429;
        Tue, 27 Jul 2021 16:41:17 -0700 (PDT)
Received: from localhost.localdomain (host-79-26-32-124.retail.telecomitalia.it. [79.26.32.124])
        by smtp.gmail.com with ESMTPSA id kk18sm1353910ejc.114.2021.07.27.16.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 16:41:16 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v4 0/2] staging: rtl8188eu: Replace a custom function with crc32_le()
Date: Wed, 28 Jul 2021 01:41:15 +0200
Message-ID: <3193794.0t0WolU9RQ@localhost.localdomain>
In-Reply-To: <YQAHcbOeh2ohAmTg@kroah.com>
References: <20210723192620.10669-1-fmdefrancesco@gmail.com> <YQAHcbOeh2ohAmTg@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, July 27, 2021 3:17:37 PM CEST Greg Kroah-Hartman wrote:
> On Fri, Jul 23, 2021 at 09:26:18PM +0200, Fabio M. De Francesco wrote:
> > Use kernel API crc32_le() in place of the custom getcrc32(). Remove no
> > more used functions and variables after the changes made by patch 1/2.
> > 
> > Fabio M. De Francesco (2):
> >   staging: rtl8188eu: Replace a custom function with crc32_le()
> >   staging: rtl8188eu: Remove no more used functions and variables
> >  
> >  drivers/staging/rtl8188eu/core/rtw_security.c | 81 +++++--------------
> >  1 file changed, 19 insertions(+), 62 deletions(-)
> 
> Much nicer, thanks!

Glad you appreciated my solution to this problem. There is another driver 
(rtl8723bs) that needs a change like this. I will post a similar patch by 
tomorrow.

Thanks very much,

Fabio




