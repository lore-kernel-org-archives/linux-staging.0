Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959001B86F8
	for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 13:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723813752; cv=none; b=nQ8cwAbXWMiKWZ++UNFYl5Dl5z255rdD7my75P8mFUHsMoAGuV6qafInPgsaGxOWffnfZ3sihSgLQk2pnDzW2DiD+iGdzpzf7qRsDgChD8nb0ZW+Tb3vn0LhG8IQPGyY6bI3XyPG3Qw5LRQiJupog/mWruVsJcHNduVgG82VX5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723813752; c=relaxed/simple;
	bh=hV61UEsZvxQXAH//23EBTg5Dfv0U9kPjQojStjFfjbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwDtrYh1vDKY7ZzqcVN21elSch6t7TLHoj2550ZwP9oOemzRvns+1Lm2ssU8sbneRSpGh1yUCirQqSDYIKnxLq+q/bsV+1Ddk6OGnc8AvijmuA9oXGt7pE14T8uFfcnUl0TKdar/0UR5ksJRIe/cinexZ7+elB2+PGwEx/PVyfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=werAlJ/F; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="werAlJ/F"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428243f928fso20058705e9.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 06:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723813749; x=1724418549; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I57ivJzE0S7Jyj+4EZvgDuynmnlEVJTzFHiR3Sj8E/Y=;
        b=werAlJ/F/rF11jSdVliVV6BoRzYy50/lhnuBHnfhRoxjTefgK02NRg6RjIfjCjaHAL
         vXQZIsOdhUscX41hcTU1btG3OO99k8pr512M9GXP4BojrFQ9gPXDxOqLfy7bpYwuoKLm
         LqBUywDfEeVcytrABfAPwQYL6wUuQ5rVGbWX8SHaNNhz4tACOzWh/k9tgK+ztgpONeiv
         DbyAFZdlsO7h4ULVWmTvGQZgFKiAatAdnzDTG2967h+TmxaVuMq2adJca+HwSiStBHR5
         4uw4SqkBZbvyCQYg0XXa/MM8mKCc/sCWI5l5cJyWD0qExsT+EkdwTw/pYZkFYOAn+jFM
         mkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723813749; x=1724418549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I57ivJzE0S7Jyj+4EZvgDuynmnlEVJTzFHiR3Sj8E/Y=;
        b=ZC/ytMdQvkHzBLIUDTLhJOf/SE/A4XhM53Wl+r1XTdJvuJm71xQMf0lUW98YkzPR4l
         f/14hlY5ka6cYeGP9rTtupSrJplkaiEQSHs9TfqPzL6yV919rgO0Y9/mewJT7S7BMtCd
         3vQSFgLB5GetPYGogxfJMygWDnct2NOEd2DR8Y576R4hReCuWDyOdP/XB4IZd69aEVK7
         IlrcIVPxwJ5MGkkZlb36n5EfwgWFDwlnMVXkxpYIUHKId8b9YM4QAIXZjRSuKT//6S83
         qTXwYND1DfOfGvovydzWZ+ckvgko/NGiG1A3w7ldLchZ3TkMhzrabUDSXN/UPhMLbT4l
         TMAg==
X-Forwarded-Encrypted: i=1; AJvYcCUS+jGZlbXdOirmBchYOlF4HcNW1gpi9OUpLldXwACSmMnnFV/EalWPRQWSBKvAIbO1xS8k3LWAdHwV+ZD0Fem+WpkQgg3VbzBdvPavTQ==
X-Gm-Message-State: AOJu0YzZsYXAedqjqxVKksf4685plmKFscGZiaITjagZ0MpFij92+aTy
	cb3vE7vu4xMnEv6Cm2gTRxOZhQ69fQ+2nbzPqK4cuEpjWfNBvK9zovDIb4B/n2M=
X-Google-Smtp-Source: AGHT+IGnx6kas1tzOJHAhP+U85MHgXfoWOwHa4tNkKg9SyOtPuPTLGnQgFkIbtCooFiXuJnYxwkOOg==
X-Received: by 2002:a05:600c:3ca4:b0:429:c674:d9de with SMTP id 5b1f17b1804b1-429ed78411cmr22492805e9.2.1723813748808;
        Fri, 16 Aug 2024 06:09:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed648e76sm22683515e9.2.2024.08.16.06.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 06:09:07 -0700 (PDT)
Date: Fri, 16 Aug 2024 16:09:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [v2] staging: media: starfive: Add the dynamic resolution support
Message-ID: <90939451-4e26-4aec-bf69-d078d88fb5c2@stanley.mountain>
References: <20240816125132.514488-1-changhuang.liang@starfivetech.com>
 <0680445d-1108-4400-b150-4804da63ddba@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0680445d-1108-4400-b150-4804da63ddba@stanley.mountain>

On Fri, Aug 16, 2024 at 04:04:38PM +0300, Dan Carpenter wrote:
> On Fri, Aug 16, 2024 at 05:51:32AM -0700, Changhuang Liang wrote:
> > Add the dynamic resolution support for video "capture_raw" device.
> > 
> 
> What does this change look like from a use perspective if a user is reading the
> git log?
> 
> > Fixes: e080f339c80a ("media: staging: media: starfive: camss: Add capture driver")
> > 
> 
> This looks like a new feature and not a bugfix.  Please describe the bug more
> clearly if it's really a bugfix.
> 

Actually the first version of the commit had a good description.  Just go back
to that.

> Add multiple resolution support for video "capture_raw" device. Otherwise
> it will capture the wrong image data if the width is not 1920.

Btw:
1) Don't put a blank line after the Fixes tag.
2) Put a note under the --- cut off line that says what changed.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Please send v3.

regards,
dan carpenter

