Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B37F444701
	for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387831; cv=none; b=Ndg7EUzTBfZa7BYsfZNxmVKHgpdsyO6lkErLKqJtYuY0JUoJaS00v/Gs0fPj7Ssh7v/jro1tgKSpRc4QkU99EIa3g/EEAHr08x/ir3He41GqSZOzL8yOmvq0TdgqGHT75O8xi1imtHeBVuKQncQY7m9n5SOg0hj5HiR9QlHwBhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387831; c=relaxed/simple;
	bh=Se7NkzKRBbstIWMyWUOVe+AMD6O75GbMwW/t+1YRS3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODDSb/jjTKlMrwiPtglp9zOJ6DCn5q4o5dartKgCmRrrv8T4x2M2ICZqzClFbPRfpZ7Yy7Uvhoyec80qIBmhRYTdRK4cw/qsLE+GIAeRzKcf2b3HwbIdA9SI3MBm/YMlF0ytJd6r0QGhYwQhE7KUwEDqmQ7xzKgfon0n8ws8pDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IVsRwUc2; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IVsRwUc2"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a36887bso1025231b6e.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789387828; x=1789992628; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26Uw7zNV0CaU8mcuuO2rFoHLPl3S+teCO+5Ml7uyCio=;
        b=IVsRwUc2Lxvrxh1ycV/aimkNIlAHy/Li9cRFjXDixCL4HkKt4MicVM2U25nLDSZH8/
         EypapHo+VXCtHw0+X9/szRmVqk2kSd6zCF4z6g+IahF1+fgLw+A751HKfrGTD009An4P
         YF4VnimJDfaKSmVNKcmdb161l+4wQhc61QeAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387828; x=1789992628;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=26Uw7zNV0CaU8mcuuO2rFoHLPl3S+teCO+5Ml7uyCio=;
        b=bhDMeLnuKCbpONQ61cLhH2w4KDjG0Fb3CU3+O8X9y+JA0TXLeSx1tr0VL9J/9/TONT
         7462CL8h4tkLuJnc4rj5UY+So6DI+US0RArlSlx8/CCkFwushvkhi0eH80Inmpr95as3
         Qv+0YFZZQbGXQpsC3dFdRAiY31TtjhwRP5LR1VYzFwRHJhNAinLwKSJLtHxlCoyRazkp
         f8r8bTd7+hfsARBDtn3elgL+oD0vBYeVzjyXNnSfOunkcvs/HXl40tGB50Yi7q3hb4E7
         6ixFFlaBuT2XT+NAeoZVIjPftLxdny4hEQDmCHrCZP+PjDvx/z+f+oFkuYfbJw811MRt
         TEcA==
X-Forwarded-Encrypted: i=1; AKwUvBzsQh3JN/CHscw2ZlENjmCj+qJSxtVcdi4mOE86EcdABhioDND0pR7UI8BYPCV7Z2G0D6nOi/6JRYJmwIGw@lists.linux.dev
X-Gm-Message-State: AFuF++kPJKSAGngx2RFYPL72DwUYh1ino9K0P83YTSmhctXo+XBlB7Fg
	i0BZLXtzs+vZN8KlEquytnfXQoS72iMWoLJNE8zhnM46HoN3HXOds8vQMZYpTak8IFx7DzqBdEW
	zRN3Zg+5k
X-Gm-Gg: AYBFou0PAjR3x87b+qfXjvcxTEIHyDft5sPfyRdeC2/C1Ll0MVoejf1t4kVXgWV74VC
	XttfWckLarF5KOHdqC2rFa/OorfxPxGJiHFBTrwotnBMJtFMc0aBbAeTvlU/6hZhfeGrEodl6Od
	mDTGuD3L+FdKChw65PZwXnYee6sDhOCOgnw7GdowECuWx5acKBQl1ibmEHxEbHWxZDfia7AZxYC
	9jlF+bBXQoqcZRQ0EZnplYvFYrzFDRAhOqIn8Xd2xK4vX1NJEGKFmVHqbynoYrC/v1cWNSiUVG4
	SGdOYOW1zjWoguOyBUUrkGxUTx5Dn4pIzfb67yHMSPSMtzP7V/x0hcLC+EinjK2wzNW8PpxisjK
	QTbl7uzTqLtB/wG6Lvpjux1mtz4y6y7M+IbX92x85gbVTKiHzmZ8VdWmwzeshOU846p4sXUCw8C
	zrCwaYXleUpvrbZu9i0VKb0MmdjF/MJtd5ZhKl0TR+n1PKlEKrAumLcIYKglSO6IoN4wfZZkfb9
	mJGJNnVzOHJZJyWjqlbTxKlBj9nyPnPuymC
X-Received: by 2002:a05:6808:30a2:b0:4b9:a8ac:47d with SMTP id 5614622812f47-4c7b57a0362mr1505216b6e.27.1789387827972;
        Mon, 14 Sep 2026 05:10:27 -0700 (PDT)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com. [74.125.231.76])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c3320de954sm10124537b6e.14.2026.09.14.05.10.27
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:10:27 -0700 (PDT)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9ab650so2160188fac.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 05:10:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx9AwA+N4ctSgZSO59UCfHHsGmunP7smkgAcothNO+Usd5Q+Ca7qJeG3pxq+KJet8fM8Z0kCHR9X70FDoU+@lists.linux.dev
X-Received: by 2002:a05:6820:1f10:b0:6bd:cd33:b885 with SMTP id
 006d021491bc7-6c541b4585amr1031566eaf.42.1789387826624; Mon, 14 Sep 2026
 05:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain> <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain>
In-Reply-To: <aqU5QFGmYlCtbdiE@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Sep 2026 14:10:10 +0200
X-Gmail-Original-Message-ID: <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
X-Gm-Features: AcwNN1WrtThLwvG4t-JyEDTnuDjJJzAFO-QYuNebGgduCRp--_WjKNF02oVq8vc
Message-ID: <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ceclan Dumitru <mitrutzceclan@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	dumitru.ceclan@analog.com, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu <Adrian.Suciu@analog.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Dumitru, Dan, Ricardo,
>
> On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > Can you check this
> > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > please? If there's a single patch that needs to be modified, I can squash a
> > > patch into that, otherwise v17 it is.
> > >
> >
> > These are the same warns reported by Niklas in V13. Dan fixed them in
> > smatch in devel branch but fix is not in master. Testing with smatch on
> > that branch yields no warnings.
>
> Dan: any plans to merge these things to master some time soon? Or:
>
> Ricardo: could we use devel branch of smatch for some time?

Do you know what patch fixes it? If it is easy to cherry pick I can
add it to our list of smatch patches
https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads

>
> This driver has been waiting to be merged for quite some time so it'd be
> nice to get it to 7.4
>
> >
> > https://lore.kernel.org/all/ai_txjwLPHsSKsJI@stanley.mountain
> > https://repo.or.cz/smatch.git/commit/d12183645a31b737d7fb39cbefa589e34615e8f7
> >
> > v17 is still needed to revert one breaking change introduced in v16 and
> > fix more findings from Sashiko.
>
> Ack.
>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
