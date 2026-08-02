Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5228B482D4
	for <linux-staging@lists.linux.dev>; Sun,  2 Aug 2026 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785684925; cv=pass; b=jbdkuwAiT1ktbWVNywvQZ2uaRWEfNhYKbGWE0Uh9O40Ig0mhOYVEh6uXW3twK7rt0OJURGO/4Pi1ZuvWKenzkC+cSieHoM7mucWDHqUkZ39/7NkKbIrsmllHaRFZAnlY+kq/SvKxfU+dsM2N+XVG66zvMP6eJokpE339oSHwl+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785684925; c=relaxed/simple;
	bh=CNQvXAZjnc5jCPIuiyho0m5zXfbsjDd0V46vFTXxeMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c7VVgLbx0bz4TZ2iUCTwcOnuGrTJME1Z7xPlPTl8f8CpbTKTGqwFyXWBGOmLDrQgrQWp38BuBDvGP9WDrPrR9boiEZadzg6iETW15lipAwFV72CDT1yLbZ3HJgQk0lhGh505aiAbcMPVb1osebV9bAclqjGYXiENr60kwHJpfbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=lPZqIQjq; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="lPZqIQjq"
ARC-Seal: i=1; a=rsa-sha256; t=1785684919; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Suc7MIYW38n5LHJni1TudgS10ZpdjxHkiGFmLTnORQ1vJ94LmZ3PfdIoAAJG3RkvV5qrQEaJRODnMbRP5mgPdFsA7+20aXf/LMOla9StNlqY9Eh89OEerI+OgnOsEhBuQfyNoIuv5xR8la4azrM1uM4aM0NclyFgzXukrbAUjE0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785684919; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7uyNYwJXd2PM+Nq846A2q471JkA9u5TZVUrSKvhu3xY=; 
	b=PaAUD1gTnz1S/E4Y8cF2KtDwwyfhM3+jwr/WXFJBVfNcSwIWAX1TTqxREDMVtgJGHsBNP8DY2asN95v0b3Qfs/mYCsq9+WNCT/NL82ntRfYIThNXaA4+xUgATRYIMdJFApmGUq4NrTYPugZDSdKXeryCDJQZs17J+wCgsE4U1Sg=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785684919;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7uyNYwJXd2PM+Nq846A2q471JkA9u5TZVUrSKvhu3xY=;
	b=lPZqIQjqoZrptCjxX1tf8/ksXbKEDvmRrl3safmeNoOhaCTT/sgDcFugQCqRy1sk
	aNvcJc99LIw3MBwZbqKr3kJOuSoV6s6PtfxHmDTeBVYHxkhUBNkB3t+DwpAfUjqznZa
	6cTgUXzdc+RETkif5vASbKgp4Kt6NPO3CNvJyGwc=
Received: by mx.zoho.eu with SMTPS id 178568491897042.9849632551053;
	Sun, 2 Aug 2026 17:35:18 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] staging: rtl8723bs: bound two IE parses
Date: Sun,  2 Aug 2026 15:35:07 +0000
Message-ID: <20260802153509.44263-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

v1 put a single check across five call sites and one of them was not an
HT capability site at all. It was the SSID parse in rtw_check_beacon_data(),
so the patch required an SSID of at least sizeof(struct ieee80211_ht_cap),
26 bytes, before copying it. Every SSID shorter than that would have been
dropped, which breaks bringing up an AP with an ordinary name. That was a
regression, not a fix, and I asked for v1 to be dropped here:

  https://lore.kernel.org/all/20260802151916.38931-1-ali@iusegentoo.com/

v2 splits the two apart. Patch 1 is v1 minus that hunk: the four real HT
capability sites, unchanged otherwise. Patch 2 is the check that site
actually needed, which is an upper bound rather than a lower one, since
rtw_get_ie() can hand back an element length of up to 255 for a 32 byte
destination.

I have no rtl8723bs hardware, so both are from reading the driver rather
than from an observed failure. Build tested with CONFIG_RTL8723BS=m.

Ali Ahmet Memis (2):
  staging: rtl8723bs: validate HT capability IE length before use
  staging: rtl8723bs: bound the SSID element length before copying it

 drivers/staging/rtl8723bs/core/rtw_ap.c        | 2 +-
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 2 +-
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)


base-commit: 2d2338c93da79b3bfe4b6099a931d9468d539952
-- 
2.55.0

