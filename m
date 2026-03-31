Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A163371072
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 06:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774937008; cv=none; b=CQi/z2uNWlMyd8qfP7wFrt84CYHVLh8cuWM6SSAw+oRm5ofOTtEHdPO4UbSceuwGUym6hathTfbdrXeaOskjjZ+0yzb2ZJ3X/EiBiAXTw7j+z+F2Z/sUEpCnKYQDzkLVh6Zv0Z9XgsXLRciDqgv3N/viZO/Vmf5bSlD7eCtUFVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774937008; c=relaxed/simple;
	bh=Hw2eRWNSq7xRJtzfw9eZamV77ZIiYuWvXdnIMcmHnZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMATziIb+tM5FI0IPC8ZP3yBHsLjSyonG4mluhltOcQmQ+d31Ol5iFSCzcNyS2F9fLQR4fZmjSg6QxRCAqqiZ6Bajpx2uUDp/BE6ko4g9bElBto7huQfK7DNe0NgTKO+uJL7c8p4y1uocacq6lZmXJxpWhyi6fMeuc/hMwmfHPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1X2ESnS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1X2ESnS"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso3004332f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 23:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774937004; x=1775541804; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hw2eRWNSq7xRJtzfw9eZamV77ZIiYuWvXdnIMcmHnZw=;
        b=M1X2ESnSFB0J/TvTsbFNbBdv6ErGGQz9Y/ehktdP2iTxUKzFs0fVoS4ALf8Kqu+YnM
         MAFNB9HBM+lMVI0UWhrvjVOv5Y6W3m7/0oWZ6StKa2k20uUnDpU0LG+39UBXz0fg5bKm
         VO/gPJEE8LHULE1HTOQdHGFjfn31ECxTmifBfnRIOkCLwYr9T0kXst4+JO5Q6LAgrd/m
         4XyB8dLGBb44ARBIoCZq/mxJR2nDI0Bm+5mFmRnhHtEJiJcLfO51hZsgVsMuy5m9NZ51
         ilHbtJCRx1rF7VIvynHaRajzEq22HuzNJR99PrQFND3nxRB5PfH8PBB7cPApGBf922UO
         APvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774937004; x=1775541804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hw2eRWNSq7xRJtzfw9eZamV77ZIiYuWvXdnIMcmHnZw=;
        b=tRyh5vmhZq603WGoWqsoh+5Fr14D7DWa+kPar3HsOumSab4ePevwy0LDLVZYD909qm
         CZ/5szIn5Q/mSuY38ppSVUam/bWC1CnpaxcZqWOoAnl1OzDnsu6l+AdrqwfqBWzYB+GF
         WpaTW5hTKjqRUWNFwXHGbkHM1u17x8S3lEZZ+q0vUllc7PVlGm8THVax0eWvHXPCogwy
         eTZPLzU8PSep0AhyNgWfsQkefqjMeiAGs1PaoATUQLkHHwLGSN+jwps7U5Uhq3zhS49f
         i0fOHJwTbl9ATbNMnLbLlcRQmcfE5cZQV2kHSdGaqAbMqxldaUBtT1DMH3dv3KgaDSPB
         uDCw==
X-Gm-Message-State: AOJu0YzOFSuO+g4+Xq442NwBiYVrvnDMwBk4/9B506x3S3RaWGDAyf5F
	3ASb5wb+bX7/00FtQFWJVumGNGSyuS9fAYQySp907agXkkDnCv0tMwJb
X-Gm-Gg: ATEYQzydUNsAQXwBO0c2MoAlHtoD4oByPr/5KqtS3AQZ6SnHiW/08Gjs9nlXw2LZyZX
	3sGZfKMWQwGwuudVhtbqNp8SJsKIll/PlfBf1m6LbSHZur5Pps40yf0I3ZLak6c/TSCfMiOnEFV
	rJFjboZ9X9xpinBj5upIfX9dZREjAm/8FDpaFa+zjWFiU/tw3qu9RYUOxnzCgOEiaRpjbWtvUQH
	UaIfq0h5aLixQnyhnOI81MC/qubiDdFGPqggGqXmAHZkqdifPZv9p3GyKovncyQLj25g+g3YsWe
	vYba2k+VgN3o667cQKg71vKX6QKW0jsVjXsE12S7GcJXALtUIuXmSos2tIFJhI2BjnxmvWqawf9
	RUAsiHD1NoiiNcHOLchOODqZ9s6V4qiNOOiV//ziflth7F2RAU350/xibZQ/Rt+Z+OiCFr4oz6d
	3JBKMl2XqSEhPXpCQZapM2VL3EMNM6+w==
X-Received: by 2002:a05:6000:24c6:b0:43b:4582:e90d with SMTP id ffacd0b85a97d-43b9e9fadfbmr26415699f8f.42.1774937004525;
        Mon, 30 Mar 2026 23:03:24 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1882:1f28:c460:96ff:fea3:6e21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm27245180f8f.6.2026.03.30.23.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:03:24 -0700 (PDT)
Date: Tue, 31 Mar 2026 08:03:21 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] media: atomisp: remove redundant call to
 ia_css_output0_configure()
Message-ID: <actitevm6DKddeWS@gmail.com>
References: <20260328192721.255493-1-azpijr@gmail.com>
 <20260328192721.255493-3-azpijr@gmail.com>
 <CAHp75VcOi_fhSGnYn0KzsRMdSFmFhzc1kzesW52XEQVJY06ndg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcOi_fhSGnYn0KzsRMdSFmFhzc1kzesW52XEQVJY06ndg@mail.gmail.com>

On Mon, Mar 30, 2026 at 12:01:21PM +0300, Andy Shevchenko wrote:
> On Sat, Mar 28, 2026 at 9:27 PM Jose A. Perez de Azpillaga
> <azpijr@gmail.com> wrote:
> >
> > The function configure_isp_from_args() contained a duplicate call to
> > ia_css_output0_configure() using the same output frame index. Remove
> > the redundant call to simplify the configuration path.
>
> This requires more information, in particular to explain if the order
> has no side effects. It might be that double configuration has side
> effects and removal (wrong) one may lead to other currently hidden
> issues.
>

mhm... my bad for that,

the ia_css_output0_configure() function acts as a configuration setter.
it populates a struct ia_css_output0_configuration from the frame info
and caches it in the binary parameters. calling it twice with the same
out_frame[0] pointer merely overwrites the exact same state with
identical values. it has no cumulative state, either does its order
matter relative to ia_css_copy_output_configure().

...

regards,
jose a. p-a
