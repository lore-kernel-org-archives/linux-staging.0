Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471AC1DDC37
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776251422; cv=none; b=c0vzrXvkPOMe1lJ6oYnALAKXGDm+wT9IEuQca+RWIjMyMC2/549nU/gClJrVuEzpDl1W4LBcEUB+hmSvEexyoqlwf6Z0mLsbcupDYSWE7xvRcPhHokdWO1n9rSoHbBpTh41bKhr053YbkST7nZx1/8D2q9lFpbcrSwKbJW9DLvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776251422; c=relaxed/simple;
	bh=8er+gTBwZ36ynJPRrHyMd0ut0wFbVbXvajAWpf2ejOA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BxQoESFLcisToXtpmOXKID/glqyJYEjsashEmkij0u9vfEzsVH6/APiXU9De3r2SIU3Zj7mh2GuaMwJvaRht5Jh5cFDleYC+I2GSt6191DDvyUcz9rg+6VOrXozYHCz5OFL4YjBqaw/2vvruhhsW9wXmhguydcpkvqIp+hHovPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m2O5hojG; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m2O5hojG"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776251418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tex46EAOolLu+S909IVM19QvVWWM/IxWtbPZBOkUGK4=;
	b=m2O5hojG419frKZTArcQEnwNypIzIp6ZQoJcPlFwPkl/Q5uqW7wadS+gVsAbYboaDfSY4N
	yztodXW4Qw2s6FlNx46lgrWGO6k4quEiO9p2L15ciy/u/hrD1aRhewGrT7bDx9kNNLWtUf
	v0coxZLUp7AJlHEGlvuU3HQJWLRJCiw=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 13:09:57 +0200
Message-Id: <DHTOKJ7E4RQY.3LOBNWLK5XORQ@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <error27@gmail.com>, <stable@vger.kernel.org>, <luka.gejak@linux.dev>,
 <hansg@kernel.org>
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: fix heap overflow in
 OnAuthClient shared key path
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Alexandru Hossu" <hossu.alexandru@gmail.com>,
 <gregkh@linuxfoundation.org>
References: <20260415094505.1115208-1-hossu.alexandru@gmail.com>
In-Reply-To: <20260415094505.1115208-1-hossu.alexandru@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed Apr 15, 2026 at 11:45 AM CEST, Alexandru Hossu wrote:
> rtw_get_ie() returns the raw IE length from the received frame, which
> can be up to 255. This length is used directly in memcpy() into
> chg_txt[128] with no bounds check, allowing a heap overflow of up to
> 127 bytes when a rogue AP sends an Auth seq=3D2 frame with a Challenge
> Text IE longer than 128 bytes.
>
> IEEE 802.11 mandates the Challenge Text element carries exactly 128
> bytes of challenge data. Reject any element whose length field does not
> match sizeof(pmlmeinfo->chg_txt) (128).
>
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Cc: hansg@kernel.org
> Reviewed-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
> Apologies for the version numbering confusion across previous iterations.
>
> Changes in v6:
> - Add hansg@kernel.org to Cc (original driver author; accidentally
>   omitted from the v5 series)
> - Patch content unchanged from initial submission
>
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/stag=
ing/rtl8723bs/core/rtw_mlme_ext.c
> index 5f00fe282d1b..90f27665667a 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -891,7 +891,7 @@ unsigned int OnAuthClient(struct adapter *padapter, u=
nion recv_frame *precv_fram
>  			p =3D rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EI=
D_CHALLENGE, (int *)&len,
>  				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
> =20
> -			if (!p)
> +			if (!p || len !=3D sizeof(pmlmeinfo->chg_txt))
>  				goto authclnt_fail;
> =20
>  			memcpy(pmlmeinfo->chg_txt, p + 2, len);

LGTM.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
