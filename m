Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954C863121
	for <linux-staging@lists.linux.dev>; Thu,  7 Mar 2024 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709798123; cv=none; b=XKPGUsBm/vO32qnn1EMCWtoQN+y9OrdRGsS5Gl4Q/SjPkdVf1qgu0Z1n06f8UAAbn2IxyfNlpZwvjfwGQrbnzvb6CLsOU4VduD1S9RNdUcWHwQishI8inYoH/JSnKf82AHXsTgEQtrYc9CHf84XHuuU79GW6F+ReNwZzJLY+Vzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709798123; c=relaxed/simple;
	bh=Aa66jG2WGimBH4GX5jmV/YXE8uZyBO6e9RgV/X53laE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHHNwuC8JSq/GMMCyjQV4E4bs6B+Grbdm5ONyQwvA0KmK4fK/SvCuIdRGChM22MkD+wjF1OCGd2y3PrNCLc8Y4dHJXC6t7SrpbzrsL6orqmSwc0X0kkKSwV8zF8o/9L7qk/kOOtdZXOnPI5c3ohk28LWdWbhpYuYLzx889bSm/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OugArCOz; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OugArCOz"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso66764566b.2
        for <linux-staging@lists.linux.dev>; Wed, 06 Mar 2024 23:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709798120; x=1710402920; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn0DWqG7g9N74WkvhFXOQ0ffZSSFhFrSnC9Q4XDpoto=;
        b=OugArCOzyeNdD2P53APV0sUc0SX7u8BHR9s5CswlHY26VaWlRCZ1ivErJfctHk2ALm
         W4f8W2+Eek9amyWHR9LervlJQ+Kx5UV/HnQHfyGxe9KIsl0m9RTjJONANBDfvjCO2Jzg
         ba8SnbiHhwlhfKwkkqxRo2inOcqmlcbqMMptscGUk35OKczB4ig60WPPShMQQOHbHaQL
         FSHgq1DVRWTX0iV2ngJA1fnGwjUiR57quBwJWE5hAwU0rSkSE71gm995SxnqwCyngn7B
         DhMw2ie4XS9Yp/NNSob7L1JKjjYjPKBAI7anwN+R1xeedzGFAr/Ar7Marnwmwrt7o8b/
         i3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709798120; x=1710402920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn0DWqG7g9N74WkvhFXOQ0ffZSSFhFrSnC9Q4XDpoto=;
        b=Yg7C+5bO0ioE1dbEwvXtet/2iJzjetucz5jCI0oCMIx+j0vMVl9w8Uv7142weZJEOW
         Hw7q2xx9nT/SAcyY41IT8dXcLPxsHuzpEMuHnNcpCUuZz3l5hi4kA4OJpXBKctAKvAJK
         rl6d8KYquJx2zvAyPWB/ZZY9bJZfAeZH9HCSgPvdKOTOhzsc6M7NC2grKa7/IiwG6QG3
         klaRoewIMpeIf6fMeThJDGWedEiuasa6Qqjv0v8Q+/7iC0qNVYVJreG0ehnxTdH39VnP
         YulES9e0OIcpcZG60eU9q1fBytn1oN71NbkPGZVqP3JbA9P8UyvsEQPeC2yrng2xOAUP
         ezYg==
X-Forwarded-Encrypted: i=1; AJvYcCUil91Accfyr44b/79oMWw9hM0HnHYxo8sd9Eqd6mPFnhXMZZ3ZS3IQN0DySXyNCka5IiSxyr8pULbhpAkwEiNeG44j+tm3MoioLOLERA==
X-Gm-Message-State: AOJu0YwmJ+d+GtTxLpnGar/qpov2KONXHMPlDy4Pa1x1YEmgAyWIY+p2
	RQ2mU7vMDbT+9bkSH5ziT3TYKD4MULzKXuyUaytvnDJY28uW+tQDfrOKW24h18Q=
X-Google-Smtp-Source: AGHT+IHWh6qHbiDAcCnz7U/s5fQPQnTrwoA3CIOujNr0ES6F4oppiRIthyVdwep26V/Yz6L0NmQdfQ==
X-Received: by 2002:a17:906:a456:b0:a3f:5144:ada2 with SMTP id cb22-20020a170906a45600b00a3f5144ada2mr11682129ejb.2.1709798119161;
        Wed, 06 Mar 2024 23:55:19 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id lb7-20020a170906adc700b00a4479997b97sm7037985ejb.66.2024.03.06.23.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 23:55:18 -0800 (PST)
Date: Thu, 7 Mar 2024 10:55:15 +0300
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
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQw==?= =?utf-8?Q?H?= v1 5/7] staging:
 media: starfive: Add ISP raw video device
Message-ID: <17e9c68f-0019-4b76-908b-6763fb24eb22@moroto.mountain>
References: <20240306093334.9321-1-changhuang.liang@starfivetech.com>
 <20240306093334.9321-6-changhuang.liang@starfivetech.com>
 <c474bd8f-6c23-4536-a915-efbc197a223e@moroto.mountain>
 <SHXPR01MB06715A4810E596B068029472F220A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SHXPR01MB06715A4810E596B068029472F220A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>

On Thu, Mar 07, 2024 at 02:13:50AM +0000, Changhuang Liang wrote:
> Hi, Dan
> 
> [...]
> > >
> > > +err_rm_links0:
> > > +	media_entity_remove_links(&isp_dev->subdev.entity);
> > 
> > I don't think this line is correct.  I think we only need to remove
> > &cap_yuv->video.vdev.entity.
> > 
> 
> The instance I refer to needs to clear both the source entity and the sink entity. See
> https://elixir.bootlin.com/linux/v6.8-rc7/source/drivers/media/platform/verisilicon/hantro_drv.c#L855
> 

Oh yeah.  It's the same in v4l2_m2m_register_media_controller().

regards,
dan carpenter

