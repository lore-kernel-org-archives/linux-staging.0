Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ECB14D718
	for <linux-staging@lists.linux.dev>; Sat,  3 Aug 2024 06:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722665466; cv=none; b=H6mkDjcBVoo9dMmt1m4o0oHDYmtmeL3VzeYBfO+0Au6JHMtgzvutjVfr+H0MgkjbkZFuC00ONaMYTjqJm+YTIXzgyZldXXzsQsyPWfj6kB9nRgVxAQVFfyTCScA5Q963S9Lw7UjsM6kdqGrVzP3mMOxvRrwinEEj7zpiDexseU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722665466; c=relaxed/simple;
	bh=M+Ud9zj5zxvYJ4r8nyLdhfUxJMwYZX9z7+g4PGtLCnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwocu05Q+0E2WsEpgK68WLa4d013oXl9WPAoEjSpjZhdXWPickfqANdoHNtSR1rFhM/lp1mqybh00fOnk48tjBPMehgxoVLRM77BmmeuSFXT5Y7hsq1O04fdrYgNhM9KA9JQymI4mVWRvxfDt3ybWMAEHQxIgCDUvA4u9l9M1lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NHgviK6R; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NHgviK6R"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3db18c4927bso4952821b6e.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Aug 2024 23:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722665461; x=1723270261; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4xHXuQbEIlF6T6PWN7yL7W7i12ECySoqyc3OAvP7660=;
        b=NHgviK6RuVZpKRkrUv6Cb8ueSa84VR0pipsq1RfaX8NprvhERP1+F/89rrrFN1X1HT
         xxBmK3lVq7CFOumUPUNFJ3OofNHMmhovK62QLLG56Ux0A0kD0RqF6EJpBpusmmIt6Plb
         /tANNFwEB6KhuHXqWMQtFmkOR9AMkeTyLyGrSAXPtUBQI0kkD8L74AMUtyUdrYmjg0Aw
         tezQAcGjJBOPlQMHBs3Jf4wHgyAM5nKeJbyAqXqqiCnhFz2aP+Ez4fFDP3iJDW5yswF7
         qtYl+GeddBA6xBVoRLNwXk7GZwXGgImTvaItYxEiBhJMl8GNHRupN16NSdM6NBGEfTkv
         mtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722665461; x=1723270261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xHXuQbEIlF6T6PWN7yL7W7i12ECySoqyc3OAvP7660=;
        b=JQ3I13Jgq9uZ3dkXRNN8KRAHLgHHGH7F/lAzkRJ1JIrMC//QkC9rQlfFt9oIiGBW2u
         9+Jf9ZXWP+nBJeENGRFrP5iVAABmxqatxHrvF33PRRCpYq+3ZokE8FAZFbPhVBxm8rPK
         F9UJvcYXeoisqyRFoYHdKYfOkOHMfhWg/yDoDK6+qr65ozFqEj0p/lECOio/cAUNQgRM
         5V2FjhvRCZwTdimfA7wjTpOy8ac7N5hnj91ndSHZK5gqq+XzSH9hXeDMyxBqBSV8zH+k
         Mmlism5DCPm4m226e9JvzjJo+C+69f4Ibxk4fcPrDQmgLFfdvAU33rW1mdFwMjQaJznC
         omUw==
X-Forwarded-Encrypted: i=1; AJvYcCXFucThgRbPqadQWNXC5S7z1eG42VFCO4tp0HHXmkoTS9DJPbEgprg/8Wyc+BgjHbvbth5fymKHY4Djswoq6ti4a6C6UuFausfDwCY8lQ==
X-Gm-Message-State: AOJu0YzdlhNpaxMz71lKoNxCpy3LquRElxwtdGYe4HV4u7bZtbLGQiq2
	d0OPUhYiAN7GMqz7l+bIIPucvWawX3jKDESPTPvOa3V8vN7wMjWIIZVOEzMe28s=
X-Google-Smtp-Source: AGHT+IHRmFwg9h+RQHxo9nAy0g9i1yt4x6Wdms+udQI9gwDyyIOAQZpruLkfKCJ5FsshubfS5JIUmA==
X-Received: by 2002:a05:6830:631a:b0:709:4d7a:3438 with SMTP id 46e09a7af769-709b32081c5mr7524324a34.11.1722665461056;
        Fri, 02 Aug 2024 23:11:01 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70a3a750d08sm1119236a34.62.2024.08.02.23.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 23:11:00 -0700 (PDT)
Date: Sat, 3 Aug 2024 01:10:58 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Whitton <spwhitton@spwhitton.name>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Add parentheses around macro
 definitions
Message-ID: <cf999a28-7227-4ee9-bc5f-9fe8c370458c@suswa.mountain>
References: <20240730062348.46205-2-spwhitton@spwhitton.name>
 <2024073020-reload-vanquish-f937@gregkh>
 <87v80i475p.fsf@melete.silentflame.com>
 <8d383b9d-d029-4706-91c5-9623fddf5df3@suswa.mountain>
 <878qxe41c8.fsf@melete.silentflame.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qxe41c8.fsf@melete.silentflame.com>

On Sat, Aug 03, 2024 at 01:33:43PM +0800, Sean Whitton wrote:
> Hello,
> 
> On Fri 02 Aug 2024 at 11:28pm -05, Dan Carpenter wrote:
> 
> > *You* need to figure out what the proper thing is.  Not us.  That's the
> > difficult part of writing a patch.  Once you know what the correct thing
> > is, then the rest is just typing.
> >
> > That business of defining STORAGE_CLASS_SP_C is weird.  Figure out the
> > authors intention and find a better way to do it.
> >
> > Figure out why your code compiled as well because putting parentheses
> > around (static inline) is a syntax error.
> 
> I asked follow-up questions because it seems like at least partially a
> matter of style to say that the business of defining STORAGE_CLASS_SP_C
> is weird.

I'm a domain expert when it comes to kernel style.  ;)  Trust me, it's
weird.  There are other places which do it as will but it's not normal.

> Maybe there is a better approach than what is currently done,
> but maybe there isn't.

Correct.  Just because it's weird, doesn't mean it's wrong.  Figure out
why the author did what they did and after that you'll probably be able
to judge if it makes sense.

> Maybe the checkpatch warning should just be
> suppressed (if that's something that can be done).

Yes.  Try to suppress the warning.  You don't need anyone's permission.
I think it will be difficult and I doubt you will succeed.  But you
never know until you try.  Even if you don't succeed, it's a useful
exercise.

> I would be grateful for some additional pointers.
> 

Ok.  Here was your question.

> I don't know what the author's intention was.  Are you saying that you
> think this preprocessor mechanism should just be replaced with
> hardcoding 'extern' or 'static inline' in each file which includes one
> of these headers?

The answer is you need to figure out what the author's intention was.
1) Look through the git log.  2) Try removing it and see if anything
breaks.  3) Do a grep for __INLINE_SP__.  (I deleted some extra hints
here because if I give any more hints then it's just me doing the
project).

Once you know why the macro exists then you can decide it we should do a
sed to replace it.  The sed to get rid of the macro is just an automated
one liner thing.  The difficult part is answering why the macro was
created and do we still need it?

regards,
dan carpenter

