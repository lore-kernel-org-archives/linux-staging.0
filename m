Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B08513AF2
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724320357; cv=none; b=AZeIbAos/I13/emu3HX46BJjZ+WcueZXavfQLZPfTC7+5kuJFbN8rL4DnQYqqVp8+kz+M+ug5psOxgioAzv22Dk6XGSI9Gw9v4qbNb5T+aHwVOoubKJ4fjy3zPKpZbCpeQ5UFa7VrcyimPQaahcVzNISoJqjEKwk0AGRbM3zWcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724320357; c=relaxed/simple;
	bh=YQDoeRsr6q+u3voHfHxdWEDewqv24NSCdzIjQnnVtEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOHD+OKO3mC4UP9BTc2ysdibi8rz6RgNobryOgA5944VJavSbEC5/uBZEG5aH0lVqiLg1aidDBLzhCSA/c9p1CL0VoU5j2cf1OzBQTJdg5NgH4JZ7U7wUiPx9M/iaYLs3HvlsAO9S2ytOtwqWEmxKHGTf4M2yxjvcjmyvLazH14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dO01aRmd; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dO01aRmd"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5334c4d6829so749100e87.2
        for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 02:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724320354; x=1724925154; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ioDL8+VV11S+Jkj2FT4N18seewzyeREKSup0+frDKw=;
        b=dO01aRmdSM51IJYn1AskzxpDjYAvgdoR81n+vhTp++EG64upshCgAadsXUYtpkkAkg
         YIU8QTMUxe0Gb/LtwZK7hXX8/F4kB0IHih4SptrKID2igXzVylIHblHNJgTLOk2F8y25
         l+z97orVtZjT5EGmxeruMlc9AYJBqL2Zxnhvt8hgOtrPY/3UPRo4JlQulyaGrESnstMn
         AveN/Q4KeEPdDyf7zkZtTBbZfmqziXbmD/1CEh+98tiClA+9tZhLWKM1xTSVW7ovi5aV
         n0z8YUpYHRMJn5W5huf7b8oAMvFzyim0vnpMf6416tiw6sLu0wZFpspGQJg4NgVXynzH
         se1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724320354; x=1724925154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ioDL8+VV11S+Jkj2FT4N18seewzyeREKSup0+frDKw=;
        b=X3PZsBwiTyhYQoyqwX3zUBJ6XtPLyDCoWdsqV6QfY3KiHGgjW+U2Hd07ucg5Wy/c/s
         SPzX+om1ghNDN3JQLzN5h36zdfGf0beogt4bHqErWABj9Wfva808TXFE2xvtNUhAqn2c
         zq+fw5FaDeDcimWneE1h1CxxlcDjPZPNv5AmZHA3UnwiZzMvWNmJp+opd+MaqeB32kfs
         VQvsjkGqLbrQVTfZjoSIbRXXYuGsX1wkJ3PAfXGZ5kUvSB/m7qkF5RqwG9b/mIUcP7Zm
         E/ipKzj8pX+63bq9TimMOtiPoyyBeC3RbYngQNtfpuG0gnE5rzVg7kBomR4YE74vMrDl
         HfcA==
X-Forwarded-Encrypted: i=1; AJvYcCVNAl3E4KHvE1kIgYcNP2cFTFj7IqLjf/yz2+3iDjkWjLd5ixNukLKayGPvv5XCRDwuy1p4pgOL2jhnPm7k@lists.linux.dev
X-Gm-Message-State: AOJu0YwMOa84aGfAIAA2MnWkGJhaVH3pehTKGUYW5IpyRBnY71fqCpa9
	AQpeWU5D9d/fImZ6kL4ppGimzgJhqTd+Id0Cfy3DcrYSrjqAWGpbGtqEEhGMy70=
X-Google-Smtp-Source: AGHT+IE6AR0cXAnZyVzfNmM6b2iJejrQlthgszJ9kbrDjazQQ+yfrh4+RvUHZrPu2x1o2MjsO6mC/w==
X-Received: by 2002:a05:6512:114d:b0:52e:9ab9:da14 with SMTP id 2adb3069b0e04-53348575002mr3203521e87.31.1724320353542;
        Thu, 22 Aug 2024 02:52:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a3ead33sm700430a12.47.2024.08.22.02.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:52:32 -0700 (PDT)
Date: Thu, 22 Aug 2024 12:52:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yuesong Li <liyuesong@vivo.com>
Cc: gregkh@linuxfoundation.org, soumya.negi97@gmail.com,
	piroyangg@gmail.com, andi.shyti@linux.intel.com,
	alexondunkan@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] driver:staging:vme:Remove NULL check of list_entry()
Message-ID: <3e6423eb-0845-4ab2-8d92-86da2c814569@stanley.mountain>
References: <20240822025736.1208339-1-liyuesong@vivo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822025736.1208339-1-liyuesong@vivo.com>

I think Greg may have already merged your commit, which I'm okay with
because so far as I can see it's fine.  But there should normally be
some additional analysis for this type of patch.

On Thu, Aug 22, 2024 at 10:57:36AM +0800, Yuesong Li wrote:
> list_entry() will never return a NULL pointer, thus remove the
> check.
> 

This is true.  But the other possibility here is that it could be that
list_entry_or_null() was intended.

In other words, sure, this patch doesn't introduce new crashing bugs, but it
might going against the work that static checker developers do to find risky
code.

The first thing I would do would be to see which commit introduced this.
git log -p --follow drivers/staging/vme_user/vme.c
This issue was introduced in 2009.  Probably if the code has been this way for
15 years and no one has complained then it's fine to remove the NULL check.

To be honest, that's probably all the analysis you need.  :P  I did a little bit
more analysis using Smatch.  These are the places where Smatch says that
->entry is set.  You'd have to build the cross function database using
~/smatch/smatch_scripts/build_kernel_data.sh and then run
`smatch/smatch_data/db/smdb.py where vme_resource entry`.

drivers/staging/vme_user/vme_user.c | vme_user_probe                 | (struct vme_resource)->entry | min-max
drivers/staging/vme_user/vme_user.c | vme_user_remove                | (struct vme_resource)->entry | min-max
drivers/staging/vme_user/vme.c | vme_slave_request              | (struct vme_resource)->entry | 0-u64max
drivers/staging/vme_user/vme.c | vme_slave_free                 | (struct vme_resource)->entry | min-max
drivers/staging/vme_user/vme.c | vme_master_request             | (struct vme_resource)->entry | 0-u64max
drivers/staging/vme_user/vme.c | vme_master_free                | (struct vme_resource)->entry | min-max
drivers/staging/vme_user/vme.c | vme_dma_request                | (struct vme_resource)->entry | 0-u64max
drivers/staging/vme_user/vme.c | vme_dma_free                   | (struct vme_resource)->entry | min-max
drivers/staging/vme_user/vme.c | vme_lm_request                 | (struct vme_resource)->entry | 0-u64max
drivers/staging/vme_user/vme.c | vme_lm_free                    | (struct vme_resource)->entry | min-max

When you look at the code, ->entry gets pointed to an entry in the list in the
request function and never modified again.

Which is slightly weird.  In other words, struct vme_resource)->entry is not
used as a list at all so far as I can see.  It's unclear to me what's going on
with vme, but I suspect we're going to remove it.  See 35ba63b8f6d0 ("vme: move
back to staging").  Otherwise the temptation would be to ask that we set a
pointer directly to slave_image and master_image instead of saving a pointer to
entry.

regards,
dan carpenter


