Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663872BCF46
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 17:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762795458; cv=none; b=jdSPxCL8Re48hV+dDANczd4+N03PiqDAg9ErchbXTvwkZPbiZngbwC/AbaD/OeYoLeY2C6t+MiO3a4SniqiTtVtO86X4I+o4adv6H+gzLcGVdLinddwvYE5nTCo310KfI5YA+M1PoEhXByqrctAA7dNLbrkU9Ya5RmrbK6IXp3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762795458; c=relaxed/simple;
	bh=WOc116HY4yqX9fAsk69PEELZBWaFOdc1zLAgNMfnGck=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oVBqXzr/YpyZTCjunXk5GGMu4H6OPTBTjzXJXeoChGnaFSuPEDfNgtYGBmBwSd6Ih43dfljQzM3M3yml00kmH/bK6/I+fh9OZNdzZVUgXY9Ua2ZvOWAzqTn2ySxW0LZ+t69v0XsOLvykYARUbmBZ0LWglUIg+5LFVqP2LI8RNRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=a8kvASI1; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="a8kvASI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1762795448; x=1763054648;
	bh=WOc116HY4yqX9fAsk69PEELZBWaFOdc1zLAgNMfnGck=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=a8kvASI1ynKvrOKco2sw1nBItKb9JnwdyghY+W3JxLLbOnT6fWotcRm+FZNpUmpK0
	 p9TMU9z26VKO72w6KNLzhwFOPKdy0be5rh/jo2XIV6EN8LhvC34TsZ1eL71RBMxvYz
	 iuip8CwdT8GYU+1bv7gHCQ71RUWJePMSe+Za5iZcvYwllBjni5TON9H2vMvGVEfHrO
	 cw0ee1iGtoDzmpOUHG/uLwRau5N6wAOIZGVN4GF+lW0fpeUuAG4VLCzjdw9SDHQb+3
	 oVWUvuC5zjB0drq5cX3WAamSGVhwHPuB/Mubp8pVPNi+uka3NltWbmFbENFU4O25BJ
	 8z8kXgYJz3Jtw==
Date: Mon, 10 Nov 2025 17:24:02 +0000
To: Michael Straube <straube.linux@gmail.com>
From: Bryant Boatright <bryant.boatright@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8723bs: Rename camel case enumeration
Message-ID: <aRIfq9sDa2Neok1W@ubuntu-desk>
In-Reply-To: <f367735d-e480-4eb1-a2a9-c6d311661fdd@gmail.com>
References: <cover.1762576396.git.bryant.boatright@proton.me> <38533b30dbcb39f370fd778ee2a6838ca7b962a1.1762576396.git.bryant.boatright@proton.me> <f367735d-e480-4eb1-a2a9-c6d311661fdd@gmail.com>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: 7f0ead55a479611963efdef07d79468b28e7aae7
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 08, 2025 at 06:51:45AM +0100, Michael Straube wrote:
> Hi Bryant,
>=20
> Am 08.11.25 um 05:54 schrieb Bryant Boatright:
> > -enum ParseRes { ParseOK =3D 0, ParseUnknown =3D 1, ParseFailed =3D -1 =
};
> > +enum parse_res { parse_ok =3D 0, parse_unknown =3D 1, parse_failed =3D=
 -1 };
>=20
> The constants in enums are usually named all upper case.
> PARSE_OK, PARSE_UNKNOWN, PARSE_FAILED
>=20
> Best regards,
> Michael

Michael,

Thanks for the feedback, I'll correct that and resubmit in a
V2 patchset.

Best,
Bryant

