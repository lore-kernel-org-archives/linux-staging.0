Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F5030FF3C
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775663796; cv=none; b=jpHIxIN5z5SC2r5qj+7vFytHno7F69Z5wVbjueALsA55L7dO4B+ZkosUA7KRcyx9IX48/MrNnIvabuI+D7fH2Y0kdtDHM58YP/15LzhqSg1zo79PGU4+oz+v+nWoGUNWMK42pRLPDeQ5jvzaHr2mAHGLRPpF07fS0W+WT9IhwhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775663796; c=relaxed/simple;
	bh=XtQ9e7hFReBOacjGmQu00xqSEGa888O5SQmFwxpatYQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eSxClTKGWbso96JUrrqvC4MqXdZjIZ6sLB1Hu07tbODX2hoUdcpiz69XIrDrkEQpe//DFR8ccR6YiXYsrlDUajM1RlwyQmWPrdTEZHQBvzJS75puB1X630RKCesC8hDU8AnJQnl+ke5LpaOGSwlWCyQ4yJLG0OF+9PdeLgxnEyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pqfq7Oqr; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pqfq7Oqr"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775663792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PovBup9U+WNlKAHLOrlbTPkRv8J6wkIax06iaeKI5jk=;
	b=pqfq7OqrGn+yRJchmWKZV7vs838+EpxMSSoR6u1FhQPMMyKkhlHD2r8cSNkeskQ4zF1dhv
	jRDNIdyeFbbl1qecrBwpiHGSLQ0uSY/OZeaEpEhE4KXWyQokJOCzt9f7tvLBMrcpbWcC/7
	1taMac6Fe+M38l0ZSHgNQlinxQ6WYTQ=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 17:56:25 +0200
Message-Id: <DHNWA1SUUAUM.1MY61YZDLI8NX@linux.dev>
Cc: <dan.carpenter@linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant return in
 report_join_res()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Hungyu Lin" <dennylin0707@gmail.com>, <gregkh@linuxfoundation.org>
References: <20260404110311.10917-1-dennylin0707@gmail.com>
In-Reply-To: <20260404110311.10917-1-dennylin0707@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat Apr 4, 2026 at 1:03 PM CEST, Hungyu Lin wrote:
> The return statement at the end of this void function is redundant
> and can be removed.
>
> No functional change.
>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/stag=
ing/rtl8723bs/core/rtw_mlme_ext.c
> index b1f20aa81efb..dad1d95bc325 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -4508,9 +4508,6 @@ void report_join_res(struct adapter *padapter, int =
res)
> =20
> =20
>  	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
> -
> -	return;
> -
>  }
> =20
>  void report_wmm_edca_update(struct adapter *padapter)

LGTM
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
