Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21122C85
	for <linux-staging@lists.linux.dev>; Sun,  7 Nov 2021 14:03:25 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id z21so6332588edb.5
        for <linux-staging@lists.linux.dev>; Sun, 07 Nov 2021 06:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O6sj1X95855j0rHhxAtqzBn1OgQs+JRxo8r/k2zLWbw=;
        b=jIWTCzx3JSwLNqCZ0yso0oIR9Y9fhln2u1zG5UtjkD/111wmQ8UmSNz9FJRidVQ/4C
         XWWtA1G3OWsfhiVqJ+5V9svtjP84+Fd+U7KX5mzKbMD3m5VZdVDaSjYzeGf49oEvztsZ
         TTnuqLPxL2apVtmCAe8SZiCNTiKiyB15mRpy/t7lcH8OhyAE+0G0Rhl3Ms7VraD4rJ1V
         jTsBzkIROOC5vmn7EpEFlc1Rm/2ZQ2VO7LxAr79Wy42oJEpis0lUNkCVe1/oihwhVDQN
         TTGXOZ6Z/d1ptod2qcjON1wZEThbRQmNnKVvbn+1b1WztNFeArfG0qVwXcWO8A2OYFXX
         PtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O6sj1X95855j0rHhxAtqzBn1OgQs+JRxo8r/k2zLWbw=;
        b=wFdz+NKSkZgDMYToD2IIK9iolzxJBdV7QK45w08x0FNpXpvcK5sGusYK7FC80mNvRa
         k3WZfU7zVZPgP3s0Aar+0OPo1PhL76ISz3IYoA/O8N1LU3jihi39i/bKYfGBrMNr6LlV
         E1rk6yGX/NdqkOEeI60kp3Z78l6IM586ZD367Q5vjir7QTVwXdcQfAQIORXCJRgn0aV5
         HNAjAwmdn/7tjhP0nV7XF0mUebPmVvSlhOjGwb5+LhC0Q3j0Z09+2QWVLgUtbLWEL3NJ
         xJm8Y/OIKj0G4MTCoZJxkKKmsQyGCu94AOJr8yJ37X2VbtKPyBq7giiOzD6f58/yTt8c
         01pg==
X-Gm-Message-State: AOAM532XtDVuu5LFuIbkjvZEjHvdTibi4zxXvV1I2BqVHnv/tCqoGO7s
	Oco3vsN7h6iJo7cG1mplyAQ=
X-Google-Smtp-Source: ABdhPJz83LuCrauw4wOnWjxpB5Vsm7eXFWJhAN2Oij80vNBFJ6uSPVFmo4gokEyhw0aJULGKiU5Pjg==
X-Received: by 2002:aa7:cc96:: with SMTP id p22mr98182457edt.91.1636293803988;
        Sun, 07 Nov 2021 06:03:23 -0800 (PST)
Received: from localhost.localdomain (host-79-56-54-101.retail.telecomitalia.it. [79.56.54.101])
        by smtp.gmail.com with ESMTPSA id m11sm3963008edd.58.2021.11.07.06.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 06:03:23 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: r8188eu: Use kzalloc() with GFP_ATOMIC in atomic context
Date: Sun, 07 Nov 2021 15:03:18 +0100
Message-ID: <2284999.BhpMBdGVLH@localhost.localdomain>
In-Reply-To: <YYfUywXdy3eyssyf@kroah.com>
References: <20211101191847.6749-1-fmdefrancesco@gmail.com> <6109499.H5l3i5aCOD@localhost.localdomain> <YYfUywXdy3eyssyf@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, November 7, 2021 2:29:47 PM CET Greg Kroah-Hartman wrote:
> On Sun, Nov 07, 2021 at 02:15:59PM +0100, Fabio M. De Francesco wrote:
> > On Sunday, November 7, 2021 1:38:35 PM CET Greg Kroah-Hartman wrote:
> > > On Sun, Nov 07, 2021 at 12:43:51PM +0100, Fabio M. De Francesco wrote:
> > > > On Monday, November 1, 2021 8:18:47 PM CET Fabio M. De Francesco 
wrote:
> > > > > Use the GFP_ATOMIC flag of kzalloc() with two memory allocation in
> > > > > report_del_sta_event(). This function is called while holding 
> > spinlocks,
> > > > > therefore it is not allowed to sleep. With the GFP_ATOMIC type 
flag, 
> > the
> > > > > allocation is high priority and must not sleep.
> > > > > 
> > > > > This issue is detected by Smatch which emits the following warning:
> > > > > "drivers/staging/r8188eu/core/rtw_mlme_ext.c:6848 
> > report_del_sta_event()
> > > > > warn: sleeping in atomic context".
> > > > > 
> > > > > After the change, the post-commit hook output the following 
message:
> > > > > "CHECK: Prefer kzalloc(sizeof(*pcmd_obj)...) over
> > > > > kzalloc(sizeof(struct cmd_obj)...)".
> > > > > 
> > > > > According to the above "CHECK", use the preferred style in the 
first
> > > > > kzalloc().
> > > > > 
> > > > > Fixes: 79f712ea994d ("staging: r8188eu: Remove wrappers for 
kalloc() 
> > and 
> > > > kzalloc()")
> > > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > > ---
> > 
> > > > > [...]
> > 
> > > > Please let me know if there is something that prevents this patch to 
be 
> > > > applied. I have no problem in changing / adding whatever it is 
needed.
> > > 
> > > Nothing needs to be done, I am waiting for 5.16-rc1 to be released
> > > before I pick up this patch, and others that will be targeted for
> > > 5.16-final.  Only then will I queue them up, as the automated email you
> > > should have gotten when you submitted the patch said would happen.
> > > 
> > > Just relax, there is no rush here :)
> > > 
> > 
> > Oh, sorry Greg. There must be something that I haven't understand about 
the 
> > development process... :(
> > 
> > Obviously I agree that there is no rush here :)
> > 
> > As I said, this morning I read git log and saw patches that seemed more 
> > recent; thus I thought that was the case to ask. I just (wrongly) thought 
> > that the v3 of the patch got unnoticed or dropped  because of some 
requests  
> > that I had missed. 
> 
> Be sure to notice what branch commits are being applied to.  There are
> different branches for a reason :)
> 
This is what confuses me:

--- git-log output ---

commit 8a893759d0075ea9556abcf86a4826d9865ba4bf (origin/staging-testing)
Author: Phillip Potter <phil@philpotter.co.uk>
Date:   Sat Nov 6 23:16:36 2021 +0000

    staging: r8188eu: remove MSG_88E macro

--- end of git-log output ---

Aside from the "Date" field, I know that this patch has been sent to the list 
during the last night and that it goes to the same branch (staging-testing) 
to which my patch should go. I know I'm still missing something, but I cannot 
understand what it is... :(

Anyway, never mind. I don't want to bother you with this silly questions :)

Again, thanks,

Fabio


