Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DC920DC5
	for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716794146; cv=none; b=OALlWfb+gS1XlusZ9J9VoOmgz/N2zq6epsgAbKmFiux13H5rCC2VydP5Ni93lGT6jXwzRA0BfIX5qQG0U4DONzYl2vzt1gjQWQxzTDw7vObPOzsa10+0/XQHaTR41gycJzRXf3LKYIfm2Y6fNAsC45OsB0L0RUZMxkEOl+lDpsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716794146; c=relaxed/simple;
	bh=mwe8kOgRaHJINAiRajKjPR7tR6S5Am3qELO6PW9hBaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdFWzgh4qf2f4kv/MuKo5X++aDBVpYqFfsSKyDKav6Pv83uwDXV/17in84SOKMN8OoMl87yDBQvdkjSawFsyC/i1Y7oFnxbQ2amWFA6L6tvwfnRgKpgaVrDL7ShT22c3YZ6f/DEXkoXzQvWEE3D8+EYzF+PIf1wGccu6ZLxB51I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gDeaio76; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gDeaio76"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57863a8f4b2so2399043a12.0
        for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 00:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716794144; x=1717398944; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wzFPdlZqVo5PKSyt9wOZE+bRSKE7VsgsZElEVWfoDy0=;
        b=gDeaio76jaoaHQjR5ckHtbpZB2V9Fz4nmBaw5cPqw86pDeRwKTM8cZnWatnCw9naVX
         tb3g+wOiopGIk8mo9ezD2IQG1/aU4E1Dt2eOtokwyk9ZBV02bd0AaeotVBIMRaLOsX3B
         0y2oJK30hbWRYckWyd3bTClxA96ZqPnQAuZWx4/D0FIXUGyW9yO5HuqyovddhshAd7sS
         RVLNEMkEhbJ2ss56D/1uefwDWOmloP9mCElxFOd100H33I6L661tK6BPhXSlortErfAj
         IJx6DC2mBPzkx4I2Rt88o8DNCfe9WPKpzZfipbKof9JHUipPXU1ihLzMQtD3zpzCPCG1
         nLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716794144; x=1717398944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzFPdlZqVo5PKSyt9wOZE+bRSKE7VsgsZElEVWfoDy0=;
        b=DBUGrwqRAjaOTbI2BqXbirlXciO3UKkP2kS/vmwYvJOOXnrF7GBoxf3lhJteEyLoUf
         6YaYxsoYWXCVOjlRWjHsoDcdlx9o/tC0aQMpKFfCTr3eQqJhHURv41oAupwRG+Et0Dqm
         87H2Ak1mOpBNLvt+dx/7Ck3UeJNpKh0OFsNfl9jeuZzrHRvDxYbp7UWNVBf6rkkafspq
         CKto7rihuZRjEA7qVtTDyHKWPisLKdIuwwKQoR4Mhju6Zpeeusl0H5LpPzV0hYjTNzgm
         EYwC7T2aUDN7hF1MThcQHQAxiw0bqJZF1sz8d2E25Pp5A7hOf8Ty/IsCQKc7lJcDPM/B
         tv3A==
X-Forwarded-Encrypted: i=1; AJvYcCUrkG/vS+BQS+Utw/JaGSmyL/9PqKkkZwa1Yls0A6jlSHeSHkBNUp/VW2s+DyhDPh42PvKMMy8J5yVsHbScsDgVr4qw3z4KHnyt/RTYZA==
X-Gm-Message-State: AOJu0Yyo79mp5BtaZNu+TMBLsk4+f4YlaTzSq2A6yBzjozgPCKlHltI4
	uJ2ULz6acLQi1W0wrgnfRtS3VgMZTpcYdlOFDhM7P9hDoTR813XpMP7EZIz/e9U=
X-Google-Smtp-Source: AGHT+IGwZC7pS7Leyu+wJb6TKMTnokaMP1y0HwF8cJ3djE8qqANhHC/c/DSGNi9ozYoKaXx0eDOQBA==
X-Received: by 2002:a50:d6d9:0:b0:578:e1f5:47e1 with SMTP id 4fb4d7f45d1cf-578e1f54b50mr3546015a12.34.1716794143546;
        Mon, 27 May 2024 00:15:43 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579c73c771esm2141548a12.65.2024.05.27.00.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 00:15:43 -0700 (PDT)
Date: Mon, 27 May 2024 10:15:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	syzbot+83763e624cfec6b462cb@syzkaller.appspotmail.com
Subject: Re: [PATCH] staging: rtl8712: remove unnecessary alignment of
 pxmitpriv->pxmitbuf
Message-ID: <839d7d29-84ee-4da3-8024-67b79d581780@moroto.mountain>
References: <20240525073229.4144612-1-namcao@linutronix.de>
 <92412c38-8fb0-4a81-9205-7735ae21459c@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92412c38-8fb0-4a81-9205-7735ae21459c@moroto.mountain>

On Mon, May 27, 2024 at 10:06:22AM +0300, Dan Carpenter wrote:
> On Sat, May 25, 2024 at 09:32:29AM +0200, Nam Cao wrote:
> > This driver wants pxmitpriv->pxmitbuf to be 4-byte aligned. This is ensured
> > by allocating 4 more bytes than required with kmalloc(), then do the
> > p = p + 4 - (p & 3) trick to make sure the pointer is 4-byte aligned.
> > 
> > This is unnecessary. Pointers from kmalloc() are already at least
> > 8-byte-aligned.
> > 
> > Remove this alignment trick to simplify the code, and also to stop wasting
> > 4 extra bytes of dynamic memory allocator.
> > 
> > This also gets rid of a (false) warning from kmemleak. This 4-byte-aligned
> > buffer is used to store pointers from kmalloc(). For 64-bit platforms,
> > pointer size is 8 bytes and kmemleak only scans for pointers in 8-byte
> > blocks, thus it misses the pointers stored in this 4-byte-aligned buffer
> > and thinks that these pointers have been leaked. This is just a false
> > warning, not a real problem. But still, it would be nice to get rid of
> > these warnings.
> 
> Are you sure it's a false positive?  I've always wondered what happens
> when you do:
> 
> 	p = kmalloc();
> 	kfree((char *)p + 4);

Ah, never mind, it actually frees p.

It took me a while to figure out that it's actually pointers stored in
the buffer which are reported as leaks and not the buffer itself.  This
was explained quite well in the commit message but I just misunderstood.

regards,
dan carpenter

