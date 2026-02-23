Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF7223EA89
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854497; cv=none; b=TUBI4ltCp6Q6Wyv/lOn7v8Bszfw8RobgvDCiTR3YyiRsUw50efLhMh7Lz0Z4DOrAlcxwydY6ZlVQp0xOcRYzWvjMg3e8pAf7UXQ6rso0mr3lDfe41hbmC63dwCV1lLOPKtx5fpEbRa4Wlpqnz+Dvb1XKecVhLMbd6zxxu8JONu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854497; c=relaxed/simple;
	bh=QN4RCk/uQkbSB3ROteJhLnRWiY5BGB85xvPTFAFwqjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orkqDbbUNGTigqgye9eR1tBO5tRJuIY76qJ9Qw7rAkMYyBnmY/+206EV4dg+3E5FdIp/QuLgRyqZKitQCXZhYWcN9qCZjHIHtv2NVisrFIzMFTAEPKtxEqLK3hO2+NECCswHQcAh1/eZ5U49S484AXqr8F374wE1oABreZO6/SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjBXk8LU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjBXk8LU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771854497; x=1803390497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QN4RCk/uQkbSB3ROteJhLnRWiY5BGB85xvPTFAFwqjE=;
  b=fjBXk8LUcLig0ZhpPkAuuqo3GBc0mfsxNGe6eN65EKvB+Q/JN74GdoR2
   BzpYnMSooG2J2Ct9EHm8bm1huPkbubbV6OvWCBLy9RxIAK2DZD4SgPE1t
   uizUSmxODIeLz8dtM0sNsIqliXIwwoaEIVSEt+87D093yqmLjfv7UOg/O
   8ImtmizPkC9LJO6VMXJ18+G/ugUDVVteZ4qwzDBBUBUvA97QdwucIY9pw
   xT9EfhmNKoWpiFrQpXwsW3d/p1VOpO1bU8XqsfMVzStemFAHbrZ3GxSmQ
   yNFXigtQdBwxDe1KRpdnf7WsgefcDkm9OBaPXLE+iSBXMvd+buCCGI0sS
   g==;
X-CSE-ConnectionGUID: uaXo/rBuTTG9x2GJA7QvoQ==
X-CSE-MsgGUID: DBlglxQ7Sle+V4PRdfKooA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72887490"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72887490"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 05:48:16 -0800
X-CSE-ConnectionGUID: orGoZ7aqTamjAsJZgs7jvQ==
X-CSE-MsgGUID: fJ3BG5ImSJugFE4PI4GJiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="213508147"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 05:48:09 -0800
Date: Mon, 23 Feb 2026 15:48:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Priit Laes <plaes@plaes.org>, Dan Carpenter <dan.carpenter@linaro.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Archit Anant <architanant5@gmail.com>,
	Minu Jin <s9430939@naver.com>, Thomas Gleixner <tglx@kernel.org>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	JJ Strnad <strnad.jj@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	=?utf-8?B?Um9n77+9cmlv?= Fernandes Pereira <rfp2005@gmail.com>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	yingche <zxcv2569763104@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Karthikey D Kadati <karthikey3608@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Erick Karanja <karanja99erick@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/11] staging: stl8723bs: Use common round_up macro
Message-ID: <aZxal9nb2vTjj41Z@smile.fi.intel.com>
References: <20260221190628.50273-1-plaes@plaes.org>
 <20260221190628.50273-2-plaes@plaes.org>
 <517df668-cc9d-4a9a-92cb-04aa80069a56@gmail.com>
 <aZv9K1It5Q-J5Iaw@stanley.mountain>
 <aZwvU_zJfySr422N@plaes.org>
 <4e52556f-abbf-6ae5-3ed8-7aa6e4486a1a@inria.fr>
 <aZw_F1xqjtd-gdWf@smile.fi.intel.com>
 <7b46d8c8-1a2-4aae-a07d-a895a971fba@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b46d8c8-1a2-4aae-a07d-a895a971fba@inria.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Feb 23, 2026 at 01:16:53PM +0100, Julia Lawall wrote:
> On Mon, 23 Feb 2026, Andy Shevchenko wrote:
> > On Mon, Feb 23, 2026 at 12:40:44PM +0100, Julia Lawall wrote:
> > > On Mon, 23 Feb 2026, Priit Laes wrote:

...

> > > The outreachy tutorial suggests the arguments --separator , --nokeywords
> > > --nogit --nogit-fallback --norolestats
> >
> > Wondering if you have a new chapter to suggest `b4` to be used for that.
> > Maybe it's time to have two ways explained?
> 
> If you have a few minutes to add an explanation, I would be happy to add
> it.

I would be glad to, if I was an advanced user of `b4`. It's still in my TODO
list to play with it more (currently I have my own script to prepare and send
patches).

-- 
With Best Regards,
Andy Shevchenko


