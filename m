Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E630D28FC
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 08:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229045; cv=none; b=dAKyZdOcWC35wz/dDWiwXsikZ+5JyP7ouo9xH2We839Tfn9SaE4Yj+uCBYbbaHtz6GQGLxo/hnLE0p/3Z57+Lq1RYY8vIfuEWAhpFMTWizHEKA3RjIfW6GqzEWKlJxl2LKa1rHW8HskZ9n7SL5BOxTLSf/pFEIUge7lLpFwZUsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229045; c=relaxed/simple;
	bh=oSVUsb2TneSMSqxp+ci6T1TAFjDu2A01fTPvrithRBQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gBABvZ06uMvFokrknjlYa+AA22vWRo6bLXum4gcjWKF13HFxjhu/RTEwq3OORPbuM7DgvF8vuYqAb591iViFUB1UD3M4ubsflmD2OKAfRJkC4veSc4wKxwk3JnAPSP1n+2bGMP5Ui9Ee7o92eF5Qpl3gXyrLRnvmye5F1cSYHmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=KmtyYCzR; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KmtyYCzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1771229032; x=1771488232;
	bh=aXgBKI++p/m6DHAa+6SLw5QDDUpx793Hag2a12toOGE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KmtyYCzRSgrBuLqX7b0+/7785KnK61UDwKBoK9MY6q2QamwaQatlF/QcX9KuRyCdb
	 /KvpVAETKj7BtxqO2y6j02eR9CIAXsok34Y8+YiCttNCJ3XJzYP9hGRusVPcWBuiTR
	 qQgEQ/Fs1H0Gh48ijNcG4rWPr0NVu1PIitVjYXujPkGldNGNwCI6uERLwcw8fLwpAE
	 uZAjxqQ6f2B5nMbkMefp1agio/WN1mBdNBY2Rt+kJjMBFO3R3xShXZ/bqNRA9Th9me
	 3kiTblKufeqDhi9OqzluT3hyKru9MYBxJiwqTrmdzGcb6JNkiYbWFM4ppdNPIK/UD9
	 +aqqJYTpJb3bw==
Date: Mon, 16 Feb 2026 08:03:47 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bryant Boatright <bryant.boatright@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Checkpatch cleanup patches
Message-ID: <aZLPXTng0Qg20N-W@ubuntu-desk>
In-Reply-To: <2025121747-unluckily-filth-c167@gregkh>
References: <aTF0D_zaeNVIfP2E@ubuntu-desk> <2025121747-unluckily-filth-c167@gregkh>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: ae2c3a3edc5efeb92ec2cf813ec0dd9ff18b0d6d
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 02:03:25PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Dec 04, 2025 at 11:44:19AM +0000, Bryant Boatright wrote:
> > Correct camel case names reported by checkpatch.
> >
> > These patches are not required to be applied in any order.
> >
> > Changes in v3:
> >    1. Patch 1: Updated parse_res to parse_result for clearer purpose pe=
r
> >       feedback from gregkh@linuxfoundation.org.
> >    2. Patch 1: Change definition of parse_result to multi-line definiti=
on per
> >       feed feedback from gregkh@linuxfoundation.org.
> >    3. Patch 2: Fix typo in commit message introduced in v2 per feedback=
 from
> >       gregkh@linuxfoundation.org.
> >    4. Remove patch 2 (from v2) as name change was not needed per feedba=
ck from
> >       gregkh@linuxfoundation.org.
> >    5. Add changelog for patchset to cover letter per feedback from
> >       gregkh@linuxfoundation.org.
> >
> > Changes in v2:
> >    1. Patch 1: Make enumeration constant names all upper case per feedb=
ack from
> >    straube.linux@gmail.com.
> >
> > Bryant Boatright (2):
> >   staging: rtl8723bs: Rename camel case enumeration
> >   staging: rtl8723bs: Rename camel case variable
> >
> >  .../staging/rtl8723bs/core/rtw_ieee80211.c    | 26 +++++++++----------
> >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
> >  drivers/staging/rtl8723bs/include/ieee80211.h | 12 ++++++---
> >  3 files changed, 22 insertions(+), 18 deletions(-)
> >
> > --
> > 2.43.0
> >
> >
> >
>=20
> These did not come through as properly linked together, how did you send
> them?  Can you use something like 'b4' or 'git send-email' to send them
> as a patch series, and not as unconnected emails?
>=20
> thanks,
>=20
> greg k-h
>=20

Sorry for the delayed response. Yes, I can do that - apologies for not catc=
hing
that on this version.

Would you want that sent as a V4 patch, or just resend this series but corr=
ectly
linked?

