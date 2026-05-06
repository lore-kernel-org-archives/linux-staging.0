Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299BFF507
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778069587; cv=none; b=azbxo9ZDkzQehFhhCn4929s9S12xcJVwLMFHXc3YwgOMpU4/TRbFs0vD0TGHAZXwZVZ0fqA7Sm6JPkjcBAxfYgr1fNVVj7zP6KMvO4AAXp3akxd74am/qHtHpS2G3u1eQnp6nacO/q72T42Hwm2am6q3asE3Cn/5lAfFqnWtfTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778069587; c=relaxed/simple;
	bh=25EStH+ZKY3S23pfBiuDiZcfYIT3PHSSztxBuJUVBwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNh2czv5Oy84g5rZCcIwVEbz320TbgYnRZX97tmn5AA/41MpqBAXy6IhZPkp6OmdaHWJ/b4YlBGzpLCi1Lv0DYMUw0ZQCMogX0+tgzhfhk6st5Kk7TA/KApo8jL/V9Ml4s8uj8DNEfe8G6adg9uDhi9MdSNdZRnISvtWl1HwAlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LASiodmF; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LASiodmF"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-67b32c695efso1278869a12.1
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778069583; x=1778674383; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yVjlbnqQSsjSh+3tnbsmuYby63Qhu3djg55a/YfzcUs=;
        b=LASiodmFB9woidNjtvR8o4UMoYttROgJcQnuClvZjtd7dk+0RnqYJID8ssI6g3ExOY
         oOe3d2pXbi3em8uNsN26mtveW2k5lAI5vN/pHmshGJ4Gy+BhhYMfSkeuvB8Eu1k/MUdW
         2u22kKzEmoH38rfifuznYqLUjWpXAqWc959DI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778069583; x=1778674383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVjlbnqQSsjSh+3tnbsmuYby63Qhu3djg55a/YfzcUs=;
        b=U8agKZAF6RQTdcePEIpTXgNtmooB013v/OdGCMtcJ9b/HaeR2Vt+0kjK5R5n9lOK9y
         1UNCkt6DiWwCBX4H8txoJoL2UTE4ZNjptYQAvyN5Lucgxy5VlQk+m5tU23ic+0/ugEHN
         5xiqYGEopf/bDM/8yGQUs47vxyojd0R7k71KoUsmi1STojcFMVhmKhe9TMR029UzFzTO
         lD3XCTmMdJBLx7+vGBb8ZQkttXjVumd3QCemddvF84oI6dJZojggyfJRSguWAlGsLu4t
         DchZN+9knZIuNjTPdfDUeL5czWHHtFfcXS2482yfJh7dzdr85lilLX9dsFu8ic7eZ2gf
         CSAw==
X-Forwarded-Encrypted: i=1; AFNElJ8nKL3pMOGllowj01c7vCHZjgXgZyve13F9wksQhTXqg3i4Zp3tG5f47EFArVJp1qG8JLPQHpnt3xIoo/jO@lists.linux.dev
X-Gm-Message-State: AOJu0YxkUj4zENKxhj4VHky/IcnREm78nbJL13opQCPYR3Swub5dwIQh
	ImP7ZsnMK35D1QWCBZFAU97KQ3VM2cim57GGV1Gk0wH/9YUYCp8aazsn0FKLfcOhA5HYdpJCfId
	7skvpjm0x
X-Gm-Gg: AeBDietIOcVC8SY1soZpW723AwBWkNYvJVau8UF+aQRF31VDtkCj7NOyv/zGbQZntB6
	GEAAFvTQmwD8KYUT+YZ/011gG57GDqbtGZXyf+i/trJ4G0JKwd3arXQn58amPfbo0gYclmlU6EP
	Uyg373kT4cGsPv9vL6nSvi2iwW0/mHoH9q0HBFcnOh/kCZQbP7GK8OmulzWRY0x2xC34AW5rtdh
	/UGln0+CTanKnlqjuebv9IGo+JApUQESPePgU1LSWMx5fV8BMSzHggGwvcskVY8HbQv6EHeFE2Y
	2fn7LwgUyIw0UNOEa2TTYl+Oc9YMhqBznTrru1rj5YLTgdL3jxuanHZWKPW9WTTETZ4DdkkBKyJ
	XP50tFAfUK4ffJzh080ncGCmz38s6EIwZG6nMpQRVapvWHCyskz1ufzJl93tiyLZVwDxxTP02/O
	6hIr1XP0l13RJl7l9IoyTCWJcdBn4txwTYR0W7uWQvi3K5OOmlT1fuScVlc/YxquPjS9qQ/ng=
X-Received: by 2002:a17:906:f587:b0:ba9:13e2:ddd1 with SMTP id a640c23a62f3a-bc549911f7cmr165909866b.4.1778069582670;
        Wed, 06 May 2026 05:13:02 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55f30a2cfsm75071566b.57.2026.05.06.05.13.01
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:13:01 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bc1f0830f44so156157166b.0
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 05:13:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ87EiNYcj74iXeB4U3npALWKv8C098DifGcMRIcSGFQBtBcUZ4iWVywp8L/EnsiBtt2zZF1KTHZLLtN3mJK@lists.linux.dev
X-Received: by 2002:a17:906:f587:b0:ba9:13e2:ddd1 with SMTP id
 a640c23a62f3a-bc549911f7cmr165900866b.4.1778069580078; Wed, 06 May 2026
 05:13:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
 <20260504-smatch-7-1-v3-1-fda125c30058@chromium.org> <20260505231211.GE1598374@killaraus.ideasonboard.com>
 <CANiDSCtwPC1ihe5u=HuDG0f261zq76=TL90oMqfP8VQ6UK771g@mail.gmail.com> <20260506111838.GL1598374@killaraus.ideasonboard.com>
In-Reply-To: <20260506111838.GL1598374@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 6 May 2026 14:12:47 +0200
X-Gmail-Original-Message-ID: <CANiDSCvo_J+jTUAjWAMhoVWnkvaYFH_=LJ+TBovfDhcskaooOA@mail.gmail.com>
X-Gm-Features: AVHnY4IQkpK3-5RS14A7VUMwQMw6jxPGx8jG3XavvTzh8GHEisq1RNp9k2xsYIg
Message-ID: <CANiDSCvo_J+jTUAjWAMhoVWnkvaYFH_=LJ+TBovfDhcskaooOA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] media: v4l2-dev: Add range check for vdev->minor
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Wed, 6 May 2026 at 13:18, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, May 06, 2026 at 08:48:06AM +0200, Ricardo Ribalda wrote:
> > On Wed, 6 May 2026 at 01:12, Laurent Pinchart wrote:
> > > On Mon, May 04, 2026 at 06:54:04AM +0000, Ricardo Ribalda wrote:
> > > > If the fixed minor ranges are not properly set we could end up in a
> > > > situation where the calculated minor is invalid. Add a check for this in
> > > > the code to make it more robust.
> > >
> > > If it was just for that, we could define the ranges in a way that could
> > > not lead to future programmatic errors.
> > >
> > > > This check also fixes the following false positive smatch warning:
> > > >
> > > > drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > > > drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > > > drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > > > index 6ce623a1245a..5516b2bbb08f 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > > > @@ -1032,6 +1032,11 @@ int __video_register_device(struct video_device *vdev,
> > > >       vdev->minor = i + minor_offset;
> > > >       vdev->num = nr;
> > > >
> > > > +     if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
> > > > +             mutex_unlock(&videodev_lock);
> > >
> > > I may get tempted to convert code to using scoped guards at some point.
> > >
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > >
> > > I'm annoyed by the proliferation of workarounds for smatch false
> > > positives that generate useless code :-/ This is in particular is not a
> > > big deal though, so
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > >
> > > but I don't want to continue in this direction with every new kernel
> > > release. We need a way to tell smatch that this is safe with incurring
> > > an runtime cost.
> >
> > To provide some context, in this release alone we have found two "Fixes:".
> >
> > Do you have any data regarding the runtime cost of these new checks?
> > Most of the time, the compiler simply optimizes them out, so the
> > impact is either zero or minimal.
>
> If the compiler can optimize them out, then I expect the static analysis
> tools to also get the ability to avoid those false positives.

Ideally yes, but LLVM/gcc has hundreds (maybe thousands?) of
contributors and sparse/smatch are maintained by a handful group of
heroic warriors.

>
> > The added checks make the code more robust for future refactoring and
> > serve as useful documentation.
>
> In this specific case, if we want to make the code more robust, I think
> we should have an array of minor offsets and calculate the minor ranges
> based on that. It would avoid offsets and ranges getting out of sync. I
> don't think it's worth it though, because I don't foresee we will ever
> change ranges for the fixed minors case.
>
> > Furthermore, when false positives occur
> > in new code, they force the author to write more idiomatic code, which
> > improves maintainability.
>
> Up to a point only. Sometimes guarantees are provided in a very remote
> place. For instance, control values have ranges that are set when
> creating the control, and enforced by the control framework. Adding
> range checks to .s_ctrl() is redundant, but I don't expect static
> analysis tools to be able to understand that the value is guaranteed to
> be within the range (especially given that we support modifying ranges
> at runtime). How can we avoid those redundant checks (or mask
> operations, as in the mt9p031 patch in this series) ?

It depends on the nature of the range check and the consequences of
failing it. We can decide case by case and worst case scenario we can
ignore specific errors.


The mt9p031 patch in this series is special, the issue is not the
range check, but that smatch did not properly handle a mask operation.
Dan is working to fix it.



>
> > We have a deficit of maintainers, not
> > authors.
> >
> > So, I DO want to continue in this direction. I am very grateful for
> > these static analysis tools; they truly make our code more
> > maintainable.
>
> I do like smatch a lot, it points out real issues. My concern is that we
> have code that offers guarantees in ways that are not visible to static
> analysis tools (or to compilers), and having to add more runtime checks
> everywhere to silence warning is not nice. Those checks can over time
> become redundant (because tools improve, or because we remove the code),
> and will likely not be removed because nobody notices.
>
> There's a broader question here of how to connect pieces of code where
> one piece offers a guarantee that the other piece depends on, in a way
> that can be exposed to tools.

I agree with the idea, but this might not the right forum. It would be
a great topic for the Kernel Summit, though.

The "rust people" would love to have some annotations about the
guarantees of the C code.

But until we have those annotations the best we can do is runtime
checks where they make sense and keep track of where they do not make
sense (allow lists). That will make future discussions more
productive.

>
> > > >       /* Should not happen since we thought this minor was free */
> > > >       if (WARN_ON(video_devices[vdev->minor])) {
> > > >               mutex_unlock(&videodev_lock);
> > > >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
