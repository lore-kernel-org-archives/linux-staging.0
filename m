Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2E118C926
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355530; cv=none; b=tH/8pOymkpXQQvjHdbzUW/oyNjseCsC2Te1cibrxpL6J8DgtmooeXdquIzHjf3PSyM9iGAa98s0r3wKsigRke4gm6WTjSCv5CLgp9t0D3c1Fcs3n6ZDyedQUODbOeacGVW83WHXt3ghq/DMrcwpsh3uTmrEjdqXSX70auRbm5ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355530; c=relaxed/simple;
	bh=ciJceeDlK4Y/meCsbSLF/LMnhpaQTDx0EUKSZhsR9W4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rcfyvrK71M7cGTZG93RlzCJdpjPEjAGtyH4CFLUEZWTjCtxfJjgPZlaYNmJTJWLXOfAXUlxzcxSRxsOvOETsPpzCOlUukkg7799vofbsJyGnF+VTdEiHjmDks/4igzRfmghZaiMzmkmtAP6wLb3u0wUUq3HIeS6zA6n20sT7Cdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=S/GyJdL9; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="S/GyJdL9"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-79ef72bb8c8so194495185a.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1722355528; x=1722960328; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ciJceeDlK4Y/meCsbSLF/LMnhpaQTDx0EUKSZhsR9W4=;
        b=S/GyJdL9n0D1Z08eMtnCx+5bveMSRkNpRRg/N3CbdKMaDecP+QxnF3S7fB3wHSX4mo
         LCLsPUR9pNmdIMpL4c7SbTq3AW6hW/rlWGwWn3PMDV/H78lRokNAJ262EDaI7Rdlx0T0
         OuaXPlFmNwX7tJ+sHllmn1QAyffUPcJULQkDuITe4oqCStxNYfHAuHfFs1eQaEEpmPJZ
         jRErEeVtLKWHLeCSHMPDuQX+uAikeYDh/9BjnYtWvYz2cMU2z5kU5YmDXvdax6Q/HZyE
         hHtSswh57gV4Iov2ngDaED11pvk2naomdFbNCNYsMHql4F16HCwXXAh7rTscA8kz17F5
         yQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722355528; x=1722960328;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ciJceeDlK4Y/meCsbSLF/LMnhpaQTDx0EUKSZhsR9W4=;
        b=O9jq+lLMuL2OYBexRkp+E6HOpWAeIv5KTQFVUVSDunXVxlgQG/To2tX7usDPp3LHqc
         ehhu5y3Kb40a75wSUm+K/0ZnG4HzKNINTzLGoV0JFJzBP3C+5SHbD/BSnNwfA0DSb8DX
         kNTccoQ8nEd3kKzA3ukKWKrcfQQdHTnfys8oIKpZC5E6ey97fqL7vMyIqaBq45zPB3Tn
         1K0qEUFiSK6RKjseWloKfo0WpVnur6yWEN8h+u/nx+mr65J346FMUMU+oPmiqI+XXjvy
         K2cmQ2dv8fw5G1Apba6Gposp4I8JxutF6v2RqTAV4rHNE5AD4aBry+AZBFtr09f9n08z
         v5SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxvXB1SY72iHt083jRx61tGOzvuAYUGqyP/9dyBsKgpHjuQi0xz+MmndJbkVtV8h3Kdupe/SMB/NmqKfJxBJPN/kZUorjc9S95+kgmWA==
X-Gm-Message-State: AOJu0YyU1N9S6h55VjCFGKtq+/zH6KiEYRiKTvtTlQt/tHfmWOGtZjBm
	8LbVuh0/Y7lDKWJkwk6EY/BO6Qj73SFpZ3cz9gZN95FoRCGviiiKAx5tBUepa4c=
X-Google-Smtp-Source: AGHT+IEqLv3C2h4BQ+3fI7pKVhff0eutIQIkZ2jsV14fbu5lHsoFKAnZxlGiOhZ4pHufize9xVS64Q==
X-Received: by 2002:a05:620a:4090:b0:79b:efe1:1222 with SMTP id af79cd13be357-7a1e52fbb32mr1673543485a.63.1722355528312;
        Tue, 30 Jul 2024 09:05:28 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:820c::580])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d745f06asm644089685a.134.2024.07.30.09.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 09:05:28 -0700 (PDT)
Message-ID: <2229769f3a9baf58fbeeed93fa4b0373a02055e3.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha
 Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Steve
 Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org,  linux-staging@lists.linux.dev
Date: Tue, 30 Jul 2024 12:05:26 -0400
In-Reply-To: <8aea6cc0-10bf-48b8-add9-eb3f1caa2d66@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
	 <20240724002044.112544-2-marex@denx.de>
	 <5e5fba4fd6c3c0c9df23697bd328367e5fdfa923.camel@ndufresne.ca>
	 <8aea6cc0-10bf-48b8-add9-eb3f1caa2d66@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le lundi 29 juillet 2024 =C3=A0 04:16 +0200, Marek Vasut a =C3=A9crit=C2=A0=
:
> On 7/24/24 6:08 PM, Nicolas Dufresne wrote:
> > Hi Marek,
>=20
> Hi,
>=20
> > Le mercredi 24 juillet 2024 =C3=A0 02:19 +0200, Marek Vasut a =C3=A9cri=
t=C2=A0:
> > > Introduce dedicated memory-to-memory IPUv3 VDI deinterlacer driver.
> > > Currently the IPUv3 can operate VDI in DIRECT mode, from sensor to
> > > memory. This only works for single stream, that is, one input from
> > > one camera is deinterlaced on the fly with a helper buffer in DRAM
> > > and the result is written into memory.
> > >=20
> > > The i.MX6Q/QP does support up to four analog cameras via two IPUv3
> > > instances, each containing one VDI deinterlacer block. In order to
> > > deinterlace all four streams from all four analog cameras live, it
> > > is necessary to operate VDI in INDIRECT mode, where the interlaced
> > > streams are written to buffers in memory, and then deinterlaced in
> > > memory using VDI in INDIRECT memory-to-memory mode.
> >=20
> > Just a quick design question. Is it possible to chain the deinterlacer =
and the
> > csc-scaler ?
>=20
> I think you could do that.
>=20
> > If so, it would be much more efficient if all this could be
> > combined into the existing m2m driver, since you could save a memory ro=
untrip
> > when needing to deinterlace, change the colorspace and possibly scale t=
oo.
>=20
> The existing PRP/IC driver is similar to what this driver does, yes, but=
=20
> it uses a different DMA path , I believe it is IDMAC->PRP->IC->IDMAC .=
=20
> This driver uses IDMAC->VDI->IC->IDMAC . I am not convinced mixing the=
=20
> two paths into a single driver would be beneficial, but I am reasonably=
=20
> sure it would be very convoluted. Instead, this driver could be extended=
=20
> to do deinterlacing and scaling using the IC if that was needed. I think=
=20
> that would be the cleaner approach.

Not that I only meant to ask if there was a path to combine
CSC/Scaling/Deinterlacing without a memory rountrip. If a rountrip is neede=
d
anyway, I would rather make separate video nodes, and leave it to userspace=
 to
deal with. Though, if we can avoid it, a combined driver should be highly
beneficial.

cheers,
Nicolas
