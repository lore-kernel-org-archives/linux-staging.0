Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3540399373
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 15:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773157473; cv=none; b=R/p224OJIWHxIXOhjaV/xyL2GAU5nPNCAXT/0gj0Y0VDp8SZuFPCiDjqHIOom1CVGuZ+6tn5Me7OUf935vYg2FThdzjBURLm361YjaetmEyIFRQZOdPvTUmY+B21ZeOrWgrtJSpMyVFBgsfAvUD16smD/6/8VUVoHy90LdCV57k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773157473; c=relaxed/simple;
	bh=fR6x3Jw6FjOJ69pnz8RYPYNmGxc12+rT+/SFgXMzG9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbTX3bIPHWtAmmf6p96sxdV3za1pPbz5c0R9TalFRq2m6qfQ0ncKkowf06HDHpCdbmE9RnYJOqZKJR4SOP7acXP/eZpQUTfJRJaZWThj40J3jRGcsrvSewCEVWdbCraw44GDzG2vB0Bamn2FWbZOhX9fefz7GOoHOFXc88r+HJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmYEkzIX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmYEkzIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773157470; x=1804693470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fR6x3Jw6FjOJ69pnz8RYPYNmGxc12+rT+/SFgXMzG9U=;
  b=ZmYEkzIXQQ0q7qOgQFzrkENSEzZiJblje44+nTpCn6SJvbT0GvleKOuE
   PV0Da8KNAnV6EsUTLfxJ5POdWNnZilE4TKyvPuqEQUNkkNGAJ09i1wwSs
   8JGdVh6vYfXhNmdIuLrAQVrXtj6xghDllUKTsjgQjk13NWWj2h8qVAZLi
   s8vBQ1hCi/s3t5mmmYi5slJU8um0YpqzU+W5/hrOMXRLxqzQSb36y1EHX
   OpNrzQ61z5NE7R2MJ1w6kX9I7p4ryfvE/Z6Ap3NRG12RO5Qhyz8BurpQZ
   e4fUgIkolj8fqetZQo63BreICIS9CRGdi2WKtAd9F9PnnVK6K+1fsMWLt
   w==;
X-CSE-ConnectionGUID: H5IPKuZlRViseV6KlKiLyA==
X-CSE-MsgGUID: Ieh9PDs0SIaZ/b6KIfE2uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="91780770"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="91780770"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 08:44:30 -0700
X-CSE-ConnectionGUID: MDgz3mAUSfyQ/XtEzcEPNg==
X-CSE-MsgGUID: 4tCIacWQSbiF4PQC92NBZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="224341810"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 08:44:27 -0700
Date: Tue, 10 Mar 2026 17:44:25 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: fix block comment style in
 circbuf.c
Message-ID: <abA8WebNosKYwvj-@ashevche-desk.local>
References: <20260309213024.5733-1-rayfraytech@gmail.com>
 <20260310151620.905-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310151620.905-1-rayfraytech@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 10, 2026 at 04:16:20PM +0100, Oskar Ray-Frayssinet wrote:
> Fix block comment formatting to comply with kernel coding style:
> - Add leading '*' on continuation lines
> - Move trailing '*/' to a separate line

You fixed something new I haven't asked for in v1 and you missed completely my
point in v1 review.

Try again.

-- 
With Best Regards,
Andy Shevchenko


