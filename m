Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792696472;
	b=EJP6GgCuxfGmavC2QgQrJdaEeIu09d23vyec171ZYe/rrmrk9jlbojPbikLbTde9OTr7
	 rks/vrPfLN2qeULmVMtq4snFeByzDe3fBvCQH1rq9PCjPhqVD+yxIVPDrCZLS4/Nc3vzP
	 E+i2oUyHIlr2+NRVb6fEupDvoRic4w9kgsWTl5BDpd+8jWry0I4Ewka4BcZeNzZInbmba
	 M6ZZ5k5+3J4UzDdV0C6hIFkvvl4asdkKNPclHzMib9hCZUxrabo7dC0gr+WF1Y9b4j7MR
	 g15hwX9PyDExcJLCrI2lB3ahWg2iLRrsE8HKXYpSU1qxnvqOrG7L2APh4Igum5niEQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792696472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=u6kKdaF5AxgzpiROVhZ0qUCFn2LlsDmJ9V904EQhkRI=;
	b=IVSLdXV8WYVIo9krydHKmUP3/0Y/3LZTs7sG9Goc0GbhBojmHQIzLSbaotDudSIaZECe
	 XzfYIJDuD9lclrA2nmtxj8IQyJiJ9C0hlP69Ez9A9x9z8pKWUZDnpHs+MImjqeRIT8M5K
	 TosC0eI6L7QySwRQlpOR1lV6ACJiOKrnLYGmroMkweJM6PPMXu18JppmulkQ0dgu8pAcH
	 hdMfZiuHloyFpdWTKbNmXWHywLiuFovesTfycPQaikc0jEvusSQfjA3N1DsQJLDr8xAyB
	 jt2U7RmaSbxw5vD75AkkZjN2TUF0FlqHSUGIurbV9WyG6ULgMsI2VjLICL9oh+KWv8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sE+JTic8;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4090606A319
	for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 19:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4090606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sE+JTic8
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1517bda04a0so129310c88.0
        for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 12:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696471; x=1793301271; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6kKdaF5AxgzpiROVhZ0qUCFn2LlsDmJ9V904EQhkRI=;
        b=sE+JTic86YKkNJNBMlIOUOwQpOUlLawVLKkk62apCvrsmcWZnXynQWNj/EZFvGJmQI
         uXgwmtGgfBD3qrTd+DeBoOUQ8kjT66ZSHxAV6Z0SmleWskDxFBw7I9C7qru+8Xr0lpeG
         +jolhSvbTC56DoqvovfgGYmjokOBy0CCBr8rBc2UtKKMcE8GLU3r5DD51bDIpLDSFwiH
         yGD+NrkUCorIqz7c+p6BecB9/UeTskrd0biCRf7qh6+N3k0Dy8qj625pKmsbVscoX5uB
         Lx3/VZ2gKNZBOQnYwajPaXHPVJhFuB+TeWpj7hbAFwcnOSx9lToYZ9o38pxrLJjijBxL
         7QCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696471; x=1793301271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6kKdaF5AxgzpiROVhZ0qUCFn2LlsDmJ9V904EQhkRI=;
        b=dpyv0Y5uLAkt1rbZqtuVXcYJOchAdAao+agOCPk52/x0uPiJN7w5Fstf6Lm4zs/pGe
         SDIkUey1J6/IJq4Fdtr0yTxGoKG9nYtlh5Ju9SxN6gFN5nvQME+gB5b1WkfHaGlTNT0W
         fAP78VfEKnD1rWqODF1s4BJQHKxmvyMMQFmLxiRbjbL2JWYN22j/2xJaEmtZ+x0n3Mr5
         zcCc/9AXF+gAtVqIYMy6xCKuKZ3GP6FgX+vTz2gX5Igm/8vOJJo6HU/NCGaqhBe570Ip
         gLkwtGNu1h8jRBVXEXMrJSlo4g10rslBSvLS+tvxJF7z99ede4ol+fyg3s7sO55v2T61
         Jm9A==
X-Forwarded-Encrypted: i=1; AKwUvBwTsUwYx8pVSe6BAEI3VD1uG3LI1OWRx0Z+AcZA38cEeevC9ntaPjV993WElnBMMv6xhWqJV+W0toH7Ot77@lists.linux.dev
X-Gm-Message-State: AFq9FYJwxj8Bws9qieBzHqd5+A5N5PvDHE6KRhzqKSfF0mcc1vtp1MDi
	6B2qt9p/Ly6g+Z66yYFPi8pfpp30Mz1ZzS3K/XFw2a+4RtM+Rvp34iLf
X-Gm-Gg: AYBFou15v3wkx7YLmWi0wFuU1C45Hr4LWF+uTlDLnuYa/6Ct0eWAdlJhtJBvUkkvBDy
	v+ULiEziSBc1/xDlgD8x8oAgcwjPyTeovSpg/6r6OFjTPEBaTH70lIYVCT7yZ/Xy1mtdYKAxb3Y
	iI1u3lsnsRUCbeVc/MbASE4Tw2LDSrIzu/ny+SDunAWeP7N0bGh6+jftKxr2AxgPpoRogOK2eTw
	5SJY+SNDeUVSyqxSFZJX1EY4F3JWGUdx9Xd9E+eMXk/HMG36PAyowvhNbCd5k/g6cXqekdQXEvc
	riNFYqApmfaXmdZTf/27ZSvCNJ/30JvOHKqtEzbdnDfk+g+HWOVygQInuacG+yHLgijjO5LIjYt
	IV6DfXmwCeP5UILxepGnu4sXMuQcJdMsRIoKxcCAft6G9gcyMUjl9FeftRkiKLUTKZZbAUtYS34
	YamwTtTwF8U6X6ypeVee/bBZ9h4K8jdvtB90pK0gfYycmIufHW6Ic/Q3edXU6p372o/MvThUldm
	NJjhZh2P/Vk/IAg9wcwqYI4BPEw74Mm2zrQNcpmg1D1n5Y2/HritiwZKh+7
X-Received: by 2002:a05:701b:42cc:10b0:14a:5284:1bf5 with SMTP id a92af1059eb24-195c4f4ef96mr212310c88.13.1792696470556;
        Thu, 22 Oct 2026 12:14:30 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:5e95:3be4:ff57:f0a5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d8f8eaf9sm220483eec.16.2026.10.22.12.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:14:29 -0700 (PDT)
Date: Fri, 23 Oct 2026 00:44:08 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Alex Elder <elder@riscstar.com>
Cc: greybus-dev@lists.linaro.org, outreachy@lists.linux.dev,
	pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Use fsleep() for delay
Message-ID: <atpggBthwjZIFwXR@user>
References: <20261022110238.38824-1-pavankumaryalagada@gmail.com>
 <6d683673-39de-4986-a593-68a5a495e764@riscstar.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d683673-39de-4986-a593-68a5a495e764@riscstar.com>

On Thu, Oct 22, 2026 at 08:28:23AM -0500, Alex Elder wrote:
> On 10/22/26 6:02 AM, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > In the loopback function, usleep_range() is used for short delays
> > and msleep() for longer delays. This requires choosing the delay
> > function based on the requested time and converting microseconds
> > to milliseconds when using msleep().
> > 
> > Replace both functions with fsleep(), which selects a suitable
> > delay method based on the requested time. This avoids the need
> > to choose the delay function and convert the time manually.
> > 
> > Suggested-by: Alex Elder <elder@riscstar.com>
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> Your description above is pretty good, but I agree with
> Johan's comment.  In fact, you should think about and
> understand exactly how that behavior changes with the
> switch to using fsleep().
> - When would the delay be different from before?
> - When it differs--by how much does it differ?

The current code uses usleep_range() for delays below 20
milliseconds and msleep() for longer delays. When using
msleep(), it converts microseconds to milliseconds by
rounding down, which can make the delay shorter than
requested.

For example, a requested delay of 20,500 microseconds
becomes msleep(20), which requests a 20 millisecond
sleep.

With fsleep(), the kernel selects the delay method
based on the requested time. For a 1000 microsecond
delay, the current code allows 100 microseconds of
extra time, while fsleep() allows up to 250 microseconds.

> - Is this amount significant?
> And the third question gets at exactly what Johan was
> saying should be included in the patch description.
> 
> We want to know not just the mechanics of the change,
> but at a higher level, what is its effect?

The change may affect the time between loopback operations
and the reported performance. The code does not seem to
need an exact delay, so i think using fsleep() is reasonable.
However, testing is needed to confirm its actual effect.

I do not have Greybus hardware to test the driver at runtime,
so my assessment is based on reviewing the code and fsleep()
implementation.

If possible, could you please check the runtime behavior or
and let me know if you find any issues with this change?

Thanks,
Pavan

> 
> You don't need to provide a super high level of detail
> in this particular change, but you should demonstrate
> somehow that you've thought about these things.
> 
> Please submit a new version of the patch and reword
> the description a bit to concisely capture why it
> makes sense to make the change, and why you believe
> that the change in behavior is likely harmless.
> 
> Thanks.
> 
> 					-Alex
> 
> > ---
> >   drivers/staging/greybus/loopback.c | 8 ++------
> >   1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > index efc69c10cffe..2fe845eaef29 100644
> > --- a/drivers/staging/greybus/loopback.c
> > +++ b/drivers/staging/greybus/loopback.c
> > @@ -898,12 +898,8 @@ static int gb_loopback_fn(void *data)
> >   		gb->send_count++;
> >   		mutex_unlock(&gb->mutex);
> > -		if (us_wait) {
> > -			if (us_wait < 20000)
> > -				usleep_range(us_wait, us_wait + 100);
> > -			else
> > -				msleep(us_wait / 1000);
> > -		}
> > +		if (us_wait)
> > +			fsleep(us_wait);
> >   	}
> >   	gb_pm_runtime_put_autosuspend(bundle);
> 
