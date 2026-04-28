Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742162D6E58
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777356466; cv=none; b=OT6kG8zpNgWJBoxgy9ZA6YHV6D/39kLmr2JAocjby0KCSfRP9LoVRmm7+oHv92JAQxVjrGY4nVgRz7XE3m0qAlYGWYB4gK/5mDtncthHRalAKpg50ZcVH7pbVlaRwhtvqkuw22TqdBE5B+1d4zCrgG5dlipxQgsJ+lX8jKhyrSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777356466; c=relaxed/simple;
	bh=W3o54za1Z+Ij4BHa4mMO+sD7JOkWg46GtFVh7UvPzoM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=m5Q0o07gnEfL28dar3cQyckMvCzXNuEM2KtuRAXemGy511dPtSmfML1i2SEO0u8jPUe85TPbAsGIRrWg2AQ8Djx4sRIfivhS6oHiKormCYQ5wavgRQb+J10UpQPVdrBYxyzk5usTmAYLbEnRQiQAY1TSSwglRcEc1wYJHurHt/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BripRtps; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BripRtps"
Date: Tue, 28 Apr 2026 08:07:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777356462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yXIZnTTfgSu3QdSMTAXgQKbxalZFhohJ7lQlQitZiM8=;
	b=BripRtpsjugnh6wRgXcLAm9WkOA1PrCMy8lanlHvkQI0su6UfwYgZJg1myfQxBcJ48Y540
	n6HT4lERixQVS36cRm8ZMJRniCJ9eT1f/lF1ldNW5wXqVTRY9K5Bs0eUocXiq602tHvqia
	hs/3cZu31KdTjb/RnYahNJFpmxetpzo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Salman Alghamdi <me@cipherat.com>, gregkh@linuxfoundation.org
CC: straube.linux@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_4/7=5D_staging=3A_rtl8723bs=3A_rtw=5Fmlm?=
 =?US-ASCII?Q?e=3A_extract_local_variables_for_long_expressions?=
In-Reply-To: <20260427190548.156499-5-me@cipherat.com>
References: <20260427190548.156499-1-me@cipherat.com> <20260427190548.156499-5-me@cipherat.com>
Message-ID: <4ABC50A6-CBCD-474B-9DF0-35C3F43CD286@linux.dev>
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

On April 27, 2026 9:05:32 PM GMT+02:00, Salman Alghamdi <me@cipherat=2Ecom>=
 wrote:
>Extract local variables to shorten lines that cannot be wrapped
>cleanly=2E
>
>Signed-off-by: Salman Alghamdi <me@cipherat=2Ecom>
>---
> drivers/staging/rtl8723bs/core/rtw_mlme=2Ec | 56 ++++++++++++++++-------
> 1 file changed, 39 insertions(+), 17 deletions(-)
>

=2E=2E=2E

>@@ -792,8 +808,10 @@ void rtw_surveydone_event_callback(struct adapter	*a=
dapter, u8 *pbuf)
> 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
> 				&& check_fwstate(pmlmepriv, _FW_LINKED)) {
> 				if (rtw_select_roaming_candidate(pmlmepriv) =3D=3D _SUCCESS) {
>-					receive_disconnect(adapter, pmlmepriv->cur_network=2Enetwork=2Emac_=
address
>-						, WLAN_REASON_ACTIVE_ROAM);
>+					u8 *mac_addr =3D pmlmepriv->cur_network=2Enetwork=2Emac_address;
>+
>+					receive_disconnect(adapter, mac_address,
>+							   WLAN_REASON_ACTIVE_ROAM);

Here you declare u8 *mac_addr but you never actually use it=2E instead
you pass undeclared variable mac_address to receive_disconnect(),=20
which will lead to compilation failure=2E

> 				}
> 			}
> 		}

=2E=2E=2E

Best regards,
Luka Gejak
