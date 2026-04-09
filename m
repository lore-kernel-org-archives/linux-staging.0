Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559293D566C
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775749212; cv=none; b=Z6DIgcz8UwhQn1P86Ac785t4QT0w7JJ/wbCk7VZt2b+7FUXzOE33Op4mBJN1EdflSyZd6muPNNzWGDzusl/j+jvfp0jkkOP+WbdBt0BLNwzqaLOh13l8WowKI03JRATwa2z/4ToFo2aP2uwxAATYkSKqesCqKxwvh8sYPWPiDmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775749212; c=relaxed/simple;
	bh=m01D5uUlULcLHu82o9r/bblMXDmMYdHSsuoFeyy1qrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPx18FYnWK4xXGMSuv0JHKvOnfg0xfobu36T30vu9hsfX6h4WbvRLtOgmF45LgucLlcIB7IKJkd5g3Tjl+UkOsmz7G4zLky5GXZ2doUiQxfqgORUzCS7zNDJhuGL88Hi/VfgRGQKtjHSH1yihr9AOyeM5ytdLUmkBEEQ4K/2NIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/Zz3YX7; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/Zz3YX7"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c74244dc0b3so655266a12.2
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775749211; x=1776354011; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jsq/PGp8jDRD7QMz5PcPe7ew5/viULm6CdvvLEJUNXo=;
        b=M/Zz3YX7Js8Zd6L5Pn3ZlCC1xEYK/DMidTm9ACAlmB6wXXRSOlnPsAeLHTBNOwIVGg
         i8BQ/a+vUBLTmF0DrED1bIewKbA6GD52Bk9gGKgqNPT7ukIPV2aXd3zXCvR6yv4Iz1bU
         kfC1h2twTS92Bwg1bDAFM5KONh/SSlReKzSkn9yg9SMSwicwcTWDTqe+3lvpC2QyfV1a
         agSOP8HHwVw5H4hA9vkrdBWjtj8JUBaNiP0kCJABwuw/8WERCXQTTujLe+N2gtCrDJHp
         oHTZAHbTpnXpeQYws59at08C88/nKqN17tx+grLX32irPuvWO02d3uM3wg+YpDTWRE+5
         gZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775749211; x=1776354011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsq/PGp8jDRD7QMz5PcPe7ew5/viULm6CdvvLEJUNXo=;
        b=HCp/UUBmiIoLUi6NKerqhGn2WcnY4jE4NnvNXO5VUoq72vOdtkoSmaCGlQ4goWMZ/r
         GAN2TayWEb0Ip2d3sDx+T/ogDAkLxu0mHY1DjxanjxLEFVLXP8TIYOkPGsFj4k4HUyWK
         MeqMgeDyRER6/ZnGtI6zxRc5g5hHpqDrItN2OHmKkGH909RCw8uOu4QyyYiFoXYNlqr6
         f+YBSjcDATmkC5qjpuiP61kYFxMfIJFLglLMOE2SiywlcM/iAdvTSLvAztpJi0gAMHz2
         +4FaVRMkGQmyrz4M4n/8wac+fAVQwPcyjNZd4gVTbzYaOizim+BH+5IRnyhlnZYLrFNi
         09iA==
X-Forwarded-Encrypted: i=1; AJvYcCUsoZPxwyMrn2+IQIrLmr2tW7Al/P1JHWPibN8VAVsEIidz4V9bZyMt5s8TMXXkoEb9LXUPrL23GI/Q3MMN@lists.linux.dev
X-Gm-Message-State: AOJu0YzQJPTS6v0CJptmqIuMJ7hnxHKjtTVpV5F9C8zNcVetbuR6hLQP
	KBDxiq/TnqF/ku47weNYlV4mwzn65VD7pQNrO38rWBQ1NK5L+Uuh5B/H
X-Gm-Gg: AeBDieubTjCvU9N7HKkPoPjdVocHrncFw6lvoU52GNhrUZFaA+BD/FvDBqN363ijQID
	fr83Xb43DJyLMIayxILsSD+FrF87qp15jHS0ZfIt4hOz0ZIbPf75gE14D9g+A8ENYpDVLpIGiya
	V7zrmofEgMBgxNPtSsVS1fbyspQ2iFszcNxmAQTte8ORkIS5kBNNLAluuq/hlbgyJnze3M1X3EG
	XlffUWFzctlHVPJRk3XFKDnyXiDLINomxvdpzjynu/DtPv2DVO7wadhO2JBWlJr3qYj89XZ4733
	0hG/V4BM8fOlluWk8QvWWVVyzur1fXuyN/oh6HV5RhwjG1v7EwFfWgY2xFLvSkWfedagxgEK+nE
	oU1iK7o19yuWODH+Qum1BaSMzkdf3HCsNT2pZf2cAOdjDriT9ShuO+MtshU9Em3CK/qQfZqIzzT
	xZBFWRKO7DvCzvN2qf/Z+dF5A=
X-Received: by 2002:a05:6a20:7f91:b0:398:71f2:59d8 with SMTP id adf61e73a8af0-39f2f1296b9mr27793739637.56.1775749210397;
        Thu, 09 Apr 2026 08:40:10 -0700 (PDT)
Received: from inspiron ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6476a81sm21852991a12.7.2026.04.09.08.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:40:10 -0700 (PDT)
Date: Thu, 9 Apr 2026 21:09:58 +0530
From: Prithvi <activprithvi@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>, abrahamadekunle50@gmail.com,
	b9788213@gmail.com, straube.linux@gmail.com, tmimiharoen@gmail.com,
	filippo.muschera@gmail.com, ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com, rayfraytech@gmail.com,
	david@cardinalsystem.net, weibu@redadmin.org,
	dharanitharan725@gmail.com, ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org, karanja99erick@gmail.com,
	khushalchitturi@gmail.com, suunj1331@gmail.com, s9430939@naver.com,
	nikolayof23@gmail.com, bryant.boatright@proton.me,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v4 0/5] staging: rtl8723bs: Code cleanup in
 drivers/staging/rtl8723bs
Message-ID: <20260409153958.6wmjiu4jcghtyeom@inspiron>
References: <20260409135026.137904-1-activprithvi@gmail.com>
 <DHOOTLM62TV2.2JOOAA5UQG410@linux.dev>
 <20260409145045.44r4f5bleklkk4ha@inspiron>
 <2026040942-slicer-rake-4056@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026040942-slicer-rake-4056@gregkh>

On Thu, Apr 09, 2026 at 05:02:16PM +0200, Greg KH wrote:
> On Thu, Apr 09, 2026 at 08:20:45PM +0530, Prithvi wrote:
> > On Thu, Apr 09, 2026 at 04:18:28PM +0200, Luka Gejak wrote:
> > > On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
> > > > This patch series focuses on code cleanup in drivers/staging/rtl8723bs,
> > > > majorly focusing on fixing checkpatch warnings of constant being on right
> > > > side of test in comparisons, deletion of empty if block ,use of
> > > > read_poll_timeout_atomic(), and other code simplifications.
> > > >
> > > > Changes since v3:
> > > > - Rebased the patches on top of staging-next
> > > > - Remove compilation output from cover letter
> > > > - Add changes in each patch version in cover letter
> > > >
> > > > v3 link: https://lore.kernel.org/linux-staging/1D11A73B-4869-47DB-B8F5-FB3F0D7FF932@linux.dev/T/#m3190af744bc1e1f151e9e8503c7d20951fe27534
> > > 
> > > ...
> > > 
> > > Hi Prithvi,
> > > this seems better, but I have one question. Did patch series appear on 
> > > mailing list to you, because I cant find it and my emails sent today 
> > > don't appear either. Not to be misunderstood I don't believe this is 
> > > your fault but I would like to know if you are experiencing the same 
> > > problem.
> > > Best regards,
> > > Luka Gejak
> > 
> > Hi Luka,
> > 
> > I just observed I am also facing the same issue - I am not able to see the 
> > patch series on the mailing list, no idea why :( However I received the 
> > sent patches as well as your reviewed by tags on mail but I am not sure why 
> > the patch series is not visible on the mailing list.
> > 
> > Shall I resend the patch series?
> 
> No, please wait, lore.kernel.org is currently having some problems.
> 
> But next time, trim your "who do I cc:" list, as it is _way_ too big,
> how did you generate it?
> 
> thanks,
> 
> greg k-h

Understood...here I used all the email addresses generated from the 
get_maintainer.pl script. Next time, I'll be sure to trim it down just to 
maintainers and reviewers.

Thanks,
Prithvi
