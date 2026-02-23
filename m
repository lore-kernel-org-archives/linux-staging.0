Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34F42248A8
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 11:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771847459; cv=none; b=qa/BgYmmR69V74txNpJwOb4xx5y5W1wwNMuz6XEx6ajv1iDuDNC5DJLyyApunpJ3Z1IaQEUwEnlWbO5EnWLNQX+Zau2hGATJNsbhplZRzTmCAAt5ii3/41gknw3SCYo7swyFXX9wnW9RIB9YoOWkzaN19bH4yhjYd1QR5dazm6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771847459; c=relaxed/simple;
	bh=4CO5SuUewnlO2DdLwJeUhIyrabNPCcT0UbSkM5zhdlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WePYsGl2f6xhs7b2ALB24YwqT81SacAL11vv6iO1zbH0M6Q+weMrKo7r7tu9LIdbTnxjIf9ya6tStN5TF/JEyPp38i66rCbmR/KVM1OWehFlFCx59A65q7zqTdBjnWjgRlSqUfuMxe9/63/ZBv/+K7u4W/RmtRaGxJmRfPJgo2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6qQsvp6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6qQsvp6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771847458; x=1803383458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4CO5SuUewnlO2DdLwJeUhIyrabNPCcT0UbSkM5zhdlk=;
  b=T6qQsvp6IgOwMugQki3heFWhBMA+v1gS04cMcO4pe6oFnBWnb/y5b215
   MFUrVLxqKdrdZiIKZnPbZfAcqEGE3xebwohUPqTwHkKoASdoPMal6YIO/
   uo8H481zH8eJ7xfRwv8tTsPxYsZGcbMxRsQIRiWEFU7/GxF2kXABez2qj
   kTkwEWh8pAuqmi6CzPggBEGgDzorDKh+JZEjJVBUDhyJtnRC5DGIbXGou
   zHc0eIi8Xs0MwF9uIVzYn1ylSng8LeGATVXwi+Zn7UkoKDbDHAmwTv8/X
   plRJqkTJd/Gtc9mpFXNJ8mg0kSmtB1tTUaEnYLaPbyfSy5r9r8V5VcgDw
   g==;
X-CSE-ConnectionGUID: xswwaT/ATViLmvBSkn6gdg==
X-CSE-MsgGUID: FwJmKN++SZu6DFMxE2gD4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76702788"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="76702788"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 03:50:57 -0800
X-CSE-ConnectionGUID: 284vC2ehTVaYXZ0dyYn50Q==
X-CSE-MsgGUID: p5pfd4e5QXOL6YwTYvunTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="253261535"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 03:50:49 -0800
Date: Mon, 23 Feb 2026 13:50:47 +0200
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
Message-ID: <aZw_F1xqjtd-gdWf@smile.fi.intel.com>
References: <20260221190628.50273-1-plaes@plaes.org>
 <20260221190628.50273-2-plaes@plaes.org>
 <517df668-cc9d-4a9a-92cb-04aa80069a56@gmail.com>
 <aZv9K1It5Q-J5Iaw@stanley.mountain>
 <aZwvU_zJfySr422N@plaes.org>
 <4e52556f-abbf-6ae5-3ed8-7aa6e4486a1a@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e52556f-abbf-6ae5-3ed8-7aa6e4486a1a@inria.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Feb 23, 2026 at 12:40:44PM +0100, Julia Lawall wrote:
> On Mon, 23 Feb 2026, Priit Laes wrote:

...

> The outreachy tutorial suggests the arguments --separator , --nokeywords
> --nogit --nogit-fallback --norolestats

Wondering if you have a new chapter to suggest `b4` to be used for that.
Maybe it's time to have two ways explained?

-- 
With Best Regards,
Andy Shevchenko


