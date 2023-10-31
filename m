Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE17199A0
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 10:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ELpBC4w0"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c59a4dcdacso77956081fa.1
        for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 03:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698748082; x=1699352882; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QaagOn8jPXjQl6PIIuGW+mOnt3BUe6CBcTW08fMQBa0=;
        b=ELpBC4w0byIjD76x9HBs8yhqTwAXZnBkhJEOOq4ca+eGW8lELWTbKyQsArD9oFCw6H
         YYxn5KqrynkS24sTzDM1lNhIBRhH7mTdvuSTVPXvAxxbw8E/G9jWzYMTaEKmus9ieE+V
         Chp3XsbTimfi1jQvFTqDsF+KTeZhGhCV7jAupnPKs8+1lpssSbGgXOT4b0BmWAAtExAQ
         hj5jyoCSclG0oglwid5IG/74D+28QluYq3NnmDdzAeJsXTI3bvrZRSM2EIZw2d264ToO
         /U+vx1qHIRFnRKWRQwGMc9o9TaIwaTh5sxvex8BoWub0t9Y/cu6Ad3Xp/ydtchB6ALAX
         CEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698748082; x=1699352882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaagOn8jPXjQl6PIIuGW+mOnt3BUe6CBcTW08fMQBa0=;
        b=c9O4vbQ60UGRXve0kZA1jNRHPQjYdBjczuyOxlXrDazS6C7QJRvD5lugyGFFucNGYQ
         1xRXX3qHsNLl0QlKm90o4X4mt/Y3eJR5Hb79mjQAHXCYUV2dYEGINpmYNaH8rkHJOowb
         E2zk9r5v1HWoAu/TEIacJW+FkKJqYwbOoKoqfFpkQyI64OhsqcqUpQgofDiIgBiwIEAo
         5zI2wmsaAYo0TEofVC1V6U366C0WzQLvtTPGkD5ZdK+0EwRq+dfKnA1OM6neeCP1neoX
         7nDLOu7gKZl/ojtYlUBmi/OK5KbxOdW1rOsclRehG8U4b699aq2lgoggW4rg0m18uoII
         lhHg==
X-Gm-Message-State: AOJu0YzARthIqEx3BKUrP6/vQTBYqpbo7rlDoDcK5qM59CUZRzMqk+8b
	HSSYxUBFVz+kOoyEu6lRVpIHUw==
X-Google-Smtp-Source: AGHT+IFMWkwmSW5SOzELVmhfggUt0jYW3qNZpAyrcPZw7EFRT9Ua080roa8h6HCZMYw5HqzBC4vqBg==
X-Received: by 2002:a2e:494a:0:b0:2c5:1a89:41c0 with SMTP id b10-20020a2e494a000000b002c51a8941c0mr8374240ljd.23.1698748082529;
        Tue, 31 Oct 2023 03:28:02 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j20-20020a05600c485400b004063cd8105csm1323646wmo.22.2023.10.31.03.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 03:28:02 -0700 (PDT)
Date: Tue, 31 Oct 2023 13:27:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rohit Chavan <roheetchavan@gmail.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: Added blank line after declarations
Message-ID: <d94519dc-8e2e-427b-9828-4f714d0561a1@kadam.mountain>
References: <20231031100610.5394-1-roheetchavan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031100610.5394-1-roheetchavan@gmail.com>

On Tue, Oct 31, 2023 at 10:06:10AM +0000, Rohit Chavan wrote:
> Fixes below warning reported by checkpatch.
> WARNING: Missing a blank line after declarations
> 
> Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>

This is a checkpatch false positive.  (It's not "after declarations").
Just ignore it.

regards,
dan carpenter

