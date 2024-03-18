Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A53E3032A
	for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 11:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710760605; cv=none; b=r9MOLLI1B3rysEnpysuPPEKl48m4ElfL9TEAxo2vT3o4gdeTZCYUg72r/EhJTJkxD7LKpzRXgv+JiTYz5RkfqduiVfM9HWhQl/iI9M7lh4aadYkTzmJFZ3ByJoz1PzHABvBgR07MYlk/zmn3d0KfoYT2tQzIy/gGXGkz2fat8iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710760605; c=relaxed/simple;
	bh=K/B9jshhQTO4EDidb9xFu7jg5/YHjfatld4X7iyOsJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgcZd23KFEW1RC6dcYmTCIVfq9hLxD40OvEwDhS6IjTQRcUr5RVfZ7npI+NBL4Sf2x2zAAIjCwHr0vcVn8N5pOfboDbxQJaGy8gj4yqY4pRnugvek6uebR5JP9YWLTUlCwiulwTKa3jdzaIei4SzQLNC0Bz7r4/spSuHzyZeUHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XMtJaKwW; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XMtJaKwW"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so578354466b.0
        for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710760602; x=1711365402; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KnHhyb7uDpQBPnfr4V2y5wGYxknsht7Nq/KOV466kCg=;
        b=XMtJaKwWoIE6NxOV6Vf3BeVmwrtcMK/vWl739Ndp2gxS3JVk2HyCatvaQmFNi8DoFL
         3LFJ/UoQErU+Z+EEJbZXMYbz5UPGDTtUwZTeo16AoiBA5WdPV4K8fcW9OGreJPmCA9ig
         RkvtyRfKI52Ozq61ddrycGP5kbJ04GTBDnMdthXdOEpQXkqAVWc+DoTXiSMiD0A1ezZ9
         6E67Snbf3NO8f/G54ZoWlW47VOBoVO6su8ynwvl3RUDU3UB3E4AsrbQDQxV99KN1d3eE
         YA5iM/V6sn2AdMpyqf36AObbQWO5b1617HRUhZtxq0RiwGxQvZS0LweD0/Pn0DfwWks0
         mnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710760602; x=1711365402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnHhyb7uDpQBPnfr4V2y5wGYxknsht7Nq/KOV466kCg=;
        b=Ou7BoCTGTmg6SQsWlWzMFyO/hRFKe83IVge99Y/Irt3NfN9MTKyBObvPw0jwCe9pIp
         hRyYDHo79GgOGedsRb15LNhQ8TkZZcp58WNETVIy2BRlJXqN4yVwp3Qxec0sUnfuBIf+
         YFBMZY8zQ4iBXfGqik+MPG6GDn0mmt10LLw244oKp8lNo4VRXJBkxgGiyKcuRPye43W3
         DcEfRTwpLAaxAShD/D+6gNIxy4Ltw+o0W4txfbX6y2oSUl9BAbw7QAzKiP4durxjqxUi
         BH0Esb6wnf7Tjaoig+hSlJJIddWF/fWXHs7b8PDk9aPTs922xev1PmZsxNzv3zMFUn5H
         NCfw==
X-Forwarded-Encrypted: i=1; AJvYcCVBCfKQmA+/K+EqWLDNvMRnlwyBi+RLg1TjrlT1rbY/9aWVuXVL99cRt2+PBPP4oVla3myDTVL9WI2HsY7R08i/yDXl/jDEaRcU2hMwPA==
X-Gm-Message-State: AOJu0Yzb75MT1WHAs48Q7ohE0UFYUqzngrPEjy2udYGW9+jCxPkP9+hA
	SZVoI9NnMXfNgPHki0bFlOhJFfgLQVx4qKZWUusOuslSqnO5BLycG+Do2rh0HNc=
X-Google-Smtp-Source: AGHT+IFLgonsgY/3PtzQAbuX1V/tusa6WXagx6nFGjo08BezauKdmdlJY/CD9Qb58XVaazG7ruBA0Q==
X-Received: by 2002:a17:907:60ca:b0:a44:5477:bb46 with SMTP id hv10-20020a17090760ca00b00a445477bb46mr10100474ejc.61.1710760601717;
        Mon, 18 Mar 2024 04:16:41 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id w17-20020a1709064a1100b00a466e772597sm4798756eju.177.2024.03.18.04.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 04:16:41 -0700 (PDT)
Date: Mon, 18 Mar 2024 14:16:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Tiwari <ayushtiw0110@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v5] staging: greybus: Constify gb_audio_module_type
Message-ID: <ea44d965-e727-4fc4-86cd-b727e1e0d2be@moroto.mountain>
References: <ZfXj1WkJ3nrYh3qL@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfXj1WkJ3nrYh3qL@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>

On Sat, Mar 16, 2024 at 11:54:21PM +0530, Ayush Tiwari wrote:
> Constify static struct kobj_type gb_audio_module_type to prevent
> modification of data shared across many instances(instances here
> refer to multiple kobject instances being created, since this same
> gb_audio_module_type structure is used as a template for all audio
> manager module kobjs, it is effectively 'shared' across all these
> instances), ensuring that the structure's usage is consistent and
> predictable throughout the driver and allowing the compiler to place
> it in read-only memory. The gb_audio_module_type structure is used
> when initializing and adding kobj instances to the kernel's object
> hierarchy. After adding const, any attempt to alter
> gb_audio_module_type in the code would raise a compile-time error.
> This enforcement ensures that the sysfs interface and operations for
> audio modules remain stable.
> 

Basically the patch is fine.  The only comments have been around the
commit message.  And all the reviewers have said correct things...  But
I'm still going to chime in as well.

The commit message is too long for something very simple.

Basically all kernel maintainers understand about constness.  There is
sometimes trickiness around constness but in this specific case there
isn't anything subtle or interesting.  You don't need to explain about
constness.  Maybe you can say the word "hardenning" as an explanation.

Julia asked you to write what steps you had done to ensure that the
patch doesn't break anything.  And I was curious what she meant by that
because I had forgotten that it would be bad if there were a cast that
removed the const.  So the bit about "any attempt to alter
gb_audio_module_type in the code would raise a compile-time error." is
not true.

Also we assume that you have compile tested everything so you never need
to write that.

The information which is missing from this commit message is the
checkpatch warning.  I'm more familiar with checkpatch than a lot of
kernel maintainers and I had forgotten that this was a checkpatch
warning.  Please copy and paste the warning.

Basically what I want in a commit message is this:

"Checkpatch complains that "gb_audio_module_type" should be const as
part of kernel hardenning.  <Copy and paste relevant bits from
checkpatch>.  I have reviewed how this struct is used and it's never
modified anywhere so checkpatch is correct that it can safely be
declared as const.  Constify it."

regards,
dan carpenter

