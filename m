Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3363A423A66
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 08:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476268; cv=none; b=W+i47kjfsyOcvhOL8o74y4uUmsnAdh0wtznuE/2WFnf0ijMXbUf3qRJdSPlA3e1Q2bOn8W+pD6H0FDXhxql0M76OFoLveizh6l7/qWpHraePWPQvT5g3OBEIzL6vHjfW8X09UKkl2+1EhYxh+ohY67Edp2gv8tG6lQMALCB4xIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476268; c=relaxed/simple;
	bh=Dp6GaLUMU/0OFm0EzOOoA+XXDyAvET6TUnjHrLveOTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0hPLllyzymd/HAuywZ48Y41O0aKQVQyG4tHnwuIQCmrx78az1fVC+ZGYSeLU0mkNcCfWEEK90GMM0uK5zgbrN/wOPsnKRhg44OqZRWFhc/oulrYq5GCUYqgiKUhzUcJIqd82f74dtHuXE8DtUjgeL38ItIC1xfHQQ+j1rODqOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LV9ewN4i; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LV9ewN4i"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b613a17bso6233125e9.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 01:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780476266; x=1781081066; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vdVtFAD1SffENzZTndgzlq6gODyL/390DZ1mx/KKFo8=;
        b=LV9ewN4iepwpcNAjfYuIpbi89Yi7YjxVr/A/6reVoJNEaOYJfhcyVjzHZ9u4JZgrB7
         B1kfaYjLagkxF5o7Lo26I8jwkd7lnMODFF4j7ya/kQOv2Kssp4WWK4skYijUqMz0Ymd8
         8fl7lP8+U5aSKb8Oz5/ESr+9ZyEGvFMe4h44YA2WdQXPCMStBknzdUXucrSj87On6+b2
         3vUy6gQ0hGwSsVRit+P62otI5s7Hd55zJdyl4qmW5OLgATGgHI+jKwMk40fO8VVwo2Ak
         HZ+3O6peCVf+CNKyYc48LWzsS429OEERgLxI21nUT9AdknBuIO0R9Jfj3aToPxJ3w0wg
         v+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780476266; x=1781081066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdVtFAD1SffENzZTndgzlq6gODyL/390DZ1mx/KKFo8=;
        b=H0Bhe6h8SOUmmgJ7PYPCwa6qDOocaIxC/DXpTwFOLhtsHYumQdUWmuYdHQxNGPND0L
         jeWRwDyXjF3jF08IOWel+W0porpsYBIox8iJnXcGlMIjFxg0pur/r884D4pv7PIpnJv/
         f5IwGnI8IeVWWKSTnF0A6GlzH4AS7mEqn4F9MLPpTTbKqDqQ6KDShshNIxtVcWeb7v6b
         HxjRr9vXdhNGazHGf4/MtTXEI1rSqPvhsc4TLElaoOzMEiuB0jCwWyYTXUElsJbqy5QF
         7TtKj+HB/vTlZkP0AQKEMIPTtfJOTHBM1/SEuPlPJ1TPXJcgfoEN1uGGerZEEO94lslH
         oQyw==
X-Forwarded-Encrypted: i=1; AFNElJ+Y5MpjyHpJ0mEd7lSz8YgsmGFgiqgGh4J3sCJ3Sc/2rKhAFdD0zeSpabd/lp7cjNOSNZjbvzTRM60BDbUn@lists.linux.dev
X-Gm-Message-State: AOJu0YyL8j8SFYZ2bsYoIXMlHC47+fjccvWf7qzOs2+7+XzwdMjlGLYd
	3RbMLemmYC87X+j9wMx72WSiguCywbZo2P5ZDmbfLVCW0zT+n94Jsu9d
X-Gm-Gg: Acq92OEgTiHoIL1t3h5JT/PTIZz94M1c4lDVK0gpdfSgrHvkzt4Zt1D/CKn9VodgQIl
	4TVXzu1jwb1rH0cYr+wn2oQzoSyncUmI8MTvDAeCsLgwHzSf/lYLZ+8lM5MI+38LW46WzJc3U0l
	tgIK0fffMk1Tgizmri1Z/SjPK9QrkiyFfErXQZ8X1WCM05ytF/jKk9l0k5d0zWK0zMuZILFOTsS
	zzlVf+mJe2vKbu8rkogFVntpNZ4XqxYWdP018P/fs9vDCGBmXnPVlgsXpyGgdttCtxeH3XTlnj9
	1lYiKJJnyKA74T3mt4130do9A7Vc/imN4JEiiMm2SWbttUKtDNy0SoFOdsQyKyEQdvujEnFVnqU
	xEag+jBdbontnxE1dI1shS3WwHVrk2GYrcqnSGWApMQvDdx453Fb9Qr2Ra1HU+EwlKgCSIMo5R9
	Gm2k5ey5s0zrcDLgmmsWzBGWS3XOVgKg==
X-Received: by 2002:a05:600c:648:b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-490b5e79899mr21644995e9.1.1780476265441;
        Wed, 03 Jun 2026 01:44:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7a52dabsm10466065e9.1.2026.06.03.01.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:44:24 -0700 (PDT)
Date: Wed, 3 Jun 2026 11:44:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Eugene Mavick <m@mavick.dev>
Cc: gregkh@linuxfoundation.org, khomenkov@mailbox.org,
	ethantidmore06@gmail.com, m.steinmoetzger@gmail.com,
	tomasz.unger@yahoo.pl, arthur.stupa@gmail.com, jannik@jrehkemper.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <ah_pZPamB-HJhawR@stanley.mountain>
References: <20260531061022.573089-1-mavick4022@gmail.com>
 <20260603080105.780648-1-m@mavick.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603080105.780648-1-m@mavick.dev>

On Wed, Jun 03, 2026 at 04:01:05PM +0800, Eugene Mavick wrote:
> Remove unnecessary parentheses to clear checkpatch.pl warnings
> 
> Example of fixed warnings:
> CHECK: Unnecessary parentheses around dvobj->cam_cache[id]
> CHECK: Unnecessary parentheses around 'val != 0xfe'

No, leave these.  It's a staging specific rule.  I even modified
checkpatch to not warn about these so I'm not sure how you are seeing
them.  I just tested again and checkpatch doesn't warn...

regards,
dan carpenter

