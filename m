Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007D81A2C02
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722354192; cv=none; b=cvoOyI9bYrgFkRkOKpDHcbdOMJ9t8p+YLHMinHbKPAf4Ds3LWvTVBA6TeQ3PFMb9HKzwgRbyDouHowi8bws1OyQDn9oUdFHQNlB+ge8pvCj8MxTn+nzmlPYCDp2dzauHai+B9uq3s98XWJ+0T3NR8lu/jM0bBLG7IBxIKQQO2E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722354192; c=relaxed/simple;
	bh=rSvGfadipcs90Hv/YQ9X3+4TBeY+iyPipFcMLItNGww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvMF/geTjw4tPpA1shPBsXLvXK8cMm0Y7XLp7SMrL861FIVGdi2qpq2gZmvZABqnifqpoNq1Aap7neiBFhAH2b5WrXMpmEwT5HPVvbXAwRFvqJbk8hwUHvAto3Y2+ISXFkpOz+gj2jLbJLOW1GJ3oBmDkmPJRcq4Y5DfTdZ7NaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qX2UtaIC; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qX2UtaIC"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-25e3bc751daso3213480fac.3
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 08:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722354190; x=1722958990; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GZs3J/cTXLWFL7SSFr9tAI/IXhUTrybV87IR2TNiVLQ=;
        b=qX2UtaICB52EKDUK6Vcykb1CmQg0qMlIP8SahjA6RYxVHkVhw7FuwgU71tprERv0r+
         tRazh4UXf2FeXYDbXdG+4ZDyovf3hovcE8VQR6sygIpcTlAZfIh0Ph5RX9dAEiwsrIJ1
         tyBUhIMHyKur1wNKdD5yYo1BEUYg69uCUzzbTla2X7JjUZvBn4ZYMDFiIiUFEy5y54vY
         AUFqDNIZASKIbI931h1Bxyco7C9tCN3mQz/bHzdOpwFCqFqWGqWRJ/YAZg317e9BtfJN
         KlVG4NAXogxHQqVXLORJXUiWhYw3Cji6B9ah6ymteFrIBw8lAmSKqYhMAly84xZqT9uI
         Ms8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722354190; x=1722958990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZs3J/cTXLWFL7SSFr9tAI/IXhUTrybV87IR2TNiVLQ=;
        b=gfFxCY2ghNYWlel54IBCaVfJHBI2rlH8AAAoMe2R4VuVGrMcNsL0c0JNCjPSQn591w
         n2NmWEdoVO+1715896rzffffJ4gN9NpdnPZLZTwERmgdw+SdX611zJYRwBfP+zFlwSHO
         NK9mqtV847aq3P5BLmNZ4OZEoAPCc2qkTllfSm+CjsrZJvfq1KkkshfSatpU1hS1JNGe
         pbTsWyLprl0QK0pndIZs4VQqdfD6wC7PvU824ZRhageiLLZ+fptkBrXWIgqzhsN+zf5O
         ZpoLb1YdpTjI28lXNRLoopj1Gx3hXeM+EOAXS2ORvdQItD7mAQvqu0syhRB/TXfTRyGi
         cywA==
X-Forwarded-Encrypted: i=1; AJvYcCXnB55jJPJ9TOvNXan0PPqhlIT94DzQOQHHmiPz5+t9Zw0HL+J41y/DVTDPQ2Qlu0Qp2I4lwFarqW+5l2kHnSn27xNnxp0Xu1gIsRdUjA==
X-Gm-Message-State: AOJu0Yx2poSvKUVzFRaaAwbVVreXJrhMnffbWluI9dXNbd0xYkdkOeKB
	oro7JaWjNOKzyRH5zf0bvvYpbCCfyX7XI9pR0MQSWWTrV/rc0nh07Ci2sCizKeE=
X-Google-Smtp-Source: AGHT+IHyIFq/MJPHYNYxljNwR5PEhaFOsCTOZ+ANviYaWzIHF0QHtuX7rhJ3Yvr1fkY/b9wA7vbcGQ==
X-Received: by 2002:a05:6870:330b:b0:258:3455:4b02 with SMTP id 586e51a60fabf-267d4f3b2c0mr12329491fac.51.1722354190145;
        Tue, 30 Jul 2024 08:43:10 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2657723ada8sm2269453fac.57.2024.07.30.08.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 08:43:09 -0700 (PDT)
Date: Tue, 30 Jul 2024 10:43:08 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kartik Kulkarni <kartik.koolks@gmail.com>
Cc: hdegoede@redhat.com, mchehab@kernel.org, akari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com
Subject: Re: [PATCH] staging: atomisp: bnr: fix trailing statement
Message-ID: <582189dd-48ee-4ca5-87ca-dd640b09f18b@suswa.mountain>
References: <20240730123842.37487-1-kartik.koolks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730123842.37487-1-kartik.koolks@gmail.com>

On Tue, Jul 30, 2024 at 12:38:42PM +0000, Kartik Kulkarni wrote:
> Fix checkpatch error trailing statements should be on next line in
> ia_css_bnr.host.c:48.
> ---
> Newbie to contributing to kernel code
> ---
> 
> Signed-off-by: Kartik Kulkarni <kartik.koolks@gmail.com>

This signed off by line needs to go above the --- line.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

