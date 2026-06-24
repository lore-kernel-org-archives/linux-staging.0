Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EEB30100D
	for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 12:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302801; cv=none; b=Y6WLAf8IF31cgB3MnVXF2EmX7ymT1sP2unduSY3BUQaLAG9GPTYJosEMu8ej4JgRh2J9PqeWpS1SamvxFkuikeR5t7GNbmQRf2+MFc8jRZ3NfAZSimJX7LDXnos0fo1vTYtiNWicRvkrOhT0MJMkDv5t1ce6DVle9GyQpxBpM5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302801; c=relaxed/simple;
	bh=rCt9n22ce6w937Nlwxj2mRTyBoW3uwZl2eYmkKm4aqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNSICkTEHAhncvZZxBsH7eNEcbZb2OIWylLBcX1fpzF9QjyXRK1b/fJ0XaQ5Y1T8QLeSswTdtcUhYVgSbOapM7AN/cR9Tsog/7HdEAvzt5b4HaP8vAF3JU9bTJeNRkLgq3b6f8iDs4eTza0eBDxbx0DQTH19tGfYRAF9MUCtO2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4Q6lZc9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4Q6lZc9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782302800; x=1813838800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rCt9n22ce6w937Nlwxj2mRTyBoW3uwZl2eYmkKm4aqc=;
  b=L4Q6lZc9C3jKZ0SonE6shxs4YGE97GsyhGCnxuiD/NEXQW5rnBLU5fLk
   +tNuFp7datPxciprv+TIY9HVm4jPBhzqYGrDdd9GGfaCg2hLnfqy0K/6v
   eAUc+1fyc50cu6S08atrlgaWMUVv4GsBMqVQpZU0hU6DeUrMhYCEPm6QR
   X92KAC1qSZT+2FcYIxQVd9Ycjyt7bzIJB3L52n8jQ00IwgMNET+tDhMsI
   ifF9C0Vqln4a31Hg3j3/vvO5QG/PZ3xa5p810+1/6t+BbwYScsavFRCUG
   Ei0WlLXcD8CGI64v55qS5AnTDc943HgGA30MxqXhkNx32IKDLuNF2+TZD
   g==;
X-CSE-ConnectionGUID: iLn8TnqaTpeTTmFiMvRSVw==
X-CSE-MsgGUID: V3jowoqOSkOxNzCPXSo3Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100609914"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="100609914"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 05:06:40 -0700
X-CSE-ConnectionGUID: wNAm3FOORqa/+VdXSnvtAg==
X-CSE-MsgGUID: VyqlAjbGR4S1xVFo9Wz/Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="254797297"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.156])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 05:06:37 -0700
Date: Wed, 24 Jun 2026 15:06:35 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Igor Putko <igorpetindev@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] staging: media: atomisp: remove dead
 platform_support.h header
Message-ID: <ajvIS13S9rJgsORe@ashevche-desk.local>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
 <20260618151246.6678-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618151246.6678-1-igorpetindev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 18, 2026 at 06:12:43PM +0300, Igor Putko wrote:
> 
> Following your feedback, this series replaces the custom CSS_ALIGN() macro
> with the standard __aligned attribute and completely removes the dead
> platform_support.h header file from the driver.

Thank you much for doing this! I have given a few comments, I think the v3 will
be final if you address them. Expecting a v3 with 4 patches.

-- 
With Best Regards,
Andy Shevchenko


