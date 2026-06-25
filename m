Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38AA2DAFA9;
	Thu, 25 Jun 2026 07:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371702; cv=none; b=Rbd9cKaHQBTLj6FOHeji9gWG6twhVHjSsd8e+k9jItdAb9JuZ6RCvFASzLJgo9cUVsgnZHPZTwB6DiflNBpL9qdWIO52DEClNeUTZVH3azWyOeFXACzbz2C5hHTwpDaT8/7xD/e1gW7F1MGg8p75bwRl5sxD4Y/MPNSlZ2+MM7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371702; c=relaxed/simple;
	bh=VVmG+vOAHLGFXSjawZLGI9QilozJF/132VfqwXu/DYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVOrSDbpRLxO8XspkOzDtEqsDzgVSe1kTOuumu/WosNALKHloXTe9nORakavN2AuefJvfoh7bvC3YoYuOJ2rQceT/YZDTfEbxI8vr5qs3urjDiCtq7ApbSKH2NCGKhrYjC5le6JIn/k9tD2kfJHaSpxZmixLOdiH+gAawxuo62A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hi7psdeW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hi7psdeW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782371701; x=1813907701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VVmG+vOAHLGFXSjawZLGI9QilozJF/132VfqwXu/DYs=;
  b=hi7psdeWNRALeJiaMN5bv+lrQsjR4rPA7TUAm8zxQmqXhYxppxv1TFr2
   1nIZEypb8LHn7PtuDRzyfp4Yx9xtIFmCjpzGeq+hacWSZpCeU+8/Bu9fQ
   q7IsVZJdEQ3v9Ex1N8nLl3286v06EXQSrYGrvwdWcLyZRtTkXWaB50uao
   pc1maVevePqp4FvZsloFr6P+Ga/XDn/PXGVyXwOfPeANbHc4clpcjqzHC
   7+wrUM2sK6354efZg8wdrfyOBpkirC3N2aQ7K8nOnhlAR7sbaRD62CunH
   kMQIyOlSRgbwBFL08eOtrx+tpN4ZehcegT1AozkacBQP6QihVWfhlE+X6
   Q==;
X-CSE-ConnectionGUID: MdNMRwUHRoKvvkFWqHfibg==
X-CSE-MsgGUID: YXBlZXKUQ+SoruE13ZoGzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="82127789"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="82127789"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 00:15:00 -0700
X-CSE-ConnectionGUID: 3MdLDEXSSpmw9bf2v0zlAw==
X-CSE-MsgGUID: ujAvk6ggRC+z5aqmHNeH0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="247304209"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 00:14:57 -0700
Date: Thu, 25 Jun 2026 10:14:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	feng@innora.ai, ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 0/3] staging: media: atomisp: use kvmalloc_objs() and
 drop redundant OOM messages
Message-ID: <ajzVb3DIghSrgvjs@ashevche-desk.local>
References: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 23, 2026 at 07:09:25PM -0300, Rodrigo Gobbi wrote:
> Several allocations in the atomisp driver still size their buffers with
> open-coded multiplication, e.g. width * height * sizeof(*p). When the
> dimensions are large the product can silently wrap, causing kvmalloc()
> to allocate an undersized buffer.
> 
> Convert the remaining sites to kvmalloc_objs() with array_size(), which
> saturate to SIZE_MAX on overflow so kvmalloc() returns NULL instead of
> allocating too few bytes.
> 
> This continues the work started in commit [2], and picks up the stalled
> sites from [1], unifying with [3].
> 
> While here, drop the redundant IA_CSS_ERROR("out of memory") messages on
> the touched allocation paths: the memory management core already emits a
> far more detailed warning on allocation failure as raised at [1].
> 
> [1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
> [2] https://github.com/torvalds/linux/commit/d178c7ca8fefc28115d35b94c3b1f4d653e34182

FWIW, since it's in tree, you can refer to it in usual way:
d178c7ca8fef ("staging: media: atomisp: use array3_size() for overflow-safe allocation")

> [3] https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/

Anyways, the whole series is good, thanks!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


