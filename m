Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6AB2C85
	for <linux-staging@lists.linux.dev>; Sun,  7 Nov 2021 13:16:02 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id j21so51244222edt.11
        for <linux-staging@lists.linux.dev>; Sun, 07 Nov 2021 05:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Je5hDQMIRJ/aKOcOoapBhm7Gdjtc8kk4qY79WTxgwEE=;
        b=nu4IDGR8phkVeLe2ckx2wCGZQ1g+XDvFXgFPhi6MqYK5wfYtORWmpV5mR/mGQUB2wj
         u9tLyagbX8Bb1nr7C0zGL4BIFHe8I83v8seK8q83qU4kaazbjzHq/RiCm8qn66NI0+KW
         4UuwtI1vSKajEYFHjA++sudhh4imUsKBwWmktoLxtP1YoVilbmTEzrTljnr+uU2VIw5X
         7Gqixw5Yr8VeVhiU9S4mgoTNfbFDBe2760qXGtppZRIkC/71RxDBvSTEYI6/QwE5O73k
         rlBsfJFZKjbgfrp91/pYnX2NFrAsMTpTPUbfB5fK4o9Ov2mdxuyml01nlITU1Y2zH0H+
         IVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Je5hDQMIRJ/aKOcOoapBhm7Gdjtc8kk4qY79WTxgwEE=;
        b=Qjz+eEg9D7m1sYDEYX/3jwOBDaFtN/JUSfWfBe/znrWSIWoKuuD/lVmkVEVYm3x/4a
         N8M1i84FauTaP4L+vR7OBWguZeBeZfS++01Qaq2vxqLjjeaaqJzm14XPkVF8XojAE4g5
         wJMVMe9fnyqNYA/4FsDaKjuix/pdoktBXPSvuNb09Fb+joSUBJwLX+tag+V60mDpq8MP
         SzPR6ma5VK/hXvgh59PPbkmLaTCyXfAKgh4pJbIj0DhEh5l/A4imT/g/e28c0iB7GJwi
         k1HeVmUWjsPXK/hKigcc2sUepgeY67cM9YzAzXfkp/e+VUKF8KVl96mUdYXLM//Zh+rN
         nkyQ==
X-Gm-Message-State: AOAM533yRxbraBxFRf+EKVQbv/lDtew5TYEmiJH+oFyZzgqLjZJnnJ5Q
	9yyosU0VitgisJvvfTfCCQk=
X-Google-Smtp-Source: ABdhPJwCvEMtUYIGNHunEZRjlRkmwZOofWCSptscM7qAH6EJC+94JC1e0cksu68EhA9c52X7F2LyYA==
X-Received: by 2002:a05:6402:d0e:: with SMTP id eb14mr37141350edb.59.1636290960720;
        Sun, 07 Nov 2021 05:16:00 -0800 (PST)
Received: from localhost.localdomain (host-79-56-54-101.retail.telecomitalia.it. [79.56.54.101])
        by smtp.gmail.com with ESMTPSA id hp3sm6890994ejc.61.2021.11.07.05.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 05:16:00 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: r8188eu: Use kzalloc() with GFP_ATOMIC in atomic context
Date: Sun, 07 Nov 2021 14:15:59 +0100
Message-ID: <6109499.H5l3i5aCOD@localhost.localdomain>
In-Reply-To: <YYfIywQ3AqrWbi8z@kroah.com>
References: <20211101191847.6749-1-fmdefrancesco@gmail.com> <2389191.WthrnW1hFq@localhost.localdomain> <YYfIywQ3AqrWbi8z@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, November 7, 2021 1:38:35 PM CET Greg Kroah-Hartman wrote:
> On Sun, Nov 07, 2021 at 12:43:51PM +0100, Fabio M. De Francesco wrote:
> > On Monday, November 1, 2021 8:18:47 PM CET Fabio M. De Francesco wrote:
> > > Use the GFP_ATOMIC flag of kzalloc() with two memory allocation in
> > > report_del_sta_event(). This function is called while holding 
spinlocks,
> > > therefore it is not allowed to sleep. With the GFP_ATOMIC type flag, 
the
> > > allocation is high priority and must not sleep.
> > > 
> > > This issue is detected by Smatch which emits the following warning:
> > > "drivers/staging/r8188eu/core/rtw_mlme_ext.c:6848 
report_del_sta_event()
> > > warn: sleeping in atomic context".
> > > 
> > > After the change, the post-commit hook output the following message:
> > > "CHECK: Prefer kzalloc(sizeof(*pcmd_obj)...) over
> > > kzalloc(sizeof(struct cmd_obj)...)".
> > > 
> > > According to the above "CHECK", use the preferred style in the first
> > > kzalloc().
> > > 
> > > Fixes: 79f712ea994d ("staging: r8188eu: Remove wrappers for kalloc() 
and 
> > kzalloc()")
> > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > ---

> > > [...]

> > Please let me know if there is something that prevents this patch to be 
> > applied. I have no problem in changing / adding whatever it is needed.
> 
> Nothing needs to be done, I am waiting for 5.16-rc1 to be released
> before I pick up this patch, and others that will be targeted for
> 5.16-final.  Only then will I queue them up, as the automated email you
> should have gotten when you submitted the patch said would happen.
> 
> Just relax, there is no rush here :)
> 

Oh, sorry Greg. There must be something that I haven't understand about the 
development process... :(

Obviously I agree that there is no rush here :)

As I said, this morning I read git log and saw patches that seemed more 
recent; thus I thought that was the case to ask. I just (wrongly) thought 
that the v3 of the patch got unnoticed or dropped  because of some requests  
that I had missed. 

Thanks for the explanation,

Fabio

> thanks,
> 
> greg k-h
> 




