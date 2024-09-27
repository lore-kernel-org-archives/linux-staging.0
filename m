Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3A81BC09F
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431784; cv=none; b=cVyBig9tPhb2boPrEU0X9YLDhzsXu5v/SGgbWrNY1gLORSKA7A3qay1KGN0pSQksMiQxoiHPtt2ePN1noKndcLQL8Y/2bvOnv7EqCHN2AVEsQ8VciZUE74WGSHOjYou+AVhfSll7B0PKqiOdXL68Mj8KlBrEf3M7FWqgEJFShlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431784; c=relaxed/simple;
	bh=u1HYuzt3VcJ0Ke4gqg4Bcs27HCUdrkVdFqLZtu1O5Y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvhwO+7Oswcuyi18cRv/O+wqpLSKtqlcEZfdkXYIRZdx+uFMrzfmqUooSWTFmENJDVPGgqzWLu4oZGA7ioPB2DnCZGWLwcuS+Gv3S8n2orN0ThdAXn/y0uSKTgiy0RhQHEqiXV1qtB+0UOBkY7FTMWWvfjSEkr0zjAyC7akJejA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgshzPHO; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgshzPHO"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a86e9db75b9so313838466b.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727431781; x=1728036581; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1HYuzt3VcJ0Ke4gqg4Bcs27HCUdrkVdFqLZtu1O5Y0=;
        b=ZgshzPHO5Mh13C7uLJ1+3ULlaIl4MGFWF8f2E7Ho2d46vm1iKaz39vKgFFm4Zrk33R
         PMjCGIA2u+suTMBV+n/p/SE2HvFiuO3B2hqZYIzH0hqtVjwMVQu2ikC/9oFVMe2FV29I
         BnQM6OrpjeJrkunIHXD7GI2M/lRbUA6ifnfrZGVKTiDOPYNBcEzh0spoiahbcnrUhhxd
         sVv0a5i+omsq92Y413N82OikTErKlBqwQUDBk8QTTFf8QjMWKaB+6/NHx8+dWnCDO+5j
         lh8zyelDoCjjLxYSvn+Y91j6ixdJ51tnCSqo5IFJJdal51nzJXMp4QtsXJ5YkmlR1oQg
         iXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431781; x=1728036581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1HYuzt3VcJ0Ke4gqg4Bcs27HCUdrkVdFqLZtu1O5Y0=;
        b=wABWYD4GPl55p1hvj2Ux/yT6q389hjV3bVOIrG3vTf46H1CQGqTD9FajdsmbV2qCyT
         BlYsEZayitk5ANME+BijIiySkJnrGMzAdZOJpZzb3yGZkLsJPMmsQK44wD1h+0rYQpTt
         l6FBB+eupdZ/kEUij/mKIHnKOEc1jbMY3ArYd7m9tis4nJItF5u/x0DAkDMXW56nAGKg
         wd0rxrhqZGi9j7NY/gUtcw7PiUQWoX9hpcu0dcpCXEAo9IHKt5k2s30xcjrmQa4QWCVT
         090E6fCSnd9vaVMzo7sZoWkesJ04plQrgzSd+EOtt1oaQmx3d2v/HFGv5HBlsGn+H2eL
         0JLw==
X-Forwarded-Encrypted: i=1; AJvYcCX4spBPA7Xj9rXMKCdQjNVoXpyrVARGV/X5Yf4RPXMdtSzTb7rUKOFlWeJy9b5C77KvBqUUL2rr+QRs/liQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzPEs9aF/+ZNszZ0+ckCUTuPlVatEa8u52smYiESXbLUOiLXdPL
	bguQ7Q/r6atG1rF3DIruhx3H2JiGUwamFHxRpV4guyfTrx3cwT16n1GP+/Jzz+Uu5JBjLeABqk+
	dG48QXtjPpTSMsDL2MT/TRjToKHc=
X-Google-Smtp-Source: AGHT+IFxKrVn+eN+8GsBOc9kEvDkWwEzAHy/d1V0TW1e6sbZfloJ1RQ+VeEYJjBsCrVj4lEvUHHOb0kRXZt1hATpgt0=
X-Received: by 2002:a17:907:3e1c:b0:a88:b93b:cdcb with SMTP id
 a640c23a62f3a-a93c4a68305mr210200466b.47.1727431781464; Fri, 27 Sep 2024
 03:09:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org> <20240927-cocci-6-12-v2-3-1c6ad931959b@chromium.org>
In-Reply-To: <20240927-cocci-6-12-v2-3-1c6ad931959b@chromium.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Sep 2024 13:09:05 +0300
Message-ID: <CAHp75VegFGC6DR0RJ5QPPOoTEvwDz08tJzWirOeJvzPWKxFE4w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: atomisp: Use max() macros
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 1:02=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> The max() macro produce nicer code

You forgot to update the commit message.

> and also fixes the following cocci
> errors:

> drivers/staging/media/atomisp/pci/sh_css_frac.h:40:17-18: WARNING opportu=
nity for max()
> drivers/staging/media/atomisp/pci/sh_css_frac.h:50:17-18: WARNING opportu=
nity for max()

--=20
With Best Regards,
Andy Shevchenko
