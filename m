Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1973DA7ED
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 15:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909727; cv=none; b=MEDiVTMpIzqKiBhG4QNhc1hrtI+U/zO9YPK7c2w70FEquMTuux0yhXxrqLNCMeciaHTNyUWr8of+IaFjduca75Tea2SykR2dCl/rJse/aOW9tzy9l5J92+t/DnJbwDLgApHNBIJeOtsHop+5Fg7fauiwUAmvO0AZfn7vS0Y3G+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909727; c=relaxed/simple;
	bh=04Y/K5VDRi25LK9LlB/Zbr8srRm7zmupjNgFmjG7L84=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ew8927pKQj6oAGvA1US38Q7z5+/l4PSj/hmUQQY1BcoEbrOMjBmu/j3J+4xBzz0Ru8obDmBrmO0WvHad2qGsRcczz5grdDaunIOYRw2Phv/WXuNYo7b0bFHmtm47F6ywEKZI7QL1L6ma5MccEZ/9T8JBd0WeC8OLTXDVc90gfe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai; spf=pass smtp.mailfrom=innora.ai; dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b=pMVP8K1P; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b="pMVP8K1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail2; t=1777909715; x=1778168915;
	bh=+jHcaP3g5S6HHwy4F6oN4vGmat21NwzUyYuheLKpT4A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=pMVP8K1PTjzB5KtLFC3Ebah+FvBWZ7fnyZZrrykWpPz45xggvmdtd/E+g296IU9bD
	 q2QR87XIB89R8P+QOOxa8WChXP1uHKCCeASKDPAEHmqGXhfDMTrPX2OFnvajL0TOAW
	 fKe39p8Gk7dv3kEbsssUPNaMl1f7S1OefzaP491jz2irUE9MLcFFaBd2udcdNZp/RM
	 +faJ/cORLZUfusoPu0hM1MbkLPLfSfVrq6+BN2kTeJYi2ETIZa6iHHmPHm9q05jqUz
	 Vy9JvhGWicD7VU9hxHkSlorbwcoa5huMk9FcPamFub1tslFB92NCuaW2P3QujVXEYC
	 XRze5NPP93k5Q==
Date: Mon, 04 May 2026 15:48:30 +0000
To: Greg KH <gregkh@linuxfoundation.org>
From: Feng Ning <feng@innora.ai>
Cc: Feng Ning <feng@innora.ai>, linux-staging@lists.linux.dev, Luka Gejak <luka.gejak@linux.dev>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v6] staging: rtl8723bs: fix heap buffer overflow in cfg80211_rtw_add_key()
Message-ID: <20260504154823.52057-1-feng@innora.ai>
In-Reply-To: <2026050417-monkhood-backless-4c3e@gregkh>
References: <20260413113224.5201-1-feng@innora.ai> <2026042626-tabloid-suitor-33c5@gregkh> <20260427111738.33069-1-feng@innora.ai> <2026050417-monkhood-backless-4c3e@gregkh>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: 540f3df26f76d6b45f51ef858be4274927d84568
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2026 at 04:12:44PM +0200, Greg KH wrote:
> What about these review comments:
>         https://sashiko.dev/#/patchset/20260427111738.33069-1-feng@innora=
.ai
>
> Are they incorrect?
>
> And was this tested on real hardware?

Hi Greg,

Thank you for the pointer to the Sashiko review.

Regarding the review comment (Medium): Sashiko suggests returning -EINVAL
when params->seq_len exceeds sizeof(param->u.crypt.seq), rather than
silently truncating with min_t().

The comment raises a valid point.  I chose min_t() for two reasons:

  1. The upstream cfg80211 framework does not enforce an upper bound on
     seq_len before reaching the driver, so a strict -EINVAL could
     break any existing userspace that happens to pass seq_len > 8
     (even if no standard cipher requires more than 6 bytes).

  2. Staging drivers historically favour silent clamping over hard
     rejections for parameters that are out of the ordinary but
     otherwise harmless -- the primary goal was to close the overflow,
     not to police the caller.

That said, I can see the argument for -EINVAL: it makes the contract
explicit and avoids installing a key with a truncated sequence counter
that could produce unexpected crypto behaviour.

I am happy to send v7 with -EINVAL if you prefer that approach.
Alternatively, if min_t() is acceptable as-is, I can add a brief
comment in the code explaining why truncation is intentional.

Please let me know which direction you prefer and I will follow up
promptly.

Regarding hardware testing: I do not currently have a physical
rtl8723bs device.  My verification was based on code review of the
cfg80211 key installation path and static analysis confirming that
ieee_param.crypt.seq is an 8-byte fixed buffer while params->seq_len
is fully userspace-controlled via NL80211_CMD_NEW_KEY.

I understand this is a limitation.  If hardware testing is required
before merge I can source a RTL8723BU/BS USB dongle (approximately
1-2 weeks), or alternatively a community member with the hardware
could confirm the fix.  Please advise on your preference.

Thanks,
Feng Ning

