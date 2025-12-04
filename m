Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B81930EF92
	for <linux-staging@lists.linux.dev>; Thu,  4 Dec 2025 11:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764848678; cv=none; b=N0kl4WbC6hyHBNH0dRmmx7FusCDeOHTcJ5TawSon/IfdzaChGw0FlygEah61N5aF9BsPWjt1DqjJPRg+rSZ5S/khjUjnlnw1NHHPBf+CbzgE+eXt2yrxUBGTPPwltVzfKvz/sL6hF0UIAIXh49fbpPQoK/+IDHSPHPz4U59K1sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764848678; c=relaxed/simple;
	bh=UqlDLsG9V/pjp7xhJHIuGuyhD7/WHKIUoUiDMJnJuyw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VeFfICam2tcKHvB0GGGMPE2e17E1ggJzLtvUbUhEDwsGUToPaZLukzDnuFOWQvfZVmSX9VELQ40IYhQzUZxr7m4XhWu79TXjmPOtobhiVz/ke6THq+fvfPpnQLmR5MyuTqaV51g7f6MEgJ7yI27z5/UQlfzW37qUD3e4bILWTvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=SCpTmVag; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="SCpTmVag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1764848665; x=1765107865;
	bh=wRx/g6kQBWGhw+60xEF6kyDqt+M5FlAucNwCh+O7Jdc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=SCpTmVagcrjXlowHlRvuVr51jNa2tH1JrYmFUAL31ba405cemRbgATG9ztu9PD3iu
	 Civ/BqCmPrqYQ7P6IY26mxMXHT1uOvTSXe74sXdmxwGEfUCslJVmJ7gGN38uZloYRS
	 FodStWu20sZBsBV6aYXBp6N0p0m9A8qGOB8eirW9yBa48op8mK9wtLWK2OshY5m2Tf
	 NdEQJAyZWqurjT27d1f7IbEpGJq2FXL6oYpwYuuk5auHfg96pCthuT5F9vG0zsDLCy
	 hm6XdOExp51CffmNqSTzhUI20rbJYUhjcgKmQBF4BFnEd+52oeCoZcBjScmOZZAvPH
	 rUjVikS5HjW1g==
Date: Thu, 04 Dec 2025 11:44:19 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bryant Boatright <bryant.boatright@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Checkpatch cleanup patches
Message-ID: <aTF0D_zaeNVIfP2E@ubuntu-desk>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: 887373d3b73f1ab0b1d6b66af07411f17a988407
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Correct camel case names reported by checkpatch.

These patches are not required to be applied in any order.

Changes in v3:
   1. Patch 1: Updated parse_res to parse_result for clearer purpose per
      feedback from gregkh@linuxfoundation.org.
   2. Patch 1: Change definition of parse_result to multi-line definition p=
er
      feed feedback from gregkh@linuxfoundation.org.
   3. Patch 2: Fix typo in commit message introduced in v2 per feedback fro=
m
      gregkh@linuxfoundation.org.
   4. Remove patch 2 (from v2) as name change was not needed per feedback f=
rom
      gregkh@linuxfoundation.org.
   5. Add changelog for patchset to cover letter per feedback from
      gregkh@linuxfoundation.org.

Changes in v2:
   1. Patch 1: Make enumeration constant names all upper case per feedback =
from
   straube.linux@gmail.com.

Bryant Boatright (2):
  staging: rtl8723bs: Rename camel case enumeration
  staging: rtl8723bs: Rename camel case variable

 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 26 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h | 12 ++++++---
 3 files changed, 22 insertions(+), 18 deletions(-)

--=20
2.43.0


