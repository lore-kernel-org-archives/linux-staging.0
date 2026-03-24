Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237723E0224
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 12:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354151; cv=none; b=SDQMedOpDMVJ4IZR43wA7LxM6f0AoW6+xVJbcI2fLKOssuR0aDmzwFXpHLl3mvctG5wBnaSn6+cXcw8/88328/2awqyv4R6AgdYR+3AHfpnbqwgr7F60P6b9zbQMpCLRr+p8S+wMplqPasVN2VJqlBVNk6Ip6ews9m4kNnjfT+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354151; c=relaxed/simple;
	bh=5LjOAonuU3uCnMK7KKSQPamQFdOpUTc3YHq5mK4ekog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQr/pCUFWuh+EolgcqqObGZhOdehQG6FYju+2jLv0bIwdDwux0arL12kWC7xe1wESfgWNVLIEmf69jSlbGQyq2Qa1F67ylE3ehADroV3zVfB5T5/M0hMM7NXjEWYcmZVpFR8D9GsYqaBlpbYBmLpFht3bgvDtJI6OnGMV7RUA90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhASrDQX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhASrDQX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774354146; x=1805890146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5LjOAonuU3uCnMK7KKSQPamQFdOpUTc3YHq5mK4ekog=;
  b=AhASrDQXf5m78U7p8tFuouoN/2lxI6fDB9QOqRDS90hGcVKZ6jL7ajvo
   cqXGqPUuPBPzc8xZIUOyyM7iVuaCBWZ2ee2hNqwRz1Tl1EpmU6Tk/Viqy
   hBdvtnfhoaGfnKrj7QsQOOmMUB6VpBQtHdsjcBnwNhHSzon2K/oUvsNAe
   DojYBVyGn6B1aKc//DqXZVXERvyJwfHgkKKMJbLTJ0S0umdOZpQ48IkU4
   +LZkt7/j451VjwUzYbffCZ7BJKZsmgN/vtQY5XaS/jebVeKliLVDdcLZm
   K5m+gjuXqpcwEp8zcG2x5PPz3hCXNSB+NpAu9upgGVI6CiIgwf45GUfro
   g==;
X-CSE-ConnectionGUID: DvwISxadQD+t/zTJByGrCA==
X-CSE-MsgGUID: 8Fm56tdXRyGdgBnfsJ7sdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="92746058"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="92746058"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 05:09:02 -0700
X-CSE-ConnectionGUID: 1TJKkL/vQ++/9FbDVCNotQ==
X-CSE-MsgGUID: NmZS1kMQSKyKBtuij4qxxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247412624"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 05:09:00 -0700
Date: Tue, 24 Mar 2026 14:08:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chethan C <mail.chethanc@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Osama Albahrani <osalbahr@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: media: av7110: fix coding style
Message-ID: <acJ-2eBSlbuZ2ltN@ashevche-desk.local>
References: <20260323190835.660111-1-mail.chethanc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323190835.660111-1-mail.chethanc@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 24, 2026 at 12:38:19AM +0530, Chethan C wrote:
> Fixed Indentation, Alignment issues reported by checkpatch.pl.
> 
> Rename enum av7110_rec_play_state, av7110_type_rec_play_format and
> av7110_encoder_command to follow the kernel naming style.
> 
> Rename wssData to wss_data to avoid CamelCase identifiers.

...

>  	u16			wssMode;
> -	u16			wssData;
> +	u16			wss_data;

Now these two are in inconsistent state.

...

> -	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, LoadVidCode, 1, mode);
> +	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_LOAD_VID_CODE,
> +			    1, mode);

Also rethink about more logical split. As far as I can see this API does some
variadic arguments processing while the first two are mandatory ones. With
that taken into account I would do it as

	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
			    AV7110_LOAD_VID_CODE, 1, mode);

Also check the entire patch for this kind of amendments.

...

> -	rc = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 1, av7110->wssData);

> +	rc = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_WSS_CONFIG, 2,
> +			   1, av7110->wss_data);
>  	return (rc < 0) ? rc : count;

This can also be improved a bit as

	if (rc)
		return rc;

	return count;

but strictly speaking it's out of the scope of this patch.

-- 
With Best Regards,
Andy Shevchenko


