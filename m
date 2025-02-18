Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91F01E5202
	for <linux-staging@lists.linux.dev>; Tue, 18 Feb 2025 19:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905693; cv=none; b=A/e6MrpjQiue5TdsUVI82XdyKpCAJd00kr2dMZBTaEmtsn8LwtgkShsZ0fBInbzIAn6erSmp6EaLN+R8tRLPY8oHC/qgmXiHxetYwRLqMWn3i+LTw+RyJz9diJ3Q+yZvgPbBzk9H21Jb01V3Z3oqcCLxoLb6R7nTUzRY3Ew2jK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905693; c=relaxed/simple;
	bh=qYAZTiqzP1po9iMBaj0lHNXjlSX1F1TWryWziMbjTVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJ3aJTiltIg6e1wro4+JjUrfyS22g1H3neQJd2E9sibgTYJqYTYh830pEXjXj6T+ow54CNQ9EUavEXS42yY2mhLx6IbM9+MzkUKH3gEf8zNzU5xlhuXTYoc5XJOyzs04ZoynDcqB1tN4Yk2oLyedE/MA5d6z9APnwkEqRLo415s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mf8SuruL; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mf8SuruL"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaec61d0f65so1203368766b.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Feb 2025 11:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739905690; x=1740510490; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rNsBxEX1Tk64WX5P1Q2cqgd6NAXQLvCCopiRfOs8H1Q=;
        b=mf8SuruLNCtIGRiPEXayoRIPHxaQjjRASZZgabzgspdNzVNXF96RJh0I2TDNRwL/Dv
         rc0sBGZaUXSyTDrzbLuQpBdRoL/ShK6Fu9L/rflaMFecYTzu6I6FdWVf80FWB2Z/xLCG
         liNkwBrtwbf/hGjx3zvcxdAof/IkOrAUdBGGBgjL1fgcI8l6ttTL/PDagwZRqedwrT1g
         gyapcI6C8yBLd/UOD90uWWYB0PAZFOfJl48If41TcDjYCdBPaJ6qzVHEiOXcSCkTm7EU
         J8A8cGR5cW2oUbhHRVzp5mRrVopPHOYWiM2fIvGEGuMnKShAlc4nfR+zu8ImybyN/xHp
         8qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739905690; x=1740510490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNsBxEX1Tk64WX5P1Q2cqgd6NAXQLvCCopiRfOs8H1Q=;
        b=QakuF+nnCcDfRmKsq50YXyfMftSCkpKTj8KoVgpvf+MvHlGyS6G4VU5iFcVoRyxVdG
         wUsAlhlXUH3JDXVASEbLY1KqQbv6kD24tx7UUl83zDoBrjlXQfbBZR6ZARPhZ53mw89c
         rPsWayV6tW655YqdDuuBaCb+8t2UHw78PGhQ4u8bzsT7anwjEpNAhGR9XukW3InqzdLx
         ixttQqckOKZ4hmsecJJfkv34HOEftkwXm+7QA46FVKWrCWPuKEoXjBmU++CGTRS1ZhZl
         0s9CX4ZFT+BaoP42DGERwtU6E8eEBQwb2QYKGkbKEJFXWcSiFzOHsYJ9pRScLv5LWQDg
         m7bw==
X-Forwarded-Encrypted: i=1; AJvYcCU+MjwoKjfeXhgOO3+0041/6s524q/pfeiPyBJFnuQ3QMeFCmBcInYa2PhX4sul0f2DJFk0l932U1suEa0R@lists.linux.dev
X-Gm-Message-State: AOJu0YzMhnJ7KltZuT8CVi4pI8R4JqIXsgDWQipVGbccXKWtaIlNrs3Q
	l3JFgf6nfRUSU+3ETvWBYJsxwqcCylFvpbfGTjAvNq2aoyHC04pQ8Z8iD6ZG3/A=
X-Gm-Gg: ASbGncv/DfWTbSxcLKCikFOMcq21X9i5vptsWaTNrsO1lNdyg8rprGxQ46uh5QlEzMZ
	3ME+YuFmxlntn9575jM0lAUBXGTqXh4OhWJhtlTLOXwS9/+xGpCKlZ6Fq4UxR04ctwDs70rEKoO
	jWU65Gd20SMuXaXkrn52igBCwzfH+Pe+TUns9QuMDCRcmKM5XwcCwdrybUVwEwM2QQgCONO1dcE
	rnRLQZJYydEwyEEvkQ/paiVggVxXGOfI3SQshjnoYHvbxr5kj9Wqj2T/xxsorpEbi7Pepjph75d
	XYs6+wFEemIT/M44goz8
X-Google-Smtp-Source: AGHT+IFlziriHnAKD1HuHccq2KQBzmgCVFxrmvHg/JF2Df2oa6sJkUNmECTIl18g14D0PF+iOjDlAQ==
X-Received: by 2002:a17:906:26d3:b0:abb:b1a4:b0fe with SMTP id a640c23a62f3a-abbb1a529b3mr486697566b.1.1739905690148;
        Tue, 18 Feb 2025 11:08:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abbb0fb63ecsm244309466b.115.2025.02.18.11.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:08:09 -0800 (PST)
Date: Tue, 18 Feb 2025 22:08:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Madhur Kumar <madhurkumar004@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: Fix CamelCase issues across multiple
 files
Message-ID: <6259457a-3a44-4b02-bc83-19eb1fc05e49@stanley.mountain>
References: <20250218184343.20585-1-madhurkumar004@gmail.com>
 <20250218184343.20585-2-madhurkumar004@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218184343.20585-2-madhurkumar004@gmail.com>

On Wed, Feb 19, 2025 at 12:13:43AM +0530, Madhur Kumar wrote:
> Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
> ---

Quite a few issues...  Take your time.  There is no rush.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

