Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28699172BC4
	for <linux-staging@lists.linux.dev>; Thu, 18 Apr 2024 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713460761; cv=none; b=HjAcCWow16kZ2FVBHvqtr4G/5ET8aFSgee1rZxl2pF/yDqEC+vF/BwZbQnjE/NZfGYCu0yiPn44T8BzsXeSMrFEqO3owUywidcpB+LivnogUTw4Spab2CSf3eDWdEUxnSRmBJEaSEosEht/+Nxz942Izi1hiu1noLKQJvuxA+A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713460761; c=relaxed/simple;
	bh=yROCoENx2b9yAJSMGatAYPh1hwYf8DqL0GPMYtwTMVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQdHQSQiWXX78ezRy3oFwveSH+AC2a+HUcCsSr7Vwr4LobMD9ZoBhmdhT6QT3W+v7WqH4c6IHVhOB2d2fUQWQ4B4RUbPMJ4c4sWYJBS9RyN8xtMzj3PBvNgLZA9zigR8CMrWH9lkyZ7bs5HNp9c4zRbLQSuL0Ooz8UzIDErbICk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G/xQZgrG; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G/xQZgrG"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a51f9ad7684so60752266b.2
        for <linux-staging@lists.linux.dev>; Thu, 18 Apr 2024 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713460758; x=1714065558; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fXGa0pEP8iUBNqIHW4VCl1wGNComHip6UrWPNRc9bPA=;
        b=G/xQZgrGuID/e/A7ywLd7pQNl4Kt7mH/cGbps0sPfJguK37gorsu3S7hE1aF9CKueW
         HmBNN+XMO6YJYT27d8wz50lZxPAmiUCG3UyEy2Bwvp0tE7bZeqg+CC1kmN6rCSNvAQCt
         l57d6Chr9gHKk6ipc+fuH5A9Gw98TeNqDlH0iYG6cH9ghBU7nL0KmW/eSroNt80ujPeA
         EZWDIZskYicikc4Bvtd9ZojPwQTr+Ag8QsbjNJ4foDOk9Fq9tbyfyWpyeFOcFZMQ3k0I
         rK8/S+uQ5S6GnppwU0wcLnJEb03qYK6SwNqhcDp31wveI4hZLpRc9O82SO0PrIQhAzD8
         pObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713460758; x=1714065558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXGa0pEP8iUBNqIHW4VCl1wGNComHip6UrWPNRc9bPA=;
        b=gPqjVja0SU0VuWEduRVT/hr8Ui0mvdRHn2W4MalWaFEbX8uHopwj7CNeNPfOMirvLl
         5Pi4/v4Z2lyUP+m2DJzi6pRgoLUBWPppPdPbKv8gApygzazg8nyfBMYkIjM3qGbQhEt1
         IT1LNjkRPMVhcupB1qEjzLACKIuTmFVmPW5ggYLUPymk/thGBDKD5QWcJAmoTI67+X05
         qZ9f4RXo8MYiloHDOnrW4D0CQHYf4oDzdIwSvGXX0omJ1u58QgDgzQFYusKkzN0LhWF8
         kN4L6zfi4BOs8nwnIewcbniWENGFScF3/IPByXjtuFoHtzP7f/kdq+251bgSo1IRKUV3
         E+aA==
X-Forwarded-Encrypted: i=1; AJvYcCVjoKRbolPcMsUseQYjPeZgptwIaprj22hLs39oGacgmHmcYmdjrQXHKxo3SLTu9bPZqrOymPU3gP46fbYLRbGEEoCf8oYNE+rpeeOqrA==
X-Gm-Message-State: AOJu0YyIEB12WLsp9BL4x4lyBUrn4c4SRRyZTOz/hLUZNVSsCIQIOLYk
	Hs8ylFKiaTqHoRBMrIyXTmReKcYapdkgu/xEEiLjlVIQMv4R8P65zHZxoNwvs2c=
X-Google-Smtp-Source: AGHT+IEwc41StGMMjA7NT/EcMHzsdl7Ubbyp3HEt0hPwzN/ol9BuHMjJLxAT3hzrUe7Xf/hT6lTnuQ==
X-Received: by 2002:a50:875d:0:b0:56b:829a:38e3 with SMTP id 29-20020a50875d000000b0056b829a38e3mr2946788edv.16.1713460758239;
        Thu, 18 Apr 2024 10:19:18 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id e19-20020a056402089300b0057016d010f9sm1101811edy.16.2024.04.18.10.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 10:19:17 -0700 (PDT)
Date: Thu, 18 Apr 2024 20:19:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbdjFdIHN0YWdpbmc=?= =?utf-8?Q?=3A?= media:
 starfive: Clean pad selection in isp_try_format()
Message-ID: <ea244234-38f0-4381-9c9a-b6c6076e7dcb@moroto.mountain>
References: <20240312024520.11022-1-changhuang.liang@starfivetech.com>
 <SHXPR01MB06710239B9F69E2F0EC0CB01F20EA@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SHXPR01MB06710239B9F69E2F0EC0CB01F20EA@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>

On Thu, Apr 18, 2024 at 01:27:04AM +0000, Changhuang Liang wrote:
> Hi, Hans
> 
> > The code to select isp_dev->formats[] is overly complicated.  We can just use
> > the "pad" as the index.  This will making adding new pads easier in future
> > patches.  No functional change.
> > 
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> 
> Could you please help to review this patch, thanks for your time.

Linux-media uses patchwork, so probably it was missed because it didn't
have a [PATCH] in the subject.  Just resend.

regards,
dan carpenter

