Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223864;
	b=fuBj5CITc+nocQsZnqd6kbtUkwMo4yD1EiGpPa79Y+32QVCm1qM/w2V40t4Ui5pzsAcd
	 ioCzLRumq17sbWqGk4QMoIW4wJxc2bT90J7mswbc7/StIJAcOlMYlo1i3zmxSUdMhWkmn
	 oavaEq3hDnHXsHp0IsFSgyr3Ejta7RACpICkiyWnf+EDaEcWdPcwujcmds8wNGbAU4eOQ
	 Gz9zobs+ZEnRnVUlzqNozgEI5o1UaT6mB9R/vzUDrjDkPx5HKtkeUXQqg/wu5V2Food5P
	 EQ0Y44BIIms5YwA+y30csjHr7PLe9PS2FjMhoS4GMnsbj/4C2S6Shz2miFi8ZStAWIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223864;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=B86lTJg6fVd92y4pCKi8wB4ITu4XfOT9mAL1WQiizMQ=;
	b=T3X3XyU371Vfj0/4obtwri1NOVok3pfIgDtXoOT3gxChezTi2ohpW7ue69huFlzaeMH6
	 cy04JCVT+pWUYfnYUb+OxsRy4iYpTCJUNBkqsfo7GHyftrOvpDgSsD3O1GuG4t7CZpH1q
	 MXYII0XuQ81+AmNetxOJqeMLb1OZZsdMc+O7z0WQp446OEut5h8lyplqCfOoMis2621Ei
	 FccIekt/fFugNmgOUi43XfKr3pTd1MU8gkaY5SyrmOpPaGzbH5kLr2aQ+E3Oz88VRRwOY
	 rsr7nDQandFy8gmLL6MQ1AWsmyJVgNUGAJmbewYEYXtJMpvBhRO+2eGmD0U8Qmr554g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=innora.ai;
	spf=pass smtp.mailfrom=innora.ai;
	dkim=pass header.d=innora.ai header.i=@innora.ai header.a=rsa-sha256 header.s=protonmail3 header.b=h+kM8mcH;
	arc=none smtp.remote-ip=185.70.43.18
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BA6606A6BE
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 01:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15BA6606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=innora.ai header.i=@innora.ai header.a=rsa-sha256 header.s=protonmail3 header.b=h+kM8mcH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail3; t=1795223859; x=1795483059;
	bh=B86lTJg6fVd92y4pCKi8wB4ITu4XfOT9mAL1WQiizMQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=h+kM8mcHIgzX0lzJc9I1gfApeVJxk96qYuvNq+lOX6VYlwvZTmqcSsSAVQALI9Rsq
	 HNphwwSMOAYCNTbkbz4VmYny1iqHtLi3mYCBcoJznT1hyUOQkdz7vMk2tWuC50GGPB
	 WbG6Th8dpkxs1+ILao2fwmF4RJWToAlewPVRmqfvJN9A1I1OIhCgUo4uJ22KE0lFZf
	 jXMU/btB8JdpSHH3rl2U4FpTr9w4AXhWMw7IkKU4UOyISD9K1t+axEHG9wpyMX7sB9
	 46M2lqBLTLFLJ0V6m3HFSrSNH4CanIa9HtB+ZnvsgNZSR9qQrZaoi+Vx2IIaIBI63V
	 z9NrQ3m6KH4BQ==
Date: Sat, 21 Nov 2026 01:17:31 +0000
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
From: Feng Ning <feng@innora.ai>
Cc: ~lkcamp/patches@lists.sr.ht, linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 0/3] staging: media: atomisp: use kvmalloc_objs() and drop redundant OOM messages
Message-ID: <fFOS6YphXT9R2XDv53HTfEYV5vtnDpJcxclUqfj6zTAiE3lzliiJwFvLcdzqa8Fa0hkkyo_lQPZ3Rig_d1bBLIaIXoDYI5glhBs15cjjZ_E=@innora.ai>
In-Reply-To: <a848c700-f1b4-4975-8c80-27b8c81160ec@gmail.com>
References: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com> <a848c700-f1b4-4975-8c80-27b8c81160ec@gmail.com>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: ad9a0e95a03b7ecd04a5a18409552a3ccf551525
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Rodrigo,

As co-author of 2 of the 3 patches in this v4 series, I'd like to add my
support to your ping.

The series is still marked "New" on patchwork and does not appear to have
been picked up or delegated yet.  Since d178c7ca8fef has already been
merged, the remaining changes are small cleanups on top of it.

If it helps, I'm happy to help rebase onto the current media tree or
prepare a v5, subject to your preference as the series owner.

Thanks for taking a look when time permits.

Best regards,
Feng Ning

