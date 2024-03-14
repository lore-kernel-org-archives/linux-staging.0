Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E212107
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 06:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710398172; cv=none; b=Zo0JorGJq2szT87Y0VNoU35THTfNa4tXe6qPAb/iN7ABcDau4Iut4gXlZBiCmir9o2o1uhQxZxPkKrJISX2DwLxYeOrj2DFKEIQo0/PGFEObBsA7D/4nvSmCAnlTUJeOtqhZwNxmqK8fgKxOZFtpSCi8OKyLxBBnF4i7TT+MYH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710398172; c=relaxed/simple;
	bh=Y55DOdOUJ9/00z4L+nvIUF+Ywn3NqrmT78v7XjIrvX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2fE8nbWgYyvleqauAF0yM/kxMarBEB9Pfwy6jwTi9s33MLDp0L39SCtLP+GFchdVSBDvwpOCk+5lEQxKW+qd0D3ZlOSa1YdkVngVIWRl3b/CklFcQ1FnTvnk2cDkUDsLOZqUNGg6UR6YFcAIKG0GII9p1Ly7OB8PrhT4K6ZCOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fxvoIj7B; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fxvoIj7B"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33ddd1624beso378487f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 23:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710398169; x=1711002969; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zVIRO0p5fZc/LHgMjNbk7il9lkq8Vb4FW/ceXX01tpg=;
        b=fxvoIj7BC6VUv+ebQGa8dd5Ms/lLy0cOK6+Deu8LsEiBy0fuUxyWPp9hcIcSJwgz1m
         t4SqxwKybotX2FxGpKXJ16fktrsfxMGyLkMar8SWzkIscknXdUh2PsELB29Zv8X0MQsm
         PugZnQcgojtctfz5Mr/lgs1iwwGmiuislkOx1gRifvdFThWY4RHCM9c7loGlbfiWwZgt
         5Ufpqg0gcoBu0CHFuvVK20DC33jvoFPUZ874SEmy29ppBGZ26WQ7WQN2YFaVvXirKDXP
         qeicBkkWH5hTmAW2qi+3+F5LMGJSfNrn43C9MU/UMk3e2dQ1au2LPUKz/GPf+1YKPYT7
         EyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710398169; x=1711002969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVIRO0p5fZc/LHgMjNbk7il9lkq8Vb4FW/ceXX01tpg=;
        b=KPDqQIsAtidWhjOpxVce0AMZA00noTvwE24kRH/Iex4+EsRPmrb3ZSXv5waveqsLXg
         Lb/ru/3TFDQjjJVrXG2Uu3kIVxM+x/+8uDLAx9APvpSTot/RprYuvR7lkWZMBJD1WV57
         8tZLgg32Yt3Y8cPNKnoMkv3ltE8/XfWnqHErkdJ9x3pNj4jZhaJGG6VfECk93cCqmQsE
         k82LTX6Haa3dM3AkTf0lNMHbnUs8uVjaOgJ6LbdbGVu3EyzuNCZBRw6U8hnF4CEYyJJQ
         CGzA9EEMvybwWAW59d/gMNVtP1XvPzI7w9XGt7ICAcsqn3lCJ3PGfdjiTzk8EnmoXU0O
         epew==
X-Forwarded-Encrypted: i=1; AJvYcCU85HY4HNY/Zo9M3QriTRrdsDZS5sljasF2FhKOqAILOXHBR/WimJggwt5g6kST1RcaVks5Wgoo0d3uRLbEcSJiuvLYLWc2+iPP1cqclQ==
X-Gm-Message-State: AOJu0Yy/GME1GMbT0HuHvaBNFM+akqSSz1mH/LlTrxtnFUy0zhWmhd7Z
	OMHFThhB72ME2v1jBowg61dyOb+N/SSQJeR+Rgiyj6vNM27rBHKkvPFAhewBho8=
X-Google-Smtp-Source: AGHT+IGTtuKMmLJ4BVv9G6rzFgq1K97mIt5rNwER/4qv7PeBEWDRseNW2AxN2CNtaft+Qd6Bek9qVQ==
X-Received: by 2002:adf:eac1:0:b0:33d:8c9d:419 with SMTP id o1-20020adfeac1000000b0033d8c9d0419mr790121wrn.24.1710398168673;
        Wed, 13 Mar 2024 23:36:08 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id v12-20020a5d678c000000b0033dd2c3131fsm834343wru.65.2024.03.13.23.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 23:36:08 -0700 (PDT)
Date: Thu, 14 Mar 2024 09:36:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>, forest@forestbond.com
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v3] staging: vt6655: Remove unused function
 RFbAL7230SelectChannelPostProcess
Message-ID: <4e162fac-078e-4a37-9a6a-fad186b0d27a@moroto.mountain>
References: <20240311035649.25043-1-dorine.a.tipo@gmail.com>
 <20240311060747.32876-1-dorine.a.tipo@gmail.com>
 <36c92e00-213e-4f25-9720-66912b4da56f@moroto.mountain>
 <d0f975e8-3ce4-4a2b-b52e-51b748a8601d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0f975e8-3ce4-4a2b-b52e-51b748a8601d@gmail.com>

On Thu, Mar 14, 2024 at 06:33:58AM +0100, Philipp Hortmann wrote:
> On 3/11/24 08:31, Dan Carpenter wrote:
> > The main issue with this patch is that it doesn't apply, but I have a
> > few other comments as well.
> > 
> > Why is Forest Bond not on the CC list?  Please use get_maintainer.pl.
> 
> Hi Dan,
> 
> reason why some omit Forest Bond is that the emailaddress seems to not exist
> anymore - find below. Can I issue a patch to change this?
> 
> Who is then entered to the M: in MAINTAINERS?
> STAGING - VIA VT665X DRIVERS
> M:	Forest Bond <forest@alittletooquiet.net>
> S:	Odd Fixes
> F:	drivers/staging/vt665?/
> 

Yeah.  His current email is forest@forestbond.com, but let's mark it as
orphan.  You actually have this hardware, don't you?  Do you want to
take over?

regards,
dan carpenter

