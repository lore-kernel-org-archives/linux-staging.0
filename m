Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02E972623
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741130; cv=none; b=G2+7D+8n7047+KcNZ44zvw7wxWLArldEoAc8e9iJDWlzenp0Y66M1Z7xrZQGdpwGgvU+Z6jy4TFZkWHPX/nG6tFCdepbEdJ9LzgbHQEuDkZF0wn3efceaQtN34Mjc7ZT5+mCqVl9G4m/HI9FVHAq9E9i3oXL0YU21HJjmCiBGV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741130; c=relaxed/simple;
	bh=bR/kC0bu3KKDRmd3uu6VxeciF2aVLA3pF9Cg3TURw0M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dStoiR+lt+jKAW45F/h7D/FgdXgEA+GqEVounr7o4R9YO2uoeC43LSknmYpbvLFWFXDHJh93QRkpKOmCmmnP+r7nUMUsgSVi7+wcwWCo9lrj01W8y0hJMC74V9cPbpqtWPBnAbvUl1RwQ02hMFcDKJWLMsnVswI79okzELnjPJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WRy+NTUK; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WRy+NTUK"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775741125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kaF9zlEzjAJ0fU7hodzaP27gIsf/kbGmfnyy3HI4De4=;
	b=WRy+NTUKWPfi1FRykxtUzjvBvwJGTuGueKykOCI9IWY6+NznGNTKuUxT1TI5G4GmaBPRDA
	bDEwYgJuXeYHLTsxWIIyYLgtd25dtfty2HTnNOQUWOwmSBAxNGDhh0qhuD/diVzvnAMKhP
	lzvyBzeyEyzrAX8b7KBhYJxbg9z0lrc=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 15:25:15 +0200
Message-Id: <DHONOUOTL7HV.3D3TEE7P1I94J@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] staging: rtl8723bs: wrap long lines in
 rtl8723b_phycfg.c
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: <osjin83@gmail.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20260409050452.97774-1-osjin83@gmail.com>
 <20260409050452.97774-4-osjin83@gmail.com>
In-Reply-To: <20260409050452.97774-4-osjin83@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu Apr 9, 2026 at 7:04 AM CEST, osjin83 wrote:
> From: Jinemon Tama <osjin83@gmail.com>
>
> Wrap lines that exceed the 100-column limit in rtl8723b_phycfg.c to
> resolve checkpatch.pl warnings. Arguments are aligned with the open
> parenthesis where appropriate to maintain readability.
>
> Signed-off-by: Jinemon Tama <osjin83@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/st=
aging/rtl8723bs/hal/rtl8723b_phycfg.c
> index 01e1595fb46f..498f7b25a2b5 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
> @@ -395,7 +395,8 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
> =20
>  	PHY_SetRFReg(Adapter, RF_PATH_A, 0x1, 0xfffff, 0x780);
> =20
> -	rtw_write8(Adapter, REG_SYS_FUNC_EN, FEN_PPLL|FEN_PCIEA|FEN_DIO_PCIE|FE=
N_BB_GLB_RSTn|FEN_BBRSTB);
> +	rtw_write8(Adapter, REG_SYS_FUNC_EN,
> +		   FEN_PPLL | FEN_PCIEA | FEN_DIO_PCIE | FEN_BB_GLB_RSTn | FEN_BBRSTB)=
;
> =20
>  	rtw_write8(Adapter, REG_AFE_XTAL_CTRL + 1, 0x80);
> =20
Thank you for the v2. You are very close, but this patch violates the=20
one change per patch rule. Let's take a closer look. Here, you are=20
wrapping the line and fixing the operator spacing around the OR=20
operator "|" (FEN_PPLL|FEN_PCIEA...). The operator spacing fix belongs=20
in Patch 1. Please fix the spacing for that line in Patch 1, and only=20
perform the line-wrap in Patch 3.
