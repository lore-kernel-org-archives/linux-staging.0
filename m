Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D236E32ED40
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 05:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780292392; cv=pass; b=mgL+Vy9/r3G/Qy7piQCXHUQBmODSIMVgm9RK4oGutW9tpcQiv6PNjdaiTaNV6IRNM0I4GsCoxqGHtg5rkUpIYfASu2iDVKmUQHqxrysFGI7GEocWSGpAo1656eV8qtVe3/fsK8ExZ4vv0kw+e2GTqN2uGG+qRWxQIhcYoJu6YZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780292392; c=relaxed/simple;
	bh=fhMh7VI+fDjToJYmmaPjtR0k2mbAxzQziy8hOa/+IsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BV9/VtwYtk0ZUIVAuSv9PCatZ1cFTfv0ldeeEtZLUNWIYnHRFpUKF+kITzgCRmIbu1x0BoTV9mgWhCyMybbbv4Jjdr+WoQ4IdcPE5Ue1U+0/GJ3LrJzh6dGVqec+ezMb7nVuC8dcUucoHIG2e9gssmkgdxJ+txDeeTTqI5QVoEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+UOUrIi; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+UOUrIi"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so614755b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 22:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780292391; cv=none;
        d=google.com; s=arc-20240605;
        b=I7kz5sqCrT3rjV2vMl6UeIa7Wx3CPoY3h+YrwZmhZwsV4pV+LV46usr7XMZovlxi2a
         50yr7SxYNbLSdiTfZFjeNLbuxqsUETzqOMZH/HHq/RGc/VguWF0C/q3RXwAN0no4FaUa
         NVqxObNuYsxZqM/W6q1evM7xg33iQ+du6GvU0E9ZWScyz+Jovqg0KBsEZDU6QrsR32LZ
         Icr+VlX3n57hPATYc5h258DQ7zUJwbmSJAae8WTf02NGRsBUbvdZKqN6IR7m7+PzW7Am
         7icMdRlzndpzQzs0+xNQPtjHQiGPlcZGhXhe6MoganOrIZQ0DbHolkkQeiWB5pUF1KT4
         B46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=++Hez6BcFzhV60mZuduDVLo3yt8bc2DYA37KVaO+BJI=;
        fh=+yac7hYDsQCSZ7kYGre20aDzumjulYQHSL5bZuF66qc=;
        b=arups36NB13vP+tBt6G5r38d9LaZsXQaHmIOnSqG5CHY//spXuKbB9ZHBSpLujDbzx
         UGUJnMRKd8y7a30ho9Ga50ToN74DgNUwD3Y+46EIRklOcKie+v7FvmxObZHudyx2h4DA
         dMy98XN7bjxsI+Xh9hOiiKiRi5e+65Vhb8vnQ7Jdk18l2p7T+H/POyGM/jS7SzZUW0qe
         vdKukpalFCDWeQV9XIfD3Oj5ZO5U0Hr5U4e+HtH9WhcqlyG06zlJOWjSKSnaC1TS1V7d
         UyHTsqVA2BXjbFgqbhmhTI8yWEaPcLRupCyiDhH21jaWAanMXcktTlE0FkIrGUUSE9nd
         Ro8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780292391; x=1780897191; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++Hez6BcFzhV60mZuduDVLo3yt8bc2DYA37KVaO+BJI=;
        b=O+UOUrIiCBaVgdGG6QwrtaTtUNLAEJT+0qjsLC2/La5riPZE1AbxqNMyDnVIh3RJuN
         Vk1T2T8o2pKsJ3FE7zEiH1MIBTi4iqBM7gqxAN1DMg1DvH1H+Ge+BaGjAl84WnRcW+/k
         mL2c7Ly3b78Y3610rtUt2CaOThq5RE5jjBE8hk6tmpR7nw5MT6+EM1vxbpYSJLBoem73
         e8uyeAB0sUgjNPHmDGd1ZyjqOW20YFs/M8WEVCzN1FmRHApoWgimMENHQYIMeFRLE//c
         mTs3QAYvslntHKF+Bv0dZQi1/ZRchXQJ0MGCzTJYFngbq1w7aSbsaia+i7hOi4u5EuRs
         uGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780292391; x=1780897191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++Hez6BcFzhV60mZuduDVLo3yt8bc2DYA37KVaO+BJI=;
        b=rmvYUwLfQi6NfMTYyY/CI3aS7LT2awtzZ3/dDbKQ6FMZ6dLetijl6bzVUzx8A0U0Nd
         H+mi3jrgaTmZuDffnNI0kbW+8seTpvncmNdu5GT9lEBAlCSgK0XvQoDwhjIBQurgwvpm
         LdyDtSfiU5UySQ+U9wWXK5Nz0adTFu4758yj6GbqDA/Feb06bIZ43F76QuCjufGGQ7oY
         Uz8iXfwlBOv2mLZZrHkQut5exlI9hrPD5cw2KbUnubqQ0Yi6FIvINajwvBy/JzhMN5ho
         iAC8vCl6K+1v1txpssG57hJdenn5PBjfJNgF0S/CQ7JyqHfwpDuyQlNmot9x/szjZka/
         0etg==
X-Forwarded-Encrypted: i=1; AFNElJ+sJNrdh0gz0HboBBSU8LY2xKKT4RWx/bCAucM+jkWjuDKQhGOAXHAoctsvNNikNg2eYkoMhFD5+pdXrAa9@lists.linux.dev
X-Gm-Message-State: AOJu0YzWojiBVS3stZ7L8mL9yXc559+Y2lc2d4mijVyYrUqZHAVh4nVY
	8etJk2q6zObhOgFAV6kaQJt7tlp4hxmbH/kEOZjLk+izq+IY0pYIj/N9a8jt1yGboQ8mLeyESMl
	ld1lUVR6HnAePrRb7oR0KsoIOumB6YDo=
X-Gm-Gg: Acq92OFukY0/6VFs+Q9HXGj07ufh8HDk3spcdhdmfoi+CRuaagID647p+6fGyvmKzuK
	DkCaYjphP2WeFls4ueNGxFLMQxbClJ1HxhQJJK0R/nclWiK7IJO0mTAE92ocLvR24ptNYvtlG6K
	RXnwkrBgy/nmDh+GZCOEXy0yUKzHVsX13fK6pMoy2zHO7dDtUVKQgpNrMUAxCW62rEeB1qsAQhj
	UAEmCpUp3i7bKUXpDN9ZHepj9lho8FLHEMKxRiTXYlVpFk1+9iBlxhWkCOCIyO4Lv5FBxFRDbXM
	YWsaJKlYYb+ppkjgQWnSXr9w5WTUrg==
X-Received: by 2002:a05:6a00:aa8c:b0:829:b08f:7353 with SMTP id
 d2e1a72fcca58-84225806185mr7434867b3a.7.1780292391030; Sun, 31 May 2026
 22:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
 <2026053145-bungee-flyover-840a@gregkh>
In-Reply-To: <2026053145-bungee-flyover-840a@gregkh>
From: Grewstad <dogestad24@gmail.com>
Date: Mon, 1 Jun 2026 11:09:36 +0530
X-Gm-Features: AVHnY4KL0P2TgGuqwzNPsVxgOuqCoiWIuNNwDFufUXPHqDJofsznfpXWQubqhvg
Message-ID: <CAD03fjaxcS0rfZbNPNQjg7HxAhhTvOBxH=p-Rj_ngaGBPmpXMA@mail.gmail.com>
Subject: Re: [RFC] drivers/staging/axis-fifo: TODO file and subsystem direction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jic23@kernel.org, jacobsfeder@gmail.com, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	hjk@hansjkoch.de, davem@davemloft.net, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 8:56=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> There really is no difference between a miscdevice and a character
> device, the interaction from user/kernel is the same.

> UIO provides a mmap of a device to userspace where it is controlled
> directly.  Probably not what you want to do here right?

Yeah, on second thought, UIO is probably not a great fit here. This device =
is
expected to handle streaming workloads, so having a kernel driver manage
the data path seems like the better approach. Thanks.

> Is that what this device is?
> WHat really is this device for?  What is the goal of this hardware and
> how is it used today?  Do you have the hardware to test with it?  Who
> uses it?

Well the hardware is programmable and meant for hobbyists and researchers. =
It
could do anything, but SDR/DAQ and low-end networking are common uses. But =
since
It is a programmable prototyping board, making it hard to cleanly
categorize it into any
one subsystem.

I don't have the hardware, but I plan on testing it using QEMU.

I was looking for guidance on whether the current miscdevice based ABI
is already the
best fit, or whether it could integrate into an existing subsystem.

Thanks,
Arihan Bhor
