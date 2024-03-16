Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5C31CAA0;
	Sat, 16 Mar 2024 20:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710620291; cv=none; b=QnETImh7om5T58adLG4wcSLh58d/n2lkTAKMJfY8h+Ky4t7MFEj/MwMojBH8X1Qic02XvcLi9nvwwMnkmSMNk32Cenae+nIpQxA4t+O2IY6r3oWCDKyAWw2HGMvvmo1RvQfg3vT1PJL0iXECcflufRqMfqhgqOWV0sYBO1scj/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710620291; c=relaxed/simple;
	bh=jncKyVulRUwBwOqCRNknWV4SqA07bbbaAvVFV7C7TSA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KRxQDcSn1tlEl4q4sp+fTO7bD67ELkYuG0C3PLXgP7qiXPoVLQCdj7JIQQxMQIArHEuh/NflEkKN2XSzi5nm8rYI/shCXK1lTEBM67BkikjL8feOuKJHuv2ACuBcXasbDAe6zNprB8vGOi1dW78tI0oy0ufdTO9lf27gyHXBMSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=ts5tT3Fm; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="ts5tT3Fm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1/cNUncyNAjaSL/I9d5LeA20byWgUCX6hXuHKO3GwG0=;
  b=ts5tT3FmWR/gGCXhvL4QIZijvSxJ32uo9+PdA7iqJwleoT899wa0+J9S
   KU1Lf0RYmcs7pV7roiImQxVlNBeh9SMmF5TjBVHhAcIOqGUBnL4WEHezf
   Ih1+XWXgTk5xIUtEHvtT4FqwXxaCyDhI2Xw6/JwZhBByJaU/rI1r+YiVz
   o=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,131,1708383600"; 
   d="scan'208";a="82343017"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 21:17:29 +0100
Date: Sat, 16 Mar 2024 21:17:28 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Dorine Tipo <dorine.a.tipo@gmail.com>
cc: gregkh@linuxfoundation.org, forest@forestbond.com, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev, 
    julia.lawall@inria.fr, dan.carpenter@linaro.org
Subject: Re: [PATCH v7] staging: vt6655: Remove unused  declaration of
In-Reply-To: <20240316193016.1885-1-dorine.a.tipo@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2403162116580.3295@hadrien>
References: <20240316193016.1885-1-dorine.a.tipo@gmail.com>
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
> Fixes: dd2837bdea0e ("staging: vt6655: Remove unused byRFType in rf.c")
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
> V5: - Added a missing closing parenthesis in the fixes tag
>
> V6: - Sent the wrong patch for v5. This version includes the fix in v5
>
> V7: - Made the subjectline more uniques as suggested by
>       fabio.maria.de.francesco@linux.intel.com

Actually, this doesn't seem to have worked.  The name of the function is
not included.

julia

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
