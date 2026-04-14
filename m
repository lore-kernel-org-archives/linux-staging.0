Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3006B38D005
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776168772; cv=none; b=aYMRKS0MJu0DPJ72J8xWHY56Wno4BIijBGvLZoAYiMId+HKpEU9ZcLWLJ6Qm82QkI7sWOXQaFhuzTglpCv5s1P+im+KI0FB2bNcLwN/obyaU5bHTT0jKGSwexy4xDAM7Me+hhcvTwf7IvXrom0hfifs6J4qV9ttNRMbt8XIO6XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776168772; c=relaxed/simple;
	bh=GZXibGVmJV/ZJpuo0C/0kEoIPS4Fp6UBL3QQbP+I3+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsTa4ZYA8sGM7F0wKks/jszx2HCnoU2tHTqrR8zbvKJsnxqKI4Nud08TFVAzb4M96SbSRpivb1y4pEm79XUduHOj9+Ad9hPwRnyBnwBv/w0v8Q9TbdpUDis8o2MxNj1V8zj5cgL45buZm65pqc9K6BUN5qG9nUOebDNKECzBe6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSHswyXK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSHswyXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776168771; x=1807704771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GZXibGVmJV/ZJpuo0C/0kEoIPS4Fp6UBL3QQbP+I3+g=;
  b=jSHswyXK7btG6QkpS9MS4QdlW8LqpR9WWm0RyaCB8yqOyXHHVZbHkYR0
   cOYuz3dhJrTSmcheOjaweULDC4X03xSpGZ3tFrn+idvY5r0dxxfYIIZBO
   R0hgx76ogIwW+KYuAQmkcU2wVU7voJWZ2SlJhARahv5oyRqTXgdADQUSq
   9BdvKMzuH6mOF96mHzJSqFsJDW5oOXZri78w2tmgvjgyNUNzIydrzAcga
   Elq6aw0u0/vB0QNrHgDqE1PpqQzBeFR2VouGG69vn6SYdq9M/13D9A77k
   q/lZ4x6zweqOMeeCektDdO99L6sgjUEU9qqlLwksr1g1+UdliC+zTMLHj
   A==;
X-CSE-ConnectionGUID: PBOyKgDqRVadLcoAMzwS5A==
X-CSE-MsgGUID: 0klYQZ9kQI2GKyLGBgFxsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="80716144"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="80716144"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:12:50 -0700
X-CSE-ConnectionGUID: FSDmtQtDRaO4GeqLyxiu1g==
X-CSE-MsgGUID: NWTpmikqSfeBiI88RpEMYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="260514680"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:12:49 -0700
Date: Tue, 14 Apr 2026 15:12:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marc Finkelbaum <regpacy@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] staging: rtl8723bs: add space before inline block
 comments
Message-ID: <ad4vPnmlZsgnuhak@ashevche-desk.local>
References: <20260414095833.76480-1-regpacy@gmail.com>
 <20260414095833.76480-6-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414095833.76480-6-regpacy@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 14, 2026 at 12:58:29PM +0300, Marc Finkelbaum wrote:
> Add a space between the semicolon and the opening '/*' on all
> Queue2Pipe assignment lines in _OneOutPipeMapping, _TwoOutPipeMapping,
> and _ThreeOutPipeMapping.
> 
> No functional change.

...

> +	pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0]; /* VO */
> +	pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[0]; /* VI */
> +	pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[0]; /* BE */
> +	pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[0]; /* BK */
>  
> +	pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0]; /* BCN */
> +	pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0]; /* MGT */
> +	pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0]; /* HIGH */
> +	pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0]; /* TXCMD */

I would rather have something like

enum {
	RTL8723BS_PIPE_VO,
	RTL8723BS_PIPE_VI,
	...
};

and replace indices on the left by the enum values and drop comments.

-- 
With Best Regards,
Andy Shevchenko


