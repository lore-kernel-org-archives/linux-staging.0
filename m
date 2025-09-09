Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4344527147D
	for <linux-staging@lists.linux.dev>; Tue,  9 Sep 2025 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757419044; cv=none; b=A/ea3EmH7MvSQttpsFQcY7h7rgxPH7B3t7PCfItIO4BWBwafiNVhTmZF64FxVI/Fl5vRdcfxdnh7c7/yod4SZytQG0pm92K1OgbB84IO3uflvqo5P0IYa+xA+Llc6lhDgAwA7nxdR8K663KSkeYWmHjHBH5xz3mS+SmnaA9HX8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757419044; c=relaxed/simple;
	bh=yuCDpFi5rbOpE0JK/zNBJ23ZkC7xxv42pAHKzW27gjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5rc1VANupBtjS5P5nhKEDK3qE5uKw893axzCvtzN54NLmWG1GIkQpRm8lDNyKZaOcLUUD0EkI0vdqbWoP4Z9v8nVTdoeYhFKg1/8d0Dc/D2zM/COFEhUtOc8SQc1RJqhVzj5OW78nM7UaonShbgyLkpwoLPwpOLXq8725MWZQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+SmLLwt; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+SmLLwt"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6188b6f7f15so6119430a12.2
        for <linux-staging@lists.linux.dev>; Tue, 09 Sep 2025 04:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757419041; x=1758023841; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yuCDpFi5rbOpE0JK/zNBJ23ZkC7xxv42pAHKzW27gjI=;
        b=a+SmLLwtjQUFsPCP17LshhRIBeKrPF74UXBrIceg/Ek1hD6h3nzeJgafPD6BWzM9zy
         pddsfU9JrHFdg2mOayqYuHudzB32+5sJY5Vr05vVo4kE8MWG7X5E1yOj9rTdxJBN8/xL
         H3+N6d5gdOVP1TUdtOL3qRNFXJHyG50j8OAsPS6seaFdksqZ/JYu8kjBwonLJXW2DKPt
         dZNzhW4CzOkdk93oH6BIdeMLn2vbenaU8fIPXnwJGMY5FssYQj2HflbG0lh580kXliRD
         s9TBx+vQgqiXzPS2xSpKAY2j4VCVYjsAybJZF8BSf0yeFsb+1xPJZ9h4Iirpk4fDN0ud
         h0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757419041; x=1758023841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yuCDpFi5rbOpE0JK/zNBJ23ZkC7xxv42pAHKzW27gjI=;
        b=RGmPoxody68vAj3iDYZriFJrBRmArHbcyrOKTOXOpQuKDk4JoCjUNJ7M8iFXQVJTps
         wnWOAmt0Xf8jN53ZQBPTS8e+PEBwvKkuTzJRqc09Ni56uO8kg4mgYRiURbJpeaQQCgun
         mf2rOZUAdZsQJwLcGs+JSkWN1jS/KC8ODd2UopngpywEvpE54XI49il1To4+aMn59+dH
         KwVIuwdyE6BNDibBOmj/BBR/97KZd4/3aPsxRLo7Mp1accy1wltNSl152wfMAnAADnH1
         Kwk+wdp1N64K4SxVegv/9N+DLI+gdGpKdwQawMt7VuYZAk4zmbxKh4/oJdHJYEO7TB9u
         Q+ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWadXcfpaypm8fCyAhB6gCbrwKAncNw4kw5XArvGDH53lxMbczaIVFyO/YULwK2bH6O6h7dFodq8zYihYr6@lists.linux.dev
X-Gm-Message-State: AOJu0YzJrOZ8va0IDYa3IUWk0lnUEEDclfQNxyczbG0tZ1gLcp+Whj0X
	3HDLNwWh+lFKX0V3RocJijeF0aWcsYIBTnhXEvr87sUKrNJVjxOH8ru5bHuDWX2/iO5adowXMLG
	109VOXypKSnAjq1NAGykkRv4eclW8kMM=
X-Gm-Gg: ASbGncuvS2nSET/4XbyuQQV71ObCMlUozwZIJwHmh9hGswonmUJ2cCpX97TRltRHz1U
	DhfUjg6j+rU02w1wjWd2GX2oLHlwtlL6gpa00+G2hL4d7bZxVd4Y8/lO/MlRQRQOe/BDPuhYqNo
	CQ5KP+oMyxHXHm7b+IqPBHgbKvxu360M43x8wasuUc+hwJx9PrFdawna1K9uZliguDRpjSxKDK/
	SsFd5m4KiW1a5N/vgzjn+r1ZjWO8w==
X-Google-Smtp-Source: AGHT+IFWzr+q68gGxYAFoeb3uI8/O6WUTRKkifzdIp81TCMsGZWVR3LYvNL8bjLQ9XMbKBsOaM3e8t33FBxcTQ4++NE=
X-Received: by 2002:a05:6402:3511:b0:628:1503:e02c with SMTP id
 4fb4d7f45d1cf-6281503e1cemr6478837a12.2.1757419041365; Tue, 09 Sep 2025
 04:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
 <20250827-vchiq-destage-v1-4-5052a0d81c42@ideasonboard.com>
 <731ead88-8dc9-4032-86f5-7a2dd5044b22@gmx.net> <175690685574.8095.13306600513284108529@freya>
 <0b9fa19b-195b-4bee-8f51-6b00ff2fcb6a@gmx.net>
In-Reply-To: <0b9fa19b-195b-4bee-8f51-6b00ff2fcb6a@gmx.net>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 9 Sep 2025 12:57:10 +0100
X-Gm-Features: AS18NWA1T_AOrlXPyZD_b1ewqRjcdGDJaWojtfrcUD5zfFVI3yE7LhbqooWIwow
Message-ID: <CALeDE9PQhYvGXOWE35EZG-e=7HCTRCw9gt7KhtuWUxMHVz_--Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: staging: Drop bcm2835-camera driver
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, "Ivan T. Ivanov" <iivanov@suse.de>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel-list@raspberrypi.com, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hey Stefan,

Thanks for adding me to the cc:

> >> Am 27.08.25 um 08:24 schrieb Jai Luthra:
> >>> The bcm2835-camera driver is replaced by the V4L2 bcm2835-unicam driver
> >>> that is already upstream. So drop it from staging.
> >> AFAIK the old Raspberry Pi Camera V1 isn't supported by V4L2
> >> bcm2835-unicam. Personally i'm fine with this, but this must be clear in
> >> the commit message.Did you already talked to distributions like Redhat &
> >> OpenSuSE about this step?
> > As Dave mentioned, the OV5647 should work with V4L2. I don't have a sensor
> > with me, but I can order one and try to get it working with the upstream
> > kernel separate from this series.
> >
> > I did test the V2 camera module (IMX219) with my series applied on top of
> > upstream kernel, and capture worked fine with bcm2835-unicam, so I don't
> > believe V1 camera module should be an issue.
> I was in holidays the last days, so I better reply to this thread /
> context even there is a V2 out yet.
>
> Yes, this explains the technical part behind the motivation and I'm fine
> with this to speed up unstaging.
> But my point was "Are the users informed about this step?". So I hope
> the extended Cc should do this job at least for popular distributions.

I was vaguely aware because I randomly read the lists.

The last I looked there's still some missing bits stopping the unicam
driver from working out of the box upstream. What is the status of
that delta?

Overall I'm fine with the old camera driver going, it never worked
particularly well upstream on Fedora so I suspect overall even with
the missing bits on the unicam driver I don't think we're actually
worse off, but it would be nice to get the last bits in place so the
camera actually finally works upstream

Peter
