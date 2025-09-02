Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0EB2E62B7
	for <linux-staging@lists.linux.dev>; Tue,  2 Sep 2025 07:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756797127; cv=none; b=DLEyylQFsORMGpoFbeDmmz7Jd8UQPLCFsmKgQBksBx5/oXLr56IMmL9xQlElDRYI+ZhkYp7y4FCt/qogaLIe42C+vtGT0dnhQtkDWAYDPfbsUOGbsn8NEP0FL6Rs461o1uweOa8TTqVqpn0cw8rM9OrdCSAUuIWoTAs0YvdSr8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756797127; c=relaxed/simple;
	bh=4Dj8wHzcKZ+KE+l9JlZw2/wgZaNm5SI7Vg6vhkZUvrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTv0TXKXpodO9LeBucdD/WlL7C8Ox0ACgjmUdAdjNkXV3Af2zJhbzbugoDS/mBkt7n/VB9UyFNcJ9g6iBXqCSPMh41MMRbBMIWXm1gx1n8A0HTaBI78djnktlg29tHxnPs/T5yhzeZcCUSLAObNdbDiO4PzJmrzNIErb9f1k61Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KQvjzmTv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KQvjzmTv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b883aa3c9so13891195e9.2
        for <linux-staging@lists.linux.dev>; Tue, 02 Sep 2025 00:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756797122; x=1757401922; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=leRMEPgF8RUEvULChzHRAQuhgrQpyQ/k4NKGFx3/OIQ=;
        b=KQvjzmTvWZJe5LprvE6EHx4mgjQYY0tCLjNbphccy9r00605PbxcmSJtJVC7QNVG1E
         VJv7VCIognMPfATcrk6wKmA4HPRVp7qw2fGpA1KBhdk9qkSjJYvyrGcNA2tlfZzb8aLZ
         zsjN/PkvwVY6IhI73r3n2NshBsPVY4qfrT1lO3QniQaoUGsFBf3joH06SqXaRhvv0eug
         FcR/vpnPbQU7a+D4b4gSFI9Y5UaX1+ULXbwv7OhfrdOUCx0NwTQk2WammFwwrspi3jA3
         hRNdGnI1kn8LXEN3xpBhfnSuhR9P2vvbZY/blvqYKdffaBUUB+KhANTAhZ9sOFAhemCx
         UxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797122; x=1757401922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leRMEPgF8RUEvULChzHRAQuhgrQpyQ/k4NKGFx3/OIQ=;
        b=KtMMioK964xjjwgm00HWuV0clqwgPAWzgnbC7TqKc7HDzUIEIc8fkEqGaQW7HPFWu1
         cX2n1b0rXgT57Wpmv75RujaRPcMd6fUpKvbUF9Wc7hHqrY9qX/njdR4EZtm8HfZbdw6O
         uAEmBTgcupHTjyrNUCufG7k2UTilZ0YTZRzgpwOWu5DWgmbl1xDUzBswOMu2YfYC2H9s
         m5jk3Rv5KTeRiRLnTSXHO5XO2Ed62hoBkpINDN1+3MfTCAVz/QVaQoDWZb3fCKULrvVU
         xQxNRvGUrKyuFeby7oXFP0uzo4PMocB9DoEE0plSxGlZFpRVhzpNkZpCfswq0bzVZHIp
         08CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd2tgSqHqA5e6g09Ikz0rKF1HQDfzPcthXp9mgqnup/8WAHpL31r7YFU9d0w+99GFpYeTpLgZZgyXgfOr+@lists.linux.dev
X-Gm-Message-State: AOJu0YxEhRJ71hwv2rEC0iYiI9Aud/+r2JwlG8oc1Mn1PHlKm7AT8NwK
	37/4TM4i/r4wpRZRL8zn2beWuLvzIMC+L0cVhLUFrwgEGsHUNOD09Ir3AT/WmRGlchY=
X-Gm-Gg: ASbGncsy7lHYMNw9aRYsfh8N681Ruuc+JrwzjO0Xvd6Vhfjj3p8vRbDoy250V28yV5R
	kSe8m8YIvfLjulGxEiI8cCgtQoFS4bVHhkLqh1LCJXbClt3dOb3K7H227Iumy/DWLGdqxTr+dIG
	fSsl67SxR9JRYUHbGUSvkcDN8W2jwfwWGuHhmoNMzHKYSy+Q2qCrnbIYNMpHqWNpncsxInKv2dl
	oi3ZY3wVNYYamSChK5zakpfdga731a/VJVeZ9vrenWYmDoyAkXg2SopGkbBob2dCPbaD6VAWq1F
	Byi2Dc8+Otp8IrMgyxADd5cHxcJJ4UxLrazcrUMNlktaWSVM6lQjQkvVFqz6D4jAQ+0OGlKQSwt
	Zj0FhuR4DCCNOSVzmJQkTgc7+/DeVR5Lln6gMDQ==
X-Google-Smtp-Source: AGHT+IFYuCWJOgHXp+J/kYURbVc6VnwzlfI13ByiraVfMdlwIoA3Pz1WV9KjlyYQt58VCk3unM9JLQ==
X-Received: by 2002:a05:600c:4f8f:b0:456:43c:dcdc with SMTP id 5b1f17b1804b1-45b8558baefmr77527515e9.33.1756797122251;
        Tue, 02 Sep 2025 00:12:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6f0c6dc1sm267152735e9.1.2025.09.02.00.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 00:12:01 -0700 (PDT)
Date: Tue, 2 Sep 2025 10:11:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mikko Perttunen <mperttunen@nvidia.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 19/19] staging: media: tegra-video: add CSI support
 for Tegra20 and Tegra30
Message-ID: <aLaYvsh1sCF7uF6Z@stanley.mountain>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-20-clamor95@gmail.com>
 <3643424.irdbgypaU6@senjougahara>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3643424.irdbgypaU6@senjougahara>

On Tue, Sep 02, 2025 at 11:38:18AM +0900, Mikko Perttunen wrote:
> > @@ -282,20 +411,27 @@ static int tegra20_vi_enable(struct tegra_vi *vi, bool on)
> >  static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
> >  {
> >  	struct tegra_vi *vi = chan->vi;
> > -	struct host1x_syncpt *out_sp;
> > +	struct host1x_syncpt *out_sp, *fs_sp;
> >  
> >  	out_sp = host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAGED);
> >  	if (!out_sp)
> > -		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\n");
> > +		return dev_err_probe(vi->dev, -ENOMEM, "failed to request mw ack syncpoint\n");
> 
> Existing issue, but dev_err_probe doesn't print anything when the error is
> -ENOMEM, since "there is already enough output". But that's not necessarily
> the case with failing syncpoint allocation. Maybe we should be using a
> different error code like EBUSY?
> 

I'm not sure I love the rule that -ENOMEM doesn't print a message.
Deleting error messages is fine because it makes the code simpler and
saves a little memory.  But with dev_err_probe() the message is still
there in the memory, we just don't print it.  Printing the error message
doesn't hurt anything.

But if we go down that road, we should make it make it a checkpatch
warning to pass a hard coded -ENOMEM to dev_err_probe().

regards,
dan carpenter
