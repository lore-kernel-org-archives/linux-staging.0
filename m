Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D032FB2
	for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 11:06:43 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id x11so50825564ejv.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 04:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oXHXNjMFde3RZo3Oxerlx2/B9K7hyGDePqliIxHv4MA=;
        b=kFJPOezz5P+KBafIBtx5LkHwKkRJ8gvjuCuOmKNLsy1VV4GIZOVB+y5Oh9MP7bwnjg
         c5TNOS3nKVLBTlPhcb877vCCYeK7uh/9/NeiOYW40MyHwa5LRQpGqNBmiImS9Uha5o0V
         nCuIiWdythFAJ4EdNHvsT++8Y9FWC7+F5v/UrF/SEi0HdKvgH5S7jkLeUu0K4CUvhQAv
         svTyNqePO2dnyvfw/xwAZ7zB5hqA6Z+186eHhlaymBMPt9xZaJYluVhZF9Md1pYuIDga
         iVm17b4SZdlQ1ixl/vzkqRcectRASfTPP14RflXwmagkNL8JnYQ00XinfI/SJX8SnX+1
         bDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oXHXNjMFde3RZo3Oxerlx2/B9K7hyGDePqliIxHv4MA=;
        b=BZT9HXHnH4+o3BCCVy2oA4Lm0hlXhK4Pnz2LYGQhcHb8yef6ejDMBFHJolXcZi1kjw
         Za4/XNuHr8mttBRk/DGbcfk4Bqa6FuIFHZMhDqi8xfBlqDnFHTKDFgdpUYDc3xG5tLDi
         5ioGelgzP3nxPzFOSjOcaPNHD8/pnTe3WSI+EV0+V64LeIcm9XcGyu92n4wNEo8QvGAK
         e2lndvyLlHlouDuxfSpKMDZCGZDthE8E/kS39P2HG7EI0O3pxpRE58oylPNMdIQQaylZ
         k7jmh0rG8NzNpPnxoVBB/EYbmZTSgdseQyeWiuRQ5LkxIQ5EgGaYhEj605v2ORAKFDX6
         VGYA==
X-Gm-Message-State: AOAM532RfeomS9FOPTsz0OTXfLJKx+os0DpOElcacX10m64GfkFMkKYI
	61pPBQZdMf0vnrBF4fzeng8=
X-Google-Smtp-Source: ABdhPJwiRv4tF7NGkgUlL8yunBa4MTW70bNhkcmcV+TLo+TlZPs6Q3znBeeFglkMlyCHCCO7jtntSA==
X-Received: by 2002:a17:907:7704:: with SMTP id kw4mr44804146ejc.23.1629889602317;
        Wed, 25 Aug 2021 04:06:42 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id q11sm2992305edv.73.2021.08.25.04.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:06:41 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, gregkh@linuxfoundation.org, straube.linux@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] staging: r8188eu: add error handling of rtw_read16
Date: Wed, 25 Aug 2021 13:06:40 +0200
Message-ID: <3494498.825kMHXWDN@localhost.localdomain>
In-Reply-To: <20210825103802.GS7722@kadam>
References: <cover.1629789580.git.paskripkin@gmail.com> <3396277b-6d80-b621-0ef0-71de7d581602@gmail.com> <20210825103802.GS7722@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, August 25, 2021 12:38:02 PM CEST Dan Carpenter wrote:
> On Wed, Aug 25, 2021 at 01:13:54PM +0300, Pavel Skripkin wrote:
> > On 8/25/21 1:06 PM, Dan Carpenter wrote:
> > > On Wed, Aug 25, 2021 at 12:55:37PM +0300, Pavel Skripkin wrote:
> > > > The main problem, that no one knows who is the "old". Greg can take patches
> > > > in any order he wants
> > > 
> > > Patches are always taken in first come first serve.
> > > 
> > 
> > 
> > OK, but if pending patch needs new version, then it will be taken at the
> > end?
> 
> Versions don't matter.  No one is tracking any of that.
> 
> A patch arrives.  It is either applied or rejected.  First come first
> serve.
> 
> > 
> > Here is the situation we have:
> > 
> > 	I have the patch series based on old function behavior, it was
> > 	posted first
> > 
> > 	Then Fabio posted refactoring of the function and it changes
> > 	return values.
> > 
> > 
> > Both series are pending right now and made on top of staging-next branch.
> > Who needs to rebase? I think, applying these series as-is can broke the
> > driver, since error handling will be broken
> 
> That's a bug then.  The patch should be rejected.  You're not allowed to
> break the code.

Sorry Dan, I disagree. It's not a bug. No one intend to break the code. 
How could anyone know that someone else is working simultaneously on 
some code that is not compatible with the work of the other developer?

Pavel and I worked simultaneously on code based on the current Greg's tree.

We incidentally got to know that mine breaks his.

I suppose that Greg will take Pavel's work first, because it was submitted few 
hours before mine and then will ask me to take into account Pavel's patches, 
rebase, fix and resend mine.

Each series is self contained and does not introduce bugs to the current tree.
The bugs will arise when Greg will have applied one of the two series as usually 
in a FIFO order.

There's no practical means to know who is working to what just by reading all 
the messages of the lists. Who reads all the messages before deciding to work 
on something? This issue will be solved a way or the other, I really don't think it 
is a big problem, it's unavoidable when a lot of people work on the same 
driver or subsystem.

Regards,

Fabio  

> Also don't write patches which lead to merge order breaking the code
> silently.  That makes it difficult for stable as well.  For example,
> don't do this:
> 
> -void frob(int a, int b);
> +void frob(int b, int a);
> 
> In that case, you would change the name of the function so that the
> build would break when people mix old and new code.
> 
> regards,
> dan carpenter
> 
> 




