Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A653A6F07
	for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776862697; cv=none; b=Zv3f8N1kAF4nyHpl2EbDFEUmqfqtPKIw1zG4JG+InXMCwAn/slkeBCFBVQPdPcTUstjys5HqmI3nE+bxl33lYhwsHgKX4W1hwAij4a6erI3aQZ+RpSdwBjROlpZcY8nscN4W4j0CXU1OC0g4aAhdqe7qmB+9RGiyOj0ASAueUNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776862697; c=relaxed/simple;
	bh=BeKAEr866bGqGjCrAVcMRc4wRuL/1uRDLhYAfGcflGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUXnpft9E+Kd85W+nNrvbTLZVZtpnbWUSgVfAKz8yVrnFlpK3PPPqXAfJ54OpntEGsKQG00NZBTkE4n1gBYy/HjxcgnI74aaipcyuvWIrmvfW3q7jHUh8aL/bomFhgGA8+fyyXGpFUZiciMJDkRY4BfUZ7ySIIHQfZGAJoDenBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhDsNmEf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhDsNmEf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776862696; x=1808398696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BeKAEr866bGqGjCrAVcMRc4wRuL/1uRDLhYAfGcflGc=;
  b=FhDsNmEfDrRH98WtSeWqWJeENWfZBUak+cxTP3gmb/96nDDLEVDtLgKf
   S5mXz70kgWusBFKVg54spF3QPJhMPuUhskaUafWHkYUrLtzFrE1SOavB/
   7gZbS9PhHWmCKwOVBRMDmufLGbTR3ygNLxFCm5fABJLEdNdpxthWxz2d5
   9BLAVKlcYFAW7B71d0IkqiVY4Hwuogh/+UTVQltxfnV4JBrRJyKLgvh1B
   bbwUTQs5FyG53yohZ1TdHjlUGyHDEmkYHP4NoNj0MJ7I3thLDb9KhZ3HA
   VvkC7HVZUKR0tyASnAxfA4eOwkIr825JkByIdrxHomJLD1yf6eQ4t9nl/
   Q==;
X-CSE-ConnectionGUID: z4AVrvGfS16uIREzMY3qkQ==
X-CSE-MsgGUID: cIWIucJJTcukVYIgkwtTqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81423637"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="81423637"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 05:58:16 -0700
X-CSE-ConnectionGUID: 3gPtgcJ9QxSV+47oKPtYHQ==
X-CSE-MsgGUID: TqXkmvj9TF2e7Edm+DJBjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="229169939"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 05:58:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 455A91223DC;
	Wed, 22 Apr 2026 15:58:08 +0300 (EEST)
Date: Wed, 22 Apr 2026 15:58:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
Cc: andy.shevchenko@gmail.com, andy@kernel.org, gregkh@linuxfoundation.org,
	hansg@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH v4 1/2] media: atomisp: csi2: Remove unimplemented DPCM
 decompression
Message-ID: <aejF4OlVJtKSknxg@kekkonen.localdomain>
References: <aejBTB7JUYb43Fqi@kekkonen.localdomain>
 <20260422125115.39219-1-debjeetbanerjee48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422125115.39219-1-debjeetbanerjee48@gmail.com>

On Wed, Apr 22, 2026 at 06:21:15PM +0530, Debjeet Banerjee wrote:
> Disregard my last reply, apologies for my mistake on the subject.
> 
> On Wed, 22 Apr 2026 15:38:36 +0300, Sakari Ailus wrote:
> > This won't apply to my atomisp branch.
> 
> I see the issue, it's because of the indentation problem that happened becuase of my IDE.
> Should i send a patch v5 with the indentation fixed right now?

Can you try rebasing on the atomisp branch first?

-- 
Sakari Ailus
