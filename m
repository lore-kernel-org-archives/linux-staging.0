Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18E52343C7
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743592853; cv=none; b=ZxI+AXv52WXyDo14OjLi3FOE09tkaigIOXFn5xQfc4ro+ogn08Vfi7VucV8aBXS8v8RzgHYB5NLdwW/5yjsyTQ8PzQZdAUVgVPvk2V+vt0pbFM8m2Ir0BfhlAxKmWOLZPGTl91lANnDjvHzSQT1z4Ou1B0QuBuNpxKYhoEt3ZXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743592853; c=relaxed/simple;
	bh=XqrqN8nPpf+6rXqYVdfm+eKeYixj/LZaQPS9VpMMYhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFGQianAaRHM21AG474G2JvnrbS3Pc4t7Pt0QN93O6saTEQIhs1PhjEGZCeeQKJrqpd8jqTyVNeAIizbO+oMUFg3XXWRu3/6GeYHGXIqA8tC16iFVNUpmz9rAfPxnwQ2ARuEqn1r3hlOnRvPAGC+tv8cSRPqpyNTi52ngHqhIfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyPj/Jpm; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyPj/Jpm"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4774d68c670so85717791cf.0;
        Wed, 02 Apr 2025 04:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743592850; x=1744197650; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJfI3KQNmYoBOgkvBWNQRM8I+8oVOhYb3y1OZGqHTSU=;
        b=JyPj/Jpm1szEN6dqyob400fBjOzF1I6nvfusWoh13DmzMD6g220pyOwj/RNo+J1uqn
         9BxbjYQuepYr4Np93cp1opcbI5fT8TPkLtBdWCpY415hCbjGPkLxsGKuQwiWIKeckrN9
         e1z1QgLl4HZHAuMdzqhlUMg66E3subtApFW7Ji7M6+gVrRGJs2TrbnoDiUN7Js1myxaH
         iCqrKErZp4nkEfwbaaHBTaWpF7DZllRY0HAx6SVOqBnFclTA1PdK8ceKHkt3bM8Lfgtt
         vRC00eZdbxaJR1gMM5FT1ivEw8F7pdO4ss64plzb/22WwHD3G+Ek/BXv08E+BLOzrP4S
         ltbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743592850; x=1744197650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJfI3KQNmYoBOgkvBWNQRM8I+8oVOhYb3y1OZGqHTSU=;
        b=XL8ypX9D9AhnLSl9h9rhewv9d2PV4uJF0UIrZfDEXAts7Oc2dAJ5ak9qgu+ooUyxkS
         +rIL+0ZZG4dKcHoWGgYC+ZBkZSRep2NCf4K8tNPMmvcp2sAVWNiBBHjSJbGFF6DtXs2l
         teQOFsyJJ8OsmTOPZfRMgW4eaAeqprYA6K7eHsydmQvq+sBievR49iRZbFzJtXAWIPH1
         QRB5kRa7p0/V2zww/6C7rPIHhSwbgXnETPROwrC6yaFAgsy+fgtNUwj7+/Qwc65Lqn7v
         WZHtjLrz7Ynn6cJYqqkvY+Um030Wx2T3lqh9WEqOUGvLJE3qtMPiP74J8FDJOh/jJbXH
         MjFg==
X-Forwarded-Encrypted: i=1; AJvYcCW7HT6HdqUnq8MDh0jTnrQTz6uDW2eYtJSZ6nzoIKsRnOOSI5R5+deQrhfV+6tIFuof92D+KWnYf5y1Cv7mmg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yye+W4jyKIK4+Wt2WbgNVP3P8mhzyjAsxf2kFAt4wNtojoBHSrj
	r/+COhSRcV6/XBPgvDMz4LFPot+mufkFA1UKlXRHOskHwa6ux4f0V6mAm6MlzxxSMpCzhDJbr5B
	9JizPEyjCDge///wYpdq5GpASisk=
X-Gm-Gg: ASbGncvAZ2gKu5N800rpOilbtJbqZjlloG4vEl+LeF3sgv6sqB/WayKAANMEXsEJCOJ
	UquiFhmJVDxiWKf2EKPernIgBw6mZmNP7QLaB1/vecodjE2brX8udYCG9CEl2B3A8CLIldgVMoQ
	+qh7v2anmUel1fxH3d2oK85L3GpTsuoyYo63Gr+SfwXBUJy9JdbULYOlSG
X-Google-Smtp-Source: AGHT+IEzgm5Sgg9rIS64YHPqyl2jwV0x2z9yc9P3o00P3nftXrs78z0AVxZhQ/agGkbhCI//FQWotOu233LqJ5pTtlU=
X-Received: by 2002:a05:622a:1882:b0:476:a03b:96e7 with SMTP id
 d75a77b69052e-477ed75eaebmr176911361cf.51.1743592850414; Wed, 02 Apr 2025
 04:20:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <67eccb67.050a0220.dd435.b100@mx.google.com> <2025040207-unrelated-aflame-bf70@gregkh>
In-Reply-To: <2025040207-unrelated-aflame-bf70@gregkh>
From: Gabriel <gshahrouzi@gmail.com>
Date: Wed, 2 Apr 2025 07:20:39 -0400
X-Gm-Features: AQ5f1Jol1T8yZOWCn4FoGfuVLOh9GAvg71gMDfnVIX1f95n1Rnier_SWBdArHw0
Message-ID: <CAKUZ0zJ5pMYNxsM+h8MY9gxsnW=rFjBCBjEoK8k+cUdV+5rs_g@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Remove trailing whitespace
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com, 
	eamanu@riseup.net, linux-kernel@vger.kernel.org, 
	kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 2:15=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Tue, Apr 01, 2025 at 10:30:15PM -0700, gshahrouzi@gmail.com wrote:
> > >>From 3ffe31ac00fdfb94ffc521d8ab0fa60196e69c7a Mon Sep 17 00:00:00 200=
1
> > From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > Date: Wed, 2 Apr 2025 01:22:59 -0400
> > Subject: [PATCH] staging: rtl8723bs: Remove trailing whitespace
>
> Why is this here in the body of the email?  Please just use 'git
> send-email' to send the patch out.
I used git-format to generate the patch but then used a wacky method
(a python script that tried to do what git send does but worse) to
send the email instead of git send which attached the email header to
the email body. I'll switch to using git send-email.
>
> thanks,
>
> greg k-h
