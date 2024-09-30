Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9C0189902;
	Mon, 30 Sep 2024 13:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727702148; cv=none; b=FqdcWt0b10NB3gXef1J0CUV93KIM8nnXCAo6hClVH1zhtxu+urUtW/E7FeySPKxKw/zMfVRNVJ+PNjAtJW19SpcAozjYhTIUa8SyE0ZipLgdAt0qUtTTThnsAGc8Z09CTX87iPAJg3C7w5C9zF/+3LnKV2t16lOmU10NJxiziWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727702148; c=relaxed/simple;
	bh=G2NE2HYYrjkDsJLQfz80M0XbUQwgh0IvoD9nSKhNNGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlRcJGVnwJ/LvFVD9Rg19U1P6pAtuLqP1hu8Fy8HJaTb6FadvEAdAFF/KjP9xkjkhsIjg5fOWYhAcwlV2L9VL6Ggk0CQyZfNhVZ5ap5xlwq9BrC/mmrRhRnO7fsZWT0wLeU85UAJFCsxFfSGSm83PhhQKXdDPNzepMrPO4V5hJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: mRlHVOAESyOGwDWQOqNW9Q==
X-CSE-MsgGUID: UZ1TPa3hRCWq1A7+OmOAhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="52202789"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="52202789"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 06:15:46 -0700
X-CSE-ConnectionGUID: UZNB2qooRre/2fG6cg7wnw==
X-CSE-MsgGUID: K96ZQ2I3QO2pspBlbPEKWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="73165858"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 06:15:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1svGFX-0000000Efaa-46VY;
	Mon, 30 Sep 2024 16:15:39 +0300
Date: Mon, 30 Sep 2024 16:15:39 +0300
From: Andy Shevchenko <andy@kernel.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	kieran.bingham+renesas@ideasonboard.com,
	benjamin.gaignard@collabora.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: Fix spelling errors reported by codespell
Message-ID: <Zvqke6eFoQqnHDZt@smile.fi.intel.com>
References: <20240926222351.7116-1-everestkc@everestkc.com.np>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926222351.7116-1-everestkc@everestkc.com.np>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 26, 2024 at 04:23:37PM -0600, Everest K.C. wrote:
> Fixed spelling errors as follows:
> 	unkonwn ==> unknown
> 	Stablization ==> Stabilization
> 	previouly ==> previously
> 	acknowlede ==> acknowledge

LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


