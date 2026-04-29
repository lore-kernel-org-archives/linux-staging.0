Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7FF382385
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 07:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448582; cv=none; b=qgo0/M9J0cwIyZtSriZpVATUackvBziboDlrhlV4NpKjsWKYc60IkYwW+OauFkruvZSrMldfMjEpZukJneSsmmExn9uZh1O/0JT3DyAnBFJbR4P7VtvTj30a6Riq51SR8nnwvo/QswMgBvVzEUOqSwq6942hWm3Ei6PHFj/2dPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448582; c=relaxed/simple;
	bh=CC3r3hHpl3PYePstBnan9ERucJgMhXDJr9YHge/rvgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKpf6HXPbYC7vxGWYuMexvEivSJwxYMhMBvrghz49rk7bteFrVu52EM3IJUPSH3lqgizwPEF7geHFltWMkrwJ5jnJFcX6fvBWdtE9haeCdk88eGr9GVxUVCOZlVP71WSbbLkFVztWxAD3NHPtyzqxbSlzg4OT7fEsFOPJt3H8VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UW5C6nH9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UW5C6nH9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777448581; x=1808984581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CC3r3hHpl3PYePstBnan9ERucJgMhXDJr9YHge/rvgc=;
  b=UW5C6nH9iT/rICK5IMUATJZTFeJMWz8y6SFf+dGGW/PIjuQCKjXGSF3O
   WFzXZ0Pd+eR5l7Rst+c3ytStTqRHOJwJz/NRzzpRwcbMSGpBW/n6M1akN
   +7dWx82srtvZQ6H3nEaM4b2HrJdnf/CmZGDD8wo2KQdbnVBkweEVg+zp5
   HRNQUJATTVDhPUvBPhlLsKVSXz5nMBYnIeoZ5Nzl0Hodu+TRFbzWVkCVJ
   QvRBZUwb+OZ786DFfatPesA+EPFIQXv/PaoixWarfzdYzxLvWyvTMOISd
   2YoN8QyOxfirrSodsRQzYxauccAqQXJ2huJ08/dRErVsCez9ImttEqlzn
   A==;
X-CSE-ConnectionGUID: D3xPtrtUTf2rvqRyOhxIKw==
X-CSE-MsgGUID: QNG4Sk8BTNieibMrmXMbjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="103826585"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="103826585"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 00:43:00 -0700
X-CSE-ConnectionGUID: Ff0adLojSWynEvLAbfrT7g==
X-CSE-MsgGUID: toqVZPHlQFugjBTO9/2QdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="257746924"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 00:42:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A0E2411FCDF;
	Wed, 29 Apr 2026 10:43:02 +0300 (EEST)
Date: Wed, 29 Apr 2026 10:43:02 +0300
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
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/6] media: v4l2-dev: Add range check for vdev->minor
Message-ID: <afG2hm-V9uUkUmXk@kekkonen.localdomain>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-1-46890dffb611@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-smatch-7-1-v1-1-46890dffb611@chromium.org>

Hi Ricardo,

On Tue, Apr 28, 2026 at 12:41:07PM +0000, Ricardo Ribalda wrote:
> If the fixed minor ranges are not properly set we could end up in a
> situation where the calculated minor is invalid. Add a check for this in
> the code.
> 
> This check also fixes the following smatch warning:
> 
> drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 6ce623a1245a..a731ffdb91ee 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1032,6 +1032,12 @@ int __video_register_device(struct video_device *vdev,
>  	vdev->minor = i + minor_offset;
>  	vdev->num = nr;
>  
> +	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {

Could this be combined with the should-not-happen case below? The error
handling is the same (releasing the mutex) and the error code could be as
well. I think the message can be just as well removed as we have a
WARN_ON() here anyway.

I wonder what Hans thinks.

> +		mutex_unlock(&videodev_lock);
> +		pr_err("invalid minor. Check ranges.\n");
> +		return -EINVAL;
> +	}
> +
>  	/* Should not happen since we thought this minor was free */
>  	if (WARN_ON(video_devices[vdev->minor])) {
>  		mutex_unlock(&videodev_lock);
> 

-- 
Kind regards,

Sakari Ailus
