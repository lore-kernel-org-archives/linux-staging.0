Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4B8190067
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 14:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704856; cv=none; b=oYe4hOdoY5t8AOHYFIR31kYeI+LKNSsbIoaWUfv9lqml8AuKK04xaVXOheFqvc5DbfmZutggbbtecptnGJiXsYlp4R9inhgZ7AoKy9pedRNRa0l2RRelTX22vDcNlpTDUff2QvR1PfTSbQD9/pMjZlmUmp1LZ/2fvSqsPzKMcpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704856; c=relaxed/simple;
	bh=dPR/MK3GE8NMOYtuwtlYVjIQEgLz8dluF1iNQdnetFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9OXF8ljA+HlcEd1idwfOOVBvgvwW0sFkBqGd8F/eZ6IjMWgAmEJJq4sW2RwVf3G7RFNChFfQ8woIuCgG69Fv0Xhb60OxHGuFR84lKMJxT48n07c1Y36SomQvffAT0ofAzTZt82ITcjJAZcdAdH+pk3Zlx3pRYlc+rhgrM6xC9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dap1TH7u; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dap1TH7u"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8d29b7edc2so626882566b.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 07:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727704853; x=1728309653; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B9iC2N/12abllbC0V03F2t6+J5vMpvZXd0nYPLT3vBQ=;
        b=Dap1TH7u9F5N5c+SxXcdLvP+w9cJnr74nViLmsYGBOvHyKy7xGofaiQTEsAH2mmuf0
         rMHpNyiSEiMzxvFAt3Whns3+VfNiihiyUz0nPvog7mNZeFV1iZhuuYn1GSkMPZ7oI66V
         Wsv1SgpfztIcWvt8+DNrxjPVSjmuxvvVIE2rr48kAV/xwjeJ/qCbrJJnCtTQ8iEJVx+D
         laY1aVhI0ZCXLiIhKDlJQuF4BUCW9/fF3oBhVDPidX+AlyoOwPkOFuJ36IaqrJr33jj+
         Drb+fnA0DXGVEqTfKD+qqWTe1SN/ZmvZ3OIZdrIf68iTF/cI6IDl/AhlxdB3bb7PxIV5
         OH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704853; x=1728309653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9iC2N/12abllbC0V03F2t6+J5vMpvZXd0nYPLT3vBQ=;
        b=MS1f8fjVex9p23J6ytfnr+SS0fRN9Nwvvc1SClFd3rve5z1kisOw1e8jp0hf72xJ89
         KPmIwqqqjuHpraVSzDnDaxg4ovI53rc5wZLYYSUpKROL1NPOrylvmkVuI0hoD/I3k9We
         tgyBizbj9tbEx51PrUtAAnwuS68FWWRMW3oZ3+yQm3LUSP+GFi+B040IJcP+CNaYpjzb
         VUUgv4/bTKnkpZL3/79sjnyoVBrzYru3SGyhfOLMKoT8b4THGaTrBOkJEIUghRUGhXDN
         Ca2TmcQMa2eIkmnIy8wt0fX2uGt0rK5s74HSC8SE1VeYt15PoTzepC35syTB3JIqAguY
         2ESQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4xJHs4Hcq+BWisg10WLo8WYhOIvOLTvP5h6X/NbxcIRUExRu6iAn47fbIXilYDBQ3lnZgX6674Ep3cjSm@lists.linux.dev
X-Gm-Message-State: AOJu0YxZf2xO9JFWd9oHsX617KiGYdvNjV7pQE2l5Rsb5LgSh+eE8uJO
	f+nhF2DnBZynNM7ctxwfNzbMkZYFKy+PZQgV3lgdPgGH46HWXPFsLQQ8BpqIWIg=
X-Google-Smtp-Source: AGHT+IHrW1k6OyoeAr7X2J4sCHCj9NzoUl8sq6E2Ub0OP+VdkpEDGrA+mzsk7GWeJcQA5FmXlP3tnw==
X-Received: by 2002:a17:906:c104:b0:a86:b762:52ec with SMTP id a640c23a62f3a-a93c4adf8ebmr1289043666b.51.1727704853182;
        Mon, 30 Sep 2024 07:00:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297bceesm532099966b.187.2024.09.30.07.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 07:00:51 -0700 (PDT)
Date: Mon, 30 Sep 2024 17:00:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Walls <awalls@md.metrocast.net>,
	Julia Lawall <Julia.Lawall@inria.fr>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy@kernel.org>, Mike Isely <isely@pobox.com>,
	Olli Salonen <olli.salonen@iki.fi>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Sean Young <sean@mess.org>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>, Jemma Denson <jdenson@gmail.com>,
	Patrick Boettcher <patrick.boettcher@posteo.de>,
	Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
	Michal Simek <michal.simek@amd.com>,
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, openbmc@lists.ozlabs.org,
	linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 00/45] media: Use string_choice helpers
Message-ID: <f04f0057-626b-471f-b0a4-56ba30dbf8cf@stanley.mountain>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
 <20240930122157.GF31662@pendragon.ideasonboard.com>
 <4873f3a0-bd82-4ace-a783-10ea137284d6@xs4all.nl>
 <7D358236-19F8-4F94-89A0-F379F193971F@md.metrocast.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7D358236-19F8-4F94-89A0-F379F193971F@md.metrocast.net>

On Mon, Sep 30, 2024 at 08:57:44AM -0400, Andy Walls wrote:
> No human being really code reviews sweeping editorial change like these thoroughly.

I wonder if there is some way to verify that people are actually running the
Coccinelle script that they say they are without doing anything extra on the
side.

I use a script to filter out mechanical changes.

https://github.com/error27/rename_rev

It's kind of a pain in the butt to review something like this.  The command
would be something like:

rename_rev.pl -e 's/(.*?,|^\W+)(.*) \? "enabled" : "disabled"/$1str_enabled_disabled($2)/' -e 's/(.*?,|^\W+)(.*) \? "enable" : "disable"/$1str_enable_disable($2)/' -e 's/(.*,|^\W+)(.*) \? "low" : "high"/$1str_low_high($2)/'  -e 's/(.*,|^\W+)(.*) \? "on" : "off"/$1str_on_off($2)/' -e 's/(.*,|^\W+)(.*) \? "true" : "false"/$1str_true_false($2)/'  -e 's/(.*,|^\W+)(.*) \? "high" : "low"/$1str_high_low($2)/' -e 's/(.*,|^\W+)(.*) \? "read" : "write"/$1str_read_write($2)/'

For every email in the series there was another new str_foo_bar() function so
the command line kept getting longer and longer.  It doesn't work perfectly, but
it's often good enough so I can spot the interesting bits.

regards,
dan carpenter

