Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A281F03D9
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 16:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912731; cv=none; b=ocQhs49JIRie3mxLsxSQadhtXzSeFDlv7sOl/75taBhsGPXZgMquIJ3RLotuI54HUtUEIwG8ihnkI6s54rq2dcIzej9XwNq22NStzuFvtWFgZXAH22/A159JkywGP+tACjhO8Pq7YhPnm8mQj1zFVJfEN88jIqve2cUWs4WEalY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912731; c=relaxed/simple;
	bh=UJQtwdxYy+rByq9K+VAHmNOBeVflC5kLexSB2YR569c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gA3tMla6q1+jwftpuPzMz2z/x2V/z7cpjaUTbeDZb6qmabYN05jCsAShYO9unz8drGSKtFSlMsKIGnAS9ALf8z+QYjMdCJdhz7A8P9ZDh5vKL1Vg+f13g5+3h/lnvdpmkucDAJk/ESzlC6bqNCCwT4c7nyB15+mIpdBzMH6IGjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai; spf=pass smtp.mailfrom=innora.ai; dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b=pzXF727b; arc=none smtp.client-ip=109.224.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b="pzXF727b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail2; t=1777912721; x=1778171921;
	bh=oPte7l8uEb7xnk/RLS5OPzuq6rHnHMCvn4HKjFxNQPg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=pzXF727bQRtzVE4FErsUj6hhJLEzsCjjoVcxFIa9fWYxhGAaoz5Nj3Ux8pfxWHRdz
	 WS72sE9ZlDrG7MPMxDxdNbIAGoHqId+HcIvp3yHQu55Q0xDrEzDorl4bFGDw0FoPug
	 ZkKwmyVNaGf6z5nJpr2C3KtUQIb10VZHgp/jNqX4vzjwX60SFoCHPXEfPVwR3P/jVW
	 pJ8GgIPlMKwzbrXWqcyBahtsdzl4fwuAZPXrfopDA0HgEBNodHL8RklTO1p3I9GKNJ
	 zp89alhSRhNZvnaGg0/dKZEGdQQqNy7mt/fsps2zn6ZcxByueGh3bs+eKBdqbYKxlK
	 RkYtpsoGlTANQ==
Date: Mon, 04 May 2026 16:38:35 +0000
To: gregkh@linuxfoundation.org
From: Feng Ning <feng@innora.ai>
Cc: linux-staging@lists.linux.dev, Luka Gejak <luka.gejak@linux.dev>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v6] staging: rtl8723bs: fix heap buffer overflow in cfg80211_rtw_add_key()
Message-ID: <20260504163828.90294-1-feng@innora.ai>
In-Reply-To: <2026050458-numbness-haven-1ae4@gregkh>
References: <20260413113224.5201-1-feng@innora.ai> <2026042626-tabloid-suitor-33c5@gregkh> <20260427111738.33069-1-feng@innora.ai> <2026050417-monkhood-backless-4c3e@gregkh> <20260504154823.52057-1-feng@innora.ai> <2026050458-numbness-haven-1ae4@gregkh>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: 651521782a266a3bfa15d81423969c6cf5b12709
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2026 at 06:03:02PM +0200, Greg KH wrote:
> Let's fix this in a way that the code can be moved out of staging
> someday please.
>
> > That said, I can see the argument for -EINVAL: it makes the contract
> > explicit and avoids installing a key with a truncated sequence counter
> > that could produce unexpected crypto behaviour.
>
> Yes, that is better.
>
> > Regarding hardware testing: I do not currently have a physical
> > rtl8723bs device.
>
> Ideally someone can test this on the real hardware.  I'm loath to take
> real patches for this driver without that happening.

Hi Greg,

Thank you.  I will change the silent truncation to an explicit -EINVAL
when seq_len > sizeof(param->u.crypt.seq) for the next iteration.

Regarding testing: I do not have access to RTL8723BS/BU hardware to
verify this, and I will not resubmit as a regular PATCH without a
Tested-by from real hardware.

Would you prefer I send the -EINVAL revision as an RFC on
linux-staging and linux-wireless to ask for a community tester, or
should I drop the patch until someone with the hardware picks up the
thread?

I'm fine with either path -- whichever you prefer.

thanks,
Feng Ning

