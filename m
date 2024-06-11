Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BA179C2
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 06:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718085876; cv=none; b=fIoiLm3XbpiF9JsEtz88nggieARbyxkMub6O7TxebaNH5ZkUURb8OluFwQJ4b5pCEBcdpHCxq/rrhk/4BxIxv+nGCERC+I7OrWoYAvqHjDw+g79gJs1NBSDzaRTzNbloIhmQkO2L8PdkyLYsmpTxMrcKCADnXEgZ4miDYglfMNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718085876; c=relaxed/simple;
	bh=SBOh5FMqWjlQnLRCzPkRoSoXGpXY/Kx1rplBIzP/Kpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vB+DvLxIcXhlggAg8D1kfIn+FPUj1KNfY/85166EjNtfO1kFvXlfUVU+p46H27HAQpzjyc2mdbuVYdHvfL20STf+0X8ALNwWF4kjnCo+lBXRQwlooCwlXxCbAk0b3XJnmKZ85X8ojCJrU/Q6in2hdQzTCSvbiIwSXrSklZhju/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jcl5CTSf; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jcl5CTSf"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52c32d934c2so2782981e87.2
        for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 23:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718085872; x=1718690672; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yAPZO3yTkrqMJ5pPtOySZTxQ0ESxWcduJjtdKssr1x0=;
        b=Jcl5CTSfIg3Bv/st+eI3STs3lQttc0UC1QWzX93YnAlpAQMzzTHtRpF/oQng5n8FUY
         FVIifuG9l6BkzCpDVLNL9sf2raje0VqKBJpcmAgc6dH2u8WsVFIKzIlm9rmw0C2Ug3dz
         XaRHJF/TC5sehxfoso40HSjfo8AVfXh7IQwN51/7ngUM2VlIMK91q7FIfB72tRAg6zNd
         jriritl8sbWu5xl6Wipoa1CxjluHh412iU37qoUOTT9elkkTicgzmYYG+wVfqDoAwmQg
         MUNCZdWbVZ3F233QNbMo6nZLOTFLbIJGIEpGpZd3305km2uiYPNeTbI0ZzPFGWFHjGcI
         ljqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718085872; x=1718690672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAPZO3yTkrqMJ5pPtOySZTxQ0ESxWcduJjtdKssr1x0=;
        b=QoFsZGZoh0kS2h39EDXR5xOWAx6gvWYEcvur4G7mriAbNOwAyB6jQAKEfXljq9JhQM
         rAr34oVGJM2Czu9VFTbupnwaBn+sEwGnfcORSgsrR1HelS6nrFwc2lwLoyrXO1ZCwkfp
         YYalzuVSIJFp9Hjr1tnzBQ57pYUGqJKET01VPCQvHFGRNYLxNfkTBPvtOIspdArmZDj7
         9yN/xpXx2nML8gfGXi28+p69yIKXCuqAIQRzApe/5ce8rtqMbTD8Vuo1U/iKu/VTYoCR
         bDmUnX4OYt45FkpZ1dWlk+A69alaXYMe2zQxqJhFSoamJuEfEQ0EYAUpZH97dQS84Cau
         VNHg==
X-Forwarded-Encrypted: i=1; AJvYcCWuBTFOGlZdFAbOWBs3VNvSHUUN5C/PfZIGCFBKmUirTw+FLNw2Yto2MWLRKxGlKX1UK4h6TE4vN/HJJGQ/W2EXRFRc0rhMmbWEZSA+0A==
X-Gm-Message-State: AOJu0Yxc2slLdNdmMXLBNBHMzX+9tZOZ2cKtiVV37csTjdR5zHbUSgKb
	yLqI8vX5WzMOBv+1SwlqQ6sGMHqwiZIPJQxDyo+OOP/lWyXxJEcgMcwN9yLFBog=
X-Google-Smtp-Source: AGHT+IGnLjRuH5I3DZyMOkcQJRaqyoOS3zZjJWaQBS2WlZZraSJ2sjozH7QJS+RDPy719gYBD4WbhQ==
X-Received: by 2002:a05:6512:3f10:b0:52b:59f7:7602 with SMTP id 2adb3069b0e04-52bb9f66381mr9382633e87.8.1718085872022;
        Mon, 10 Jun 2024 23:04:32 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f25dc3f07sm3798947f8f.79.2024.06.10.23.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 23:04:31 -0700 (PDT)
Date: Tue, 11 Jun 2024 09:04:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 07/10] staging: vchiq_arm: Reduce indentation of
 service_callback
Message-ID: <01190bf2-c698-423a-b587-c80ce5d92bb8@moroto.mountain>
References: <20240610210220.95524-1-wahrenst@gmx.net>
 <20240610210220.95524-8-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610210220.95524-8-wahrenst@gmx.net>

On Mon, Jun 10, 2024 at 11:02:17PM +0200, Stefan Wahren wrote:
> The service_callback has 5 levels of indentation, which makes it
> hard to read. Reduce this by splitting the code in a new function
> service_single_message() as suggested by Laurent Pinchart.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

To be honest, I liked the version of this patch which Laurent didn't
like.  Even after pulling this code into a separate function, I'd still
support flipping the conditions around and adding the goto...

Laurent, you really didn't like the goto?

regards,
dan carpenter

