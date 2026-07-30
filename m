Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02283403B14
	for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408475; cv=pass; b=KxmXykt0MCvfCQfHwTzYbEYVMpnx7FrmAcWNb/9VvXycfqgOrI77r338EFhCI5h5tWxPm4ykMJ2sQ7SMy6SgN+Sgmeirwp/Sfe7gS9J+JAwceAwU9LUi8Sdiet0Mm7uq6xAKxmt8qA2/9bdAyEAxw0Dgfltyhf4XaBzE4nAd01c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408475; c=relaxed/simple;
	bh=QWHUlfXnzDKC4Rqmu9EtejXt1Ib7/6596iuWwy2rcFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5fTivEcdrXFSe9fTBJKW13SPE/bYNoPF/NkF+K34KejWQ5fXGvbu/UHb2RGkCZp07VWSBDWfgGuK4B1krsb4E6+mqLKo4+ro4s/TLrF9wgUhCmGfvUH1kWfUlJG0GjTgsC03ONKN5XPkeQIZmRJVLfJ9uOEBolOGby/9NPmNOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsQ/j15t; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsQ/j15t"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-80dc4a68e4aso25583847b3.0
        for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 03:47:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785408473; cv=none;
        d=google.com; s=arc-20260327;
        b=cwGwmXwo8oOdaGarerc1fiodlYxMFkSfrQzBwnqdnsmJ/4LdoMbtTN93DRuAAGIBZR
         shIMBDKMnrUERWDmYTuGCKAJrKOsTUgZ7m0raazomUrDsbLdb2CWHadp5xFa0aX5NM5+
         EDn2uPlYNXvUwlDT6us4Z9cQg7zF3HgCEe1ykoY3vZHiCgoNBN1lFEK8hanZWtOKC/Pu
         eId344TLq85MRFyfEL/5ZmKNtvih3n34rFiLdynuFtt0wG8m23sEoG4/ybWyp/6esBtt
         Bsrea7EJDrK4h+L4NwJif2hzbgHMUXeN8FdFP0GEtGDSqcLQkp55kKwAmMZl4QzVIgqg
         4arg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QWHUlfXnzDKC4Rqmu9EtejXt1Ib7/6596iuWwy2rcFs=;
        fh=WfnGOR4Z7WEWh9DQTVdej/zpu2hbo72oh/Cl3iVEf8g=;
        b=s3ksCqKaotq57L1pGXxjQJMf3zu07v/AiHAV5QczjyE5gg8SKIKhFqGcuel65RjTWE
         ueVfs2aEBZmCavOA7CtomiN/BrCrurA6j/XdnZV2EdrPFip598sKEoLuKn6QCm9aLaYe
         bWPXbn+tq1av4tyW/VcRvxeVecYdXBh56ZbtSx1qj2q4gn7YUXs8HSw0Pq42rEHCJDI1
         EXjlFQh9FFcL8KMtgfb6aiSgeMztTmNNZNj9FQHtzv0+uL2cIhF5+tp7vP0BV9bqHza7
         XtKexVE9L+ztNON9epqNaC4cixWD5EJNduR/1P51JvMJ8YM3mxOCSBZ14AKDV8PoguDE
         rdsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785408473; x=1786013273; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QWHUlfXnzDKC4Rqmu9EtejXt1Ib7/6596iuWwy2rcFs=;
        b=IsQ/j15t0lEhSMEeYWZGI+DXepDcwZUioq34WtIizfUgFexZ+Vi2KuxExVIki7H/60
         cL8pzPVOPajpU5YNG737aNfZ+UbaT+l8O4+T6iB6y1zZJi9KtC0fmywwPLpm9MYTdwaq
         b+hPR3oj0XJv1YBw2UXhyCFy94aaNiY//uH0EAcBtg5IIdk/CAlpcf+iDnzwSbjUP7JF
         xkorGOWKy6PZTnLniNWCdjA40fcZOJ1ystQNAj2o98jY6WT9nmMcM0acFCfLh9Ce3xKj
         fk5oWNstuH6Q6AMpbOc6zIQr4fmg05A/WmxPMjFNp53PZH8CKwzFWm11gMaF3etGl87T
         55rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785408473; x=1786013273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWHUlfXnzDKC4Rqmu9EtejXt1Ib7/6596iuWwy2rcFs=;
        b=NkQxl2STo5Ib3VUg1cpgXOPx44hN/2nzyVrVMhE5OBvuQRPWJrxv6X6rKjEqO161rE
         JRpMTBcvPOHc1//teQ5RAn06g3V0099RsRc9CDhHggZ/tg2Ud8rjG73QeNMMrEU+NVFo
         9f2zfkA7inL7IF556FnvYkArR8UpcbAKP1ywyXQeP9hu2LHM+k5wYW+7xr/5qV35JFMB
         LqAO0dT/dUL4e1AyULzlvORnLiq7kxaE2O2xUb0MyOFt2rHvNVU7o0Gx/rH1Ys6fdymW
         KSGrcvItQ5S4z1vnBQqRFmTCdZf0hFyiTrN2nIuBVjmUCS9sUo5Fti/n5A+y0neFoEaD
         lN4g==
X-Forwarded-Encrypted: i=1; AHgh+RroewRou0pnonZEGj0oPxClXU3I7zrI6RQDA/seaaCeNpzSdfBucl9W28MTSQZK3tWyVCQC6khMpsb+vWQ9@lists.linux.dev
X-Gm-Message-State: AOJu0YyaxbT9xxI0Jyg48sfFDl/4lH9g78pMg8AIRnbqJPokGL6LdAoU
	ApvRwNUFk2N1tVGrKHOyormLbxfoMrg0dx23JLs5y/D7WX2Ve4c2rANuqJzEoGPEBh1fupRTvsM
	luU36fZkkgOfMTytuy4c/VGgikpyVQTA=
X-Gm-Gg: AR+sD11UkoPRGDLknyro6vrhyw2WNo73X8fBtsDCAzVifBMX4wC76tlGG6og2jTIDpm
	NkxFQm1pLPNYZAllzQq51Fd81C3LKzi2fBSPJhQDKDvFBIlsHoSFaJygo6O+NMh0JQ7R4evu5is
	WIzFPB9wQ3i4z0PtRNN+RABlWSLVGo4vfF5XIb1aE6alj6ZBVwOfPmYhnmUAkWTq/JU2i2EHn54
	rITMDtgELhbkRc/5XTWawII3FPE3/ThnNaZ8ZEnVahcECJS9x9yZsYQPZq2aHr1TD0beX1CiXW3
	QhoYRdDTwIffzG5sB2UPZm4NKCJNIcwXcPNqxCm1Jf1o0fv4xEq/b858ypLk7CX69etwjwemvMy
	C8Q==
X-Received: by 2002:a05:690c:650b:b0:81e:d792:a019 with SMTP id
 00721157ae682-81fb8956a93mr12118247b3.6.1785408472874; Thu, 30 Jul 2026
 03:47:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727112239.812159-1-congnt264@gmail.com> <amjkCL_nSJk6VRSL@kekkonen.localdomain>
In-Reply-To: <amjkCL_nSJk6VRSL@kekkonen.localdomain>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Thu, 30 Jul 2026 17:47:40 +0700
X-Gm-Features: AUfX_mwwFt2EUDelZdyCyCIVnc_Pld_oIBKNyCCIjfjES1prCoawe-ms2lIKKYs
Message-ID: <CAJpJ=Gt3wjc9oAUKA-r=4XxjgiB6cPnBGBbsopnSCJ357qcgyg@mail.gmail.com>
Subject: Re: [PATCH] media: staging/ipu7: fix async notifier leak on init error
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good catch, thanks. You're right: isys_register_devices() registers the
notifier via isys_notifier_init(), and if isys_fw_log_init() later fails,
out_cleanup only calls isys_unregister_devices(), which never unregisters
or cleans up the notifier. The remove path already does this correctly
(isys_notifier_cleanup() followed by isys_unregister_devices()).

As it's a distinct, pre-existing bug I've sent it as a separate patch
rather than folding it into this one:
https://lore.kernel.org/linux-staging/20260730103754.1480367-1-congnt264@gm=
ail.com/

I kept this patch (the init-error leak fix) unchanged.


On Wed, Jul 29, 2026 at 12:17=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Cong,
>
> Thanks for the patch.
>
> On Mon, Jul 27, 2026 at 06:22:39PM +0700, Cong Nguyen wrote:
> > isys_notifier_init() initialises a v4l2 async notifier and then, for
> > each CSI-2 port, adds a remote sensor subdev to the notifier's
> > waiting_list via v4l2_async_nf_add_fwnode_remote(), which allocates a
> > sensor_async_sd descriptor and takes a fwnode reference.
> >
> > If parsing or adding a later port fails, the code jumps to the
> > "err_parse" label, which only drops the current endpoint fwnode
> > reference and returns, without calling v4l2_async_nf_cleanup(). Any
> > descriptors already added to the notifier for earlier ports are
> > therefore leaked, and the caller's error path does not clean up the
> > notifier either.
> >
> > Call v4l2_async_nf_cleanup() on the error path, matching the cleanup
> > already performed when v4l2_async_nf_register() fails. This is safe as
> > the notifier is always initialised before the loop is entered.
> >
> > Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device=
 driver")
> > Signed-off-by: Cong Nguyen <congnt264@gmail.com>
>
> The patch is fine, but there's another issue there, see
> <URL:https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/me=
ssage/G5DTPKTRTWM5PBTFQJP2HI7T324FZF5D/>.
>
> Feel free to post a patch for that, too.
>
> --
> Kind regards,
>
> Sakari Ailus
