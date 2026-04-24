Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429AD38BF6A
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 16:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777046724; cv=none; b=W/AH/GgdeZR+M1nUNLu63DEcVDgnGsUOXJQuB9ubzeslwJTFAj6VmbtERe2fl4HNK9bcXK1s+xBHTwwHx1+gzdLq6BEdlfftvEgJAm1jSNaFC7q4bjhKPT7yIBY9IPp3kwZfGcwiU8+3BfuNqq0aBxFoBTwTDh63LS0JOJ7J2aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777046724; c=relaxed/simple;
	bh=Wx+TfFb7rml/L4j01p2YX0FM+tB18+DjYhwNqOfNKWU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=GGrNX6APOyQwWD97yKJ0diyaR9jljki25gZRe04dAKP3g5v988Iq+kfP0N+bpfd+EKvF6hhrj666I0B2whoZpdMkh8TZzW9kkwiQCF2yoylX9n5JWZu7PgLGbFV+RhVaTpfsL38MaUwgbsl0ROLQa2cZB+EmlW6n1Fki6teV4y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wH6TsUj3; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wH6TsUj3"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777046720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nOVJxBU8bfCcP8wQz7nw1g48oNv89bgPgmOrg59WIts=;
	b=wH6TsUj3LPzWwYaap8rDR9bIDYm4ia2o5ZfZpKPaiC2aYV/albSTL+Kw4+csajo3tvH92J
	t+NLYXrMy2+WB7bJmAJAJ5wNc3+fOngxlI1FW1IJNvofuI+Urnzw0x+L++bae8uMsOHUEp
	h0pCZ40uBloTKTQ9GmvvVavtSRQpuus=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 18:05:14 +0200
Message-Id: <DI1IHIF0D6K2.1IU19G9JW5YEG@linux.dev>
Subject: Re: [PATCH 0/3] staging: rtl8723bs: fix OOB reads and heap overflow
 in IE parsing
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Alexandru Hossu" <hossu.alexandru@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>
References: <20260424151932.3734611-1-hossu.alexandru@gmail.com>
In-Reply-To: <20260424151932.3734611-1-hossu.alexandru@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri Apr 24, 2026 at 5:19 PM CEST, Alexandru Hossu wrote:
> This series fixes three related bugs in the rtl8723bs staging driver's
> 802.11 IE parsing code.  All three follow the same root cause: IE parsing
> loops and IE handler functions do not validate that an IE's declared leng=
th
> fits within the actual frame/buffer before operating on it.
>
> Patch 1 and 2 fix OOB reads in three IE parsing loops
> (update_beacon_info, issue_assocreq, join_cmd_hdl) that lack the two-guar=
d
> pattern already applied to OnAssocRsp() in a previous fix.  A malicious A=
P
> sending a beacon or association response with a truncated final IE (e.g.,
> only the element_id byte present, no length byte) causes the loop to read
> pIE->length one byte past the end of the IE area.
>
> Patch 3 fixes a one-byte heap buffer overflow in rtw_cfg80211_set_wpa_ie(=
).
> supplicant_ie is a 256-byte array in struct security_priv.  Because
> wpa_ielen is taken directly from the IE length field (u8, 0-255), the cop=
y:
>
>     memcpy(supplicant_ie, pwpa, wpa_ielen + 2);
>
> can write up to 257 bytes.  rtw_parse_wpa_ie()'s own length consistency
> check silently passes because it casts the arithmetic to u8:
> (u8)(257 - 2) =3D=3D 255 =3D=3D wpa_ielen.  The overflow is triggered via
> NL80211_CMD_CONNECT with a crafted WPA IE of length 255; nl80211's
> validate_ie_attr() accepts this as a well-formed (though oversized) IE.
>
> Alexandru Hossu (3):
>   staging: rtl8723bs: fix OOB read in update_beacon_info() IE loop
>   staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and
>     join_cmd_hdl()
>   staging: rtl8723bs: fix heap buffer overflow in
>     rtw_cfg80211_set_wpa_ie()
>
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 8 ++++++++
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c    | 4 ++++
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 8 ++++++++
>  3 files changed, 20 insertions(+)

LGTM so for the patch series:

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
