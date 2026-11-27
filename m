Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793383;
	b=VOWDMCbd3wAsc/rhjq/vKvQmp4idn/fxPvrAk7QCjHN++AZ7hiRT3WfSCxPMBU+tIjW2
	 05CYpMnW2bB7vFER4vkPXbD2EVQ42t1DQltB+rA31qqmYAoC1KWMORGCl5HU05WZV0Ky1
	 CD/x8XT3B9bG6+D7OcAvU/x3jI5+QTTTlDWg/vnQ33Dv3qRdOp1WR01+VYTJLdyAimNoP
	 9sDiiBg6oU+K+mE5AJPMs6Rv6FajmumB8h04mP+ple9PufPpwurkVg3xvtyOK1wmwCiXE
	 BURHokoPLCryluiM7/PFipoNESyKhr0Bqfx1LrUs9b6HjasiJA/FcXycPUw+Jd41EbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793383;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=PDBWxjarfS3sHkGbgUJmciEx3Ksk85bYAgtEXJXoTGg=;
	b=3dj97/3703dEU9a21C/NUlDUV+snReOfPPf+9uC6fMha7YQf++a+AyiJbjcrAtbpztVQ
	 +NfzRS91v1YERO3V9fdZZtSQ6qoGqG+UxeSL0jL+RjQHe6ZHV9N655Av9Ufoj/0Du2A1m
	 JB/Hij2tzCPJ9IfTMreGmBgpgD3s2koilyERf6A5PP2cbEjoZt4HisKaldYMqeSpxD+J3
	 AQYtKV5l7z1sT0ZX5YBvE4vjG7KS8f2kbR953+wjyZMJWHPaFFbSJDLUuUaWeb3W598mt
	 hafHXZMjvwNv+H2VfWqMWRpAYUaaPhTTD38VSBDjKJ1ALsI9Z2pZ/ulybVzDYNQSJ4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QSgzCDRy;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C5F606A31F
	for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 15:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C5F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QSgzCDRy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795793384; x=1827329384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VfQtAHh4pH+Leu88YwMvxLzyj1Y/DCFEB3kdDcJV++c=;
  b=QSgzCDRyuoRceuGPIdETpqML7ddzokMt9ytCR1U34cwEeilk52pCYOeI
   I75Kd4Yyd4ExIUUZgry9fOiPR5QXM5Y6KznR1F60e5jDjpLUhG8ZThNXs
   gdqOqAaOQkNVB5glLpTmg7+HpKp6ZUrX0MTmOIOUHmwMN+ef1P7Ica0IS
   vna/8SJhJ8pBPwXSST9TTE/CG+wKt7P7wbhXNDpnsmkzUs2P2Fy4ebalR
   05197bzUT5/rdzB+HBGdY6jrhxzlr6j8qAnF9eUTLmJ57tGz2tmWG1/o+
   RUQYnmS3KSRDau3MiJRUbgB5MG9rVnITMBmFv+U5HZ/k8TnutR6jiwVga
   w==;
X-CSE-ConnectionGUID: crQi0NQKTv2p++ps6T6Mkw==
X-CSE-MsgGUID: ifsmxq1JQUa0ul2JyfKzXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4667698"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4667698"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:29:43 -0800
X-CSE-ConnectionGUID: zG9Yg1CWQlS6Hr/IbY8Y4w==
X-CSE-MsgGUID: ym9YhbxpTteli+mo0uoJNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12653398"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:29:40 -0800
Date: Fri, 27 Nov 2026 17:29:38 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Punnay Sharma <punnaysharma805@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux@analog.com
Subject: Re: [PATCH 4/4] staging: iio: impedance-analyzer: ad5933: keep old
 values on failed writes
Message-ID: <awmh4sckaG95emAc@ashevche-desk.local>
References: <20261127123303.144052-1-punnaysharma805@gmail.com>
 <20261127123303.144052-5-punnaysharma805@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127123303.144052-5-punnaysharma805@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 27, 2026 at 06:03:03PM +0530, Punnay Sharma wrote:
> ad5933_store() updates the driver's copy of a setting before it writes
> the setting to the chip. If the I2C write fails, userspace gets the
> error, but the driver keeps the new value.
> 
> For out_altvoltage0_raw (output range) and in_voltage0_scale (PGA
> gain), the new bits stay in st->ctrl_hb. ad5933_cmd() sends ctrl_hb
> with every command, so the next buffer enable programs the failed
> setting anyway. For example, if echo 198 > out_altvoltage0_raw fails,
> the next sweep still runs with the 198 mV range. For
> out_altvoltage0_settling_cycles and out_altvoltage0_frequency_points,
> the attribute reads back a value that never reached the chip.
> 
> Save the old values before the switch and put them back when the
> write fails.

...

> static ssize_t ad5933_store(struct device *dev,

>  	u16 val;
>  	int i, ret = 0;
>  	__be16 dat;
> +	unsigned char old_ctrl_hb;
> +	unsigned short old_settling_cycles;
> +	unsigned short old_freq_points;

Even if the original code doesn't follow reversed xmas tree order, still please
try to follow with touched lines.

>  	if (this_attr->address != AD5933_IN_PGA_GAIN) {
>  		ret = kstrtou16(buf, 10, &val);

>  	mutex_lock(&st->lock);
> +	old_ctrl_hb = st->ctrl_hb;
> +	old_settling_cycles = st->settling_cycles;
> +	old_freq_points = st->freq_points;

>  	switch ((u32)this_attr->address) {
>  	case AD5933_OUT_RANGE:

>  	}
>  
> +	if (ret) {
> +		st->ctrl_hb = old_ctrl_hb;
> +		st->settling_cycles = old_settling_cycles;
> +		st->freq_points = old_freq_points;
> +	}
> +
>  	mutex_unlock(&st->lock);

It's better to split the three members to a separate data structure and
copy it as a whole.

-- 
With Best Regards,
Andy Shevchenko


