Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F321AE046
	for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 19:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960101; cv=none; b=oqo7X+z1dkFYoBpHnkm4osofgiQfiGK1QgD2kICoRQ/0643lNbJLeCqSQIlBnQIOONUAYGBeHVZE/1Ty29qRICcl5tKOE7iLetFpFsEUfZBd5Ter02WJITmVXuMmF3Oc1lbnV0CTNWh+vY/efmiYVW0fGAfOxD4WAmpeqxVszRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960101; c=relaxed/simple;
	bh=RIc3uiEi5hFUHQ+W+Ywrw8vY95ZuV8nWSKks7hk1ptA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Si5Jg9yQ/i8K2NpspoOvuHdM4kSsAWVTXuf2GAWnJzZGiSUv1X0KaC9kLSkrePBEgjq376a+4N7s+S2OeWkF6QwmSh9COB81B3l18EWd7uGGqmq1ym3fpm+hVldcozgGQa+duI/330ip+/9DWwlu2fyWEHnHB25IB00CQeAEMXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BIfZiT7p; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BIfZiT7p"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3717ff2358eso667130f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 12:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724960098; x=1725564898; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ul9VUTXGL81P74c3MJMKeDU2A/cBzh0fq7mXGOHoEnI=;
        b=BIfZiT7pgnnATCgIRItAUEn+wct6Do4okX+gKDQmwh7KoJU9eQFUmAZfzMpLNeEH7b
         uP4rBuqbApi3Yzkv6NXll80eJzm+78VzYgzrSxO6GaZVDPJI4NtfQ8wbmmG5fdMpDyk7
         uD7a/cSYmuT+Djvloqso/C6oFMQRHJUfj5+LBL3tiALI+rHArlS/raTtEbiBwGNeMtuD
         Knn+CrMvYpWVI7CCDBCELp0xNAsl6qT6xSNA4xhjNoEgdsgnrIzNGjHED3tRTaVg2d1Z
         qIC1GBZEl1yLBBTxWITTT+8UCRcHfNDyW9ZQG525gcBXbvye0t2QKKbLyzVudYL1kfUK
         OrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724960098; x=1725564898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ul9VUTXGL81P74c3MJMKeDU2A/cBzh0fq7mXGOHoEnI=;
        b=aVSEaw2d8VZGoznBm3eHIjM0cnEJCGERXQdwGYL9+VF5GlzRQStEeQHWgReXs7LWMp
         4u9HdCggyidGhxzBHb0X2yOBWxpFMKsf2GOLV2rtEeNfypbQbQlTrYXgKyBh3MXgBPmd
         YzW4tdeXr8kPM9YQZ/V7xEVanAYvvgYzBIlih2nG+d5e5nI7MyjYAl8JhcvJ/FhyKkm6
         Upbr+WS8rR+bPuQjKLk4K0jOOpLqlJrME3D2b/Vle1yw6BjSSGiM2f8XIatomAE8xh8L
         gGDzwMQyIqieC9jQ3W2k2hTSvvmVo369vx4gAB8g9Skoq5iGAajw6ib10sW32feGbiVt
         W4ag==
X-Forwarded-Encrypted: i=1; AJvYcCUXRC/vvDBA3O/lc+bp35csSJ5MB7cMjuMi0ZEo/TLPfx0ctxXx772ib/p8VgNvhllZ6HCmYWkjhRXnwTFR@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5015Vhnacj2JS+u+sVOf2Sw0J/8J952c1icZbNOyqUFYGJJKR
	dRKXlQXDVn9mIeZh3YVP8ApLHNpiNj73dprYK/fFkbnOOqcRu/LPew+TE+0Btws=
X-Google-Smtp-Source: AGHT+IFLxHgN97pV0OZjL8rF5iTzoHIZcryvQw+TfQUbmMgFaxMAn0TsMg6LRyCZTDhCZXw9gtnqlQ==
X-Received: by 2002:a05:6000:144a:b0:371:8af5:473d with SMTP id ffacd0b85a97d-3749b52ebc1mr3061727f8f.12.1724960098181;
        Thu, 29 Aug 2024 12:34:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ef7e933sm2136404f8f.87.2024.08.29.12.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 12:34:57 -0700 (PDT)
Date: Thu, 29 Aug 2024 22:34:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Manisha Singh <masingh.linux@gmail.com>,
	florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8712: Fix style issues in rtl871x_io.c
Message-ID: <497fbcd8-2984-4be5-b877-1dec6a8d7bba@stanley.mountain>
References: <20240828204552.26790-2-masingh.linux@gmail.com>
 <607b86cd-d89a-4072-af36-ce2ce5c1f7fe@gmail.com>
 <daecc634-4faf-4dcb-b03b-f57f24673a88@stanley.mountain>
 <01183b3b-b8af-4451-8b52-e7acd0b4a9a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01183b3b-b8af-4451-8b52-e7acd0b4a9a5@gmail.com>

No no.  The v3 is also fine.  Let's not stress too much about minor things.

regards,
dan carpenter

