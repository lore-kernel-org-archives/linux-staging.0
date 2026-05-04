Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1254131C567
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882374; cv=none; b=BWDJ+wsuFyqE1GR/swGYrbgFmAkIqISd4v84G4wmVCC47Gp1q24Xuv4qgeNfD9gEwFa3OjmWwmHyWIFktmSJM/8tOFHwkCKEQw5ffLAQUVOQfWSuCvaQFzhJkDrumoDyeT+jty/71pC7C3HboWTNOVInh5Dq4tVuXPEtvY2ZIV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882374; c=relaxed/simple;
	bh=X8qkHLdSjoobmkMJMrg25y3POzIHZpP+G5Qg3ZeoyEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5SLMz1JuaH5LiQtUXnCDIgAuHSpmaEBn3ZVXTW4epbWivJGRDsKbqhePUYfzCvI34UsPVgguV7I3/G6ZR2/9+8JCLT2cttKOeq4mE1iMNQw4G12P3S7xMd5jWsaWHTtwtcMUsEBGvzBrYHOWHdbShd56CZt1YuNnKtjeM0n6KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USLjHdV7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USLjHdV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777882373; x=1809418373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X8qkHLdSjoobmkMJMrg25y3POzIHZpP+G5Qg3ZeoyEw=;
  b=USLjHdV7whOuRzfEEpBjZOhkSArZJXJtkI/wgWNqrSCHhzjIekv2RTJJ
   /fx2oDOfY7kSqJ8ZyTvrsLmqFD46/op0d2PovvZrTzU+mV+FIq6ZJABJy
   gfmbiCYx4kvvlI1YwRd1GRczpDOo7h5gfx5WfOAODCULvNP5VW/GCu5hw
   9IYVRs9RCZztgyYxfXK+7WUrl+Spz2eNhPzxyFGD48vOC7+n6YeeyjgtB
   ybpQvORuUZZn1l9EEZ5wizflFi+Xl4WjPEfdAmbc07QFJqmf3Y8BqkB1B
   YSqWCNEPLfyWB4pcJHtbbtTurFqzoQFOQkyvVgEI5UMOYENxS9zbCucMy
   g==;
X-CSE-ConnectionGUID: InDdtIzkTWycSq39x5daOg==
X-CSE-MsgGUID: BOdZb0u8TqycIXul3wFV4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78442978"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78442978"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 01:12:52 -0700
X-CSE-ConnectionGUID: axHf0N8zRI+uCVdgbaeDjQ==
X-CSE-MsgGUID: /MVs4mxeR/+5CqzKoiW4tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="235708670"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.114])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 01:12:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1F72B121CC4;
	Mon, 04 May 2026 11:12:48 +0300 (EEST)
Date: Mon, 4 May 2026 11:12:48 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v2 1/6] media: v4l2-dev: Add range check for vdev->minor
Message-ID: <afhVAAMjAPjeB29E@kekkonen.localdomain>
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
 <20260501-smatch-7-1-v2-1-a2fcfb2531ac@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-smatch-7-1-v2-1-a2fcfb2531ac@chromium.org>

On Fri, May 01, 2026 at 11:32:46AM +0000, Ricardo Ribalda wrote:
> If the fixed minor ranges are not properly set we could end up in a
> situation where the calculated minor is invalid. Add a check for this in
> the code to make it more robust.
> 
> This check also fixes the following false positive smatch warning:
> 
> drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
