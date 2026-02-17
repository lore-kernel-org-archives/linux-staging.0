Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDE335502F
	for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771340063; cv=none; b=JbyPWYbmjlQxfTjo4rJ6VPFq2pbhPZYHGgnERxAhK4EVVKRIA7A2SRvdIC7H445JPOloikGiq5ihRbwFUrGaEDx0gPchmofvJmKK01yD7l1zRuW3xIEw4TNwVF14NyJGCf4tvvcsGQWEwqwruIybhF0YAnWNYgCIChfdWprifJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771340063; c=relaxed/simple;
	bh=cGEtKtdw/6N+LoMuq7wbZJnM+ThYrLKcb54laqGcTiQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TxMYqng4wrLBuTkug4TqJ/kxyRHOTPtMvAVJVSEAREWTDsTVDZdpw4srgjoHtRAQkU/JIsNAy3Hz9UBaHaPlC1u4jWWT7Q4HOkK/9jeAU/qsV+elM4QXREoB2OCwObNyuc67pUWYMS9vnoU6yXdhQgcTFP3BjUnZV5Zt/8RsJwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=lvF7cavp; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="lvF7cavp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1771340050; x=1771599250;
	bh=HHoFH3tPQH0WC8u3id3jUD3Y6d9mHPUBcCjHA7ev5FA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lvF7cavp2+W7XGU+ebzBRaYPM0yxxJHOu4lV9rfb9ym216iRXZAM+klBGzyMuXKPt
	 bqs4Y/wrcqRXR1hZschYlg/vp6Fr3ncdwQNlTsBTac3xW9uhMTXknkN0lequ7LOawt
	 FM8FctGbQwPS4F+3sOWiqbzAdRhrhs9+u9KpnlO639meg+gCRnLvevoNd8KvQYP1at
	 zn7dFOw2llvgX8pOcUvdGjI7kIGgNWaMHCkSzwpCoKXjP+dArv049kuW6GCOV/XH/U
	 59H8EwUUMOFb6PZ4ERLzw+vveAoYuv7XtnR/SwzlE4vBqiSDiEXtTdSMwCyDY7ALcz
	 M/05x4q93IA3Q==
Date: Tue, 17 Feb 2026 14:54:06 +0000
To: gregkh@linuxfoundation.org
From: Bryant Boatright <bryant.boatright@proton.me>
Cc: linux-staging@lists.linux.dev, Bryant Boatright <bryant.boatright@proton.me>
Subject: [PATCH v4 0/2] Checkpatch cleanup patches
Message-ID: <20260217145352.2172407-1-bryant.boatright@proton.me>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: 147b8f0cdb6293d2b92d91e286d9d48e6135b4aa
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

Changes in v4:
   1. Use `git send-email` to properly link patch series per feedback from
      gregkh@linuxfoundation.org.

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


