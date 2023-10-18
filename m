Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25FA1803E
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udXI3c8K"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-507adc3381cso4653427e87.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 03:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697624250; x=1698229050; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uMF9+XVbotmwlZkgFVQV7OtJV2XJqMd/UdMT31C9cZA=;
        b=udXI3c8K/pWZoNZNcDNGITomdovn/hvkPpmt3b2HGGmvDyOupw4ukGJ7EnBYpwKQE+
         IJXkcN9iHuVuZoYS1hqjJ4wl7nCUZzG9dXvytHN9oQO9jFmAuiQ/nxnrqTXgYXEd/EHc
         /Z5W1ySPL6xBvWRs6r3G6awyhcLVTBZN69D5OZoWvi3HZ/rKl0VkbgujD1BG4zaWDH3z
         MyTG1RgVJliV6SJd1Vs52/BpS0JU+A3DG6bQXoNv6bsbIZlsK3mxAcpQZgP0hPtkSTvz
         vq82CJIwSu8txFlejc7QOJpx5S95KUUgnvYJyGFj9WIXvzT4Yluhruxd7+s6rBDb/3B0
         A6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697624250; x=1698229050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMF9+XVbotmwlZkgFVQV7OtJV2XJqMd/UdMT31C9cZA=;
        b=c9Q9eRHZi94FYTVefcSFKCVlGr3Mi19kQb5jtJlaRzKB71udKE+sMgw8vYWMzHlS1L
         3IYEPRQdX3YDaFvPezRSIzl1u3ART5NNuX0qghoSfBDyuRtELOkgZDSX+BtKeRZIVTZs
         hNjYnvWtunS/b+VbkOtQwovA6bmAB1pvGPM+8p8KZ9KkKTFdu2CsMVOgtCXaHfmIdyA+
         DcALzKLPwabTR7xx6lcy7y04uM70khTHdXjWCcyutmJgGVPs4HMTJlei8IMIoshc9fNu
         oOARq9SllafpsLmpDIRaEovg24pMgrVhqn7ftG1RgSkv0FN6bD4GmZVM6/ghXu8G7tog
         TIhQ==
X-Gm-Message-State: AOJu0YxQWVIm0bL7hqDuRQYu2p6XCsbysicZz+53JZ/UALFqVWpBoUuN
	OOrBjSxJmEFwTAVG1RdoCy+QYQ==
X-Google-Smtp-Source: AGHT+IHuHf/vAVlD/nYzbbKTFIUa4gHdOV6nXgpEc3kC6Vu1Tngn0aHuloTkDC1Ihtka7WkYH8MafA==
X-Received: by 2002:a05:6512:3b89:b0:507:96fd:d3ee with SMTP id g9-20020a0565123b8900b0050796fdd3eemr4498644lfv.32.1697624249706;
        Wed, 18 Oct 2023 03:17:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d4806000000b0032da75af3easm1786409wrq.80.2023.10.18.03.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 03:17:28 -0700 (PDT)
Date: Wed, 18 Oct 2023 13:17:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: gustavo@embeddedor.com, outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: replace strcpy with strscpy
Message-ID: <e6c2d522-8770-4e94-81cd-5dedf91f5f32@kadam.mountain>
References: <ZS+Jb2rQWbOIIQ42@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS+Jb2rQWbOIIQ42@lab-ubuntu>

On Wed, Oct 18, 2023 at 10:29:51AM +0300, Calvince Otieno wrote:
> Checkpatch suggests using strscpy() instead of strncpy().
> 
> The advantages of strscpy() are that it always adds a NUL terminator
> and prevents read overflows if the source string is not properly
> terminated. One potential disadvantage is that it doesn't zero pad the
> string like strncpy() does.

You're not replacing strncpy(), you're replacing strcpy().  There is
never a downside to replacing strcpy() with strspy() beyond that the
secure function is probably slightly slower.

> 
> In this code, strscpy() and strncpy() are equivalent and do not affect
> runtime behavior. strscpy() simply copies the known string value of the
> variable driver_name into the fake_bridge->name variable, which also
> has a fixed size.
> 
> While using strscpy() does not address any bugs, it is considered a better
> practice and aligns with checkpatch recommendations.

This analysis does not say where driver_name is set, or how big it is,
or what the size of the fake_bridge->name buffer is.  I would like to
see that sort of analysis in the commit message.

regards,
dan carpenter

