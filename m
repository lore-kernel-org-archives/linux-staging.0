Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDB62E6116
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 05:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775712254; cv=none; b=qQd3Fy85K7T3uU90ZF8qD8Ceiji1B/gJsZj/UJCEI68Fbt6MhF2QwlV71+AbLjI8hDLRzJRC0AZkODzqE3i3JyC7An1swiqadDY6R21YRwGfFuhuROlpZX9UIvsP8pMb2laOilvAWNgJCS/w0f+n8mVD0RzgSXc5y5lfhcWXm00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775712254; c=relaxed/simple;
	bh=3iznKXv3zXNNAm9DSsiYiZfpvfmwVzD1udSVOLpkFmg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=RiRDZTLmtghxPE4RlT02hgyzYLKFaSHoaATzEBhzry/I4J7HtQtihSfTYt9cbRQbfZaCIDCB3x+s9B/Ze0cNZgL9RUUU1LXs6QpbgMDKKVSozxuSYWGZKOGL4M9YAsHBrjUZELb6y0vo+lqZpR1T0pjV2msq62IzOyh+Yyeh3M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=l6T6YPZg; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="l6T6YPZg"
Date: Thu, 09 Apr 2026 07:24:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775712250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xVjvJee2BR2h7JQLFWeEO7Wn2JqYbd7bLPQ+zpZAzs4=;
	b=l6T6YPZgqGpxVVdhFUGSPr8sii3kngb8eLByGDh9dvHblwv1X3xprLJm0JpW/rGSwpWfGc
	vrV567ig8Lm8bXwmplQDmsv7h2uYZQcX433vYNA0dbfmLoRjYVbY6+HTXFyhEyeukwVnZZ
	ZSIKQL3CgI4e6UdXMjLq3sFrW3cqKmE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Feng Ning <feng@innora.ai>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
CC: feng@innora.ai
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4=5D_staging=3A_rtl8723bs=3A_fix_hea?=
 =?US-ASCII?Q?p_buffer_overflow_in_cfg80211=5Frtw=5Fadd=5Fkey=28=29?=
In-Reply-To: <20260408224608.81874-1-feng@innora.ai>
References: <20260408224608.81874-1-feng@innora.ai>
Message-ID: <95FAA4D6-BC02-45D0-AD5C-968552443C15@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On April 9, 2026 12:46:13 AM GMT+02:00, Feng Ning <feng@innora=2Eai> wrote:
>The cfg80211 framework allows key sequence counters (NL80211_KEY_SEQ)
>up to 16 bytes, but ieee_param=2Ecrypt=2Eseq is a fixed 8-byte buffer=2E
>When cfg80211_rtw_add_key() copies the sequence counter via memcpy()
>without checking seq_len, a heap buffer overflow of up to 8 bytes
>occurs, overwriting adjacent fields key_len and key[]=2E
>
>Cap the copy length at the buffer size using min_t()=2E
>
>Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
>Signed-off-by: Feng Ning <feng@innora=2Eai>
>---
>Changes v3 -> v4:
>  - Re-send as plain text without PGP signature and public key
>    attachment (per Luka Gejak feedback)
>  - No code changes from v3
>
>Changes v2 -> v3:
>  - Added changelog below the cut line (per gregkh patch-bot)
>  - No code changes from v2
>
>Changes v1 -> v2:
>  - Initial public submission to linux-staging mailing list
>
> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec b/driver=
s/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec
>index 1ff763c10=2E=2E4a984c071 100644
>--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec
>+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec
>@@ -893,8 +893,11 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy,=
 struct net_device *ndev,
>=20
> 	param->u=2Ecrypt=2Eidx =3D key_index;
>=20
>-	if (params->seq_len && params->seq)
>-		memcpy(param->u=2Ecrypt=2Eseq, (u8 *)params->seq, params->seq_len);
>+	if (params->seq_len && params->seq) {
>+		size_t seq_copy =3D min_t(size_t, params->seq_len,
>+				       sizeof(param->u=2Ecrypt=2Eseq));
>+		memcpy(param->u=2Ecrypt=2Eseq, (u8 *)params->seq, seq_copy);
>+	}
>=20
> 	if (params->key_len && params->key) {
> 		param->u=2Ecrypt=2Ekey_len =3D params->key_len;

Looks great=2E Thank you for dropping the PGP attachments and formatting
the changelog correctly for the mailing list=2E The fix cleanly=20
addresses the bounds checking issue and safely mitigates the heap=20
buffer overflow=2E
Edit: I forgot to close <> around email address in Reviewed-by tag
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
