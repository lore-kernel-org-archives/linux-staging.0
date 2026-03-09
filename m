Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4FA3BFE5E
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 13:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773063465; cv=none; b=M8GBFFN29gAFm/vquW/1xCk4NFa5ggnRtYDeZGAftmFldrcXOszhVuwu7Wa1giaOE8ywoTxLNgi8BDXvRXYv96NiomtaWZUYxjLWHOTdslP0lkeQh05MPoZ1YHJ0L/CnPc9xEcxsjpDvBna2KFYY4VKCTx1Lwa5XvLZHFfrVxw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773063465; c=relaxed/simple;
	bh=v4/YRTDLq9d++5ynP6tFmssZscnk06ot2ItPSXbELjQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJULdaamdEEVKyPGjrVk5IbbwCK1kCHDVCc/7cXghpEIpoo0j6xlblyxVGLARZZ9Nk/0to1iD5pK+Z0IpFsN3UuKKmo5NeOUGE3ymFFr1K2i++7rBmO+VZfbUO+mJgKgx/dJKiSWYkZi2wqckIRckVzQy1OgkK8N2gGbDRvcW1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=DLYQabqx; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="DLYQabqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1773063456; x=1773322656;
	bh=v4/YRTDLq9d++5ynP6tFmssZscnk06ot2ItPSXbELjQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DLYQabqxfV+tu6j94+KYMxT4aNIqjvRj+h5CxSyq9Qv2gLqYJbwEh+14xR08ZYnU2
	 41viEPpteOSjuyYZJdZvZyiJXzPcJYv49ZJ8d7UlcnonC2bWEmTMBiRkCkOsCS8YyZ
	 dTFZ9Z7+nAFqNG2zlhi+uAxgzS2I6G8qrhGqk0UvYwGgpKeLW4+9yn6KFAkxR0uyVE
	 6zczqX8ntusO3h4hOnrACVmxkvDG8yp8u58sWFUQQepCcRHThML/j+qVidm8Kj2el0
	 IKaq+RBfXDs21PXRuClW7WT9GH5V++TFd96+M1rBEcMZPsqTOUxsTXwCoEsiBEXM7s
	 pMGOQTFVIwwPg==
Date: Mon, 09 Mar 2026 13:37:34 +0000
To: Gustavo Arantes <dev.gustavoa@gmail.com>
From: Bryant Boatright <bryant.boatright@proton.me>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in rtw_dev_unload
Message-ID: <aa7NGuNWI2D83Bhj@ubuntu-desk>
In-Reply-To: <20260308215619.608685-1-dev.gustavoa@gmail.com>
References: <20260308215619.608685-1-dev.gustavoa@gmail.com>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: 5b0a96ae2009715ec2d1eeb1082fda290511cb2b
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 08, 2026 at 06:56:19PM -0300, Gustavo Arantes wrote:
> Replace msleep(10) with usleep_range(10000, 20000) in the command thread
> shutdown loop in rtw_dev_unload(), since msleep() for values less than
> 20ms may not in fact sleep for the intended duration and will often
> sleep for up to 20ms, as documented in
> Documentation/timers/timers-howto.rst.
>=20

This has been addressed in a thread recently and Gred said to drop the patc=
h [1].

Best,

Bryant Boatright

[1] https://lore.kernel.org/linux-staging/20260214173139.49094-1-ofekalm100=
@gmail.com/



