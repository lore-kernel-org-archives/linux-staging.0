Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749213CBE6E
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 23:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442993; cv=none; b=sCVf+CyEmB2CfLix6YMCaLIYb81yq4pM+4wJFoI0BhIqHL8gKRlwqYT48ntfv4VmsSsYK7GgtzmRztymlL4IA93FcDqCNCkQq3hYQ23fIp3adyGYSNjsYRgtT3lMm/PiFXydXXggoLkMOgA3OzF27KE2eXd6w/7uTtP+nJvdxVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442993; c=relaxed/simple;
	bh=1ugYhzSS5NJhyRtIxNYzpGFAeMAn/U8pFQEq2S7zZjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNDHUoHd8m7tPPHHqn0h3SBETidCRpVKQj7WcPGm/ceO2z/u2xr5c6TI9oTvkyBqGkRulJ8gIh42YPhpJhd/GLH9ODiMHsxN5b+FyuMzK/F3dm5dBrX79ggSQQdgkyeoKX72xkDsBUPSBQAu4pwCd4BfLA4f1FNwnsH/fXUFUXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgrhjhGN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgrhjhGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780442991; x=1811978991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1ugYhzSS5NJhyRtIxNYzpGFAeMAn/U8pFQEq2S7zZjM=;
  b=PgrhjhGNjFu2TSH24eH7zMLQLWiZsgbWkRRW4YrP9JF/R19QxTHxoBNn
   UErBd9qWsJtcVOguS48u+9IrD7BiNMzgA8EY5ohISnOQr4XkP+ylbpaG5
   QDIE/tk7n5szUJfRBU8ApNzkULZvoqV4yVVeHRD5d6oVpHMCeIT6HuHop
   VIm4YcziVOtDgdJ/EFKYqxcgHAh9q6YwRBwgn69JIRjWa8BN3LDglnOjr
   gzVGVrKPhzQbSAZAmrD2WfArVCk7PIXYOU/LzLHdzekpwtNv9ITz8Kowx
   6oqE7/1XVOhx9/KaBGsK5UmoZsmwDwJJp/EnEdZwwGmuMDCxS+sbViaUO
   g==;
X-CSE-ConnectionGUID: A7B1CdrCSgCvVqx/TWUBVA==
X-CSE-MsgGUID: IHWo0DN+S5qy9B7xk5mocw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81302130"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81302130"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 16:29:51 -0700
X-CSE-ConnectionGUID: zyUJj8LsQnWqfOO7wkkYmg==
X-CSE-MsgGUID: 1WEL6PfNTM+shV+NTNoHuA==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 16:29:48 -0700
Date: Wed, 3 Jun 2026 02:29:46 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof =?utf-8?Q?Wo=C5=9B?= <krzysztofina2022@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	khushalchitturi@gmail.com, architanant5@gmail.com,
	s9430939@naver.com, kees@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style in rtw_cmd.c
Message-ID: <ah9nar_KAw49VKfO@ashevche-desk.local>
References: <20260525201001.14852-1-krzysztofina2022@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525201001.14852-1-krzysztofina2022@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, May 25, 2026 at 10:10:01PM +0200, Krzysztof Woś wrote:
> Fix spdx comment style and indentation in rtw_cmd.c to resolve
> errors and warnings reported by checkpatch.pl.

...

> -	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
> +	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 -
> +		((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);

Is this the only single issue of the type in the entire driver?

Also, now it's harder to read. What this code does is as simple as

	pcmdpriv->rsp_buf = ALIGN(pcmdpriv->rsp_allocated_buf, 4);

(need linux/align.h to be included).

-- 
With Best Regards,
Andy Shevchenko


