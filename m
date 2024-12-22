Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5883D130A54
	for <linux-staging@lists.linux.dev>; Sun, 22 Dec 2024 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734859178; cv=none; b=fprKlKSCpsj2HB2dnDAH+zi4VxwfRSBjnKguHPXxjb+7xIpDnoYOHNOMj9UMBr4mBHs0fUeXji3C2NwGw6VoRyjsKwEIt5X3gbQedkz7Cuflz63qvwThYhMp8hZ9fkSftkUGHohmbIXPL/pJ33PgwVwbbRjyUZmvB7YVz6l2AWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734859178; c=relaxed/simple;
	bh=lwTCsvXR48QIFcbi0uTIMNj9W18+iV2nZJOPQVJGIVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8cdYfuQT+36X9MgHHrpEEthFN4xknLJ6HKeSlPV9QcFS/gWnY1yPmqkfMAnWd47oDp5T19cpsKvbZInyL76EKbDCHto7C29KrE07q3Z+l2MQXOcw4x+REIMv9eupaJ640JL0W7VC/Ir/I698BXWI31Z4BrnDyMgeNfBLgmWJrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agcEjkXD; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agcEjkXD"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa66e4d1d5aso522004266b.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Dec 2024 01:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734859173; x=1735463973; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pv2LhoQ9a83s98dbiPnH5RnEeAsvfWOy8DtIJXOkHCM=;
        b=agcEjkXD8WebxgV5T45lTi5SSS7D9IUM45v3rTJpJsaLnBNu/mpiPaY5ujxCI/UvS+
         LxQyVc8AbQYsTbN2UvyBbRUB374USQgRTF23Dp7pt00atdkTzNq7yGvW9iOCq2MIMhsO
         ew5azp5LmX8sba/MRD77kwVVD2AYRO2fsT1x9Ha5QLsba7CM/wlqYw6gvK+37yBEVuMM
         WioEeKbySNiWCvOAg53s0Ob8M+sXcVej4G0FQtx/JHrqJl+9d2Jd6FPyHF3AtEOLpCCW
         eMISE35wk6V/q7Q1oF30mJxkHdvwF+aupzgt+480DcnO8CJSdwZX/MkTe0bqe76bA4ZE
         RblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734859173; x=1735463973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pv2LhoQ9a83s98dbiPnH5RnEeAsvfWOy8DtIJXOkHCM=;
        b=Xb9hN1LRf1/xaTOu4Wgm5hohvW9lTaGlkOe/942KschXLsbKIWGP2JZYk0an+M1k4H
         v6J6XgN8hIZHmfeCjniLlT2XSJwRff5TMQf7d8oRd2/FoV+mbBjQica53SQI3AR+xkYW
         /IzLwvFa8XJPL8umLPJw0BRbyngOCnCbotHVP40UfFCA82ky6s+Q9p0nc53S++DBV6uP
         QZc4zKCyzRbk4DSoipv393a54eIfdvw2irIML1Hx53dkZiJlDDy8fqnANXptHnNbotfv
         B3kCkib4xG+kwgUli2gTfu2xiURjSCTMsAOwJY9XJGPUy+8X0kuPNAwjgE2dRY++nHV8
         fBrA==
X-Forwarded-Encrypted: i=1; AJvYcCVX+uPKO3j8O6+WVNqWzeqCeJYOLfF3grFkV69N+lvw76H6io4gnG0XGnjHTDwMaW8zgyGeQbny1OVlqWzO@lists.linux.dev
X-Gm-Message-State: AOJu0YxdNBZZJv7hzkM1v2M6V6s31sx21GpXa9xr2dJleQEi7ldXQf9K
	RX0mUrQ6nmZTsg1aEpuX7DK1ZJ40Y1bIC+cIQ50m/E7FjnOkuZ1K
X-Gm-Gg: ASbGncsTeHJ37rTYWoYsFRynrgEsdWom22hA2/FmFtOfCNragYTTffer+TNPlqlUBwN
	0tXpLOhizyuBa3rdJd4XiVyCJ1adVxYYe0U3cbr1hS6Q2XK7l62mMI51eUBZ0z2soKr1Zxo9MMQ
	5nhjR88vdTfOjOPC+HN5vtfpasdB6lqt0OiGVxCFeixsJinNkeMd6PTVP5KJctBRvQ2e340kYIM
	yFOR0bjACQ72BgZXZ87jSE+Eg3ZaHBXwLyrJxgCJW97japMW45/mq7JGaKWeBSwjVAH4JRr
X-Google-Smtp-Source: AGHT+IHiWQ9hq87j7hXmIKd3v/a0Fs89hk1J2Km9/tLBNVrPl8JLfvm86yU3IGTUohkt2AEmUuVZFg==
X-Received: by 2002:a17:907:7f0e:b0:aa6:c169:4e21 with SMTP id a640c23a62f3a-aac27028286mr752417366b.6.1734859173373;
        Sun, 22 Dec 2024 01:19:33 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4988sm373058666b.124.2024.12.22.01.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 01:19:32 -0800 (PST)
Date: Sun, 22 Dec 2024 10:19:28 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Antonio Riccio <linux@ariccio.me>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Rename variable ValidAll
Message-ID: <Z2fZoGCf6WGUunGI@egonzo>
References: <Z2cekOavt5rTukZY@stream-circuit>
 <2024122201-uncivil-footnote-f584@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024122201-uncivil-footnote-f584@gregkh>

On Sun, Dec 22, 2024 at 07:11:40AM +0100, Greg Kroah-Hartman wrote:
> On Sat, Dec 21, 2024 at 08:01:23PM +0000, Antonio Riccio wrote:
> > --- a/drivers/staging/gpib/uapi/gpib_user.h
> > +++ b/drivers/staging/gpib/uapi/gpib_user.h
> > @@ -114,7 +114,7 @@ enum bus_control_line {
> >  	ValidSRQ = 0x20,
> >  	ValidATN = 0x40,
> >  	ValidEOI = 0x80,
> > -	ValidALL = 0xff,
> > +	VALIDALL = 0xff,
> 
> Why are you only changing one of these?  And are you sure that these
> values aren't coming from a specification with this type of naming?
> 
> thanks,
> 
> greg k-h
I prefer that we keep the camel case definitions in the uapi includes
as they are for now so that they remain compatible with the current
user space includes. Over time I will release a version of the user
space includes that provide compatability definitions for the
checkpatch clean version of the uapi includes. This includes the camel
case definitions and the typedefs. I will submit a patches for this in
the new year.
-dave
