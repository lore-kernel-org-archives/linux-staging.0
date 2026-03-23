Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0E62BEC3F;
	Mon, 23 Mar 2026 16:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284179; cv=none; b=ERC2iPWyZgg8ODho2vgsQFnbnyJJ1x3nfvKzNrV58gDgHRt4xYPDPQWW0lrYb0GEfRg/R3s9c5Xld7Dh5sJYZliyAKm80b01ZyfaRc5GkdLBY9AlSFUVn+e3a8SagtLO8ueRwMjHkCa9ubwKOUGdTmwEtH2p1KSg/OFvLYJaXkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284179; c=relaxed/simple;
	bh=ACiSoVXVadaPpUSGw618hOYhtWfsLFE3kBBx+uZB5TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oU1k8GEVb8+j2IFXQ6APPCaFqwY/WAQ4fdm+3Ry829lBBEX4S2KQKXBhBaH+VF6npzMRnrXVxlUixdyGQ/BCZbUpBR0q0ct9vuWbJBnG3Hy+YWL6qNvKBJAADzkJcJDklkl/W1/bx0YjTUWKBsqVSMUZfu98Ogt1pGFZpiaudT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLxSwXL/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLxSwXL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774284178; x=1805820178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ACiSoVXVadaPpUSGw618hOYhtWfsLFE3kBBx+uZB5TU=;
  b=DLxSwXL/mI7G/gdvCEgAPPBeJ+A9ZimkuNhvou0nHlnzybfZX93RCBuZ
   9ytuxfTYWjO7a0/eG+6SQId0lnLsGJ1bgE1ICFT9gGxvQbNlvgBs8zFKj
   23UULUTCE87QfqBQXDMnws6E200EM+9Yz1lBdTZ6YYS/cDQaOAUpu9NkI
   03MecEV0kpDNeUOiTExBpXZjBzasXu4xCPmBaN4ORbcRuYunvopY0UdHH
   6LeceShtak2erRgYqYmNzJOTkR4ETyGKi5ZVh6ZGKKiQOBJK4Lw8KeSaE
   9AsrLqfHAJrvmZAghbYoN4kUqaEonbscfVHe2tGk4n2Oyxq5S2/LIaC4x
   Q==;
X-CSE-ConnectionGUID: FyAqosTWTpSleiNt8/sSGQ==
X-CSE-MsgGUID: dCKETM7MQVeuPfvrvpJfGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="85598941"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="85598941"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:42:57 -0700
X-CSE-ConnectionGUID: F+cb1beLSG6eAIOlnO0qSA==
X-CSE-MsgGUID: y/0rb4S4QJWmHWOgXGKurw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="219233274"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:42:52 -0700
Date: Mon, 23 Mar 2026 18:42:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Prithvi Tambewagh <activprithvi@gmail.com>
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	straube.linux@gmail.com, b9788213@gmail.com,
	ethantidmore06@gmail.com, dan.carpenter@linaro.org,
	weibu@redadmin.org, knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com, dharanitharan725@gmail.com,
	lukagejak5@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com, suunj1331@gmail.com,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
Message-ID: <acFtiaXTp7bwl604@ashevche-desk.local>
References: <20260323162901.121947-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323162901.121947-1-activprithvi@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 23, 2026 at 09:59:01PM +0530, Prithvi Tambewagh wrote:
> In all types of comparison/test (using ==, !=, >=, <=, >, <
> operators) ensure that the constant lies to the right side of the test,
> thus fixing checkpatch warnings : comparisons should place the constant
> on the right side of the test, throughout the rtl8723bs driver.

...

>  	do {
>  		valid = rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
> -		if (0 == valid) {
> +		if (!valid)
>  			read_down = true;
> -		}
>  	} while ((!read_down) && (retry_cnts--));
>  
>  	return read_down;

This entire piece can be replaced with something from iopoll.h.

...

> -	if (WIFI_CTRL_TYPE == GetFrameType(pframe))
> +	if (GetFrameType(pframe) == WIFI_CTRL_TYPE)
>  		return true;
>  	else
>  		return false;

Just

	return GetFrameType(pframe) == WIFI_CTRL_TYPE;

-- 
With Best Regards,
Andy Shevchenko


