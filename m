Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720363644C7
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846864; cv=none; b=WhEOf50W+IF5rWMQtT1qQ2Xyu4rasTtbJMMEyllAraw4206shNZCEEtrldtGpB2ZiBXuMy5JXfACMTqKGYztMyvvSy82BI2ThDN63sOdW/yLUOvuskrSbJpdVpmghSzJrZKQKNjUiELlNQJI227Suvrg8IDP2Xkf/KoHCYprZXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846864; c=relaxed/simple;
	bh=xFci3fBprS/SQZx/BZ2nOmqCqh0xAlXcv3UJ/OzCRPM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gJVFs+U5trQbTG2a1LQTBgyEBso/EbcBU2EbPOt4piyBoyEljEVbtppu7LJsvzfKyw68mcP9FJA6b75yZGF66G0IGFJU0gwbYhTKO+SlT/ztjhgOlwwqYGbP8UzeWQrG9S4H318LAN6NVcq7sYOdrd1vidxaobfY4j/+IoL7fVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=UgJpgw6f; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="UgJpgw6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8zqohxNjoz2GsADhdnP1yS/Omtixg8VovVN6z+tgeac=;
  b=UgJpgw6fWOqakOkWdaTnAbWRwZP3BiFCevoA12jsX74xJvBqLrb4HO0S
   Vrui1jRXGsy3fj/IqRhF/6azgTJKG4GRtV7pih9os+B552l9s/AHtmVwV
   b3fxiXIxMUCaO7tqHT0cdgIW6pvRmCcjvVqQxDDd80lkYr1UuGBwEjBHc
   M=;
X-CSE-ConnectionGUID: mxxXOydnQEaC35y4ZK+jjA==
X-CSE-MsgGUID: ET1w1PyQSRitQxX2y1mJ9g==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,306,1763420400"; 
   d="scan'208";a="139549008"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 12:40:45 +0100
Date: Mon, 23 Feb 2026 12:40:44 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Priit Laes <plaes@plaes.org>
cc: Dan Carpenter <dan.carpenter@linaro.org>, 
    Vivek BalachandharTN <vivek.balachandhar@gmail.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Archit Anant <architanant5@gmail.com>, Minu Jin <s9430939@naver.com>, 
    Andy Shevchenko <andriy.shevchenko@intel.com>, 
    Thomas Gleixner <tglx@kernel.org>, 
    Yuvraj Singh Chauhan <ysinghcin@gmail.com>, 
    JJ Strnad <strnad.jj@gmail.com>, Julia Lawall <julia.lawall@inria.fr>, 
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
    =?ISO-8859-15?Q?Rog=E9rio_Fernandes_Pereira?= <rfp2005@gmail.com>, 
    Diksha Kumari <dikshakdevgan@gmail.com>, 
    yingche <zxcv2569763104@gmail.com>, 
    Khushal Chitturi <khushalchitturi@gmail.com>, 
    Karthikey D Kadati <karthikey3608@gmail.com>, 
    Akiyoshi Kurita <weibu@redadmin.org>, 
    Erick Karanja <karanja99erick@gmail.com>, 
    SeungJu Cheon <suunj1331@gmail.com>, Sun Jian <sun.jian.kdev@gmail.com>, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/11] staging: stl8723bs: Use common round_up macro
In-Reply-To: <aZwvU_zJfySr422N@plaes.org>
Message-ID: <4e52556f-abbf-6ae5-3ed8-7aa6e4486a1a@inria.fr>
References: <20260221190628.50273-1-plaes@plaes.org> <20260221190628.50273-2-plaes@plaes.org> <517df668-cc9d-4a9a-92cb-04aa80069a56@gmail.com> <aZv9K1It5Q-J5Iaw@stanley.mountain> <aZwvU_zJfySr422N@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1414229873-1771846845=:3520"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1414229873-1771846845=:3520
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT



On Mon, 23 Feb 2026, Priit Laes wrote:

> On Mon, Feb 23, 2026 at 10:09:31AM +0300, Dan Carpenter wrote:
> > On Sat, Feb 21, 2026 at 03:41:27PM -0400, Vivek BalachandharTN wrote:
> > > Subject has a typo. Please correct it.
> > >
> > > How did you test this? The driver code appears largely AI-generated unless
> > > it has been validated on actual hardware, such as Pine64 Wi-Fi module or
> > > another board compatible with rtl8723bs considering these changes are not
> > > just indentation based.
> > >
> >
> > The patch doesn't introduce any bugs.
> >
> > #define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
> >
> > This is the canonical way to implement a round up macro.  It's how
> > roundup() is implemented in the kernel.
> >
> > The patch uses round_up() instead which is a faster version but it only
> > works for power of 2 rounds.  psdio->block_transfer_len is 512 so it's
> > fine.  I probably would prefer to use roundup() for that even though
> > round_up() works as well.
> >
> > We maybe should create a static checker rule to warn about using
> > round_up() for non-power of 2 values:
> >
> > KTODO: create a Smatch rule to use roundup() instead of round_up()
> >        for user supplied values, or non-power of 2.
> >
>
> Firstly, thanks for the kind words, Dan.
>
> It's kinda annoying how things have changed since the old days.
> Apparently if someone now attempts to improve the low-hanging fruit, it gets
> instantly accused of doing something awful...
>
> Anyway, meanwhile I actually discovered some better versions of out-of-tree
> drivers for rtl8732bs based on existing rtw888 driver [1], [2], therefore I
> have no motivation left to fix up my "own brain slop".
>
> And on more thing - whats the proper way to use get_maintainers.pl script
> with `git send-email` when sending patch series? Apparently I used it wrongly
> and managed to agitate lots of people in the process..

The outreachy tutorial suggests the arguments --separator , --nokeywords
--nogit --nogit-fallback --norolestats

julia

>
> [1] https://github.com/jernejsk/linux-1/tree/8723b
> [2] https://github.com/MocLG/rtw88-rtl8723bs
>
> Päikest,
> Priit
>
--8323329-1414229873-1771846845=:3520--
