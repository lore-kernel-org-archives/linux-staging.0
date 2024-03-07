Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6834B823BF
	for <linux-staging@lists.linux.dev>; Thu,  7 Mar 2024 08:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709801471; cv=none; b=JbefKwLOU0Ii/x6K/aJUjcifaUKuslm/oMg1sBZeKqb+QT0UEN80cSh5MTcNNzarKBvqsw3SidfFAfI3O6NUGw+fEOdLFPZx8zKAW3h0fsaFch1/UpY0Z/OxInoI2Zm5WohBGkv1JL2s3Kigtnei6VOX/AKVEd5ifhJu+AU3UZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709801471; c=relaxed/simple;
	bh=yV/OikP6MH4jY26/Y82oK9+/dSYC2x7JTtfrU8Ax2hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNKxzdxf90d8TC6qWl6HOXblngf/Hm83Mn/hHPIJmf///uqDaZAcY+fPiOkt47n0fJG17Oz3M6qQpmZzg1JWLZYZckspkB0do6xQiAYRTh73FfqTW9nlyoYMCEoF9rsVEWWGZjmXDHwXr/0Hnol4b+Qh8ySC9anI8tL3TZ5iRks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BgW798Jw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgW798Jw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709801469; x=1741337469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yV/OikP6MH4jY26/Y82oK9+/dSYC2x7JTtfrU8Ax2hs=;
  b=BgW798JwVtG7exnN1vYdl/tRE8EGyM68n6/RCNoz0tXayxDKQjDS9DAB
   OtJunieZtpP+V1QedRU0YXVAMHQ0h4VCNftermX3g6QGCNfjVbOW4yeMj
   2VA/MmdDzdVlVwHJZRcvcx+Mys1jqFdcEk4gMj9p7oqr+r742xGm7AM57
   ZGsD9ps2N6qfu8Z/sTLGAGcPX1YdeP8viTFCBaaHosjvo2+TjPoKFZ688
   LacG0/iclfYXfTXsH+Zw5c7WXG6hvJVJ93R0PjuPvbtUG34j2r2cJGvja
   6Cdnc9wVo4Wg+PYBsIfyydLmwdhXCu+31x8832a6X2MN7huRaXmXZwL28
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="21908205"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="21908205"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 00:51:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="10201949"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 00:51:06 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5FA9B11F819;
	Thu,  7 Mar 2024 10:51:03 +0200 (EET)
Date: Thu, 7 Mar 2024 08:51:03 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ali Zahraee <ahzahraee@gmail.com>
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com
Subject: Re: [PATCH] Documentation: media: remove documentation of obsolete
 struct members
Message-ID: <Zel_98N4G-zADEJw@kekkonen.localdomain>
References: <20240307084404.7796-1-ahzahraee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240307084404.7796-1-ahzahraee@gmail.com>

Hi Ali,

Thanks for the patch.

On Thu, Mar 07, 2024 at 09:44:04AM +0100, Ali Zahraee wrote:
> These struct members were removed from the struct, but their
> documentation is still there, which causes warnings from sphinx during
> building of the docs.
> 
> Signed-off-by: Ali Zahraee <ahzahraee@gmail.com>

These have been already removed by commit
dcef3ed5b0d79f89018e31d55cf09f2c2f81392b .

-- 
Kind regards,

Sakari Ailus
