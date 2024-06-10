Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BC674054
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718011512; cv=none; b=ZYy7QeJAJcgHQdqjcKfitBjafWuMeN2OEV6NTNW809apOZ28I6PzMv5vvAoqgSjFAU9B1woAv/RHPk0kmdYGLmvO7oYrS+bExuItTg4qVmipnowHmtmNavjLd/kDB/vpK7ugth1Hn9bHi8pdYeLqMXqfCsvKrZ+hpdvO3Tq4KhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718011512; c=relaxed/simple;
	bh=JTZOwPU+VxB0/kN/e2KfZLF+FybumIOZw9skQ70PxTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xy9ILlorNhxtEw1gQSQUjyDaF1DScxR8xoX8J8MhTEEYqpNdQIEnbb1DOL4cgIJF9ICQvuGYDnPcWC9v1IK2J27Tfsk7DTqbjiR70UptFou2mCHwFOuxjlLec3cW9Ow4HADJHzVBlzTgoQ2+9yCWPA65Sf2ZQLm1tqIjfEgd7/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=f5xClaf2; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="f5xClaf2"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfa7faffa6cso4616821276.0
        for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 02:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1718011510; x=1718616310; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oxXFK2e0y5r0UCujN7S/+t7hqwk7APqO+4L4P/I+uyI=;
        b=f5xClaf2NOdGeJfPX9HQbTUM0EHjA3uttTCIDCHtsriiWVzaia3MgR2CPaT1zIqF9o
         2zGxBspUAjMdriklqQ8XnY3WyX0O6FFeCrfbgwdrUFMUWvRmlcuklw84eJpOONSfp4pR
         qCwX8uHQzo4R9Yw54ecP8vMgj0M4TeR+JmPCW99wra8bpKMwh1hz91/mg+pS7xn+tfWM
         N4kCgTyWP5p7YEWXWjv+5Tj+QZTelMtTaPnaNnPEHLFaBuxplih/F5IDNfzfkM3XiW5f
         FzutK0smIFYAUahqsXY4PXInCznXJpn+3lAcgbjGMQpc/QYeYRBG2nTEEeJQQBTeu9xq
         Y4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718011510; x=1718616310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxXFK2e0y5r0UCujN7S/+t7hqwk7APqO+4L4P/I+uyI=;
        b=e7boO5HNBq98IVO4vZkteEmhTOL7XBERQyJ1pfz7MmyAffkzWG2cNy6o7YhJblLMX3
         3eSkYbRmBTzfJAbEjxzCObifPzTuiNIopUwQtJNbNpcUj/3Laefr+shpvPx4dLQLhMS5
         noeeHDdXkTc9neIkelOA27euh3gRFRSgD407uBAFgngA8oTzYCciM88m+NjYVxjohVyG
         PRsY5CcPK2OJ9gGjAbtdDRP1jgp19oHqi/dWxzMRs8M+F2EiO5q4HVXNEY/oHXgZnRxh
         jgyiizBANsY3Cv6L8xkJFovIq1DYzVaFW1/r8XG9mQ518XF8t1s0PPM2jF6fRH152zs6
         2Pwg==
X-Forwarded-Encrypted: i=1; AJvYcCWq2DFkZx7nGz1rQkfbzIkY4kKBpSGfgF7KnJFcJI4iyfmx3lZF+qrpLQzbWvBDUDGpqtuvZMPl7sWpDS3HgHbQ62PFnzhtKuG/Y3zoug==
X-Gm-Message-State: AOJu0YzwHd7TjaYGqQ5SPUM2oEM3xq9L64JUA69tpsGUvn6jjBJLi16c
	lYq4dV5Nb1yVH3dsCg08tib23GBCaF0+Mt7KwqAZHS7TJl+kt6c0yAY0psHB0RZl1GWXBcUWa/T
	RaZg3jtIhYD0dvFgp7Q0yxw/MhfU5EwODY3j95A==
X-Google-Smtp-Source: AGHT+IFzjKyHUSwXJNHdF5VhGBs59NqiC+cGMmseeVgQSgaRCXI3j1ciK8rp7iILS2q9Ti/coL/8R7d29jjd+6mARXE=
X-Received: by 2002:a25:8e09:0:b0:df4:f2d2:fcd6 with SMTP id
 3f1490d57ef6-dfaf66bc863mr7585983276.44.1718011509948; Mon, 10 Jun 2024
 02:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ad2b7034-ecc9-4d6e-844c-bfe32fb5b23c@gmx.net> <9d603d43-0f8a-4f9b-b11b-9e7543f421b9@app.fastmail.com>
 <CAMEGJJ3BqY9=9cq_JpKTVhyWKO50hcbEK0MXkBcYZwqadciGiA@mail.gmail.com>
 <72a414e4-4cd0-4b12-a662-cb73d1e3515e@app.fastmail.com> <20240610091534.GO18479@pendragon.ideasonboard.com>
 <28495bd5-41af-41b8-b427-6b6fd36a2740@app.fastmail.com>
In-Reply-To: <28495bd5-41af-41b8-b427-6b6fd36a2740@app.fastmail.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Mon, 10 Jun 2024 10:24:58 +0100
Message-ID: <CAMEGJJ30ffMSd40YpqGuMWOeazoT+oiDvzkYEc37jOTx4fZBNg@mail.gmail.com>
Subject: Re: WARNING: drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:364
 vchiq_prepare_bulk_data
To: Arnd Bergmann <arnd@arndb.de>
Cc: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Robin Murphy <robin.murphy@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Jun 2024 at 10:20, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jun 10, 2024, at 11:15, Laurent Pinchart wrote:
> > On Mon, Jun 10, 2024 at 11:00:12AM +0200, Arnd Bergmann wrote:
> >> On Mon, Jun 10, 2024, at 10:26, Phil Elwell wrote:
> >> > On Mon, 10 Jun 2024 at 07:00, Arnd Bergmann <arnd@arndb.de> wrote:
> >> >
> >> > Why is swiotlb involved at all? The DMA controller on BCM2837 can
> >> > access all RAM that is visible to the ARM cores.
> >>
> >> When a device is not cache-coherent and the buffer is not
> >> cache aligned, we now use swiotlb to avoid clobbering data
> >> in the same cache line during DMA synchronization.
> >>
> >> We used to rely on kmalloc() returning buffers that are
> >> cacheline aligned, but that was very expensive.
> >
> > Could we reject buffers provided by userspace that are not
> > cache-aligned ?
>
> My guess is that this will likely break existing applications,
> in which case we cannot.
>
> It's probably a good idea to take a look at what buffers
> are actually passed by userspace today. That would also
> help decide how we allocate bounce buffers if we have to.
> E.g. it's a big difference if the buffers are always
> within a few bytes, kilobytes or megabytes.
>
>      Arnd

vchiq sends partial cache lines at the start and of reads (as seen
from the ARM host) out of band, so the only misaligned DMA transfers
should be from ARM to VPU. This should not require a bounce buffer.

Phil
