Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB653FCB38;
	Tue, 24 Mar 2026 13:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359798; cv=none; b=fxRNruIC2uenwoEny7QHdwAok6AC33ZrTH9M1+QPZ7AKs0pN92obl50xHnKpfLKfYqAD4qdI8d8+x7wmpHFoLaVlk09aBZteFNieYEsg45z6rr+fh/qTCmMcj2VrBgN/AR5IxaY7fsSQZ0R322fEXxV51SQ9gQijTYB9bE1pygo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359798; c=relaxed/simple;
	bh=pCxci3y1NRcyZLbvhMB0P//KiFDrFOKANOvjsIl5ER0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UyOhoFcIUkN0r+scqYSGXNtNzPyLVU7VowteBq3z6KNuxDQb/px2+apGKiyB/JL8qbwx1nfCAKo9ExlVfT6g8Ee9LSkmi0/0FE5kjxq37TAXa5jSq7nJbdL7n8TEIUFtclhN8IrhFs25fm1f3TJT48hsSD55fo7Mz/ayXCifkO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKRA2bfp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKRA2bfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774359796; x=1805895796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pCxci3y1NRcyZLbvhMB0P//KiFDrFOKANOvjsIl5ER0=;
  b=nKRA2bfpIevMWPYEEI4Q4SttxLotoplRwP9isoT4MZ7QxeVuTcwQ1Vdx
   0u9STGpzyxqWqe38akaFgUwWDX/SAaGpA2ljrqs8ZJzmpQEfstAv3s/I8
   W63zGOHJT0o2XftRh2W3NiEWibnGn+jYY6v1fx98mX8r3wihDiiGblAd1
   FEQ4oe838Ycn5YXLfoQ3M/0gM5Emu6WtRPXsir1J0HSt06UbZcS0K50Kl
   Uyj1kJephN4P1EUm2od93syjy96zB1l2Jy6xVsDA8fd3NMKlBW7TPFc+u
   4itiaHwBBb6ABo8h9o8ZaLKfgd5Ds6Qw922LTECW5/quDIO/Of4P6ngcI
   g==;
X-CSE-ConnectionGUID: M7wrJ+3wR1mRfyTqkMKHDw==
X-CSE-MsgGUID: F7lkTrVHQtaXJbdnRjlHAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75088972"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75088972"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:43:16 -0700
X-CSE-ConnectionGUID: /5tk0X3GQPqw30jK8yUugw==
X-CSE-MsgGUID: NJvMV4KMTBmi9ehlBNeLYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247966098"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:43:10 -0700
Date: Tue, 24 Mar 2026 15:43:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Prithvi <activprithvi@gmail.com>
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	straube.linux@gmail.com, b9788213@gmail.com,
	ethantidmore06@gmail.com, dan.carpenter@linaro.org,
	weibu@redadmin.org, knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com, dharanitharan725@gmail.com,
	lukagejak5@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com, suunj1331@gmail.com,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
Message-ID: <acKU7JjW3OFugHXY@ashevche-desk.local>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <acFtiaXTp7bwl604@ashevche-desk.local>
 <20260324130234.3776tp4ykuerffcg@inspiron>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324130234.3776tp4ykuerffcg@inspiron>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 24, 2026 at 06:32:34PM +0530, Prithvi wrote:
> On Mon, Mar 23, 2026 at 06:42:49PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 23, 2026 at 09:59:01PM +0530, Prithvi Tambewagh wrote:

...

> > >  	do {
> > >  		valid = rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
> > > -		if (0 == valid) {
> > > +		if (!valid)
> > >  			read_down = true;
> > > -		}
> > >  	} while ((!read_down) && (retry_cnts--));
> > >  
> > >  	return read_down;
> > 
> > This entire piece can be replaced with something from iopoll.h.
> 
> Yes...I checked out and found we can use read_poll_timeout_atomic():

...

>  #include <rtl8723b_hal.h>
>  #include <linux/etherdevice.h>
>  #include "hal_com_h2c.h"
> +#include <linux/iopoll.h>

Just make sure you put it in a better (more ordered) place, like one line above.

  ...
  #include <linux/etherdevice.h>
  #include <linux/iopoll.h>
  ...

...

>  static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
>  {
>         u8 valid;
> +       int ret;
> +
> +       ret = read_poll_timeout_atomic(rtw_read8,
> +                         valid,
> +                         !(valid & BIT(msgbox_num)),
> +                         0,
> +                         500,
> +                         false,
> +                         padapter, REG_HMETFR);
> +       return !ret;

		ret = read_poll_timeout_atomic(rtw_read8,
					       valid, !(valid & BIT(msgbox_num)),
					       0, 500, false,
					       padapter, REG_HMETFR);

		return !ret;

>  }
> 
> Is this approach correct?

Yes, looks correct. Just compress it a bit and fix indentation,
see above how.

-- 
With Best Regards,
Andy Shevchenko


