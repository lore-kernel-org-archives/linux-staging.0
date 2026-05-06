Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F7E75801
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 06:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050107; cv=none; b=Z3YH2JKqwPw7ZpGnxX74kDe/r2CnaziYL4UEuXgCkiH/d/6DGw6XZp+Gcz6XLxrHDqQiVkEhkr0nc1Q3y/YV1gYxYVYEIhtj7EJHCc/X1Ee4hH+Uar39e8h4Tddr/T8xnEc2AUAL0uA50lCDufFC+EdqdUQHxYOOWdN/rybfhRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050107; c=relaxed/simple;
	bh=LhSvGl9W/KKKCP9MSidk7mBx9lQueEu4eXswW8xLEIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZE6Kblb/B6saFmz8iL1nfbj2Q6gMgul7qRrLXhwkNoBFaVxv8prpwxsAf2UNL3Xq27WSs/9H5JBNeZNlNoy/xrSNdvFCJ3XfUXOSNEfbeun9rCJ1DoburgmD/z5WtG/a/A3+xL/osN928+GJcf4ifEZqkLaem7w4RK1ZFKtLoTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i1lYFeeX; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i1lYFeeX"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50d876329bbso51052591cf.2
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 23:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778050103; x=1778654903; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D7YZJ2T9vrH2LCVC20seo0hp+TbmDBG7DYUsWXJNUXc=;
        b=i1lYFeeXMPR+6luFj8VYa3DmjDENkYTtOsb+totZzqhiGUXu8nps62b9BIq3IS/xxN
         SW1Fh9G36E9fZqeHhggBjSBA+YemPiuf1l957oQh4AR5qmsrPRGler/speS0uLWektOn
         aEq0wixuFflrj0zODdcKjsIy2Uirx0v8i/zho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778050103; x=1778654903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7YZJ2T9vrH2LCVC20seo0hp+TbmDBG7DYUsWXJNUXc=;
        b=MR8jui7TMzhWCL/gVJMmKwZOO/DfpWn/ShkWi9J7T+TgZHgTM5NBLGWEhz0hrWlAdD
         XOcdrk/5SM9Ww8fLLJ30/ELD1FgqnjBJ4L6AQc4M/EN4Yc6S6MmHeyh01yb/XW9URH7w
         4Nydj7v29i31N7gO3jZzJUhgHMAdFDfauWXXWuCoHp/ddH6O71yIr8qB5eq8emTnulml
         hWsUxARWRcEIn6u+sNxkiym849ac3aYe9SjgB0Rdw0ThUVpl1PU2nrXv0ZnNxgPAfO5b
         H7i4ri7iIhxwAjCdFvpczySeRt8Jndw8smcy5l+pjqNLPgjBqb2sbdNbcyPqaC84mJco
         iuwA==
X-Forwarded-Encrypted: i=1; AFNElJ+v34/awHjarHdvuHZb/W23RT/tyxT8RKD629ymJEisgqwbvRVoQX59dCV0pk0VlninXVEj5rc97ZS407gA@lists.linux.dev
X-Gm-Message-State: AOJu0YwWF47M40dyU2trjgyBc8yAuYgoSTd0etX49A3XiT2oUh8lpW88
	a2VALBD3ptghQNHrF7rT4DkOd4n6Oi72iZrxyonmsKDPNi7UGnugLA28D+mbQsEW/Tibvl2UjtY
	MBpP7PZbr
X-Gm-Gg: AeBDiesSvGEWcPMqEHFFeOOTpKs8+TBmyW4/AZhkYMtTFw4V609eRbC1alF6JpJOxmF
	risAubQ5aqnCxWVIQW1e7cUzggFdv2HAyzcGq0ke3ZeZ5NsjEeVJExxJeqBkph1PFEtbJt6Cw3l
	lJY6yb21AlF9i2K56TM+iq54sYdZiFDFC1JVewfkKX39VHOhZkmLj501xvP8MfGDo57hgic0sYk
	ayTFsz3MtOF3+G5IastqFPTHz4hJra/100MT+s1AUeDEt3I/nemAG3xFCArgMmuN//hfBDGvbSv
	BR3GNPiUvKkCihagbQXBSsKLrtHzrJke+vuil6g+0DF/C8NppYsYQEYN7CZpQlyEoqTto/WYNQA
	NbzsqTBXlB3LYhEgHfkQQBUnDj4O3Wj37rPSJfmGRSBI3M5Wq6OVlXuXsamdjtUu/edG/zpzrrU
	T6O4kByGzYdz2BgVKJlEGJy+CRlcgEvadyzcY418Itn9zsaCcUa0a6uZAPrOaNUeTAmMaY5zJAq
	dgRVXAu8w==
X-Received: by 2002:a05:622a:8c9:b0:50d:9174:cf27 with SMTP id d75a77b69052e-51461c2623emr30371121cf.20.1778050103541;
        Tue, 05 May 2026 23:48:23 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c0e7ebdsm190796966d6.29.2026.05.05.23.48.21
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 23:48:21 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8b45dff1eebso55347236d6.2
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 23:48:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+193/gjt/NhZkxLKdtZJ4WyZ5qpCGBsFn7dFrHGm0xpUH/Pzp1flr+aWLTqmVUudgK6dMxGiQh/q6K1R8R@lists.linux.dev
X-Received: by 2002:a05:6214:419c:b0:8ac:bb62:fe52 with SMTP id
 6a1803df08f44-8bc41cc2af4mr29802636d6.4.1778050100873; Tue, 05 May 2026
 23:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
 <20260504-smatch-7-1-v3-1-fda125c30058@chromium.org> <20260505231211.GE1598374@killaraus.ideasonboard.com>
In-Reply-To: <20260505231211.GE1598374@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 6 May 2026 08:48:06 +0200
X-Gmail-Original-Message-ID: <CANiDSCtwPC1ihe5u=HuDG0f261zq76=TL90oMqfP8VQ6UK771g@mail.gmail.com>
X-Gm-Features: AVHnY4J42aU3-jcCECIuBLZjfOk-seTxlqhQXgH5fZHxR8TPIMUNJLay5gvAMmM
Message-ID: <CANiDSCtwPC1ihe5u=HuDG0f261zq76=TL90oMqfP8VQ6UK771g@mail.gmail.com>
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

On Wed, 6 May 2026 at 01:12, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, May 04, 2026 at 06:54:04AM +0000, Ricardo Ribalda wrote:
> > If the fixed minor ranges are not properly set we could end up in a
> > situation where the calculated minor is invalid. Add a check for this in
> > the code to make it more robust.
>
> If it was just for that, we could define the ranges in a way that could
> not lead to future programmatic errors.
>
> > This check also fixes the following false positive smatch warning:
> >
> > drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > index 6ce623a1245a..5516b2bbb08f 100644
> > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > @@ -1032,6 +1032,11 @@ int __video_register_device(struct video_device *vdev,
> >       vdev->minor = i + minor_offset;
> >       vdev->num = nr;
> >
> > +     if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
> > +             mutex_unlock(&videodev_lock);
>
> I may get tempted to convert code to using scoped guards at some point.
>
> > +             return -EINVAL;
> > +     }
> > +
>
> I'm annoyed by the proliferation of workarounds for smatch false
> positives that generate useless code :-/ This is in particular is not a
> big deal though, so
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> but I don't want to continue in this direction with every new kernel
> release. We need a way to tell smatch that this is safe with incurring
> an runtime cost.

To provide some context, in this release alone we have found two "Fixes:".

Do you have any data regarding the runtime cost of these new checks?
Most of the time, the compiler simply optimizes them out, so the
impact is either zero or minimal.

The added checks make the code more robust for future refactoring and
serve as useful documentation. Furthermore, when false positives occur
in new code, they force the author to write more idiomatic code, which
improves maintainability. We have a deficit of maintainers, not
authors.

So, I DO want to continue in this direction. I am very grateful for
these static analysis tools; they truly make our code more
maintainable.

Regards!


>
> >       /* Should not happen since we thought this minor was free */
> >       if (WARN_ON(video_devices[vdev->minor])) {
> >               mutex_unlock(&videodev_lock);
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
