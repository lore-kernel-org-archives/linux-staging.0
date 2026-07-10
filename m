Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953613D0C09
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669360; cv=none; b=T1cQXnD/BoBIu1SowPzSfSzg5JREUJCqbjkz5bfG8Sc2V0mRz62gNwbJVpbMK3zFYWgJi14XxcQw996FW22PHNr9yOSuVON5mDKI7Xze9HQIDpVkWsTM+xSiEW7Gla1QmuGUTWlN8gNXNN+hhoanwMCSz5/bi8CIVTggIX7dT0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669360; c=relaxed/simple;
	bh=fJyw3EwJS+C7+OwdfFKFVk+jzCS6vs1g2XNuSa2azqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFpnDAXQk0zz+U9lN9EcBu0ERMxW9PkmHxGfgGj2t6hfjX/z//AZKPEZQ4sSSkMdFZjkLUnElIQCrghpa9kWGkEhqg0tq6QKnWFEwaKnncfQ6lrgqN/mzgf6a47GgEN7g2jK+BCdqI0t0ugxYuDPGh4NkhkVVqKK2sSLihoN3qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0znrvaC; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0znrvaC"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6a377223171so239243eaf.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 00:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783669358; x=1784274158; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kNMWIhd4Kn6qK++so+3j3gVzZtTmvgc+EmxNrLVjwPQ=;
        b=M0znrvaCM33uGuq7J/vpOf6u+g3JtG3aZbGSqnMlLWc6qAQay8L/pBBAiUc6Z0HEgs
         fknbQfk4tEA3SsYlUTDuJlQsMfa7iqi18Fn5oyP47QSUzj1gMoFwv0x1TIrMilxJlEky
         yrr/4YM+rJQ1z5gGuhgrtAlvjIbz1e0Cuo2jvUFLQaYZctJJ0He03Y7XnQwtE2TParUD
         ZFL/8wFYroIHZF6mzg4Ng+/P9flT29yYcxe7QEKXquWd4flrrlBUne3BPpydZRNBi9Hw
         orI2xj6EWSk8DufwsF9EIQFR1cNGbqqF9dsHi/zynjAw9xMFtexM8O98QeH2zH7+tcgz
         fU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669358; x=1784274158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNMWIhd4Kn6qK++so+3j3gVzZtTmvgc+EmxNrLVjwPQ=;
        b=EF62FbiFYAhQH+4G6ge1AIO9bD51+ZPh1zht609xa+FRqNIpikEmMtbzQANhbpAf4j
         9j1WUzdKuQwI1Hn0DgO0FTUVHsLkcwZ5pAxY0PtAwSWsd0bU4XMBAAtX4eAGWldDXCFz
         +FQ78oWbT3fgFRSvGuQfa1FF55eiubDBBcLy2FEeNpcQy959J9FgyXWzEiZfzVEJtZ0z
         aco9UozfFWiQrOpGlUaE7hxkwK7fx+ikx8IOmdvty7x4pm7NDu4q+cv7bOa2xtIhdoxs
         qdj1vFq8jFO4QKmqgrsQSTCfKLf3+zrt0230zs7GTSQmYA3+vVfPxBiJod7iQy2/EgUK
         p4Dg==
X-Forwarded-Encrypted: i=1; AFNElJ89xbzisbS8fqJohs+9Q4X13ZqTGWkDxFaP2TbEvwLkhCPDYsT88YmrK9CPGrhpJci5R78ca2fkz42IpluJ@lists.linux.dev
X-Gm-Message-State: AOJu0YxUAuus+9qiO8DQHDApsiZMC4JKWjJIFSttCytqpjMQIxI+iv8G
	2qT9DvMn0+Z20YNSaS0cuHbipvy4HLMv5Cw8TXxlASX6Zi4TV1K9uPIB
X-Gm-Gg: AfdE7clBuFSrEx07xXRgPxR6O4dB8pKucwWjF8Zs7ju8nF1mvCvE3oQ9T13uKBCcViW
	eYPur9i/pMnyDsU3hC+6VNH8dBoponpt4vsxp0+fXIOv5bSLMgKwAtQWHomioY0974AIeHZs0/t
	ajfhfODPleW4hym42mLCJRAfYHc2q+zUMoZkNhC6x6E8oNbjKh+E6Oc6M4/nCW7uwS8yLqKuNQZ
	RQPDPMcOwEUIJ8sXv++Sx+Y9TgUhS16KuujKgNcdpnBA8IfZ9LGV3qVaT8eMe7qMs1r2CWWeTHj
	36dIjqsbCRFoPDAcwUFVA+FYY54+5Y6FRukIDqOZogqFHAkcoN1u9wn9A+yl6jNbtwSFMTS/Uex
	yGgpurgKPBkFbs2rwHkPqrDRG5PRTsHEZDqnQPmDv9Hp4EahLP3a2uyGahJX0BXw9cs6PjYz9bp
	IlVgSF
X-Received: by 2002:a05:6820:981:b0:6a3:8023:f343 with SMTP id 006d021491bc7-6a38023f3b7mr3977072eaf.16.1783669358539;
        Fri, 10 Jul 2026 00:42:38 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38b9ccff2sm1158317eaf.3.2026.07.10.00.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:42:36 -0700 (PDT)
Date: Fri, 10 Jul 2026 10:42:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hao-Qun Huang <alvinhuang0603@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: hid: fix SET_REPORT return value
Message-ID: <alCiZxAXbPDq3P4e@stanley.mountain>
References: <20260704081613.434445-1-alvinhuang0603@gmail.com>
 <ak99bENMWC8saJL4@stanley.mountain>
 <20260710020644.6728.alvinhuang0603@gmail.com>
 <ak_tgJC8-d1HPKuV@stanley.mountain>
 <20260710124050.31335.alvinhuang0603@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710124050.31335.alvinhuang0603@gmail.com>

So the patch has already been merged and it's fine.  The fix is
correct.

On Fri, Jul 10, 2026 at 12:40:50PM +0800, Hao-Qun Huang wrote:
> On Jul 10, 2026 at 2:50 AM, Dan Carpenter <error27@gmail.com> wrote:
> > The bug is not hard to understand, the issue is that this changes the
> > function completely...  Was nothing checking the return before?
> 
> It gets checked.  The value flows unchanged through __hid_hw_raw_request()
> to the callers, and they look at it two ways:
> 
>  - hidraw returns it straight to userspace (write(), HIDIOCSFEATURE),
>    where it is the number of bytes transferred.
> 
>  - in-kernel SET_REPORT callers, some testing "ret < 0" (hid-multitouch,
>    hid-sony), some testing "ret != size" (hid-gt683r, hid-lenovo,
>    hid-razer).
> 
> So the old return 0 was wrong both ways: the first group had a failed
> SET_REPORT masked as success, and the second saw every SET_REPORT as a
> failure.  Returning the count or a negative errno is what GET already
> does in this driver and what usbhid/i2c-hid/uhid return, so nothing
> working with those relied on the 0.

What I'm trying to say is, sure, it's easy to see the code is buggy but
it's been that way for years.  Your patch changes the return completely
from always returning zero to never returning zero.  When we're reviewing
this patch we want to know how making that change is safe.

In staging often the answer is that nothing was calling that function and
we can delete it...

But here, the real answer is that almost nothing checks for errors.  For
the few places that do, almost all of them only check for negatives.
That's probably how the code was able to work as it is...  The commit
message it should explain the risks.

"Changing this code is fine because almost nothing checks for errors.
There are a one or two in kernel checks which care about the exact
positive return and this patch will fix that but basically not much is
affected.  And hopefully userspace doesn't check either or it only checks
for negative errors.  But in the spirit of correctness, lets change this
return to be return the number of bytes and if userspace needs adjusting
we will deal with that when users file their bug reports."

regards,
dan carpenter
