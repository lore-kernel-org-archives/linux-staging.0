Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3B740848
	for <linux-staging@lists.linux.dev>; Thu, 18 Jul 2024 04:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721278075; cv=none; b=t5U1UTMhtZ2+U7F50Uokq0lUh5eRIXaHu0GKLMa4njXFLwH7ptDsGUx3MXUhhHFcNucC/MJVhrFpJVyzBHYcqf1bIV2w4i3rBThjfqo3VWexG7u6sTjyIV25g75u2NLCb81Nm/AZHAW28lHj74hLpYQB6W2jEVDciI+7+OnleDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721278075; c=relaxed/simple;
	bh=dM9j5S96Ce7No6B8g6jKga8ne9oFjdCPIu/P472JdCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzHJjfmAeKsNhWePkUsTMKnpxNqs2PNy2KxDGW8IxAWYiit7aUzfzHKYxCce8L6oPZ+7OR8so9c1VrodWiUuZXcMgQWTwBJ331EQVC21C4CXAZv1/NRLLGzzgnJOv2wzPjuyO2LbJL53zyrE4ME2FOhtY86taGApvJfSqFtUxs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=okT40GN7; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="okT40GN7"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d9c4887533so221718b6e.2
        for <linux-staging@lists.linux.dev>; Wed, 17 Jul 2024 21:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721278073; x=1721882873; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YEjjR4pJru8BJeimkJst45rGQ1t7SyphlvqL5W4Aano=;
        b=okT40GN7aKCabk7cdqAn5FdYIvqeNv7dtNYEFAenycSLlzXX+jSAF/m4XkOIHuHfO4
         TKz0S8TO+Sm+x0EnRrA05bf7IQbhNKvoH7jAM4DnKqarv/4HYrmf1g71ok+BUzYoM30W
         JakDIc0XJlyQ1KxVsS0JC/27l9qhCqBKZm/WezclNUdDE/GDnfcx23kstRSrOh/+KamT
         nPoY6+kp4Sor41xgVoVbo3WYeDSxUdOUkEB0FiNQ7DUHxRhDXSiVxl5AGlCUEu/Y4bYT
         x+DF4JygcV5MGs29gF33kBvg+6T7HItr53j9G/zY9HaxVEYv/QHZ9U5/QfKBaMXSRZut
         W5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721278073; x=1721882873;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEjjR4pJru8BJeimkJst45rGQ1t7SyphlvqL5W4Aano=;
        b=aQOJDS+pwEd6aPrLnH0ksOZTuEHimQHWyTBLqar2HNTD5yDr8fmAeEJaFipQn3mze3
         Et4yalRlB2ncvTPTqnLYV5UzufceVhjboJJcFH6cGHj5DIAEVsvtIoT53Ke8mps7i8eR
         o3oGpStKxCw9ik7Lt+sELNLzJGwzu3MFSioflBzJJomiqV6f1EQCLMfrWKuJgKtp/Gi7
         gsF4Z90n4oOxWe8eGaIp5QUXbeq1y7Bm6a2Zry3dEzKyrEbbdFe6zZhABJuOwVKyQQ0o
         N7PoORRZ/3ut/r91/ZcDAD0mXSCflilwFQeUtOu3TcUdfYM+IDFXo6H9/LdB9UK+bFnq
         ZOzg==
X-Forwarded-Encrypted: i=1; AJvYcCU4o/eUv8ri0hjuOL9WjMrYtc1bVTJeVoeCphZa9Y9Hfr4hlDtur+5M7CWZlZ5+xYQJsR1Jo33b2Ct+mB4VDrEXCsMrnlkg0CnS2qzQ9w==
X-Gm-Message-State: AOJu0YzHWJpU40IjqlvRQRcCihR2zU8NO0tv/hDncGU0AocLt2BODKWM
	Gu8LWHIySDBXWj8zK56TqShvM3QvXVWzYeuH2S7eOLSYbUgjX0qSFAz+uoF4scc=
X-Google-Smtp-Source: AGHT+IF7DJeOUaSHILHt8zGDWOZuZb99LEvSBbYC8BNRtyvtvlh/dKMmsUkVWsrC2KXScVmAfxsfIw==
X-Received: by 2002:a05:6870:214c:b0:260:f50e:923e with SMTP id 586e51a60fabf-260f50e92e2mr530155fac.37.1721278072649;
        Wed, 17 Jul 2024 21:47:52 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f90b:a43c:39d1:be63])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-260efc5a665sm206314fac.4.2024.07.17.21.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 21:47:52 -0700 (PDT)
Date: Wed, 17 Jul 2024 23:47:50 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Juan =?iso-8859-1?Q?Jos=E9?= Arboleda <soyjuanarbol@gmail.com>
Cc: gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	johan@kernel.org, linux-staging@lists.linux.dev,
	pure.logic@nexus-software.ie, trivial@kernel.org
Subject: Re: [PATCH v2] staging: greybus: break multi statement macro into
 multiple lines
Message-ID: <c9b9919e-f470-4120-8039-08dc791c58c3@suswa.mountain>
References: <2024071723-nurture-magical-7817@gregkh>
 <20240718033207.333591-1-soyjuanarbol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240718033207.333591-1-soyjuanarbol@gmail.com>

On Wed, Jul 17, 2024 at 10:32:07PM -0500, Juan José Arboleda wrote:
> The macro `gb_loopback_stats_attrs` in the Greybus loopback driver
> contains multiple statements, which should be enclosed in a do-while
> loop to ensure proper execution and adhere to coding standards.
> 
> The latter is not possible as the macro expansion will create invalid C
> syntax. Theres is not such thing like inner function definition inside a
> global scope do-while in C.
> 
> This patch nukes the `gb_loopback_stats_attrs` macro to enclose,
> addressing the style error flagged by checkpatch.pl.
> 
> Signed-off-by: Juan José Arboleda <soyjuanarbol@gmail.com>
> ---

Sorry, it's not really important to follow checkpatch.  Checkpatch is
just a Perl script and sometimes it gets things wrong.  It's a tool not
a king.

regards,
dan carpenter

