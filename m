Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CB430F95C
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 10:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300638; cv=none; b=sdVlGEHwPp0CFeC9N+rmDy18XVAPAZu7n7omHKbJtVXzVdgL75XYVve90BvMmOrHqbbx5JAO+KCvgpeNzMEAqtx3gew8bL+2l98jSqri36O586wr7Medj+TKfWr56kYeykAPkbKNV8hqh6WbQq7kjhhzDLZ9Gk5pXr91w8Z8w9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300638; c=relaxed/simple;
	bh=hAurMlYNXTxNuMUZIHfUByvT/1w4awgpU24oNdEHWZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNUHgSr7JXKE/mWceDadeip3CHx6w306x/3VrztcIgHjZhSYWmoLFIML62HAoYWDJrnVLXex9G6gy9TVJoQ03ac+whkLNX3caCKKEEjfx7um95o9oRapocPlSUAHLJlQ/3YbgPVYKvvGKFSoWStXZo0ZQP3kxYZMmFWy9/pseXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cv9wE6l1; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cv9wE6l1"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b7bb3b913so5860339e87.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 02:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768300635; x=1768905435; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3B11MsiVuh0j92dKh78EUalZ005qYKESUvNCO2I9ow=;
        b=cv9wE6l16rjt+jc6EEuuwhoGJDPV/pMG/Gd7DC+JcC/QVH2usREY5NS/adsEL6Ii+4
         i+u34a7HGzszR9PEY+6LZ4yHWzxyajRsK+wVvLQSEg5GpYvOqSFRzWrPyVkfJri6Lcda
         dgwWSWfeQTDaahzlF4ra9hOG28AWzrIEpSaP2+t+fMZ7qAMPBTdpjM9yEQkZrkNdNK4N
         qlqGgwSBnX2YSF/06Be6svsW1RDV3TqYzJnVBJP/1oy6/2SV4QybV7lN3FXsbm94A7xK
         usFqxIhpkf3rp9DENhSjwKyhuxlwVJ7V5DPJKnbkNqmFeOH3bAlmn0SqgnHHnapXlUan
         hsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300635; x=1768905435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G3B11MsiVuh0j92dKh78EUalZ005qYKESUvNCO2I9ow=;
        b=H2UO3zW331IUO/1kNQ74dr/w8+71ONQ1rnuM8l+h0FNG941eWI01tNK9360/E0DM4S
         tu36X07rUi8zSDvqLun5dFXyR9MGreyXlxf1lGmyR03GUbncGlObU1nAhWrxUnIwZiqB
         88IKuXADrWVA6afupXJvaBI38VN1Gl+jtOnNeI36OYIIbQXjXFd1OeUAaOKE1O4mJHfN
         +QpgybyvAwR2K9W+u5E0QOiRX1HjHIyMAZFi92jjBL7Bi1VK6fV4yypOziq4vYkYxnFf
         JmqryN4VjjH5B3ErBpIWibW2IRbZpwkS88TLI9Jd7XAFlkZR4lMZUVdHnkHysTyBkgIk
         /hmg==
X-Forwarded-Encrypted: i=1; AJvYcCXwNUwpjFfvF8ZNQeEeg5P04u/7+4zwYIDH1JG9SyKVfxri7vRnpQeLxMvSi7zmLZqetwQ4Ag6pfp7poHMB@lists.linux.dev
X-Gm-Message-State: AOJu0YwNQugWTK8EJ5qzxrex7+/NZhVn/bRr7cmjGxdrO+zsOS1WXSb3
	NU7qFcL1iSItoAM3a+OxyqCna8++9NdNAmOAuKhzxPrL/Co+soFeooeMLnTFNh+jb+T9rficgqo
	pRnWqrq0+Jvh/jJbwza+/RZOJtB9Zrk8=
X-Gm-Gg: AY/fxX6fnRIxHQWKlcqHiADOLBIR1hdCwgA7ubXw1WVsV8AotmctSW7G+gKBXUebzfC
	Wszi/iqeZc3+igAAZZTeJCvcPDHtWm3v52XtRubvlKjJ63wgAdt0xLynGcdfYS3zavq8lR++jdq
	t5O9Wpjz9XfbJp7j7wyNCsBLGnyChdak+iMYJ9CgV8HrxXhJpGMoty6A/VFcDnuFMFSf3R6doFY
	s93nEVrIw0eDAivNKcjTJ9IztcwXcHY//I1rV1da39cskpCUsXsv+tVjJFR4/nDwQQxMOjg
X-Google-Smtp-Source: AGHT+IHoNmdjYFJ1zXOk8KANbo3087Ay7K23A3X+9RXPVvQzCT5ooW0QixuipfeAgM0YO8yFijnKpgt0C5Sic0CvZ1E=
X-Received: by 2002:ac2:4e09:0:b0:594:2f72:2f89 with SMTP id
 2adb3069b0e04-59b9920de1bmr789651e87.9.1768300634672; Tue, 13 Jan 2026
 02:37:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260112190054.9828-1-dev.anubhavk@gmail.com> <aWVIF_rkHzxs3k-r@smile.fi.intel.com>
In-Reply-To: <aWVIF_rkHzxs3k-r@smile.fi.intel.com>
From: Anubhav Kokane <dev.anubhavk@gmail.com>
Date: Tue, 13 Jan 2026 16:07:02 +0530
X-Gm-Features: AZwV_QhO0hMTRZk8Y1rjJr3zYSAbRBJu9ux19E_5E1cEq0ry6Z0utp5qj3l2HvY
Message-ID: <CAF6CsJwg8EFtCT+zyKWex=RbWu4TyZanbXnqip=J7=sCZDab5Q@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: refactor sizeof(struct type) to sizeof(*ptr)
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 12:44=E2=80=AFAM Andy Shevchenko  wrote:
> the preferred way is to switch to use kcalloc() in all three places.
>
>                 x =3D kcalloc(count, sizeof(*...), ...);
>                 if (!x)
>                         ...handle error...
>
>                 while (count--) {
>                         ...
>                 }
>                 ...
> err:
>                 list_for_each... {
>                         ...
>                 }
>                 kfree(x);
>
Hi Andy,
Thank you for the feedback.
I looked into implementing kcalloc() as suggested. But the issue is struct
atomisp_s3a_buf (and the other buffers) are defined as list nodes with
struct list_head list embedded in them. The driver relies on adding these
individually to asd->s3a_stats and freeing them individually using kfree()
in multiple cleanup paths (including error path here).

Switching to kcalloc() would mean the s3a_buf is no longer a standalone
object but a slice of an array. This would lead to invalid or double frees
if the existing code tries kfree() on this array element.

Addressing this requires a larger refactor of the buffer management logic
across the driver, would you prefer I stick to the sizeof(*ptr) hardening f=
or
now to fix the checkpatch warning?

Regards,
Anubhav
