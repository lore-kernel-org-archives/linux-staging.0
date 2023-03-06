Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987B720F0
	for <linux-staging@lists.linux.dev>; Mon,  6 Mar 2023 05:57:35 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id f16so8404956ljq.10
        for <linux-staging@lists.linux.dev>; Sun, 05 Mar 2023 21:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678082253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p57OV1cWt0LQcfOeYUDqj5S3ULJnVt+I3s3PkFnB7L4=;
        b=ILy5d1EF72Pkvm/BfFsati4g0tFI99CMyerI/EtpSpdD7SrOVTBOmlmfpmZlV6wyjz
         5JTgKllXmpRVAe2ccpAxeDsofWftcfRODTWPqtAxkJB0aEjCn34jWvNmL8DXwqj2viT2
         F2UHk9uzeNi1zKKTHzTybLur/uyzaRuGkcW0WJOuoMV2n3fG3N3Qqm9gPgT21ULdUpIe
         dnNTSSPzWvCialZnf++ecJKc8Dsh5VAJQAMtewGBVOfpolSq23yt2UgO0XLCa8lJnzjW
         yhDZ4wdKOmiK/25ia3CT+VQuY05PK9ucETWhIzCqs7AE1L9OBBdVFF0XMx+gXUtoyWRG
         RT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678082253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p57OV1cWt0LQcfOeYUDqj5S3ULJnVt+I3s3PkFnB7L4=;
        b=lPY+bvNorbTqbvzAlRnKHDj7VGB1wQspwyjz+tapCRNDQ7p8hIwxmwsNB5l6/0wnV8
         V1TTIyitpdV7Ue3KYtSsfEV7/1korlLIjUKl5Jph9VG5pwaOfgBJvGgldcbycA69XWeb
         /wmF8k7g81PHKEgxEnKoK5kQzYNF0Q3wnUIisxT7vrf6mrnRLgLmwV/eqZ59g1TXz2MD
         lVOqIgyu6sRjamfpX8QwETlwjlZRsujG9cx8UK2wKAZ4zYNQZ95L7Lg4cfr4L54rz0/g
         C64cnxVp602wsMFvZUSFTkI8RQWmJ9VCrY8Xm5p1kUmi6IgRSnqAvJ93yGCGw1nyevj9
         pWqA==
X-Gm-Message-State: AO0yUKWRA9eEFHaA6xNtjZx23gkhRUPUYu6LAYXgNnl+wcOVulhlwtA1
	R+oLxXHaLc5JdmN7jb9yngw=
X-Google-Smtp-Source: AK7set+YKh/bpIzYvSADwWCplOVqVDziAp2shTuQF58MRsdPSkI0CqBDys+jYzbIXE4VsBAEpEcDOg==
X-Received: by 2002:a2e:3304:0:b0:294:6ee3:eaaf with SMTP id d4-20020a2e3304000000b002946ee3eaafmr2503600ljc.28.1678082253620;
        Sun, 05 Mar 2023 21:57:33 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id t8-20020a05651c204800b00295b9d903b7sm1545109ljo.119.2023.03.05.21.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 21:57:33 -0800 (PST)
Date: Mon, 6 Mar 2023 06:57:31 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Forest Bond <forest@alittletooquiet.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Macro with braces issue change to
 inline function
Message-ID: <ZAWAyyNt0rgrpA1l@combine-ThinkPad-S1-Yoga>
References: <Y9/xXHvOAwfqoDxn@combine-ThinkPad-S1-Yoga>
 <3cb45313-209a-8190-12f8-6a2d49e4173b@wanadoo.fr>
 <Y+A+HF1vDeRIqye5@combine-ThinkPad-S1-Yoga>
 <Y+DL3O5lcMyZ/aNR@kroah.com>
 <Y+H9BT8Am4Ik2ZDA@combine-ThinkPad-S1-Yoga>
 <Y+IJgxF52lpgk0RC@ubun2204.myguest.virtualbox.org>
 <ZAVxo6WHGu3kO1nl@combine-ThinkPad-S1-Yoga>
 <ZAV7xvr3BCqByjy6@ubun2204.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAV7xvr3BCqByjy6@ubun2204.myguest.virtualbox.org>

On Mon, Mar 06, 2023 at 11:06:06AM +0530, Deepak R Varma wrote:
> On Mon, Mar 06, 2023 at 05:52:51AM +0100, Guru Mehar Rachaputi wrote:
> > On Tue, Feb 07, 2023 at 01:49:15PM +0530, Deepak R Varma wrote:
> > 
> > Hej Deepak,
> > 
> > I have a problem in sending patchset through mutt.
> > I have been trying sending to my own mail address but it won't work.
> 
> This could be because of mutt configuration. There are some additional checks if
> you are trying to use mutt with gmail. Search over google or lore old posts to
> know more about it. The important aspect is to configure and test mutt well
> before you use it for sending out patches.
> 
> > 
> > When sending patchset I think we should use "In-Reply-To" flag and
> > include "Message-ID" to which we want this to be in series to. I tried
> > both "git send-email" feature and mutt "forwarding feature".
> 
> I have not used "git send-email", so can't help you there. But mutt has worked
> very well for me. Ensure you are reading and following the instructions from
> this page well: https://kernelnewbies.org/Outreachyfirstpatch
>

So for example from these patches: 0.patch, 1.patch
how to use "mutt -H" to send patches in one thread?

if first one is: mutt -H 0.patch
then should second one be: mutt -H 1.patch In-Reply-To: Message-ID?


> > 
> > Another issue is, how to attach patch file from inside mutt(for example: 
> > "mutt -H x.patch" from command line is used to extract header and body of a 
> > mail in mutt)?
> 
> Why do you want to do that?
> Build a patch file using "git format-patch" and then use "mutt -H" to send the
> patch. Both the commands work directly from the command line. If there is a need 
> for any additional attachments in support of your patch [configs, logs, trace as
> evidence, test outcomes etc], you can attach those from within the "mutt -H"
> execution context.
> 
> I suggest testing mutt well before you start sending any patches out by sending
> the patches to yourself. Do not use any kernel mailing list for testing.
> 
> 
> Regards,
> Deepak.
> 
> > 
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
