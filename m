Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D6A42089D
	for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 16:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169290; cv=none; b=QuxS6l7+VxUMCXOcd+7Y5W2I1YRITh3r8xS6h8z5K6poXGzEPG7NxxvA4YvBC+vhPH/Ah1rDMNHnNXr/HddFJmJw2WiLPTIaEU3TQ9ETd3nF7Exf7JdrCX3kVdCLcYYAh9Nh242lCH0Id+5Ay8tbb3Uu/HwPfO0Y6H0q+CSrHjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169290; c=relaxed/simple;
	bh=67jqyCE7oL3eqXdhotlmpsBj9Y+xbMo5HHGjgwiAFho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sqrdarilmna2WRlyNfmusunY5AS7/kXFoy9pqJPLuktTS8TQ3O0xaVAAnAAOEPA7rk1UlirsP9pUc4hXN5DT227ukCd2/181ECmO8M80DmJYwqADPX5WU8+8NnsyVIiHwonI31gRTFJTFlC1y5UbdCdtZqaN37cvkQvlJKV4gq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyCN1V4d; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyCN1V4d"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2837248a91.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 09:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169288; x=1785774088; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFPCWJYmCtzG5hz6wV+lDFiaJ61fxXl+OCahuMFw6j4=;
        b=XyCN1V4d4PPLx2fS5TFeMJgTFVy/PJG6/3bd+VYLuRpZL7nTVgYBfTMrVo/EzZ0sC3
         N3XJjWxGDSUJCeBtSigS5xkb6/+KMz3dKNBfaKP0ttBujKdw+BI3QyrodQ333Fwq53sm
         CGSANgZuzte5SCaGvr+TzyaLp1Gzg/mPlTuKcRrtrdHeTctlJmvlXN7kbugw2qfK0A1/
         Jx194ogP5OsaGZZvZuGiX0WhyplliYJdVnlCzA4CYOqIG1z/NHK+rP13sl8FBixyHvrS
         RaQ9inFOD/+KNd2Y6TBOVbIlqAYP9ujlxgARyV0iL1uc4Sq7RaXn1ZT8Vouehsv1VrPL
         LBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169288; x=1785774088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFPCWJYmCtzG5hz6wV+lDFiaJ61fxXl+OCahuMFw6j4=;
        b=nhZDMAFHa+XV16zZlLD927cc3eQcn7BmnFybphwVNFbtEWy4d4rak8WgKT56x5/jSV
         gSL0+H1cai7xYxC9h098VrZFIE0CZoUrb5vM00sOjJH1xTxTlJjwxKTft7mxp1Jjgm+m
         fZVn/2e8UisnD1ECBTsPT/5HEmA2oHgoNfOhRW+go0vb8lFDuTCLmf2ebH6G0Zrw50Z2
         RPV6+M8D/UcWvWOueTZINtUp3OTpwi2r5R1w+IcZ4zFzha/PvsMoZiwk9TXK9QhF3Vdt
         l/MQNrof4LImPp9yrH6aNDupzzd0vmtk0cCQqGfVJhy4krcMkj2Jf5kePBHYW/1wfMeE
         rPpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSI10Zxc500U1A5Rpa/PZ6BhhKioX20mHpJGQdZ2h4Gyz06TDUvPt1C3Dyb7LvjnGXPFKneiO94Lo1JLQq@lists.linux.dev
X-Gm-Message-State: AOJu0Ywumq48qdDFAurwJ9mcIHQNB7qM/uWjPDUDibQAmxAd4Y59QboA
	ohWK7XiODdkCNUfSJlxqBZBYiKRvwpXD/qoeatPmAHrVydDnI8i0Avs9
X-Gm-Gg: AR+sD10NuKWDRDKFzpJwKz4Setjm/ZGA/Kz3/qzLxpltV69e5zLoqoV/mv76Cm+YvPt
	NZ4I347Vzju5LVdtzdCtCI9Jjxc+bXMglJeJx1sau5DxMVAOmVsHw3PscvppVla7GntUD4fMDIq
	TH9X7RRX9+9Uixia+rFyy1ejdqnXvkRUtp90S+F8930JJURRuG82Cf1EZDkPH2bImMrNV9tMWQ2
	53Uwm2DHmULQT//WzVb8lr1QXrzHfNMLT1bKKWc0J2vfjP7NplFgXLrZVG0/NypCvnc/nbGMpUe
	4GfzcARnxVDLLNquLvuB0o/7JlPvY0sW0PCQJzacYXpHwUwUBQe/j2pAGpQMsSoPAjQHkD9c64e
	mBbmnJxYK8heLwK+rElBFJttxaFDJy6i1XF47m2DsqXgaBAIqmSyzgY4xqMnd1Zp7X1N3VPe0
X-Received: by 2002:a17:90b:184e:b0:38d:ecfe:41aa with SMTP id 98e67ed59e1d1-38f2978138amr7093404a91.43.1785169288178;
        Mon, 27 Jul 2026 09:21:28 -0700 (PDT)
Received: from localhost ([172.216.252.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6411be37sm80682a91.7.2026.07.27.09.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:21:27 -0700 (PDT)
Date: Mon, 27 Jul 2026 19:21:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: tegra-video: vi: fix probe failure on
 skipped last port
Message-ID: <ameFgX4p_UvO0DiD@stanley.mountain>
References: <20260707152425.571254-1-alvinhuang0603@gmail.com>
 <DK9B2RGTKZE4.BHXZNRMJ4PWK@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DK9B2RGTKZE4.BHXZNRMJ4PWK@bootlin.com>

On Mon, Jul 27, 2026 at 01:10:07PM +0200, Luca Ceresoli wrote:
> Hello,
> 
> On Tue Jul 7, 2026 at 5:24 PM CEST, Hao-Qun Huang wrote:
> > tegra_vi_channels_alloc() iterates over port nodes and skips those
> > whose reg property cannot be read or whose remote endpoint fails
> > v4l2_fwnode_endpoint_parse(), leaving the negative result of the
> > failed call in ret. If that happens on the last port node, the loop
> > ends with ret still negative and tegra_vi_init() fails the whole VI
> > probe.
> >
> > The same defective port earlier in the ports node is skipped silently,
> > so probing succeeds or fails depending on the order of the port nodes.
> > The CSI equivalent, tegra_csi_channels_alloc(), returns 0
> > unconditionally after its loop and does not have this problem.
> >
> > Use a separate variable for the per-port checks so that only fatal
> > errors end up in ret.
> >
> > Fixes: 1ebaeb09830f ("media: tegra-video: Add support for external sensor capture")
> > Fixes: 2ac4035a78c9 ("media: tegra-video: Add support for x8 captures with gang ports")
> > Assisted-by: Claude:claude-fable-5
> > Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
> 
> Do you have a real use case where ths failure happens?
> 
> Also, mixing two different return values may solve a bug but makes for more
> intricated. I'd rather second a fix based on moving the whole foreach loop
> body into a subfunction, and make the foreach loop body as simple as
> calling the subfunction and handling returned errors. This would fix the
> code making it more readbale.

My instinct is that the continues should just be exits...  Why are we
accepting broken device trees?

regards,
dan carpenter

