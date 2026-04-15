Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0061D346FAA
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 13:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261055; cv=none; b=NdxYCCReyx8wv0lopkJ/oe7a5dlcRHkRcAzE2bQ+qjYErESgl/Y7qNFE2J6uRTgxlZCnUmSGI5Iiba40+WXULIYwGSsGXqAupU0OQQo3a8pjOl+i0iLHDF+8ISOO4Bp8ek8dcUWzN8dlHohc8Mln3Ro9IsjPJ8vSQu43OE1iVAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261055; c=relaxed/simple;
	bh=U+487OhLQwbQGEC3o68c/Wqllc2+HlIZTWx9rLHz0dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaU46eDtC/wY54LsvfkMZ1/DjoOMwLHD51H5zeKpnWsAfH2IWcqP+XvzXF6dBH3NfWeCf0j1nVGk4wyZJ3Gj2JndbN43lGtftnaao/NTefSAhNGx8inVZoyqvsOu4IB3W9dbO134ZUo7bRMGjTZdWxOFskAqeU5Iraob2O+mQ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nw1vZYmU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nw1vZYmU"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4888375f735so67890605e9.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 06:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776261052; x=1776865852; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5iMq5QYtaU6w73NtEmcRCL+AaB64xZ7+QY+pdlA04L8=;
        b=Nw1vZYmUMkUM3KX1al1s3FDSu3bc85ENzczW3+T+l4+0QWnZfK4FqsoaEow0rxEgtP
         SkWtDS3Qpp5EeTrJcvJnoe7MjKvwCJZYT9EMIjkQG2eScovqJRsOE2kl3MSZNifisaRX
         meRMIrIM84p5cUrJ/4ivdy+PEfQ+T8oc+GnmnDZ6dmQViHbtlRSN9xS2H+IYoZ8rbvpA
         fs/PQ5Tes4dkUwF4f57ou2iQZ6k7R5ucd1Lyvz50KlS4WdHARSgdK7hVTFp9EOK9rneU
         hyCVhMIwgqbFvzGu8uI/FJr5XEwCXkFK+Ro03ZCA+WJSs+z/SNKFeqwXYFAlpoGLeXBZ
         yOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776261052; x=1776865852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iMq5QYtaU6w73NtEmcRCL+AaB64xZ7+QY+pdlA04L8=;
        b=CQ+F20c7v9vwKxldITCh/Awa/PRcEp8JlSTeSgI/bmw7ymBw4CKJieeQabdzpKD8ZW
         TxBIRYYd9YO4noa3EFNm+SAn5SLiDrtSTLhG7Ed/Q8SZUPFNjWLpI4jOpVCgWoJCbM3x
         TIlWtemd16VLRZoNnnNUGlP82Z712LNRpIEZzDUYpnuHbR5GKraXC0rY2xObgbeVQFtk
         rZjCJATk/3c+i2obWfoXcjBehJ1XqoGt4DUA4i3lTW0M5pZaVfavVbY0grroOyzQtJUA
         xAJWXgYeNnoW/qWdv62bqbSOGOTX3J0v/4+6oQEjyMATzAzXJnYFtPfezxBD8tjsntkT
         oHbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/h40tDGCOG9DvkOOafnO+islNGLR5aRE1mFMGgwayW43PSkEJ8U7U9mHRgJcB/+Shy1bU+cCrqBIJRoAne@lists.linux.dev
X-Gm-Message-State: AOJu0YxFWSCiV3P13mXP367bpaVveb7IqXkxTv2voYJWMGRH9LRB9src
	YP4zQAFX9nR1yizsh+BLZ86tO3TH7aMIrxqN132m6xL5uyHzyXBEBp4l
X-Gm-Gg: AeBDiev74q3garwuD6EGWexmqHJrpM3l37qzuHmgtJY4v1dhFzTB8xYAWdKIA9itycz
	FkV3ZtrrbXdRAcK/ideGUEboUX8ihuFN4q6WH+EnNtJsdZ/J+OqXK27N+RLU9ulwhxzLpBvs4wk
	CN6Us1qMpIlIiwbD8doD4SSwnhr/FK4sksviZbULv73/A1BH2l4XEAupSjm5fVHT0pelf/hM+/Q
	Rk7MjsaWLyDHG+15N1mScuUGvyZjRYSTB9ENsmxIoFABXCUyIFjxIVRzahpVRANzV02QPwp/ZcQ
	BoEZSR6CNg30PHPpreObtZqLEKCIP9QV6sb97uVWOdPrvm7aJJ7unnjQXQd4tnUI4A6HvU0HEq6
	34ntoNbfcozuHnno4n6CQhdUfH9LCGvortxYI4BrUvqjO1s0tWL94G2nPAB4o1u/830zrNTV8TY
	yWIRk9FCCBQkQf80sFoNvEITTjoBmkVg==
X-Received: by 2002:a05:600c:45cf:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-488d67b8dddmr284879105e9.6.1776261052201;
        Wed, 15 Apr 2026 06:50:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f092f66fsm22778355e9.1.2026.04.15.06.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:50:51 -0700 (PDT)
Date: Wed, 15 Apr 2026 16:50:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Max <m32285159@gmail.com>
Cc: gregkh@linuxfoundation.org, tsbogend@alpha.franken.de, len.bao@gmx.us,
	yoelvisoliveros@gmail.com, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
Message-ID: <ad-XuNMor_ORjyOt@stanley.mountain>
References: <20260415122939.77847-1-m32285159@gmail.com>
 <ad-FcZeXsFlSPXQj@stanley.mountain>
 <CAKqfh0EEvEwF3QmgtNk2znsaamGFCc0muGjY3zsH6OogsZS8-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKqfh0EEvEwF3QmgtNk2znsaamGFCc0muGjY3zsH6OogsZS8-Q@mail.gmail.com>

On Wed, Apr 15, 2026 at 08:31:10AM -0500, Max wrote:
> Hi Dan,
> 
> > Presumably the "_e" stands for enum?  Ugh.  No.  Don't do that.
> 
> This was because of a struct with the same name, provided there wasn't
> the "_e" suffix.
> Just curious, what name would you prefer over appending "_e"?

I haven't looked at the conflict.  No idea.  Sorry.

regards,
dan carpenter

