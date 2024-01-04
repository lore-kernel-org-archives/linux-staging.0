Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9447D20B1D
	for <linux-staging@lists.linux.dev>; Thu,  4 Jan 2024 10:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ba0FSYxk"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5570bef7cb8so235552a12.2
        for <linux-staging@lists.linux.dev>; Thu, 04 Jan 2024 02:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704362672; x=1704967472; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d1rX6LIIBT0bJ+f5LqsiiirLWt5Scgx/ZLAmvrn5Vnc=;
        b=ba0FSYxkfz+DBHsgtixkCXatoVqtW+MuWnBsidcdcF7rkTUM9yu8BbBek3Odq9e254
         djNKeDzjCx1nK5u+XRzaiiuWbVyAvbuobFAyuz2wFkjz6oc0IMwc0eGolF5xOm/Xel6H
         Clqx1+0v80ejkVx4yE9JWAXCFbzXhdLbu6EU1B8YXoVb4qzdKwj0t9ZKeYKvrBF/68iv
         LQaMeonWAiXULcKp2E+vNWFFxmSorBFFeIlLyriWYvveOAr/puDtfMeK9DR0Tq1b5uCU
         sfsIncwHmM3eDo/37aeoZU9bQuMXrb58cKf5Xs0sJ8vqVTorgZ6vHwIfLKxezVuW5jBc
         lu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704362672; x=1704967472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1rX6LIIBT0bJ+f5LqsiiirLWt5Scgx/ZLAmvrn5Vnc=;
        b=W5C2vCWuI/HLKS4003qZoXyPCiCwBQnZz0orObSqfT+LQW5yDE12f9U5QO464xT0o9
         xJpr13rxVRXpUyP+dmqYOoxCb53OsU4ssbvE3pFTg9+kHGMJJYTVqFxlQebrrSaLn0hx
         zoLbIfFa/dS9Mi+RkT+5SrmIQ1SRFPw4+HvuDB2dLOzSUP4EHO6Anrp/aLTVPNcf49Vq
         SdN5nhKcN0WxxQl+w3a07Z/xTwk33tZb5i29RPKNwnDfJ4bWsuv9rdWDwAzPMiUE4Jqe
         LM+rZtjTpSWMoUhXNxz/PC6IQl8P8IXO8+Dsz+gw3ZcSCnS+KCZRHkBz7X2Mx79pf3Qx
         4scA==
X-Gm-Message-State: AOJu0YzUE2UV8cDw8VI53gkT4nlVEd9VqgNOhZtbkTsl2vQ+FiI1UNPO
	f4Ep7RaoQ9LCpg0nSnIGsvUuAfTHmYLBYw==
X-Google-Smtp-Source: AGHT+IEWjOWS+iJS3VKXtHcdRKJTlTSCqeub68dLNbBbnnO+iXKNUFFkecaVunXmV7+mtf/AHSr0rQ==
X-Received: by 2002:a50:9b09:0:b0:553:6c38:148a with SMTP id o9-20020a509b09000000b005536c38148amr255183edi.39.1704362671711;
        Thu, 04 Jan 2024 02:04:31 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id en22-20020a056402529600b00553830eb2fcsm18450686edb.64.2024.01.04.02.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 02:04:31 -0800 (PST)
Date: Thu, 4 Jan 2024 13:04:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hidenori Kobayashi <hidenorik@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: ipu3-imgu: Set fields before
 media_entity_pads_init()
Message-ID: <27f1c487-78cc-4e56-ba79-1434aba131fd@moroto.mountain>
References: <20231228093926.748001-1-hidenorik@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231228093926.748001-1-hidenorik@chromium.org>

On Thu, Dec 28, 2023 at 06:39:25PM +0900, Hidenori Kobayashi wrote:
> The pad's flags is checked in media_entity_pads_init(), so it has to be
> initialized beforehand. The ops initialization is also moved together
> for readability.
> 

How does this bug look like to a user?  What is the Fixes tag?  Does
this need to be backported to stable?

regards,
dan carpenter

