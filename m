Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9850A18C36;
	Sat, 16 Mar 2024 16:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710607718; cv=none; b=UITjoVEMTnrG6Wq9bR4MRFwgU9GpewjMp8DgTG+4qyiu8fHPXw3CWxaeOn2cX2PZ5ZDTahLAwZJV8+z4lntHOs5X4K3r8KUXo3A+k7GyWWpX65vYIIarwqLzoW+msx4doeEer8TRTAlZ6ZpqK4zOY54NfdnIZF+X2QOqwTYVX8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710607718; c=relaxed/simple;
	bh=+sBKTMu/Vh6E4klUQRg5tWkNvcm0YJVLaPpzSOUl1qw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Sat7VvtQ2YAmtIqS6k9p0fwlH91AmgkPhoz+rwOzIt1OLIV92LPhXkxOkJu/gaQxhKGV/T6p1xIj2tJMZiqcVSQAQthrzaGQTXaoBFYhvMmUhTQe+hRyPqwDSOlIINeUczCddImh5I3ormZr3ic0enKP9g5zbEo3/EXe2Uw5q+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=bWvt4scT; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="bWvt4scT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tDDmAC6+CxSxwYc6zHqAnyuspYDM747z533e9tU6cOY=;
  b=bWvt4scTQI88XXyh2+xrZP+NMO3jwpk10QpFrdEa3cPAfdsYMPLLXEUZ
   dsXx4glgY8+fFvqUs5aTTRkI6USclY2YCFVwpDXq93Dnyc7qlBXHw2IPF
   7B6YlbKL7ykYTOYVr9pn78rFTQf3xrKtAaD+YYrwWt6flS21a1UmXUa93
   o=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,130,1708383600"; 
   d="scan'208";a="82338569"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 17:48:24 +0100
Date: Sat, 16 Mar 2024 17:48:23 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Dorine Tipo <dorine.a.tipo@gmail.com>
cc: forest@forestbond.com, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev, 
    dan.carpenter@linaro.org, philipp.g.hortmann@gmail.com, 
    julia.lawall@inria.fr
Subject: Re: [PATCH v4] staging: vt6655: Remove unused function
In-Reply-To: <20240316160835.2312-1-dorine.a.tipo@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2403161748110.3295@hadrien>
References: <20240316160835.2312-1-dorine.a.tipo@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 16 Mar 2024, Dorine Tipo wrote:

> Remove unused function RFbAL7230SelectChannelPostProcess declared in
> rf.h but has no associated implementation.
>
> Commit dd2837bdea0e removed the RFbAL7230SelectChannelPostProcess() but
> accidentally forgot to delete the declaration in the header file.
>
> Fixes: dd2837bdea0e ("staging: vt6655: Remove unused byRFType in rf.c"

Missing right parenthesis.

julia

> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
> Changes since V1:
>
> V2: - Removed the unintended blank line after removing the dead code
>     - Removed "in rf.h" from the subject
>
> V3: - Added in the Description Comment about unintended blank line
>
> V4: - Adjusted complete description according to hint from feedback
>     - Rebased patch
>
>  drivers/staging/vt6655/rf.h | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
> index 6f842ac00526..8eef100c7ef2 100644
> --- a/drivers/staging/vt6655/rf.h
> +++ b/drivers/staging/vt6655/rf.h
> @@ -68,8 +68,4 @@ bool RFbRawSetPower(struct vnt_private *priv, unsigned char byPwr,
>  void RFvRSSITodBm(struct vnt_private *priv, unsigned char byCurrRSSI,
>  		  long *pldBm);
>
> -/* {{ RobertYu: 20050104 */
> -bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv, u16 byOldChannel, u16 byNewChannel);
> -/* }} RobertYu */
> -
>  #endif /* __RF_H__ */
> --
> 2.25.1
>
>
>
