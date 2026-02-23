Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7631F346E64
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 07:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771833071; cv=none; b=aQ7/y3AkdjbUz0RIlk+OrJDFn8OrvDVOJNRzQ0WuvNOtBq8aQprL1VrL3JiwOPKgsPhB98pfBQMH0zLSKkc8+9B/qXUlGlpAnfS1wFus4BWMP7J/xz/dBDUqwMkWloljIVMv8/3PdpIyvIhO3QRpTap3cGDtqK8uopxqzz5J9So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771833071; c=relaxed/simple;
	bh=ZCKT8I26YFpk7MZ9FkpBPfTjRFTG7W+RuGJUIM0xWZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikCoNWY5cwl1beAHeGIV+vUc6C+s5kuWCfJlWqfK+ftPT26czvwqaE2caTMJfg0VC+wCt9eZI6UBUxDte3veH9VMI/nMfchw+0jbGdUy5F3a5rXQ6aoMFgJNxderOvz8jzbF7LYNrd9FduE5GDFUJ+/45AOpg77w/RM3337xyZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmU2KG2F; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmU2KG2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771833069; x=1803369069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZCKT8I26YFpk7MZ9FkpBPfTjRFTG7W+RuGJUIM0xWZQ=;
  b=mmU2KG2FJ7hdd527+UgN4SERyZEYfRPOBEvY2eXtPBtON7Na4DbyqHwv
   lNnpDrQ/AEDKo/3leqV8xFB4imUPCWn/79No9IwAZP9PikQAVMeOW6LD7
   vZMY2NksI2ztYL081Y3Or3spJ3os/RPlhkPCwUvwT0F5t2a3T+iK6nhcK
   cIKVSHH1Ijtyyj0g1UKbgCYujlSDw6lPHu/b2JkDSicXu6DpTGW4h3Jhg
   j4bh6EfiaQ4kaukgkdSp3e85ws3XG9PvEj4vo6woxdG8cFViAsUg4q6gW
   V+eXA2I4C6OiaJ2c8dzyOl4HFr5Zaat+movCGJi8sTUV+w68hZH741fhT
   Q==;
X-CSE-ConnectionGUID: fuIes4r6QGiOJ4mrdfgLHA==
X-CSE-MsgGUID: VRt6NFv2Q0Ct1kmR+g+fgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="83138646"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="83138646"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 23:51:09 -0800
X-CSE-ConnectionGUID: cdaHvyfrSbasBk2hyKMWdg==
X-CSE-MsgGUID: rI0YJ7hqRwynNm6ImR1PCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="213874883"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 23:51:00 -0800
Date: Mon, 23 Feb 2026 09:50:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Karthikey Kadati <karthikey3608@gmail.com>
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Minu Jin <s9430939@naver.com>,
	Archit Anant <architanant5@gmail.com>,
	Philip Thayer <thayerscirez@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>,
	JJ Strnad <strnad.jj@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Tanjim Kamal <tanjimkamal1@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	=?iso-8859-1?Q?Rog=E9rio?= Fernandes Pereira <rfp2005@gmail.com>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	yingche <zxcv2569763104@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Erick Karanja <karanja99erick@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/11] staging: rtl8723bs: Clean up wrapper functions
Message-ID: <aZwG4rcwoo2agPWX@smile.fi.intel.com>
References: <20260221190628.50273-1-plaes@plaes.org>
 <20260221190628.50273-11-plaes@plaes.org>
 <CAPsOcukZNc3oR=FmAjCdC6NrUV=1CaggQNGPoC2oxuH_P2R0hQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPsOcukZNc3oR=FmAjCdC6NrUV=1CaggQNGPoC2oxuH_P2R0hQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Feb 22, 2026 at 12:46:51AM +0530, Karthikey Kadati wrote:
> This looks like AI-generated nonsense. Please stop wasting the community's
> time.

Please, do not top-post (top-reply).

> On Sun, 22 Feb 2026, 12:41 am Priit Laes, <plaes@plaes.org> wrote:
> 
> > Remove wrapper functions in cmd queue handling.

If so, this breaks AI/tools guidelines in the Linux kernel and must be NAKed,
but how do you prove that this is AI?

-- 
With Best Regards,
Andy Shevchenko


