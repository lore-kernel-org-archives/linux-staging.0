Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCE84502A
	for <linux-staging@lists.linux.dev>; Wed, 22 Jan 2025 10:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737541968; cv=none; b=rdOe8Xp2losNeTep1nUD/bsyfFyBqBF9P3GMc/87Tub5jK+5s/rX+nS07tYbmvYgE0sQ9aQgjBEBV8aC3/KiVDScFtQtzTWzgywCZwj+BPw1pX0NpgH9+KcwiHwP2lQOlixtV/JJEEulc5D3h8jdRkcFNMNipSIRaqJZ3BUFyNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737541968; c=relaxed/simple;
	bh=xxdnRxJo9EYSB6NDN79OhYHS4GdenSQMtLSz+tRfN50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qURrDTuw8ppQ4TUxUQqzQSoWnnIUPC06bAPt5D503+EQTPixmXY8eWDpOb6MtU9AApW3RetqvhbTYyhFDAXZM09Cayp9Hf2hwLjRGcuMd5fS375xSeYWdkf1Kdc178hIqkurQAtFuRws7//J5UdBs6yF+n8EnJeyXGIBvG0Ciuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7fbRMDI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7fbRMDI"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436341f575fso73506885e9.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Jan 2025 02:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737541964; x=1738146764; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sk2qk1CXGKikQHG8pNoA8W9N2pmJaIAGArLyoFJspTk=;
        b=M7fbRMDI4PDjzWwCfY/vglIcSlW8uZ8IlOrdceIsnSfHUcX5xLX6SfQvSKeKlUNr6R
         TeLvhHfGtkmQGm4HECyW41jubeAEjwCGajvGNg687ve0axuh/urgWLgcF3VKhca8vY0n
         A/XIAGohX/Y8FSEkXPP2gkXQENrobSi/2okMo5quexiHONFx9O0YmzFAW7rXWhLzGaHa
         /CmDz0sZT9h56zFOxAvczfA9PA2K263ijCojXILdixci0LwOL8jgG2Fe6Z+4nFJM7WDq
         KIrcCmFbP0PRr+YMlV9R/HmJGGsHB+2PGhv1pm5OT8arPoDUy9kSkywVpaR5nxTaRuKO
         R2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737541964; x=1738146764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sk2qk1CXGKikQHG8pNoA8W9N2pmJaIAGArLyoFJspTk=;
        b=fWdm2UC1mIKGR1UUw8KDT7QvfAAMlxtvr7h5YZ9LqWc2rJklNb/fnH6otRRLc36hpf
         Qq/npC8oHZMoKo0wcOrx8JyIEKlaZ/uFpjHRAxf2brGhspAfkVwjzxSBQKmSik/IT/5E
         T/NYSa2i07DW79gHrKOwcnVcJG7ffJy3Kk/9FTqlazmLQ+Bf4lpvsdoeJ6jgJsV2rrVO
         WqD0J/PrwG1eScGw8imalCb//9kLddi4cmr077bHve575PwDjG4YSrf/MVgyEiOuqpJB
         J+INOIZ/VPISnt24awy2e1axFN2zL9yWczbZe+Iwq6xDAJJWKb9Wnx/rlQtp0TO8mtla
         +C3A==
X-Forwarded-Encrypted: i=1; AJvYcCUTSd/XJ9ZgScizykCZF0O5+zIHg5nBheJdVccR4r4H6QfbR9o6YD1C6XIwnBsBnA5pjSyIxwUO9N7X4jbg@lists.linux.dev
X-Gm-Message-State: AOJu0YwUzyOl8InX26UP2TDLx7uhyXoGYSAOSibx5vqxdg3MKRg5GU3d
	nn8q1ZiVoGEy/HTSxT0iIeJBiVnOdk1Olb95ElOA0Gk9HUZpV+pxFhkbhIHD
X-Gm-Gg: ASbGncvhuEVEHN2fVB15JqZGK9XrQHcAooo9TieczDihX1TswE8Ak0tny/x5amnNTF2
	IwBBjIoU34m5SFyAZNpsi9uhTgZIJplydPr30tc5it4hz2muyNpC6CLMC007EU6YYVxOf6u09kf
	57vKDITA95M/8Hlwrthtc+JSf8h2jbIwFqZJbq061QQphgNIG5wGDTCTTSwRuVGH1USQikOd0RC
	EnfdTiAqO07yph2tbKTswNYqZMyFMdNHOOJTY/kblADqzXBqht5DsVgZUgMN204es52aSH5kwYv
	kB+lsh5HDQ==
X-Google-Smtp-Source: AGHT+IH3cGesaANWOVg2V250ubV+xkFFVIkxUOQGnCUXei0oYyiXcz68JyvgxGH2R+fi68e/ZNBD/Q==
X-Received: by 2002:a05:600c:6c95:b0:438:a1f5:3e41 with SMTP id 5b1f17b1804b1-438a1f53fa6mr156547375e9.12.1737541964260;
        Wed, 22 Jan 2025 02:32:44 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b1cc8151sm17244075e9.1.2025.01.22.02.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:32:43 -0800 (PST)
Date: Wed, 22 Jan 2025 11:32:41 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Make static and reduce forward
 declarations
Message-ID: <Z5DJSQUkEsLuzcke@egonzo>
References: <20250121203342.20410-1-dpenkler@gmail.com>
 <6889992d-043d-4af8-869a-84eea9609148@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6889992d-043d-4af8-869a-84eea9609148@stanley.mountain>

On Wed, Jan 22, 2025 at 10:37:33AM +0300, Dan Carpenter wrote:
> On Tue, Jan 21, 2025 at 09:33:42PM +0100, Dave Penkler wrote:
> > Declaring the entry points as static caused a warning that the
> > serial_poll_status function of the agilent_82350b driver was
> > unused.
> > 
> > Add the entry point to the corresponding interface structure
> > initializations where it was missing.
> 
> ...
> 
> > @@ -842,6 +824,7 @@ static gpib_interface_t agilent_82350b_unaccel_interface = {
> >  	.primary_address = agilent_82350b_primary_address,
> >  	.secondary_address = agilent_82350b_secondary_address,
> >  	.serial_poll_response = agilent_82350b_serial_poll_response,
> > +	.serial_poll_status = agilent_82350b_serial_poll_status,
> >  	.t1_delay = agilent_82350b_t1_delay,
> >  	.return_to_local = agilent_82350b_return_to_local,
> >  };
> > @@ -869,12 +852,12 @@ static gpib_interface_t agilent_82350b_interface = {
> >  	.primary_address = agilent_82350b_primary_address,
> >  	.secondary_address = agilent_82350b_secondary_address,
> >  	.serial_poll_response = agilent_82350b_serial_poll_response,
> > +	.serial_poll_status = agilent_82350b_serial_poll_status,
> >  	.t1_delay = agilent_82350b_t1_delay,
> >  	.return_to_local = agilent_82350b_return_to_local,
> >  };
> 
> So what happened is that Sparse was complaining and you were cleaning
> up the code and you discovered this bug.  Fine.  But bug fixes need to
> be in their own commit, not hidden inside a giant cleanup patch.  They
> need to have a commit message.
> 
> Quite often it sucks to discover a bug like this because the bugs have
> to be fixed first before the cleanup.  We're a bit less strict on this
> in staging because realistically there are lots of bugs and lots of
> cleanups and they're going to get mixed together.  But other subsystems
> maintain a fixes branch and a new development branch and so bug fixes
> have to apply cleanly to the fixes branch.
> 
> So in that case you would need to save the diff of the cleanup.  Go back
> to the start.  Write the fix.  Apply the cleanup diff on the top.  Deal
> with any failed chunks.  What a headache!  I get that.  And you're from
> a gmail.com address so I don't even know if you're getting paid to deal
> with this crap...
> 
> Quite often it sucks but in this case, it's really easy.  Use
> `git citool`, highlight the bugfix lines, right click, add to commit
> write a commit message and done.  Make sure it still builds as a stand
> alone patch, though.  Quite often when I try to highlight and click on
> all the lines in a bugfix, I accidentally leave out essential pieces.
> 
> regards,
> dan carpenter
> 
OK I will send a new patch set splitting the patch as you suggested.
Thanks,
-dave
