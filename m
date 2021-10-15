Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112C072
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 12:11:48 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id y30so20100985edi.0
        for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 05:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AGmqR2xzQ/YBThqPJdploWYaJyDetQejJVHNWJNb6sM=;
        b=RS+UVqVo29WU1w+frveoYMaToC8WN74aBe00ipWX34m/BECT3GVYrbOmeRYtBfndxT
         dryzMIyoRa1/ZCEjlTc/JAoo5l4R/xbMG/OtP3LSYxYSPGEOGxB+5eA13AJsTTPx/tTr
         +o3gPer92q1wMZMTohAOV4yWzfiPDeNVsce6IrRT3NfRsjh7DwdYSuvG2owgHV5CWXlA
         aY5Evb7+M9JKI8RnghJ99iKHC3SJlG1QIwM0gxp7ypuz6dhkgH/oXUWoeUIKXxGUVQDJ
         sO0vKLTUxLIJKA/LA0PRmy2CAJEJUNVbqNzmoKVcDDDYJe5RkcRQsbIyQS4FnMISpZvf
         5EZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AGmqR2xzQ/YBThqPJdploWYaJyDetQejJVHNWJNb6sM=;
        b=YqoIbJ5QXwynNgAmReBPuYiQi8RfDkQZDLqa79JLSFmSJCYglIAqqITpAnXGF4TsTx
         ewwtt2689EXfKZqEC03/dRD84TZjya125+Mt3QUT5S5NUkw3XI1u893+51vqyMIZqpES
         pOVihfReYqfXWPg0Ih2gw4xph37QFtgegQtZPgIttl5+k3Xab9dTDZYv671SsHkcLmTt
         Y2sv9G8ALxdZTOiPrJUw4EudE7DqAUgBhfOYbefCl7ECnacj1XzaqgHRWkcZUUspOX24
         VG4ggWGNmtSSkOXfuv1cXhjD9oq94dEOiWJXJwsA2A+LoGIHs7PNIb+seE0HeOOLbVqT
         44OQ==
X-Gm-Message-State: AOAM531JfbgsJfITqIjbkbVPMN2HJyOsMvjin6nTKH4WpswRmXEmLunq
	BZOWPJm9LE74TKhiNFdLDU8=
X-Google-Smtp-Source: ABdhPJw7Y7BgwCPpoYTbRoShU4nSQRSHzGe++lAqHljG9PiM1S7/dEs5KooNi5GvsMtUX+oR4MShtA==
X-Received: by 2002:a17:906:6a2a:: with SMTP id qw42mr6165743ejc.561.1634299904340;
        Fri, 15 Oct 2021 05:11:44 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id j11sm3971820ejt.114.2021.10.15.05.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 05:11:43 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] staging: r8188eu: Use completions instead of semaphores
Date: Fri, 15 Oct 2021 14:11:41 +0200
Message-ID: <2060953.sJFZD89sIB@localhost.localdomain>
In-Reply-To: <20211015113715.GR8429@kadam>
References: <20211015110238.1819-1-fmdefrancesco@gmail.com> <20211015113715.GR8429@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, October 15, 2021 1:37:15 PM CEST Dan Carpenter wrote:
> On Fri, Oct 15, 2021 at 01:02:38PM +0200, Fabio M. De Francesco wrote:
> > rtw_cmd_thread() "up(s)" a semaphore twice, first to notify callers when
> > its execution is started and then to notify when it is about to end.
> > 
> > It makes the same semaphore go "up" twice in the same thread. This
> > construct makes Smatch to warn of duplicate "up(s)".
> >
> > [...]
> >
> > I'm waiting for Maintainers and other Reviewers to say if this patch is
> > actually needed and, if so, also for suggestions about how to improve
> > it. In particular I'm interested to know what they think of using the
> > uninterruptible version of wait_for_completion*().
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> 
> This is basically what Arnd did to rtl8723bs in commit:
> 
> commit 09a8ea34cf431bfb77159197e46753d101c528c5
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Mon Dec 10 22:40:30 2018 +0100
> 
>     staging: rtl8723bs: change semaphores to completions
> 
> But there are some differences.  His patch is a little bit cleaner
> because it gets rid of "pcmdpriv->cmd_queue_sema".  Could you basically
> just ports Arnd's patch for this driver?
> 
> His patch goes quite a bit further as well, and change some other
> semaphors but we could do it piece meal and just change the
> rtw_cmd_thread() related ones.
> 
> regards,
> dan carpenter
> 
Hi Dan,

Thanks for your review. 

I wasn't aware of Arnd's patch. If I were I would have sent a "normal" patch.

Beyond this, I noticed that other semaphore (pcmdpriv->cmd_queue_sema) but, 
since I was not 100% sure that my changes would be accepted, I decided to 
leave it as-is for now and wait for reviews like yours.

Now that I know that this changes are welcome I'll also make the other 
changes. 

I guess that I have to change one semaphore per patch and make a series. 
However, now I see that Arnd's patch makes all the necessary changes in a 
single patch. What is the correct approach? Is one patch per semaphore 
preferred or one big patch for all of those that need to be changed?

Again, thank you very much.

Regards,

Fabio M. De Francesco


