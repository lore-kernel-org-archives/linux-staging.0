Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E577E3B5307
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 07:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781161776; cv=pass; b=gx9fwBNl6zH+VVHwsEXRTY1cMkhqI01jW/JrhRY4IiDyBxjLsY866+2j2Gl8lcf9aR8ppNDXD4XepV+HkQjUlOdk/gP6C/g214WIZcW97+8rTOh7rnJaJcad/2dpC927B3H4ClVwpzAjPa21ZNINVTu7KieynNyXYFUm8ihQeHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781161776; c=relaxed/simple;
	bh=dGvGqRoFKYFzpdxnbNfrKTylPVm0ZUcjOIeie+TXgWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlPdHirFjAqtr11IgLNvAUTFRusVlewQjcrSVadRt0EClu5jId0aXDZ3VGAcpr/1STwZXM6FuDxaMK/6yvEnHgx9omDiSk5DRtpPM5Q+J2ciqkOyPgK25hSSlKDTaDcJzk21AWOjXJcZslZSC+lDC7PwUaXCHsEE9HEw90KkPLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeMBeCUd; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeMBeCUd"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-660633a60caso988896d50.2
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 00:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781161774; cv=none;
        d=google.com; s=arc-20240605;
        b=IbMIQCEZyX6r/zeHGHEk/Cbrv3t95JSdWxZ4HRDoVn4OuVgRxx5NfzhunbgyteoA81
         R7GfINXh7wyo7AfrhMmuE805+oYAEqfkb6F2o6ScwBZygvpti5NJZati9n/KoG/bxkuP
         RKO3X1ZYBxpiPZgEHbsrLRyGhSC3CIjfooEyeheeaI06GgfwTKnuddSJ9yC0umSdBfSt
         yU9xhFX5OVxg4Nm6Sw/ZIYc0jZmaEAd848bfCgUlBcEUkXC/g46aZZ22FDQIlXnq4u+u
         6h6MrlPC71rG+ioLjHIR6MJ1a73uywk26U/CDnOQMgGcAYadBnlPHLk/XaX7BIxuHCKR
         Nzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dGvGqRoFKYFzpdxnbNfrKTylPVm0ZUcjOIeie+TXgWo=;
        fh=7o5iwdi66PNdP5hYL3eCctcKjDuehBM2Y8ABShjfE3o=;
        b=lJJZmbpgUlOqGgLvfv1Ow5ECdPldISxoKpcX3eFRJJhbK0+NsdJaA/+S0EnOT8AhaD
         62DdfP42V0KhSRGRbPifSY+m7jskQE25ZDp30QylEyTr2Wb8CprpTdhAXdzlxSLpoIyW
         wTXc30Gp0mnEQqvcndxsblt1pJK3P6a/GJIkfzu+AUTxUlwPlCgPX1N+ruXngmSp6D7a
         E/a0Y9jDcqjwL3XPiEKLncOyaQBv1JjNrODAO9Gx3ILPErzfM9VTlDujuvYf/r/27Wka
         hq+zt4AldItcOwFRoHakJTvXJOzBibKUE0nA3mk7H+UYoQ4HqLwYkGDRIUJy7oRIcZ1n
         4KBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781161774; x=1781766574; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dGvGqRoFKYFzpdxnbNfrKTylPVm0ZUcjOIeie+TXgWo=;
        b=SeMBeCUd/4g8Y6eNnBcvm9ogiUvLoLeX9Jt12zwl+ePUxJFegsrTXfFiwBWzr0oWRe
         kyMh1abWrbNjkqxzjspsRY6NJniKhf0Tn78SUWrmjKI5K2JlNFlVDUsy8t5qjfRRO96W
         yYSgkslQnq1fVB8KI3KmivQ67Jzj+0joLbyoocV1Iwp6CaTKYaKOvzLWQZj/3bgfmJWZ
         Gs+8c6JBiGjDtAuycG5H4lUE4OvlWqjXgbPWXshJFgnRTNMNZyQbIa18JxemezN9Uhh1
         DA8RTUux/LJ7K9BKnZ68GNtwoBduv/oU2V5NsBvF4fCJ4Iw2xbo0FglB0UcLt+zeVRlx
         vunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781161774; x=1781766574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGvGqRoFKYFzpdxnbNfrKTylPVm0ZUcjOIeie+TXgWo=;
        b=rVPVlGbGsKEr/6la1+AJIKJXiz4gZjqK1If55IXH+OZOHv9UJx+BNV4dMhSAGvRGi2
         viSJcecrCicYSLUQBPl4qzDrgxS6JawCfXojaED9FruYSdbuviT5tfVFoBSEjgRM+7gP
         0Y1DVVUkUREDh5YoS5hzjokJmmI+Zw78YCOQY3cxVsmPPfWkkFtRBxaP0RCKNXXfQVnV
         T2RTjj9MzLOe6BUInEbTF29GxLRkdU1JAED/7snuEjr88B8vV4AKKhyJpWvHDkK+BgFp
         QNY1xWGOIFyp8jrlY+KOgIs4SMfj0ZRmctFb3JJWPWDaf1vLEn5bSFi6gHzallymHKWc
         fePQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fYDvEspwpKzgmruInlUofLzoZWtcyXTlJw/nkrOV6lUdxH7iTQqMftuPgDNp4iI/x+JtxjTwqr5/PBmzR@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5Rub7mTqwuBxtSQDtcIe2NK93M4LllqMK19Kgg609l6zrlPGn
	1QrE5934VkQrNvjE8WnUHDbeCBuPfHf6OpVh6UQmvi/x1MF+5UkwhN6SJpD3/Ip9bDtFEUKOslc
	0sTqpnvfPbHzXRWRcvQnNWhLBo6lNSko=
X-Gm-Gg: Acq92OFmcQXPbuHh0xA0f4dBxyOoOo/CdSuO+256YVuy9pgCH/RRRLJDlVViBSXds3n
	FdPwTEAlf0dYe7L0CWZzaPR1IDvVkKnYH+O5uVH5aAw/0rf4tMJPpAVqrPFJHom0GlCUoUjxsuC
	JhR8wi4qx7yQBDPvs8Z+1JrSOFyy6yNaXGDH4nWtJZttY0NzYXj35ucTlXxm3uFAKuMwxsGGffh
	8iZmgPt4wv+OFKH1cLaXf6JEpZ+bpD1nglGAT8wXU3tfm9FvDQTDTZif9cGWAjYOLbdG2KUyxQs
	yQ1Nn4MrCmbLXaRdldWM4ZdTX9746tnV+Kg/7VySZbiUdpIR
X-Received: by 2002:a05:690e:400f:b0:660:36a3:b23 with SMTP id
 956f58d0204a3-6626962c607mr1099282d50.21.1781161773901; Thu, 11 Jun 2026
 00:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aipI6J4kDWESZgtA@ashevche-desk.local> <20260611061417.11747-1-mertsftl@gmail.com>
 <aipbDeEFbXam1WPN@ashevche-desk.local>
In-Reply-To: <aipbDeEFbXam1WPN@ashevche-desk.local>
From: Mert S <mertsftl@gmail.com>
Date: Thu, 11 Jun 2026 09:09:23 +0200
X-Gm-Features: AVVi8CekkDXvmdITSkrgkym8rEoKFhKBwnxQTnQ1G2rMX7_W6GBsc6kV4hMcjVc
Message-ID: <CAA3Noor=rsoCR9NoWy9KEZSrK66p0WN1i4C0aDwn8AzuN3p0hw@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: gmin: Use str_on_off() helper
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Andy Shevchenko wrote:
> First of all, do not chain a new version to the email thread with the
> old one.

Sorry about that. I'm pretty new to all this and still finding my way
around the process, so I appreciate you pointing it out. I'll send the
next revision as its own separate thread.

> Second, you forgot tag from Kees. Why did you not take it?

That ones just my mistake, I overlooked Kees' tag when I put v2
together. I'll make sure to take it in v3.

Thanks for your patience with me, and for the review.

Mert Seftali
