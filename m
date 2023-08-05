Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C12A92A
	for <linux-staging@lists.linux.dev>; Sat,  5 Aug 2023 16:14:35 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9f0b7af65so47861411fa.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Aug 2023 09:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691252074; x=1691856874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4X5LeqFwRZ12z0t0SRAdd4hSB7565qztxHR0V8YIUsQ=;
        b=ZdXi5xrrQrMtP7oPExcSSvfWcYTjypvLAPSjl6TaUplewzQ3PZg1/F8E4b1DxABhK/
         eOpiCyCZzJYxQlGUdxzei4fKwD6Jlp1PYfStSdRLtJY4zXbShncJmrFN/9n5MQhmvbx0
         hCEeF98ays3a0OaJ5kIQbbOfUp3DoxRzwsafdlVYOX1lvk9W1s1QrPpRIV+XLKtImvU5
         Nd0Ji4MBd1kDTvqVtRCh/QmC99O2Tnp0onrQuV01AjIQ4fBkVJgam7YDxuf7Pzz+ILmP
         QoQST+xnqyhowG59TMHZFRGNX9DQ8EMzBAfk5FsoMgu2V80xizPthQcFSpV0dYZOJiqf
         WT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691252074; x=1691856874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X5LeqFwRZ12z0t0SRAdd4hSB7565qztxHR0V8YIUsQ=;
        b=c27LdYykseVQFfUcwvGxjjsT9K5QDnKYw7rIaJ0Vo022YrMhR2Og8i6ZbpIxiHteWc
         J7T3NPi/WWkGcnU29vG7bMx800RQLRs5YWJrrf3UwZkm0tk2k57Dk5HrCVbI1t30rvbS
         Q/AnEE71HcBKoPkajzm+4yErwdjHVRU0xEaf2PZ2O+xtjmbRWdMb7WsACTWHtRRCvgCe
         XjwGtWhCE9X+Z9UHQrmP/aQyRbRQUjCJv4kcnr/3IOt/sJ7o/UqoGHdoTwey083xaS6H
         KTAXS7Ls90+2WCVeJQvHTcpzm9pDTEFirfDGZTTTktigZPis9UxfvXfAIqGdvcV+UQ6S
         mA4A==
X-Gm-Message-State: AOJu0Yzk6dEW168zL9oQ4YKtgCwOGPD654GG0AjLdpJUhV6ceuj31aJf
	CCXTXGA3QrhUIRFCOjJMSsQl4A==
X-Google-Smtp-Source: AGHT+IGtX5wIfl3tY9j9ku33ZEqA5uzIH68ru1YtY4ppk1a7rI0YhJOPsqCGL7ic5oeTID5GaICrbg==
X-Received: by 2002:a2e:9694:0:b0:2b6:ec2b:7d77 with SMTP id q20-20020a2e9694000000b002b6ec2b7d77mr3221194lji.6.1691252073817;
        Sat, 05 Aug 2023 09:14:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r5-20020a056000014500b00317dd7b96e7sm1554508wrx.23.2023.08.05.09.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 09:14:33 -0700 (PDT)
Date: Sat, 5 Aug 2023 19:14:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Madhumitha Prabakaran <madhumithabiw@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	ivan.orlov0322@gmail.com
Subject: Re: [PATCH] staging: greybus: Refactor gb_audio_gb_get_topology()
 into separate calls
Message-ID: <553ef4ed-9f0a-4ab1-b7f2-0175f6cb4dca@kadam.mountain>
References: <20230804203134.GA618419@madhu-kernel>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804203134.GA618419@madhu-kernel>

On Fri, Aug 04, 2023 at 03:31:34PM -0500, Madhumitha Prabakaran wrote:
> Refactor gb_audio_gb_get_topology() into separate calls for better modularity.
> 

This is too vague.  Just say "There is a comment which says 'Split into
separate calls' so I have done it."  But actually, please just delete
the comment instead.  This code is already an endless series of wrappers
around wrappers.

Also, please run your patch through scripts/checkpatch.pl.

Btw, I just want to emphasize again that I was 100% serious when I asked
you to delete the comment.

regards,
dan carpenter

