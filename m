Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAEC52B1D3
	for <linux-staging@lists.linux.dev>; Tue, 29 Sep 2026 13:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688386; cv=none; b=YyTAwjE53pmfqp2ekO9kc7ZOHe22G3uvDDUpbdTBhIdSVM2JW5TsEDDsogQWRSzURj3MhUp/4NAKG7KjRF6+bt9foiksreGwZW8AFv2XqDSYbLekTdrs/K6iQ1kUFZ3+8+qodqOv6M9YL0tdvh8ZyXAZZbOau4FewElFFX7Cdyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688386; c=relaxed/simple;
	bh=XYJ121tcwt8Pk1Ea6bO06cIMEmOF6Tdyk1jKVmV1gKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0ospu2w55ZHJfOS93fgvsiV2FuCurbHDYdGRgKA+N4Z4nk8fwBwOJ2khBtlv4Z0Pny6KGKmtP2KDbk9o6bo3MZJ0yfvh2btDSRNQ735+9WkQLIIk5MBArvIJdowq7Gny67/hTGWui3n/TRopA7j1Op2OKZX/Qs4M6ril7EK6is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bU1ht8Ty; arc=none smtp.client-ip=74.125.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bU1ht8Ty"
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-34bd56cbd42so103847eec.1
        for <linux-staging@lists.linux.dev>; Tue, 29 Sep 2026 06:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790688384; x=1791293184; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UhyYRQHQ87I5M5mEOfyWjhfFcg5NiKnh4Prr6HH1V6Y=;
        b=bU1ht8TycuGffAZ+FJF8ylR7C0qnhaHB4uCclPn7RIkR1cs/zuSmBwHmF6txwVb8Om
         TAT1c7E/6dZiiGYWQUG6vrkLTlLHSba4cxYMmaU1KDYFUgQiVFWu3QBOS17YV6yGy7F1
         lF5ln49mWcPCNCimIcxSz0Zi1362Q4M9fXMhAGBanWQWmce56TbusoRs8irIf9mkknEd
         OpLcVYRSSr6DVTDHXUA+1CFmDDdec9Za1huidzpNeZNCtGlggf+utkiS8SbfixiU/tOA
         amI+8LG985BdEQJR+oPAE9xKJO1KIiBOaD8AcxRii6kdLLxeq37ujemPT0Mygxl4vNog
         7dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688384; x=1791293184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhyYRQHQ87I5M5mEOfyWjhfFcg5NiKnh4Prr6HH1V6Y=;
        b=WakPuLaM3VIzrQFFewSrEefgqvs2TU3pgGE2pSFqZHGCvaCey/6Y38DoiW3JaOlO85
         A2Mqp0MKNC1cZNXrKy5k8yN7Sa98GHe1BgHuBufc3OLbXoeJXWwnZQYGdovkMvnf2XdW
         GCz4mzUSdA7D75F47lO+Tixmn2rll9mfKcFKGq6XVaacvfTM0YsP25fHAiGH02alNZVs
         ARdAB10ug3+PI1o69ntsz3FILI0/MmBjOdtfjmsM2/ZpAqrUJWp29/ek6HJDUIklPHc4
         WQ6JvQcF7OKzYPO6vCkS+l5pcddy3FxTO0KyItIT3J8Tr13FO2hFqLGt1G9K88vYC5ZB
         nCbQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+QfJvNf2ZKvAix/goWI8CCITwr2OSu/Wm81KkSEkTztVtX50NYwvFzlAneoW0NpW5EGNZ2uv33QlHzXis@lists.linux.dev
X-Gm-Message-State: AFuF++n2wLu3goxwH2jaK2CS3Fghxw5UOUMvzigwjiG55bQcdHln47Bq
	1aziX4beh2zSZy0eSh/WeIDFOTqdhW0Z7igmKWYOZqstVQ7trqkb1P9A
X-Gm-Gg: AYBFou0hJedwdOQqztuAzHZ81WH9Kus6m1BVRvb+ybrUY6KNBM/Yx7Rma+s6Dvlsg1x
	npmG7ff9wGagmB27NrsB9LKL76Bl6LSvChz9dtB8k9msQeWL45uFJxcV6AP2PgtKzjGX2/TLRVk
	CRV9yOZJZxw1LDgYK+8/jDKgWVX/uSViAhJsfRZ0MYZlaPLl6YUbUucq8LKzbzFiRZB+4LV0DBE
	ZYm+CcBPf0rTODJ3PRMEEombISwbL7pxEZOuiv2cpjXLLmYiqPXz5l2Cw0G69ggLHw+DnpP9fIl
	T7qLbq0m+IBzor6s9b+veGBxOmHOHoXzibVXl1m3eG+RQa+Tf80KAlMo1p3qPcuUM+D36eYnbdD
	Dof/pZKDn6seHJuHCISTU4RYHerwNRcNfkb3Z80d2HcvSqLf30U3BvnqPrnTIERqS8fch2NABxx
	C4UWa7Gua+D49Reyeswem6AYxddqyAkHgHoQPoeMV345PUIC9ws1WniTL4AvGXDe4rJnxrBdBf7
	3UWz8F3
X-Received: by 2002:a05:7301:4d0f:b0:34b:8832:8706 with SMTP id 5a478bee46e88-34b883287ebmr1521357eec.35.1790688366426;
        Tue, 29 Sep 2026 06:26:06 -0700 (PDT)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm36468431eec.19.2026.09.29.06.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:26:06 -0700 (PDT)
Date: Tue, 29 Sep 2026 21:25:39 +0800
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Ruslan Koreev <koreev.r@gmail.com>
Cc: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com, dan.scally@ideasonboard.com, mchehab@kernel.org, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, pm@petermarshall.ca
Subject: Re: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Message-ID: <aru5-aq_sPUDy8dq@ThinkPad>
References: <arY2CULvwXGyVvH_@kekkonen.localdomain>
 <20260929092238.1765758-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929092238.1765758-1-koreev.r@gmail.com>

Hi Ruslan,

On Tue, Sep 29, 2026 at 12:22:38PM +0300, Ruslan Koreev wrote:

> I wasn't aware the ipu6 driver had grown IPU7 support, my base was
> 7.3-rc5. Tested now on next-20260924 with the ipu6 driver and patches
> 1-3, the vd55g1 one reworked as you suggested: the sensor probes,
> ipu-bridge connects both cameras, libcamera streams Y8 804x704 at 58 fps
> from the VD55G1, and Y10 and Y10P stream with plain V4L2. So this patch
> is not needed there; I'll drop it in v2.
> 
> Ruslan

I tested patches 1-3 from v1 on another ThinkPad X1 Carbon Gen 14
(21V8A028CD, Panther Lake, IPU7 PCI 8086:b05d) using the ipu6 driver on
next-20260928. I did not apply patch 4.

Patches 1-3 applied cleanly without local changes. The VD55G1
probes successfully, TBE20A1 is discovered by ipu-bridge, and the
media topology is established as:

  vd55g1 1-0010
    -> Intel IPU6 CSI2 2
    -> Intel IPU6 ISYS Capture 16
    -> /dev/video16

The sensor reports Y10_1X10/804x704, and /dev/video16 enumerates
GREY, Y10 and Y10P. Setting Y10 at 804x704 succeeds with:

  Bytes per Line : 1664
  Size Image     : 1173120

However, VIDIOC_STREAMON returns EPIPE for Y10, Y10P and GREY,
and no frames are captured.

Since you reported successful plain-V4L2 Y10/Y10P streaming on
next-20260924, could you share the exact media-ctl/v4l2-ctl commands
and any setup performed before STREAMON? I'd like to reproduce the
same sequence before looking for differences between the two
linux-next snapshots.

My test base before applying the series was:

  6375e61c01e93e35ee7acd336a689ac1fae4b509 (next-20260928)

Hardware: ThinkPad X1 Carbon Gen 14, 21V8A028CD
Kernel: 7.3.0-rc5-next-20260928-x1c14ir

Thanks,
Qiling Zhu
