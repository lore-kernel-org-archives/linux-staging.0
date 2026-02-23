Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC8E34CFA8
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 14:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857829; cv=none; b=gNViHIJocMTtaqm9GxBNxiSn+SPX6Q6YZNHBDRRlR8u+xP4J3jwWAONBGW5vdPGHr2HtHVVCuOenMdEAt2nhxO4jSmephLWFyuSlLwgzKIK/Ur4jSAZUxiorI1e/wFlYWGw38Ep5sDZXytT1iMNnNrzN4NO0ME2pR0VpOj4jSnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857829; c=relaxed/simple;
	bh=tubARjo52tn7AXxR5T7eluK5ML4ySX+HJOW1HaxO/f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bL5YPordpkpRSsqNxKuY/rYlM8CVrFt7tuXCLfOJYwZ21Q5T61/KipMtIxqtjHrKcP/k7Pd7SrExolJY096RP1626ZzC/7vyNEi5IdTJJl2dnmirjD42KGm0E5KUGBWLGrMzcB5qcybeOo1/EPkReVRYJzkzFmQ3UXkbHTcY+GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TNEgInwF; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TNEgInwF"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-436e87589e8so4190541f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 06:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771857826; x=1772462626; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZpLPH37R3WNgMf2oOHbAMx8Z0Awh1d+NouBHbBrg7Q=;
        b=TNEgInwFzj9ZjrNzEFMxQzYXu8T2U279/wd4I/kYePmysklVauNgfLLtzQ2bW0JfL6
         drJ+Uz9CgUHyRunFmrGVosJAi7t33EqGj6wPs2RwfWU2EUmicueDa33pp3m8qs5GPSwX
         ByDkdMon+d/35Ssmq8vfy7H2bCmwQJAxbj0sI6msvEzIOq/JsN2HUPpwoPlzpaI3gH9c
         UFRFiJ/FUNNMZLzVKDmQD9KVORs8En/+NvhyAk7dHA3snYnXFcI+tEnBjyRbooyHunF8
         ohAI4hOCQQdBNRKHeMFN0GgxzUSFPkfpJl7v3WruBKYco/uQOGZPv5klFMCutIfg2J8x
         enQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857826; x=1772462626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZpLPH37R3WNgMf2oOHbAMx8Z0Awh1d+NouBHbBrg7Q=;
        b=sfM8NYYbDs7my/Hq6Xjd35W7AiqYH94s8W67YDH/HCPvo6TTDldOxvMJpLvdiep4YJ
         004z5SzGxJBD6EWH4nt2JiA/jb/2zNBSDR2HVP35YOFkzMJQpOFD4tNVp1NhhzQjtrwl
         TRBHuSCjFAIq1baSSQCzpl4SPYwm9TJXYvylBxCuaI1vGoverfT/DA62O+xyCtD2VAxh
         SGJvKo4vC3fzS4I7BAUyJPqsDeeFZwE3z3wRvrvh0wApH28zFE4462GSAN2WDt30FcNF
         RAJzp4NvyRzFubuVYWFjnrmboNQEV86Anl+rg7kCw5ml0cF7eOxl4o9jFhNww6ELUPi3
         hyqg==
X-Forwarded-Encrypted: i=1; AJvYcCUCUH6aeA4ITdWo2fpUKd1Cs1ZH3VO6i1VPgHd+xZe4HK3P9z+Inm+WlPSecuzpub7CQdxt4TZd3+k6K2n9@lists.linux.dev
X-Gm-Message-State: AOJu0Ywbq6vuIN6NTh2uAYBD6Ey8WTsa92OaWRDDY33sACh26rNlP3/n
	q21RZ6Rfb3PMqiYqD4vWeD7qNblp6TVZ6s0l98rgJnXzzo2ia9LmRPOvwNK8JXnjKWU=
X-Gm-Gg: ATEYQzzf5/jS71Gxsg6g4EH2UPxPhV+ylIlZcxXWpp5PDmIGprdsmBY4jw4xlkjSJ5Y
	TWl7WKtopcYURSmsE/cmwsoSJom8Ww1PLsxeK2WHyHDyhqk8qZxJFzuREp4o5poIV0g+7ZHhQ43
	rbkOFUj+6WebWrU5ORL19Z7YL/+sxPsGzLFWhXBt3TGrL8M+8OHoy1PEW7eji7/1e4xmCQJwAt1
	gpXwvJ+DwAPOGvr9cO/i5WaL7DXvC9AbSc1Kk/eJJsNPnQhuq1yQw5Wyiex62glwp2/eKoA8pnJ
	XGVb2Z8cJVvB4Tj7Tp4YXuAp++SlPGDxLVDQt2469qYhxrO80fOKkicfO0YLa4jlj3BIMho0PFi
	lVuhnVxllTps54ss+M2zc2mFlRbz3WAfaLruTwUROCugP7jykh/FY1jL6L/cpfZFdH8pOpkM7W3
	/6oLXtw/S6Q6dV1o7n5pAmf//B/pUi
X-Received: by 2002:a05:6000:4026:b0:436:68e:3302 with SMTP id ffacd0b85a97d-4396f15b257mr14190354f8f.13.1771857825576;
        Mon, 23 Feb 2026 06:43:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9fb2sm20609130f8f.1.2026.02.23.06.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:43:45 -0800 (PST)
Date: Mon, 23 Feb 2026 17:43:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Priit Laes <plaes@plaes.org>
Cc: Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Archit Anant <architanant5@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	JJ Strnad <strnad.jj@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>,
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
	=?iso-8859-1?Q?Rog=E9rio?= Fernandes Pereira <rfp2005@gmail.com>,
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
Message-ID: <aZxnnQrBqZ4TC92-@stanley.mountain>
References: <20260221190628.50273-1-plaes@plaes.org>
 <20260221190628.50273-2-plaes@plaes.org>
 <517df668-cc9d-4a9a-92cb-04aa80069a56@gmail.com>
 <aZv9K1It5Q-J5Iaw@stanley.mountain>
 <aZwvU_zJfySr422N@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZwvU_zJfySr422N@plaes.org>

On Mon, Feb 23, 2026 at 10:43:31AM +0000, Priit Laes wrote:
>
> And on more thing - whats the proper way to use get_maintainers.pl script
> with `git send-email` when sending patch series? Apparently I used it wrongly
> and managed to agitate lots of people in the process..
> 

I don't know how you got so many people on your CC list.  When I try
running get_maintainter on your patch this is what I get.

$ ./scripts/get_maintainer.pl --no-roles --no-rolestats ~/var/mail/tmp/patch
Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Minu Jin <s9430939@naver.com>
Akiyoshi Kurita <weibu@redadmin.org>
Erick Karanja <karanja99erick@gmail.com>
SeungJu Cheon <suunj1331@gmail.com>
Andy Shevchenko <andriy.shevchenko@intel.com>
Sun Jian <sun.jian.kdev@gmail.com>
Thomas Gleixner <tglx@kernel.org>
Yuvraj Singh Chauhan <ysinghcin@gmail.com>
linux-staging@lists.linux.dev
linux-kernel@vger.kernel.org

I normally don't add --nogit --nogit-fallback like Julia does but
I sometimes remove people like Kees and Thomas by hand since I know
they are included because of --git and aren't interested in tracking
everything.  On the other hand, people like Kees and Thomas are good
at ignoring email they don't care about so I doubt they will get
annoyed with you.

regards,
dan carpenter
