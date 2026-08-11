Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1B630C16E
	for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786460425; cv=none; b=TBY66Km487oUKy4Yq+zFWapEGX1H3C8ro0j1kpDzCgYVhE5PCJqPLDudvwYHUHyFxGcwTv5L4g+DP1bujY+PAWBTUZmSjpJa/pnxSdNNV05CJRr+y3VBLlx+XnGN+bKKuJ6ZYKvkqvLwya2HNMrke6+WSAYrK2nR8P/AoYbfPM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786460425; c=relaxed/simple;
	bh=hAeM2Ul1CgdC4B6aZZPnSIz+48UgApspnpa3Pu9iLig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3J7QBsj69qlgR4Ch1DzaseG6OBNb2gwo++qjG9O9Smz2GQaiOJVnja4FevaGCL87qHrdENm7ezG9UOdjSrR1JlYwAFZlP1KdTb1Ho8sIFH5Dr8ZPgXhx7yhw5IjE8o4bkMhKQnsvueUZgZ4c/MoogZFpWYQVS+77n9BkSXxl1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9QP+/IN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9QP+/IN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786460424; x=1817996424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hAeM2Ul1CgdC4B6aZZPnSIz+48UgApspnpa3Pu9iLig=;
  b=E9QP+/INAwJbKevIuZXGUX64uxpOv4nlJcpYE3U7BNKR59+PqvppKkOd
   MKdlF6amUkv+N7NjJNkrg/mo4gv//DN3SUbXzMqq+jtJU4ztUVzL3yukD
   AQo1RHSQiB8Y5sURN09OfpGIoj/Kur5H76CRFJ69EGymyljPderA0apzW
   NgC6JcuE6ln/0oGcpiQq4xEH5syaRsiYxsYL6RGdj2C0azYUgnMeOicVO
   dWAu5XsjdfEondZJ3D6IMrMH77b0+3lNX0CGc6cUTVhcb7OZHc0M+Mz/p
   EQiOHDSP8dsBMRzE9sUQ0ixc0UN9LKnAmu8o0UFc3mYnLQ0fy3GWvzsN6
   w==;
X-CSE-ConnectionGUID: Y0RswteyS0Sqt7ARZ7I5Ng==
X-CSE-MsgGUID: zvZskFnmTruxtMveVoVX+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="109784335"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="109784335"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 08:00:24 -0700
X-CSE-ConnectionGUID: 8C6PGCJ4RSSi3yanfdn9YQ==
X-CSE-MsgGUID: 7hRi1QYZThKdHBfceGMH1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="260745775"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 08:00:21 -0700
Date: Tue, 11 Aug 2026 18:00:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Neal Patalay <nealpatalay0@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	matt@mattwardle.net, mugrinphoto@gmail.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] staging: media: atomisp: refactor pipe graph dump
 stage formatting
Message-ID: <ans5AreArUHVP-MA@ashevche-desk.local>
References: <20260708042939.40420-1-nealpatalay0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708042939.40420-1-nealpatalay0@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 07, 2026 at 09:29:39PM -0700, Neal Patalay wrote:
> The original implementation of ia_css_debug_pipe_graph_dump_stage()
> includes an off-by-one error where the original strscpy() size drops
> characters immediately before newlines. It also allocates over 600
> bytes across multiple buffers on the stack and truncates all output
> debug information after three lines. Fix the strscpy() bug, reduce
> stack usage with a single 256 byte buffer, and remove the three line
> limit via a new helper function, ia_css_debug_build_info().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


