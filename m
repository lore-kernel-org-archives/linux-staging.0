Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C2A18C36;
	Sat, 16 Mar 2024 18:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710613773; cv=none; b=VBzS0So2GIyqDKhF5uTplsPFduOTP91xEjS3ICt4qiIx4feOGEHtYcqE67xQ2LyGufIdVLLSRFKgFNkC5ZeiR/qHOnKmTd8eJrbxo+1fHw7TsEWjp2ixskBvSrxUS3Rk00wh2on6GnHu5s5WZ/n8Z+OHojTzeNtn+/R8uycyE+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710613773; c=relaxed/simple;
	bh=YCVGF6a7MZHaVA1vkZgqwvRcXT3CNW1L39G6ONBKmak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uLoXUcxhRt0qQV10ws9H87mb2q0QgK1myjIVL71+elCVedfOwwAiYpTHA8RMRv8eausCZ9frDifuCiJ2Wvbi5Woy1pEgUT3daRzA5ILbqIRunIZTjFwLBbvS+x1WR2uw3jrI24H+uVXeJNE2z5vdX+Fp213nWHd5An3RtqCpAmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOxlA9ZE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOxlA9ZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710613772; x=1742149772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YCVGF6a7MZHaVA1vkZgqwvRcXT3CNW1L39G6ONBKmak=;
  b=WOxlA9ZEUG+o62HkFOJGUFP+zc7j6eabfhwb+qtk9Yx2YcxQaXC2uk4Q
   86hmh3OK06DNF41WyhvILg28u1Wiy2G48MiDhJ13+Hd0lwAkkDJTG2Sks
   N7rnxYt6ohGkCkuzKyhjpZr3SLAErmEzmmJlW53x1/RXc/TcIYf0nVwPW
   +Chom21pIlP/VXLz7f3AaqKceT004ECi9pgraU/Hp8HvCHbUuiHx/tubb
   vMuKU4UWAdj833WQxtPWVM0RNKAKzpcX7qS4pgdBQyTry8yd3swEWcsTU
   bXGiYM7T8pOiPkoGjEk1qLkZyEQWV2ux0V4cR04E7oY+oHk3uu0QcX2Hc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="30910500"
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="30910500"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 11:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="44067997"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.localnet) ([10.213.6.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 11:29:27 -0700
From: "Fabio M. De Francesco" <fabio.maria.de.francesco@linux.intel.com>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: gregkh@linuxfoundation.org, forest@forestbond.com,
 linux-staging@lists.linux.dev, outreachy@lists.linux.dev,
 Dorine Tipo <dorine.a.tipo@gmail.com>, julia.lawall@inria.fr,
 dan.carpenter@linaro.org, philipp.g.hortmann@gmail.com
Subject: Re: [PATCH v6] staging: vt6655: Remove unused function
Date: Sat, 16 Mar 2024 19:29:23 +0100
Message-ID: <2518811.ElGaqSPkdT@fdefranc-mobl3>
Organization: intel
In-Reply-To: <20240316173835.3572-1-dorine.a.tipo@gmail.com>
References: <20240316173835.3572-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, 16 March 2024 18:38:35 CET Dorine Tipo wrote:
> Remove unused function RFbAL7230SelectChannelPostProcess declared in
> rf.h but has no associated implementation.
> 
> Commit dd2837bdea0e removed the RFbAL7230SelectChannelPostProcess() but
> accidentally forgot to delete the declaration in the header file.
> 
> Fixes: dd2837bdea0e ("staging: vt6655: Remove unused byRFType in rf.c")
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---

Make your "Subject" line more unique. Think that we may end up with having 
dozen of commits like yours, all of them referring to different removals and 
all without the necessary information to tell what they differ in (except 
the driver/subsystem).

I'd rewrite it either as "Remove unused declaration of 
RFbAL7230SelectChannelPostProcess()" if you want to make it clear that you 
are only removing the declaration (not also the definition) or, more briefly, 
as "Remove unused RFbAL7230SelectChannelPostProcess()".

There is no need for "function", since it is made clear by the parentheses 
after the symbol.

Thanks,

Fabio

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
>  drivers/staging/vt6655/rf.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
> index 6f842ac00526..8eef100c7ef2 100644
> --- a/drivers/staging/vt6655/rf.h
> +++ b/drivers/staging/vt6655/rf.h
> @@ -68,8 +68,4 @@ bool RFbRawSetPower(struct vnt_private *priv, unsigned
> char byPwr, void RFvRSSITodBm(struct vnt_private *priv, unsigned char
> byCurrRSSI, long *pldBm);
> 
> -/* {{ RobertYu: 20050104 */
> -bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv, u16
> byOldChannel, u16 byNewChannel); -/* }} RobertYu */
> -
>  #endif /* __RF_H__ */
> --
> 2.25.1




