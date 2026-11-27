Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793250;
	b=g1KBieX5HqwpdVFgW/gJV53xWK4D12yr3JJvYIjyw94fdD3Md6ykczHQDrAGnk0aWbII
	 WgbjmbVEXAfbyXDbOLOEScTJRdfg2gxg0/nu1HPZMJVf3FFdhajGLCq7W9Noma1cZLdiI
	 wWknPlBo/YlbOMY2rH0T5cN8A5seKbUTKd2lua5qPKxXHna8apjrs4njXip5nWPwyRknv
	 Ja/JYPbw8LZNsJbc8A/gkh5SB2e5On/6Qp+qAFvkaBVjvDot0Ton/C4ancZ+hg4kV8TKq
	 lGqD1I3fxWG+aSV5j3MBUt0IKYdljEyrxemEibSk3bDxVTsFZxaz+8zvji/16ZxaDxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793250;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=iRu/Zln+b9l1SeIjlGvrkjqXltuefCUpuNxW01O08HU=;
	b=wSRPf8iHc5iqsSU1iaXX/1aRhsgJZdV0WC4H7z2NYf+uPqWa3MBzreBXXZasmfB45Nek
	 3Q25zt884LcmMc2HEzwYG6xYM59SOy/kqQtT/dEwDaXUOSAXdq6U8G1X9AkIl/Bd9jWC5
	 zuWywetQ85znSpFMD09r9oQhN019xZRmFit/HJMGXNU4TErijDLXlCFjmuFWVcC9hpY7B
	 J+mVpFoWK2qur3oK2OmpX9vD3gGNO3mX/hDR1SSxlt5ZAW1wUzlvah1xtaV7QnMSfbtRU
	 51jU4nKC+q3/Q/Fflc2LQa/qj4iqvX3ILvslriMZsDTp89ST9OPa96jzPGJtPCLQEAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F6h1rT5Z;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3A2606A31C
	for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 15:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE3A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F6h1rT5Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795793251; x=1827329251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=60aYkezuEwfgp6J0v8bXqdbUduuDm1vPyexxpun2jU0=;
  b=F6h1rT5ZH6SXLBBjhvFR/Rp/nxClKTYD9RSHA79vTPrnRkXRI9FHFprQ
   fFOaOPhDS9dnCQkCmdab+3ckaPK85z8bFDSGrM6LVKPIzbSIA3/8t+DfT
   Kbj3A40TTdER11QpMRyaGoj9dDHahzmzfepgbth0meSCTffzdqdKD5uhZ
   ODRN9DDxBEmf2ffm8iJ2FHrsNGA71HcqDkf07/OdJXtcSH6xnfaVF+5gK
   C7qp4/GK/OZ+Lzda0ZusHDZcTrNlh7raSUhm5MPEo7+JNhGGXW2AjFb2H
   0Pb72vA/isv2VNDizuiRcT4vjXqBUKmn3JvvA0XAXpOLj/XICr0o4oS/P
   w==;
X-CSE-ConnectionGUID: 2OTRsjcaSs6vj7qqyNpMAQ==
X-CSE-MsgGUID: 9yAqtsagQa+zcEi8mbxwYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4597489"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4597489"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:27:30 -0800
X-CSE-ConnectionGUID: KelJrwJSQcixNhkgEiFluQ==
X-CSE-MsgGUID: NbKIb3EwTD22+2kxiYAr+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12833133"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:27:26 -0800
Date: Fri, 27 Nov 2026 17:27:24 +0200
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
Subject: Re: [PATCH 3/4] staging: iio: impedance-analyzer: ad5933: fix
 settling cycles readback
Message-ID: <awmhXCDdp73f3Szt@ashevche-desk.local>
References: <20261127123303.144052-1-punnaysharma805@gmail.com>
 <20261127123303.144052-4-punnaysharma805@gmail.com>
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
In-Reply-To: <20261127123303.144052-4-punnaysharma805@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 27, 2026 at 06:03:02PM +0530, Punnay Sharma wrote:
> Writing 1023 to out_altvoltage0_settling_cycles reads back 1023, but
> the chip uses 1020. The cycle count in the register is 9 bits, so the
> driver programs 255 with the x4 multiplier. Odd values from 513 to
> 1021 read back 1 too high. Values from 1023 to 2044 that are not a
> multiple of 4 read back up to 3 too high.
> 
> ad5933_store() saves the value in st->settling_cycles before it
> divides it by 2 or 4 for the register. ad5933_show() then returns the
> saved value, not the count the chip uses. The ABI says the attribute
> is the number of cycles before the ADC starts a conversion.
> 
> Save the value rounded down to a multiple of 2 or 4, which is the
> count the chip uses.

...

>  	case AD5933_OUT_SETTLING_CYCLES:
>  		val = clamp(val, (u16)0, (u16)0x7FC);

This really needs to drop castings.

> -		st->settling_cycles = val;
>  
>  		/* 2x, 4x handling, see datasheet */
> -		if (val > 1022)
> +		if (val > 1022) {

Are 511 and 1022 mentioned in datasheet explicitly in plain numbers?

> +			st->settling_cycles = round_down(val, 4);
>  			val = (val >> 2) | (3 << 9);
> -		else if (val > 511)
> +		} else if (val > 511) {
> +			st->settling_cycles = round_down(val, 2);
>  			val = (val >> 1) | BIT(9);
> +		} else {
> +			st->settling_cycles = val;
> +		}

This is a mess with shift by 9 bits and plain numbers like 512 (511)
and 1024 (1022). I'm wondering what datasheet says about all this.

-- 
With Best Regards,
Andy Shevchenko


