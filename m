Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBD4DDB6
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o/n02wSG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4066692ad35so8260275e9.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 03:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697105024; x=1697709824; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=naHWFuzj+O/OIKMTuO8BWcLy46hs0izi1SX0wAhmMBk=;
        b=o/n02wSGLEeJs9oO782KaVmijV4I6SC2OrBoz4gsmkTWXvi0BA2YaucJpr338XJNbi
         OxoLQhS8oFyH49lxy4z8YP0JScLyoVohbflO4qMTov0QTgKN31goxvMGhEShMeMNhAxz
         secrYlQxKf5L1aoYDA9tCSh1aWV0MO1ZEB/NCyOV8d46SvnOgD1FTTJqT9Ibd+lE4W5Y
         DLo+WXXG3flizWbGiPsjEKA9xP/DcXIhpKqOyKYEyv1XHFX0l9glNA8H2ZrrVdSJ/KYf
         73BFDfwJcKNSWVkbEmyOKh/j2I5swCiy3uXWAUcuqpLnfMnjsS++c4vRKa85hMvXAInG
         zcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697105024; x=1697709824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naHWFuzj+O/OIKMTuO8BWcLy46hs0izi1SX0wAhmMBk=;
        b=OgkrFdIuXUfqRx7qJWmVbG5mODsjT/cRyzeieuNqDQai7gFSP4NcTyAWlKv9MJXjBa
         +vpopnfOD85pKssKCbA8Gx4w4m8k5AEAFlMBqiSh+3vQNM4qNKUTvFRo1KfF0yTI4u7u
         GgOSXE3xdFfLoqFxQTOjYJhSDVLHpg3fJWG1AQxXGuNDYLoMsxEFcGAskgPkzPXBrCCi
         UIggWKeA07/4K+mUnvg1udvySOrjrPwgZFyt9l6SynfY7sGUsMYsb5wZetvT6u6stq0G
         SN7NWffPPuHOs9uM+T1aUXWo0r9hVj6L+yxbXvNlKx8Kkfp5nB3WLqIPtwALhbPGN9Xa
         mBWw==
X-Gm-Message-State: AOJu0Yy8MIs9UuAL6+jYmizwns4H1In/0TegADvDJ7niKxLZosyu2NuZ
	Ry3mm9yKCiaH8OHdVtk+99tC0Q==
X-Google-Smtp-Source: AGHT+IEx/ZN42k0swgkOxVEFQnusXfXt4HkdyCUOTkip0GsO1HHgMMPkxUmUkZ3E16VALcDrC8+Bcg==
X-Received: by 2002:a05:600c:3786:b0:405:359a:c965 with SMTP id o6-20020a05600c378600b00405359ac965mr21794161wmr.4.1697105023805;
        Thu, 12 Oct 2023 03:03:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n26-20020a05600c3b9a00b004068def185asm19559178wms.28.2023.10.12.03.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 03:03:43 -0700 (PDT)
Date: Thu, 12 Oct 2023 13:03:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>, Archana <craechal@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging/wlan-ng: remove strcpy() use in favor of
 strscpy()
Message-ID: <f0c12a00-ad9e-45b2-9cb2-7a84f4f10ef9@kadam.mountain>
References: <ZSeD1UojAgrsOh16@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSeD1UojAgrsOh16@lab-ubuntu>

This is a long email, because I have seen a bunch of people sending
strscpy() fixes and I want to explain how to write those correctly.

On Thu, Oct 12, 2023 at 08:27:49AM +0300, Calvince Otieno wrote:
> strncpy() function is actively dangerous to use since it may not
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is kind of an over statement.  This code has a " - 1" which
ensures that there is a NUL terminator.

> NUL-terminate the destination string, resulting in potential memory
> content exposures, unbounded reads, or crashes. strcpy() performs
> no bounds checking on the destination buffer.

This strcpy() sentence is unrelated to the commit.  No one was
considering using strcpy().

> The safe replacement
> is strscpy() which is specific to the Linux kernel.
> 

When you're writing the commit message, instead of talking about vague
theoretical stuff, what we want to know is the information specific to
the code you are checking.  In *this code* will the resulting string
be NUL terminated?  The other danger that strscpy() is designed to avoid
is a read overflow.  Is PRISM2_USB_FWFILE NULL terminated?  The
potential problem with strscpy() is that it does not pad the rest of the
string with zeroes and strncpy() will.  Maybe it looks something like
this:

	char buf[16];

	strscpy(buf, src, sizeof(buf));
	copy_to_user(user_pointer, buf, sizeof(buf));

If "src" is less than 15 characters long then the last characters are
a stack information leak.  So we need that analysis as well.

But then there is just the other regular string copy stuff you should
review as well.  How big is the dest buffer?  Where does s3plug[i].len
come from?  How do we know it's valid?

Sometimes these questions are quite difficult to answer, but it's not
clear from your commit message that you have tried to look for the
answers.  The question that is 100% necessary to answer is about padding
because we want to avoid introducing information leaks (security bugs).

> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> ---
>  drivers/staging/wlan-ng/prism2fw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
> index 5d03b2b9aab4..57a99dd12143 100644
> --- a/drivers/staging/wlan-ng/prism2fw.c
> +++ b/drivers/staging/wlan-ng/prism2fw.c
> @@ -725,7 +725,7 @@ static int plugimage(struct imgchunk *fchunk, unsigned int nfchunks,
>  
>  		if (j == -1) {	/* plug the filename */
>  			memset(dest, 0, s3plug[i].len);

Pay attention to this line.

> -			strncpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - 1);
> +			strscpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - 1);

Alright, so your code has a bug where you kept the " - 1".  When you
introduce a bug, then you should always assume that other people have
probably made the same mistake.

The simplest approach is to do a:

	git grep strscpy | grep " - 1"

But the better approach would be to write a Smatch or Coverity check to
prevent these in the future.  I will add this to my lore todo list:

KTODO: write a Smatch check for strscpy(dest, src, len - 1);

regards,
dan carpenter

