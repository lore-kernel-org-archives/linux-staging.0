Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572E91C13
	for <linux-staging@lists.linux.dev>; Thu, 14 Sep 2023 06:35:52 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31c5c06e8bbso528679f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Sep 2023 23:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694673350; x=1695278150; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0zNOGE+5MM6BEZnPWt6ReEcr8sE6fFN9dseyZd6cTxY=;
        b=f381SIdPO7RIMY2sSKwjUuo7JfnSd22ohbDgALu6wrOvL1t98ijtNt6O6vitj4IXy+
         UEdiXEBXF3PXBUmBqac+fN/J6XGOuHS6+36ZN8weuDif3XvlmFxUfpG+B56BAjkpFDFn
         xVnmv7Z4jOnEIh7ZrMpfKr7o9bdkQngVlbHiqTvcQ2o9/d+cX0qEP+bB1jxtMEXdn4HH
         Cv15n5CQzpnPqR/dpdbQ4ShCtmeQfWLTUELCd74HP6LEP91sIMXuafo068SeoXX+WILB
         cTffplqjNYVWhUQFWIa6+luxL/synDLlEBxy192UD7N599H+X52Cjx5ZLBqi+5JPNtVo
         IKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694673350; x=1695278150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zNOGE+5MM6BEZnPWt6ReEcr8sE6fFN9dseyZd6cTxY=;
        b=iJPYqal1B8BBAkssoFmx6NHiBdubFuhA0FRpeVoYqmaGeY/QWbubtPLg0HwL/kkYRn
         ej8cKrcdDKbpWY3o7CTPL46AnxkiEY8bv78KCsfDNHLwSo69mtrx4at+rgAFOtuipJNn
         x+zMxQX+ytwpxSmEUGSbdvGhjBpLgbmjuvH2fQnzf/Ue/qc/pNrdxDQy54tBrCTWqj6x
         pNufptOqmPi69BvhiaKefeDBfPK5SfLXQAAHidbX5P/PEgHf7+qTlawOMlJ/tFqn1htE
         i/4XR+2EC7FWx8+9Qn9/Xh2biNkkjS3b4iPWkRr7GPgO1W/gOiQYSxWWU/UpViKskRkq
         T4Lw==
X-Gm-Message-State: AOJu0YzlgL6eGCH+PHfiBlNmDDBAEmNGfLnQ7V/xsNrO4VSh9VJpO2Cr
	eT2OG2atKg/rH62u6jGdMYVyoA==
X-Google-Smtp-Source: AGHT+IFchjJOs01D7OSO6EJ43M0F+u18JLWXIlesmUdumSOf5TZW42BgtvIm+F/+kcsudif63vxKTw==
X-Received: by 2002:adf:f981:0:b0:319:7c07:87bf with SMTP id f1-20020adff981000000b003197c0787bfmr3724604wrr.53.1694673350534;
        Wed, 13 Sep 2023 23:35:50 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h16-20020a5d5490000000b0031773a8e5c4sm829543wrv.37.2023.09.13.23.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 23:35:49 -0700 (PDT)
Date: Thu, 14 Sep 2023 09:35:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [RFC PATCH v2 0/4] staging: vc04: Drop custom logging
Message-ID: <1d54715d-25f9-4937-bdff-de0136c95fe8@kadam.mountain>
References: <20230913185528.770634-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913185528.770634-1-umang.jain@ideasonboard.com>

On Thu, Sep 14, 2023 at 12:25:24AM +0530, Umang Jain wrote:
> Hello,
> 
> This series attempts to restart the discussion on custom logging used
> in VC04. In the last feedback gathered in [1] it seems that the logging
> would rather be moved to use dynamic debug. The series tries to move
> in that direction.
> 
> The elephant in the room is the ability of turning on/off log levels,
> which this series just drops. Compensated by a crude strings
> ("error", "warning", "info"... etc) for easier grepping.
> 
> The log category are also just strings (which probably can be transformed
> to dynamic debug class names moving forwards?).
> 
> To move forwards, I would like feedback on the broader direction.
> There are couple of TODOs in each of the patch (summarised in commit
> messages) which require case-by-case discussion.
> 
> Additional high-level questions to move forwards:
> 1. Is loss of log levels by moving to dynamic debug, is actually a
>    concern? Is dynamic debug a valid replacement?

Dynamic debug is honestly going to be an improvement.  I guess, Greg and
I said this back in Jan.

> 2. Whether debugfs should be dropped as well, found vestigial in [2]

Yes. The "vchiq/log" should be removed.  Ideally as part of this
patchset so it's easier to understand.

> 3. whether vchiq_log_trace() should actually be tracing support for VC04

That can be done later if people want.  No need to discuss it now.

regards,
dan carpenter

