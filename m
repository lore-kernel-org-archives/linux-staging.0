Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E8435DA65
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783261357; cv=none; b=bFWTbjtZLJrzOQ6PMmh8aW2EzXZ0gB4TCL1+ILJrYWF0J1/yFGaKRiNFhHeT0xV2mtFK86W54cQKmqt+YRKnwb3dT5/e2DfFenb//4bs2AsgvNM6LTW1so6zp9l7li5dx83XQK2u9b0OCDlMxd3WxmJUCqP02l8oWs0zQaCpB1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783261357; c=relaxed/simple;
	bh=YNQVvg/XiPpVOCPUJMfQag6QloucgkMiRuDaQGZlsf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9T0vpzw7gInpz2kXQzU//SCI75U4LMwOU1aiaAXBFmlshWrpAPvgNLJre1lHpyiZN2D/loOaJeltrPA051FSE+wLO8nuT8hHFvySRrE9mVa0B4JHriw8PkOsLZgyPsWRhWLmp1Cqbd9HO+YdcPMAhOf44d8CWQIEiPEzBQ9YhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BcPSjMN1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcPSjMN1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783261356; x=1814797356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YNQVvg/XiPpVOCPUJMfQag6QloucgkMiRuDaQGZlsf8=;
  b=BcPSjMN1HfNAnk74PUHMNwfg672awKUyV4jC1eyJBQI/6FoKTMiyV1Yz
   7/hCeL4++RDZfomxwpHapAdm1bEZn4XpEVJFF2UQLkDjpH2ibxfH18MQC
   AoS6PVifeTLCezoT3ZAIoMNfxoHBPCHKmcrHw1tKh5MoHpC8rEn9s6bIn
   pRfvpbGhT91EQnnIuyq7vhToTugeIfngG5GgU7pY0nQlKGd4BY6kJGcgV
   uR6sa6eZkk0Ywgow2dPvUp8nROBy2BWvLx7S7cJLPIJvHycI9+dnftoex
   B+u8t3kiXUwauTOEq8vPrX4GqxL0fSsZrrXcA3z6MQhYW9O9A4wSPKYge
   g==;
X-CSE-ConnectionGUID: rENXCofJTaKWJcO54um4rQ==
X-CSE-MsgGUID: yRRJZIfVQTCFSTHHL5MHtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95287976"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="95287976"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 07:22:35 -0700
X-CSE-ConnectionGUID: FjHEc2ngRAGBhyZyFmIEoA==
X-CSE-MsgGUID: MPVt+0f6SaetyH/hKkSGfg==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 07:22:32 -0700
Date: Sun, 5 Jul 2026 17:22:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Neal Patalay <nealpatalay0@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mugrinphoto@gmail.com,
	matt@mattwardle.net
Subject: Re: [PATCH v3] staging: media: atomisp: refactor pipe graph dump
 stage formatting
Message-ID: <akpopoFZyWW2e9En@ashevche-desk.local>
References: <20260705073844.146578-1-nealpatalay0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705073844.146578-1-nealpatalay0@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Jul 05, 2026 at 12:38:44AM -0700, Neal Patalay wrote:
> The original implementation of ia_css_debug_pipe_graph_dump_stage()
> includes an off-by-one error where the original strscpy() size dropped
> characters immediately before newlines. It also allocates over 600
> bytes across multiple buffers on the stack. Address these shortcomings
> and reduce stack usage with a single 256 byte buffer via a new helper
> function, ia_css_debug_build_info().

...

> +static void ia_css_debug_build_info(char *info, size_t info_size,
> +				    int *offset,
> +				    const char *flag_str, size_t flag_str_size,
> +				    int *line_len)
> +{
> +	int len = *line_len;
> +	int off = *offset;
> +	int len_written;

The blank line must divide the definition and code blocks.

> +	/*
> +	 * If new line length exceeds max line length,
> +	 * replace the last ',' with a "\\n"

Missing period at the end.

> +	 */
> +	if (len > 0 && info_size - off >= 2 &&
> +	    len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
> +		info[off - 1] = '\\';

If for some reason len is > 0 and offset is 0, this will write beyond
the boundaries.

> +		info[off] = 'n';
> +		off += 1;
> +		len = 0;
> +	}

> +	len_written = scnprintf(info + off, info_size - off,
> +				    "%s,", flag_str);

Broken indentation. Note the statement fits a single line.

> +	*offset = off + len_written;
> +	*line_len = len + len_written;
> +}

This will continue writing even if there are more than 3 lines.

-- 
With Best Regards,
Andy Shevchenko


