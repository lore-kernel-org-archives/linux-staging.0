Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C384634404E
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 06:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776149778; cv=none; b=AYchjBT5iAZD8Eb0PQIWVvBeDVcmCDO/YgVnwPb1kuZLG6EJF/xu0oGqfr2eIFUwW+7r+M9N7CNgIIgXifMhHCFAdwfwa2Uzpgrob8wkBDRZ1F7f9dTNuzi0FLVxBv4lDrGof8ug/B9NhtG81Swu/ADnspMJuILV424zzHilMm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776149778; c=relaxed/simple;
	bh=CNGb1+fstaV+KN/bL2pCwPwdrYsoD4dVjAa4R7+jbtI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NuD4SSA0LyfEklPtEaPpy99bI5yeN9WH7lWloFkwbAtGH6pE9Xk5d9Emy8EvjX1Kz/D7vY8AV2LXc4VYI0XJwV/e96TrioWFbi3nvXXz9i0ER//akqyAuZGZxJwfrmbEVESHCbMBc85WVGKnayHPhRzhQfwiG4sQIwS9OerKeQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai; spf=pass smtp.mailfrom=innora.ai; dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b=rfViK0iJ; arc=none smtp.client-ip=109.224.244.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b="rfViK0iJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail2; t=1776149773; x=1776408973;
	bh=CNGb1+fstaV+KN/bL2pCwPwdrYsoD4dVjAa4R7+jbtI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rfViK0iJDcIYewhrJUeiMUyuHO86wZvtmiqUjB7iuokw6Q7fMwRkV3rqO6yY+npHR
	 AXanaXlgTV9mT4mZEGQk8rvgv57o59nOHrYgYle4Xy34wNxTh3yWHDZYSGoJtMt4Uo
	 kGNrJku0whlhb3QCr0+2VrDk71eu378x9f5ZRLa07rxP1XuOfMciGatB18vvkynFT2
	 +z+Smm+ExN7AbsqjgUVPM6OzfdaDJU0CRJ2Jceqauwq5BGfLcOhRVwIIwzVq5ON2VP
	 WqDjX6cOmkhh3zt+P0n8FZk3lyno3mBWBRZ1GvPrykWOnEws0/pr5iioz/3q2YKzBV
	 dwt6mG9h1pblw==
Date: Tue, 14 Apr 2026 06:56:09 +0000
To: luka.gejak@linux.dev
From: Feng Ning <feng@innora.ai>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix heap buffer overflow in cfg80211_rtw_add_key
Message-ID: <ad3lAlvM6BVu6DFl@ans-MacBook-Pro.local>
In-Reply-To: <DHS3M1KRGUSB.3O6K3J3LSC83A@linux.dev>
References: <adQ4yU-Pc0uHXtb5@ans-MacBook-Pro.local> <DHS3M1KRGUSB.3O6K3J3LSC83A@linux.dev>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: a3b25099966554135a4ab6e5955ce5b0a63d7849
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Luka,

Thank you for the clarification. I apologize for the duplicate submission =
=E2=80=94 it was sent in error. I understand that the patch is already in t=
he queue and will wait for the merge window to close before any further act=
ion.

Best regards,
Feng Ning

