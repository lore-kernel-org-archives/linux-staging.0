Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BDD20F0
	for <linux-staging@lists.linux.dev>; Mon,  6 Mar 2023 07:48:55 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id a32so8638096ljr.9
        for <linux-staging@lists.linux.dev>; Sun, 05 Mar 2023 23:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678088934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tU7WT2qxwujzjjMyDpG88kr9l/E98M2ObflfoXUtYXA=;
        b=KBKLoFSBRxiVMNR697rZcHI3xo8n3h+NVP0CD8K1uHKmLCOUMmjc7WOf5q9FO3rMyR
         r31vAxiiz5XvcyBUBB10cWblZVLjYYK28y3xraraatUCzKHNx2xpSfDQpVNFvit59PsH
         srJ2P43mACHUrGEUyXn9JEua5mNYY25g+FBFR+d78Ekqfq8atg+Se3lq+5AGmT05FE99
         4qtg3atwACB9yfTdEt/uQ0MKyCTEJMfYIWXm6wLBEUCIOx0nWOnON7zzgorS6GwGVZXU
         MNpnuO/F4zx9zXRIKrqdhrAhS7l6bJQoWkTE/bne4/UqHs0BGipiBa+LQHloscgJxnU+
         5feQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678088934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tU7WT2qxwujzjjMyDpG88kr9l/E98M2ObflfoXUtYXA=;
        b=6ndZWQweXOOpzJgQA9zM9flchzg4urZu+94zCscN41ot1SLbyt42rRcAEyHr0xuR2P
         XY0KKOVd4ERxivt3YaIjFcwJHsC8+Zn5ovQbthmAiw75dY96AUrbSBsFyvNSm/25M3xv
         z5AorOsR4Qx09RdVHg1x2p08k+YuIdGkyOcQBgFGmdV4Gogy62M2Y6gmhtdN7NdqTaLN
         KchnAScFbYbNDGPnFK0ZEcmsghDmDz/3ouDFk7gDdVY7fJ8NdT/YixdXRnZhjood/hZG
         tQwjBvVxjL+L6vmqPFZwmrD/klA4uYiSljjJRqUSDSObyn/TkrJLMJYg4TLtJmHXj8hY
         FkcQ==
X-Gm-Message-State: AO0yUKUASALSrwzuwSATY4Ma+AU7NTvOTWr3eL1dNoTYtlv+BLL5dq4g
	tT7gk6n2QBJgx1/d7hjises=
X-Google-Smtp-Source: AK7set+q7RqpcZDH7x+VEP8f6bJoWZhpwfLXWvPzSxlSu89UL59HkW3xgsDMYIfmX/m/hI1ROC7+bg==
X-Received: by 2002:a05:651c:546:b0:295:c3fe:86d6 with SMTP id q6-20020a05651c054600b00295c3fe86d6mr3409272ljp.15.1678088933980;
        Sun, 05 Mar 2023 23:48:53 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id y16-20020ac24470000000b004dc4becfcd6sm1523678lfl.54.2023.03.05.23.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 23:48:53 -0800 (PST)
Date: Mon, 6 Mar 2023 08:48:52 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Forest Bond <forest@alittletooquiet.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Macro with braces issue change to
 inline function
Message-ID: <ZAWa5NpBHrPhaNWA@combine-ThinkPad-S1-Yoga>
References: <Y9/xXHvOAwfqoDxn@combine-ThinkPad-S1-Yoga>
 <3cb45313-209a-8190-12f8-6a2d49e4173b@wanadoo.fr>
 <Y+A+HF1vDeRIqye5@combine-ThinkPad-S1-Yoga>
 <Y+DL3O5lcMyZ/aNR@kroah.com>
 <Y+H9BT8Am4Ik2ZDA@combine-ThinkPad-S1-Yoga>
 <Y+IJgxF52lpgk0RC@ubun2204.myguest.virtualbox.org>
 <ZAVxo6WHGu3kO1nl@combine-ThinkPad-S1-Yoga>
 <ZAV7xvr3BCqByjy6@ubun2204.myguest.virtualbox.org>
 <ZAWAyyNt0rgrpA1l@combine-ThinkPad-S1-Yoga>
 <ZAWPk12Fz0gxaqzB@ubun2204.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAWPk12Fz0gxaqzB@ubun2204.myguest.virtualbox.org>

On Mon, Mar 06, 2023 at 12:30:35PM +0530, Deepak R Varma wrote:
> On Mon, Mar 06, 2023 at 06:57:31AM +0100, Guru Mehar Rachaputi wrote:
> > On Mon, Mar 06, 2023 at 11:06:06AM +0530, Deepak R Varma wrote:
> > > On Mon, Mar 06, 2023 at 05:52:51AM +0100, Guru Mehar Rachaputi wrote:
> > > > On Tue, Feb 07, 2023 at 01:49:15PM +0530, Deepak R Varma wrote:
> > > > 
> > > > Hej Deepak,
> > > > 
> > > > I have a problem in sending patchset through mutt.
> > > > I have been trying sending to my own mail address but it won't work.
> > > 
> > > This could be because of mutt configuration. There are some additional checks if
> > > you are trying to use mutt with gmail. Search over google or lore old posts to
> > > know more about it. The important aspect is to configure and test mutt well
> > > before you use it for sending out patches.
> > > 
> > > > 
> > > > When sending patchset I think we should use "In-Reply-To" flag and
> > > > include "Message-ID" to which we want this to be in series to. I tried
> > > > both "git send-email" feature and mutt "forwarding feature".
> > > 
> > > I have not used "git send-email", so can't help you there. But mutt has worked
> > > very well for me. Ensure you are reading and following the instructions from
> > > this page well: https://kernelnewbies.org/Outreachyfirstpatch
> > >
> > 
> > So for example from these patches: 0.patch, 1.patch
> > how to use "mutt -H" to send patches in one thread?
> > 
> > if first one is: mutt -H 0.patch
> > then should second one be: mutt -H 1.patch In-Reply-To: Message-ID?
> 
> Try this out by sending to yourself and you will know :)
> 
> There is a section "Using git format-patch to send patchsets" in the link I sent
> in my last email. Please read that.
> 
> Deepak.
>

I tried it and it won't work.
My question itself was how to use mutt to send patchset? which is not
clear on the site.

I have no problem in sending one single patch through mutt.

To be more clear:
https://lore.kernel.org/lkml/cover.1666299151.git.drv@mailo.com/
at above link, you submitted patchset.

How to send this series using mutt?
If I use "mutt -H x.patch" for every patch file they are seperate emails
in my inbox.

> > 
> > 
> > > > 
> > > > Another issue is, how to attach patch file from inside mutt(for example: 
> > > > "mutt -H x.patch" from command line is used to extract header and body of a 
> > > > mail in mutt)?
> > > 
> > > Why do you want to do that?
> > > Build a patch file using "git format-patch" and then use "mutt -H" to send the
> > > patch. Both the commands work directly from the command line. If there is a need 
> > > for any additional attachments in support of your patch [configs, logs, trace as
> > > evidence, test outcomes etc], you can attach those from within the "mutt -H"
> > > execution context.
> > > 
> > > I suggest testing mutt well before you start sending any patches out by sending
> > > the patches to yourself. Do not use any kernel mailing list for testing.
> > > 
> > > 
> > > Regards,
> > > Deepak.
> > > 
> > > > 
> > > > 
> > > > -- 
> > > > Thanks & Regards,
> > > > Guru
> > > > 
> > > 
> > > 
> > 
> > -- 
> > Thanks & Regards,
> > Guru
> > 
> 
> 

-- 
Thanks & Regards,
Guru
