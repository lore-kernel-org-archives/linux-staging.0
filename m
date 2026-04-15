Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BA83CF023
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261428; cv=none; b=qAKmxoVMXS47GflOatfqow5aFNGxNks+dRiH64AvaMwkqavwkalZg6BB0w9aQnzMCIrLhc5viTQ2xcFKMI1Bks4/ydk//ZLYmAAd2vPnKErdsY0XhpVILN35EIRMVUYv9Kba3/RFmgA4+RoV+ZZcG/Zh16+PZ1QdQZiEBRY703M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261428; c=relaxed/simple;
	bh=yIhpmlekYcDCNGfzHtVNcVBpzrOwUjdcxnoZubHOtRQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oBjelywXYqUQ1QR91kpm/xbHbGv9OnAR4gXgVPtkx3KvkH2E0+6ofVVwj4Q0iTolx8z3RaPiajdujMu3T2VlJozkxSJDScDjhShVJiLLGE1rTwEbaQsi4NZhKjSB6DbSEf7H9ERkV/gCEhFgsULAqo3Xkwml8NFTnHGpKYl+Jjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cx5K1bPx; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cx5K1bPx"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776261425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQtuVS3sgqyx9niv/tkBBdowiMa54dmrqbKGNI6tp9I=;
	b=cx5K1bPxa/C6wgJiO63D2EjbjU4dIuLWJXQKS67KzBxJUdO1/SgzIhlLRnLV+Xe5kkNRTI
	FoS/EfXKfNJ94Mz3So5CR50PiVq4IlxxiETVHlXdkQLCuxuG6zFrGmvPtCTfQoxI0/69D1
	JKl0BKrg7t5FNredFy3b2iEXX/S/wJE=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 15:56:59 +0200
Message-Id: <DHTS4F98EFCJ.3FEUAC33YRE8S@linux.dev>
Cc: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Sam Daly" <sam@samdaly.ie>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/5] staging: rtl8723bs: fix integer underflow in
 TKIP MIC verification
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Delene Tchio Romuald" <delenetchior1@gmail.com>,
 <gregkh@linuxfoundation.org>
References: <20260405101548.124829-1-delenetchior1@gmail.com>
 <20260405101548.124829-3-delenetchior1@gmail.com>
In-Reply-To: <20260405101548.124829-3-delenetchior1@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sun Apr 5, 2026 at 12:15 PM CEST, Delene Tchio Romuald wrote:
> In recvframe_chkmic(), datalen is computed as:
>
>   datalen =3D len - hdrlen - iv_len - icv_len - 8;
>
> All operands are unsigned, so if the frame is shorter than the sum of
> header, IV, ICV, and MIC lengths, the subtraction wraps to a very
> large value. This corrupted datalen is then passed to
> rtw_seccalctkipmic() and used as a pointer offset, leading to
> out-of-bounds reads on kernel heap memory.
>
> Add a minimum frame length check before the subtraction to prevent
> the unsigned integer underflow.
>
> Found by reviewing memory operations in the driver.
> Not tested on hardware.
>
> Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
> ---
> v3:
>  - Rebased on staging-next
>  - Sent as numbered series with proper Cc from get_maintainer.pl
> v2:
>  - Rebased on staging-next (v1 did not apply due to whitespace changes)
>
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/=
rtl8723bs/core/rtw_recv.c
> index 717e0594d983a..11ae99e53b86a 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -390,6 +390,13 @@ static signed int recvframe_chkmic(struct adapter *a=
dapter,  union recv_frame *p
>  				mickey =3D &stainfo->dot11tkiprxmickey.skey[0];
>  			}
> =20
> +			/* Ensure the frame is large enough for TKIP MIC verification */
> +			if (precvframe->u.hdr.len <=3D prxattrib->hdrlen +
> +			    prxattrib->iv_len + prxattrib->icv_len + 8) {
> +				res =3D _FAIL;
> +				goto exit;
> +			}
> +
>  			datalen =3D precvframe->u.hdr.len - prxattrib->hdrlen - prxattrib->iv=
_len - prxattrib->icv_len - 8;/* icv_len included the mic code */
>  			pframe =3D precvframe->u.hdr.rx_data;
>  			payload =3D pframe + prxattrib->hdrlen + prxattrib->iv_len;

LGTM.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
