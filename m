Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B20629A2;
	Tue, 29 Mar 2022 21:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648589635; x=1680125635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tHyJpMSgREeaX7Il6lUt/mc24/CfgD9AxcBykZQ1fFA=;
  b=OougkuHioAFv71zDzto8/s++bamsZCXrWWNuxNsCulRbaWvBJfiBNgj7
   5tJ9pG+MEH8ps/AQF1E5PsHVBNb2IJuY52cxTdRRFMGuNjTVwxH/wtequ
   CVB0njlESqLjyQxtz6tGYJAKVF9Nyk3vwCiB6lhfir0DqwzhVwag4dgo2
   epK/fif8cXVpkB4kCv6iDCDaeDzL7b5zLCcIK+Obbfj/xO2VDTBpTaPnR
   w2vvpikLzN1wV6R/MQMG0Qve2KujMxUb+2Cs+5VLJb10GJsYDTs9Z2sCt
   sLJfjnWCBdGPaaqoF2QW1gUgu2d7lBFQajb3sqQ1Dncm0D9+6UQhc5akI
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239310814"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="239310814"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 14:33:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="585750705"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 14:33:54 -0700
Date: Tue, 29 Mar 2022 14:36:19 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Muhammad Usama Anjum <musamaanjum@gmail.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: Remove redundant else branches.
Message-ID: <20220329213619.GA1171634@alison-desk>
References: <20220329140904.GA3566@ubuntu>
 <20220329200053.GA1170989@alison-desk>
 <CAMWRUK4ti6QxA4JWbG_XwZHwQwWUKYu+HvVHvEBX-k82oaEP6g@mail.gmail.com>
 <20220329212426.GA1171538@alison-desk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329212426.GA1171538@alison-desk>

snip

On Tue, Mar 29, 2022 at 02:24:26PM -0700, Alison Schofield wrote:
> On Tue, Mar 29, 2022 at 01:59:52PM -0700, Sevinj Aghayeva wrote:
> > 
> > That one has already landed. Is it okay if I send v2 just for this patch?
> 
> Did you see it applied already?
> 

I see Greg took a couple that I wanted to send for rework.
BTW - if it was really something *wrong* I would ask you to send
another patch,  but since it's just style, let's just apply the
learning to the next one.

Thanks!
Alison

