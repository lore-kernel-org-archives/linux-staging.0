Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033F1171B6
	for <linux-staging@lists.linux.dev>; Thu, 27 Jul 2023 17:38:00 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3a4062577c0so1552529b6e.0
        for <linux-staging@lists.linux.dev>; Thu, 27 Jul 2023 10:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690479480; x=1691084280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S0SfZCWmWIh2WNL4AjazYD4f56u8ZIvWeRVkzgtI3H0=;
        b=XUbXtI/4j3vglCphGsXW0u8s3q1q8tJzsfJvnZiXA4PaSs0z+7nAKtSHDztADz1Fm6
         cModolNbl3PqUdVkHTqk6cQbK3muspkusA+hNSnCIOHge3dJhsc17f8LWDAjz/Oa13YE
         hc5CDHF3bXfSZSToHZA14dnK4Y9t05yYczNNOYh/hcAiwsr8OpFgbr8w+9QSaWMZq+3F
         Vxr8YtmV/r0u3PhUMV87MsdGd22kUCwzIu8Zmxbjz1CCPrhLAB2tjTGSqEUH7Nt77Hla
         64X3B70h0Vekkrf4Yf/canq+9hbyBHsteaqXvKy5kUYlZvEZ+w+g35jYgT7bHpzMHpT8
         PZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690479480; x=1691084280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0SfZCWmWIh2WNL4AjazYD4f56u8ZIvWeRVkzgtI3H0=;
        b=gqj6RFuc8ojf1rGkkeWIeZb4SxmS9OHM++TogVwMYcs8FwNPa9wZnY/VEnmdP/AtOQ
         sbJeguqIZH61UnBXwngdOJjTJvdNBoku4kNVH1zsXUbZyMzUCMhTa4Vimt/FlHxhm0RP
         mxvBxpMBRNARsijK6t6deALI846F143F94CJU/OtzvVi45GfZhYzk0gp6lfIRqZqGQY7
         QELuN55JE92sIn+Mxd4RH4yE7YpkDJBuI9d82Tn5o1HBPDNO+OiQ+Tnl5jk3gcsUIqbA
         q2tn4enXswq3bviMO/FcPcFQdhdSLO34KsHlxlCAAICJ2L5YRMrF87ElTioctjqsyz0f
         1iTQ==
X-Gm-Message-State: ABy/qLatd9UqxxJE+CfKlyXocBQU3HrsaxIOKl5lF29n5S0cfV3DPavd
	4z1rO+UnVAjwJ/anmPJBNMo=
X-Google-Smtp-Source: APBJJlFWAasGc/bypjLgUL63W7kuDctXmqYZoLR/DAjWXaAo0dy91vdZBqL3HURFOU5Yhzju2q3x7w==
X-Received: by 2002:a05:6870:c348:b0:1b0:2ef7:2434 with SMTP id e8-20020a056870c34800b001b02ef72434mr18601oak.15.1690479479721;
        Thu, 27 Jul 2023 10:37:59 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id s6-20020a0568301e0600b006b93c6c97basm841220otr.44.2023.07.27.10.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 10:37:59 -0700 (PDT)
Date: Thu, 27 Jul 2023 14:37:54 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check alignment should match open
 parenthesis
Message-ID: <ZMKrcvpu3b15Hdif@alolivei-thinkpadt480s.gru.csb>
References: <ZKjeHx/zqrNIqaA6@alolivei-thinkpadt480s.gru.csb>
 <2023072729-sensitive-spyglass-ec96@gregkh>
 <ZMKDeyGaPQHm6/pr@alolivei-thinkpadt480s.gru.csb>
 <2023072741-mankind-ethics-b95b@gregkh>
 <ZMKkgItqf8r8BcRB@alolivei-thinkpadt480s.gru.csb>
 <2023072752-stem-pupil-76ab@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023072752-stem-pupil-76ab@gregkh>

On Thu, Jul 27, 2023 at 07:21:08PM +0200, Greg KH wrote:
> On Thu, Jul 27, 2023 at 02:08:16PM -0300, Alexon Oliveira wrote:
> > On Thu, Jul 27, 2023 at 05:05:03PM +0200, Greg KH wrote:
> > > You resolved one warning by replacing it with a different one, that's
> > > not good :(
> > 
> > Well, honestly, I couldn't spot any new issue caused by this patch. At least it was not reported by the checkpatch.pl. The ones that are still showing up were already there. But, to move on, if you think it's more productive, I can fix all warnings and checks reported by the checkpatch.pl and send them over in only one patch. Is it that feasible?
> 
> I would have thought you would get a "line is too long" warning, that
> didn't happen?
$ pwd
/home/alolivei/git/kernels/staging
$ perl scripts/checkpatch.pl --strict -f drivers/staging/vme_user/vme_bridge.h | grep -i parenthesis
$ 
Nope. I didn't get any of that. Check it out:

$ pwd
/home/alolivei/git/kernels/staging
$ perl scripts/checkpatch.pl --strict -f drivers/staging/vme_user/vme_bridge.h | grep -i parenthesis
$

No more checks/warnings about that. Sure, that are other checks/warnings, but not related to this, and I was intending to fix them in another patch (or multiple patches), because they involve to change the code itself.

> 
> Anyway, no, you can't send a "fix all the issues at once" patch, sorry,
> if you do that you will get a message from my patch bot that says:
> 
> - Your patch did many different things all at once, making it difficult
>   to review.  All Linux kernel patches need to only do one thing at a
>   time.  If you need to do multiple things (such as clean up all coding
>   style issues in a file/driver), do it in a sequence of patches, each
>   one doing only one thing.  This will make it easier to review the
>   patches to ensure that they are correct, and to help alleviate any
>   merge issues that larger patches can cause.
> 

That's what I thought, thank you for the explanation. That's why I sent this "little one" only correcting the check reported by checkpatch.pl related to the code formatting style. At least, as you can see above, the tool is not complaining about that issue anymore, as I made sure to follow up the guidelines on that.

> So please break it up into logical changes.
> 

The logical change of this patch is to fix all the "CHECK: Alignment should match open parenthesis" reported by checkpatch.pl in this specific code in all the lines (11 of them) I reported in my first message.

> thanks,
> 
> greg k-h

Thank you.

Alexon Oliveira
