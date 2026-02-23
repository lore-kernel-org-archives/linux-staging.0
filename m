Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560EA34D4DE
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 12:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771849023; cv=none; b=s5MyPdi8OQ9EEsPwaj0bt9T1V6lkfXRBUIx9hhnd4p76u45XEe+iyW58920LrmBzg5F4Uq13Er8uM1ksqjhLvEyS2C28EOkaNEe83P9iFFb/0BzvCP0q0EnJYSdY3Apk1HXDJlwtYBy7lBsSVJEsHFDFlL7gUekZx91XLGsheKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771849023; c=relaxed/simple;
	bh=6BQZfVp8qabfoisBi1E6jUnI5ypWfLIfknFxGGoSMiw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tILVr97d+i4dPKfp4Oh57bZWbviT5o9Cr8FVpIIfOBU9egtzQ5tIZiv4G2+vGB93Ov0o8RqgOpATtcLogKzcu1O57uz+gbBZuu5BdodEAgQV5mjMef4wJSzYjHkZOsjF489Rdy/9fibMmp6R8Z+1+D07wsk8sP1yuGLfCJL1HG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=uJmazeVc; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="uJmazeVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6BQZfVp8qabfoisBi1E6jUnI5ypWfLIfknFxGGoSMiw=;
  b=uJmazeVc9qKDbrDlFDO/0YIJb5FJcqqG/FpoyPrRG89okjlJdRC8SmO/
   fpFVKChHIeq8jzkUEGTeGhwWmxCUNzd3W8m8bwlbsCigmiT3tK/niT+/d
   HaDGxRfpaVkTEdUHzLpPWiP2DIAUpJIeXImvrr5y4lDWWO8CfWbCdv9PW
   k=;
X-CSE-ConnectionGUID: n4u8ht+AR/ONGJqKcQ4F1w==
X-CSE-MsgGUID: FVJnGM0qS8mLmUZg7FcbJA==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,306,1763420400"; 
   d="scan'208";a="264723458"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 13:16:53 +0100
Date: Mon, 23 Feb 2026 13:16:53 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
cc: Julia Lawall <julia.lawall@inria.fr>, Priit Laes <plaes@plaes.org>, 
    Dan Carpenter <dan.carpenter@linaro.org>, 
    Vivek BalachandharTN <vivek.balachandhar@gmail.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Archit Anant <architanant5@gmail.com>, Minu Jin <s9430939@naver.com>, 
    Thomas Gleixner <tglx@kernel.org>, 
    Yuvraj Singh Chauhan <ysinghcin@gmail.com>, 
    JJ Strnad <strnad.jj@gmail.com>, 
    William Hansen-Baird <william.hansen.baird@gmail.com>, 
    Randy Dunlap <rdunlap@infradead.org>, 
    Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>, 
    Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, 
    Navaneeth K <knavaneeth786@gmail.com>, 
    Artur Stupa <arthur.stupa@gmail.com>, 
    Michael Straube <straube.linux@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, Ethan Tidmore <ethantidmore06@gmail.com>, 
    Zhuoheng Li <lizhuoheng@kylinos.cn>, 
    Michael Huang <tehsiu.huang@gmail.com>, 
    Nino Zhang <ninozhang001@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
    =?UTF-8?Q?Rog=EF=BF=BDrio_Fernandes_Pereira?= <rfp2005@gmail.com>, 
    Diksha Kumari <dikshakdevgan@gmail.com>, 
    yingche <zxcv2569763104@gmail.com>, 
    Khushal Chitturi <khushalchitturi@gmail.com>, 
    Karthikey D Kadati <karthikey3608@gmail.com>, 
    Akiyoshi Kurita <weibu@redadmin.org>, 
    Erick Karanja <karanja99erick@gmail.com>, 
    SeungJu Cheon <suunj1331@gmail.com>, Sun Jian <sun.jian.kdev@gmail.com>, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/11] staging: stl8723bs: Use common round_up macro
In-Reply-To: <aZw_F1xqjtd-gdWf@smile.fi.intel.com>
Message-ID: <7b46d8c8-1a2-4aae-a07d-a895a971fba@inria.fr>
References: <20260221190628.50273-1-plaes@plaes.org> <20260221190628.50273-2-plaes@plaes.org> <517df668-cc9d-4a9a-92cb-04aa80069a56@gmail.com> <aZv9K1It5Q-J5Iaw@stanley.mountain> <aZwvU_zJfySr422N@plaes.org> <4e52556f-abbf-6ae5-3ed8-7aa6e4486a1a@inria.fr>
 <aZw_F1xqjtd-gdWf@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 23 Feb 2026, Andy Shevchenko wrote:

> On Mon, Feb 23, 2026 at 12:40:44PM +0100, Julia Lawall wrote:
> > On Mon, 23 Feb 2026, Priit Laes wrote:
>
> ...
>
> > The outreachy tutorial suggests the arguments --separator , --nokeywords
> > --nogit --nogit-fallback --norolestats
>
> Wondering if you have a new chapter to suggest `b4` to be used for that.
> Maybe it's time to have two ways explained?

If you have a few minutes to add an explanation, I would be happy to add
it.

thanks,
julia

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
