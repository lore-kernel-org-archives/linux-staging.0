Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5482366
	for <linux-staging@lists.linux.dev>; Tue,  3 Jan 2023 08:30:09 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso12325974wmq.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Jan 2023 00:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SxkhIR3WdUegYdjFr6N7zZV8KkU8dbXUnACWEfDXHjA=;
        b=U0O7Kcy3PsM1cJ4UtH003YPKItoLheviE/jyVGq0yMFPsjmCyJLCQObE1X0AKIVDEQ
         GQcpsDATHU9RK53so6RFr7TQAnykUobhEvxc6eUT/GURAk9b8qC9DBWsfSTwpXZvJfCu
         OtybD+KuJ5jecW4jaic4PQj2td/CSyxBScXmICI2T5Y51kM2cS/gqSeePGc7uPXVcqro
         ercmNRbFB3EoY+vvan4/h1TEGKzXsFirX+001fb+m3aQ+TeIPcFnyA/r5+ffi65Z6n9z
         MvoqMfezgs9eZXtOEzDqUbh28WSzkXMVVNhnV2za4dNJT4ynA1Uuj1gUzMg2eCO5NW5A
         o0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxkhIR3WdUegYdjFr6N7zZV8KkU8dbXUnACWEfDXHjA=;
        b=HUVYINcu6mHZ1ZmxnVluOnrTKXWyL5LEir7LtzW61lLtNqX1GuoVP6Nb9T+ljIE0LY
         8GoM4uZ6gKgvrfI96zlMST0vRkIA1e+9zFCgud0BWd0FVvmiPO+neY9ofsSycE3PmtT0
         2mBTYeIlFTyZRja+kuX3aWhrHENnPRe1vie8YIyOX+SzLJriVHKQOFI6p82J7pv5+GvQ
         dpX4/5toKpw2m1avP9oFtCyD4iv3oBs8/uI9TIqPi9+wgSTOiLGJJdbBZTk7as6Bt0mT
         bE56lZp96cO6782A9CBJrt82QFpcJ8re5Wod4FxxypUzw6UdiJ6isd/jwV6J/4xIsJ75
         ndew==
X-Gm-Message-State: AFqh2kqnLPoBZF+fBBh7ZUpPPdE+zIzlHlyXVjL2A1PY6QVRTjg8caSB
	OXCWpZADJY0bdhS0WmO20zk=
X-Google-Smtp-Source: AMrXdXsSKAQzDPooeHFHc9wCul2eM0IwEHdIsD8jnrUulL2L8h/jXoDmUJ8kfNBXnYvDd76ra/mKpg==
X-Received: by 2002:a05:600c:1d89:b0:3d3:5cd6:781 with SMTP id p9-20020a05600c1d8900b003d35cd60781mr29942129wms.37.1672734608066;
        Tue, 03 Jan 2023 00:30:08 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e16-20020a05600c4e5000b003c21ba7d7d6sm41943812wmq.44.2023.01.03.00.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 00:30:07 -0800 (PST)
Date: Tue, 3 Jan 2023 11:30:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] staging: rtl8192e: Rename TSSI_13dBm, Pwr_Track and
 NumTotalRFPath
Message-ID: <Y7Pni7tvFPhcz7bu@kadam>
References: <cover.1672330343.git.philipp.g.hortmann@gmail.com>
 <c7d3be41602e656170de46ea649b5bdf1081d5cf.1672330343.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7d3be41602e656170de46ea649b5bdf1081d5cf.1672330343.git.philipp.g.hortmann@gmail.com>

On Thu, Dec 29, 2022 at 05:25:46PM +0100, Philipp Hortmann wrote:
> Rename variable TSSI_13dBm to tssi_13dbm

I would probably have kept this one as-is.  It's not CamelCase, it's the
correct way to capitalize it.

regards,
dan carpenter

