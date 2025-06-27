Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2E3194C96
	for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 19:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751053540; cv=none; b=mAHM8FWkMFkgQXIPgNisBaiOhqXyV3PEISgUxF2CeyD19XaqcypLZ1Kia/K8b/+JFDizkGiBgB3oQp99rsH40wmEnOldTRolhPkm6DSWHziObTkSW6cwucVrI2kBYo6gzek46cU2tjaTAKUEMRcLqA5S+K8M14z6AagYFwXLLa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751053540; c=relaxed/simple;
	bh=QRn5xwx7XJKMLTne51Uubho7iQaz55Fgt6gUQUEa2PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTATuEU9PHDRaRvZ9+I42s1Xj/m+1fgy+KJSi8O1i6/VX80jfDy2KG/gFQBqMTwNRTtobR0J9bDOukVt6yRWQq/I85TuXKA1ZKXTV/Y0YXtnE3YgoFMZS108MKKPNn5enI8MSTuXw1c1NS6SO43n4qOkH8AJ/dplquu/h/YJQrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OWMr217k; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OWMr217k"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-40791b696a2so826083b6e.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 12:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751053538; x=1751658338; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1PHv1VdGkBxI9IqaoEgDKrlQycIIKb+rA84lWs0tETQ=;
        b=OWMr217kzZblOX4jrSreZxLsm8FCZmybg4JcOStowQAhUBJ4IYD88QxZVb8R5QG2P5
         5cf22pbfYp+hs9NphANomtPxZUATERK2YPtPR/lOmiWth7IelbJPIj6qWqxkSusyCa9n
         tNgIuBEkfu9KMYSXTx2pWKSvbSU/cpm5YNcYbi82Awk/4xRj7KtHjIAnNnjfs/VfmdcA
         AcMsG+eXP638IefN8jgZ8cEjy2p1+8vb9TiLvIiSBP6BHUa4sshls0NlKaqnHdKkdalg
         VgeyJ0gWuqI2niYHEvY9MF0gOhE38iBOQwgFAlf6ZMepnrT0qL9/gmviWCdqXSQIRx12
         EwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751053538; x=1751658338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PHv1VdGkBxI9IqaoEgDKrlQycIIKb+rA84lWs0tETQ=;
        b=oFo+MiwbzKWGmbqJfxBBEVdMf8sWKl4w9MSWkPT7InBGOUXPaIHNYjdc1eiy6dpTb7
         N6weFc2mS0zM7OBx8BXOLlzyO0cEkL6ngi2zD7BDECBKZ+RCLS4mUciBF/7f3EJhPXgm
         ruhGWoH9eC06foftqelD2bYngugF91r7UjqbI4xWMDdzkWlJx+wCSjKZyIPBBE7EeK9H
         ZD+emTiyb65vVtHqdrrp8COx80LjawxC/cAtA8K+LwwW5LoUDTNGMcvV1Ly+PZfK9UAB
         pZYRuif55pDD8d98eKUHwTgtw/ayf4KaKyxd/DswXhBumN2eyafCSTSDkz4QBKei59aw
         lrqg==
X-Forwarded-Encrypted: i=1; AJvYcCXtM8n6JqDElNHXi6ovBJqa+V+2O5RHMSlIDTe40bGvHh91zBghzbon9r2cfT94KNyiKwjktu+SJKzkULso@lists.linux.dev
X-Gm-Message-State: AOJu0YzwayAaz1uUZA3no/T11BVPetnPednJlm/sElr7xZxhayMtR5ss
	HySyOcXhjSdzSNw9V5/GX+nnZZpuLkdNw8E7u2BjrHBArh+/n9QYBPAbB4mCiaAU8rxVGHyehFm
	yqWv7ZmU=
X-Gm-Gg: ASbGncskVKnCHk00gJcnAFYKPAa5W4JH2C3EovpXoSwqN04pVzljJz1ZZdzHnE0L1Mn
	ioYC7tCET8Xu9FgK5vu7GgAjitFdZTcveyd94yPSWpZEJRxQgRlThVa5awe6KvZS2rafGVMEC6a
	Zb/PvdbeMz4PYRzfvVeFgylqmJ4b3HQ4vJApXobsJ4XVDDDATEDI7kuK0w2F1ob4XwZvGndk4Kn
	jGEtHu6zVuETn/bR+PR0b+a+Z9hmhrPxHMrh29psujbGk4/N8JxaQDaBFxQLlWumR/GmYtcPQQx
	vAZqTA6KHdRCftRnJ38pXlPDLMYsjHo/VZyDOdB8x6rwbVkH+Abosy87rJQ56dwXxN0l/Q==
X-Google-Smtp-Source: AGHT+IGOy33iVFqaz2J3YryBDyHCiRkin6krtfcbh3XEjok/Bk15oJetu93it8PEur2H1TKYtZrRnQ==
X-Received: by 2002:a05:6808:300f:b0:404:c561:6225 with SMTP id 5614622812f47-40b33e4a4ecmr3388652b6e.30.1751053538324;
        Fri, 27 Jun 2025 12:45:38 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-611b848b3f6sm312396eaf.9.2025.06.27.12.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 12:45:37 -0700 (PDT)
Date: Fri, 27 Jun 2025 22:45:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdalla Ahmad <Abdalla.Ahmad@sesame.org.jo>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] drivers: staging: iio: frequency: ad9832.h: Fixed TODO
 note.
Message-ID: <36b382da-dc1c-4aeb-add0-a96082ea71d9@suswa.mountain>
References: <20250627175114.548076-1-abdalla.ahmad@sesame.org.jo>
 <aF7kW6xRxRb0VN5H@smile.fi.intel.com>
 <AM9PR08MB6114261F0CA8CD89EC443E59A145A@AM9PR08MB6114.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR08MB6114261F0CA8CD89EC443E59A145A@AM9PR08MB6114.eurprd08.prod.outlook.com>

On Fri, Jun 27, 2025 at 07:29:36PM +0000, Abdalla Ahmad wrote:
> Hi
> 
> > Nothing of the above explains "why you are doing this".
> 
> The original TODO in drivers/staging/iio/frequency/ad9832.h was:
> > TODO: struct ad9832_platform_data needs to go into include/linux/iio
> So I guess if it really needs to go into include/linux/iio and ad9832 being a DAC, then include/linux/iio/dac/ is the appropriate place. Otherwise, the TODO note needs to be removed.
>

Please, change your email client to line wrap at 74 characters.

The way you quoted Andy's email it weird as well.  You'll want to
configure your email client to do it properly.

regards,
dan carpenter

