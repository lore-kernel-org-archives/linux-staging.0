Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827449;
	b=eLIo+OY+6kCRfIC+amKtaIqcg9vjJI+iycplzU1RJGz8EyMRkPSrk+P20gAd0/ksSumD
	 Y4Vv9LORKE+Szuy8fPfl8Z7lbmi+XL7PtOSPTqtSa0G8TRJpVP+73P6j3+liQkWENQyJH
	 0JF/w+UJwDk4iH3dzcJV5iCtns4IOnCbNinkqWPtYHG7nlb8Q5D9kWYCxNt+V2oLCIPN2
	 6C0S+wEq1c9TVe6IT/3nTa0FUd93BZVj0+P1d0qDHcVg2nPSjO2ILK8T6UYS4nCXWFNt9
	 JYpmWh2qxyoDfg5Slwp4zpXb/H9G5ot9WjLVnXUBod0PFf6y2qFwwLI3pJ4fn+E9gnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827449;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=+klGjRzQsfWrJDyayB0mR0/DFvNyflOAvejKCWxKAmE=;
	b=s0egtvTp5gAj+hzlVDX3nKrppaXpCNQkp2yvFa1hpsORIVRK5Ygxe29iR6J/e7ZpUzOq
	 wzV5lzkox8pP7Kr1Ic2CADrUMMaXAtl2H+WDGx8MWjwqI0AZVAqZOgkEILtIrGKLvFtKU
	 03tjyt1u3hh8t65jcaAq15a64Q0WXZUhUY50NcNdhVsvDBUfiEYImYk+cBsrZU61Abjs9
	 dJPhEzbJuFApl/EST9F1XMA4f7UgobA5a6cYb1tQTQq9AzcxsnGwM+zlVNyRBGY62ybtn
	 /hCidQmBtqlRbvvb276tqY8h2tI7GcNv90NtBPSQKni5RNwDlquz3V/31/HUX8uWN+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="MqqqyTB/";
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A9F607183F;
	Mon, 16 Nov 2026 11:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A9F607183F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MqqqyTB/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794827449; x=1826363449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sk7WTM62ZlwwoTm3SYzSEpCNEYlUQTQDwupcm1RfeV0=;
  b=MqqqyTB/JWm8RbgC2pCojquyVmKlU6ts4r3zLwWjrTOMydnfwUzQdOI3
   VVHV4jHVQyMHVFeaDyzeFetz76eQpCCBUme89Xukj14T0rkyKQob46T0C
   2nMPSWXjGyFZc/oMrXZPggNsvqYu2iKULGIle4ZQEzlbCnaLlkQazIe1e
   RPIcqm2NTK83syXI9I7wdK78CzPnM1Kxo6NhQNSEiTkz9LXjl7/Gbo19c
   EV8+f495UrRIIeTENScWf9HsOEXU2kHhcsbvuQz+Qx80R5H3Ln7NNfejE
   r+HYQNT3cG+2aqTu6YSXvGWnsYtPHmGEqsHkuosmCu97gpwXZZWourJYj
   A==;
X-CSE-ConnectionGUID: +PJcx22yQCa96p/9LVm9Iw==
X-CSE-MsgGUID: ZhVcsEtZQzmfNnpgy+l+xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3413202"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3413202"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:10:49 -0800
X-CSE-ConnectionGUID: eVC/pmTcQOuhZthn+xG7XQ==
X-CSE-MsgGUID: jud+LxisQhC9uwft74JkTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9710291"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:10:44 -0800
Date: Mon, 16 Nov 2026 13:10:41 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shivani Patel <patelshivani2283@gmail.com>
Cc: outreachy@lists.linux.dev, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging/most: video: add lock documentation comments
Message-ID: <avrksb2-uS6blnUF@ashevche-desk.local>
References: <20261114074725.24319-1-patelshivani2283@gmail.com>
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
In-Reply-To: <20261114074725.24319-1-patelshivani2283@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 14, 2026 at 01:16:58PM +0530, Shivani Patel wrote:

Please, get familiar first on the process and required formatting.
Documentation/process/ is a good start.

-- 
With Best Regards,
Andy Shevchenko


