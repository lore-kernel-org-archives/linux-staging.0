Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAAA20DC1
	for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 08:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708330665; cv=none; b=i1ie56prJ3hndsZ2p9Gg+seAkxV9mPEFWVdu33wtxtGiugymPjNMXMW8sFAtbSH4gouVZyC3L/bq8o00ppVaEWPKkAgd7naPNsgtTNuUF7YDn3wvbOf5FJpMCqxxDhnnnSv3CwlQQouX+1zZ+dzBgXgPDUvLyyl1bIzzzbCMPa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708330665; c=relaxed/simple;
	bh=HFzMpJTY2CqiCLwGCiBJiA7tDpfaFJpV/KrsBdDmoig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vD9m7cvKyQzpgxCA1QqRuujZeNVTGOP5usFfGqnzMzMsgfKO/CWywPXx3JLYmGxCQjr4g9+7EeTb1JfcO2N7X6KZsAHv82eEbFdTwhiRHI5kurev3cjKl+519mxt/naf0E8iCxhdPOgu4uto5lttOuYgnH91r1X+gXu/YfDnV3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W5YaDVcN; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W5YaDVcN"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3e552eff09so63259466b.3
        for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 00:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708330661; x=1708935461; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+fWtteEBUr3xYhubLV+FegEWhNEJvOAyY8/0VSt5VzY=;
        b=W5YaDVcNbV00s8UiuumPEH1IWkM/GdxFTWXS3qpb9NtZsrFYAHlZAHeWoHGXyoJDhG
         qrgzrH+OQqmK2VKp/YommviZGiQcVDOxXdSUVLFxNUj6Sl9mkYFW3jo8cYT52JfRmkJo
         EuHB959SrYsY5favKHIjSoAG12t0yvUWzDdGQw4/bj0pnbCGYyLxZk7171DApXNwvKy5
         aSMI8yhrtzUk378IgAmbaM0p75Qcu7AYY4BYiekK0XOIn9hGEPXS8dXb7DXDqqpDSOUE
         GsNS3U8y7/TEZstGesFRiOUZfXWEfW5eavhDYZRB2fwryDoNqmiVlrMutGER3IseRHYn
         6oOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708330661; x=1708935461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fWtteEBUr3xYhubLV+FegEWhNEJvOAyY8/0VSt5VzY=;
        b=gnRnn3ttY76HJCboi/dXW8oM0k4jjUCihI2sNuUBQpiKF3AWfZ00YGhNkEoXQhFVkk
         7IYSMN0c85kZExgxncGV81Rc0yoaGFLyvbd9MAlRTZQLA7fLdUzl/JD9XrNm5ayeQA0c
         tWpcrueciqlPHWAOuLg0Z3Y6sZRZN1A5w/xw2TJFh3f8NlIphBDGKxX7fl948dlx3a/D
         XwZcW6RhnsEsGE8XyPHb1pE3kajOJMWciRmjeahFveJy2KUleFS8tgtGgIjLx0N3aqrG
         fv6VMq5o2GDhDAaBC5cLwIXDk46cVMsPvehZH8xpVi0mNNUCEwpPgYHc9RYARDtJyXHm
         amCA==
X-Forwarded-Encrypted: i=1; AJvYcCWl+nCUUTTVgSZmyATn4vtZkU0gAqIrqBb/HVywAISSn4QwS0neYuWepdyfZdjKuRnnIgfHYOhprUPv99PQ4i6ZNfw6BYiCVi8DQfiCFg==
X-Gm-Message-State: AOJu0YwQHPeYo7ym7J87YwH/oJMW0My7noSO0n8JpD+xTaYg9iFfkDM2
	s0TkJE843urzS2NMcDe9Q3n3t7BR1oUQp3NDS+a0Ui1FX+4rIKp2+ko8G3bw3Us=
X-Google-Smtp-Source: AGHT+IHawomsSVE23ZtZzjbMpXN6JFZ8Y2Phn52Q9rtMSop3nAF0+LO/miE8tv7O7NNAz1YyW/CMRQ==
X-Received: by 2002:a17:906:c417:b0:a3d:e2e9:a7f7 with SMTP id u23-20020a170906c41700b00a3de2e9a7f7mr5649855ejz.27.1708330661571;
        Mon, 19 Feb 2024 00:17:41 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id h11-20020a17090634cb00b00a3d7bcfb9a1sm2688595ejb.128.2024.02.19.00.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 00:17:41 -0800 (PST)
Date: Mon, 19 Feb 2024 11:17:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Moritz C. Weber" <mo.c.weber@gmail.com>
Cc: florian.fainelli@broadcom.com, linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] Staging: vc04_services: bcm2835-camera: Fix code
 style checks
Message-ID: <236d985c-1835-410f-b0b5-cacbd5fbf930@moroto.mountain>
References: <20240217211246.28882-1-mo.c.weber@gmail.com>
 <510574c4-ad26-4fc2-93c4-7b67737f8eb1@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <510574c4-ad26-4fc2-93c4-7b67737f8eb1@moroto.mountain>

On Mon, Feb 19, 2024 at 10:38:30AM +0300, Dan Carpenter wrote:
> On Sat, Feb 17, 2024 at 10:12:38PM +0100, Moritz C. Weber wrote:
> > Resubmit these patches to fix multiple code style checks for better readability, consistency, and to address errors indicated by Gregs patch bot
> > 
> > Moritz C. Weber (8):
> >   Staging: vc04_services: bcm2835-camera: fix brace code style check
> >   Staging: vc04_services: bcm2835-camera: fix brace code style check
> >   Staging: vc04_services: bcm2835-camera: fix brace code style check
> >   Staging: vc04_services: bcm2835-camera: fix brace code style check
> >   Staging: vc04_services: bcm2835-camera: fix brace code style check
> >   Staging: vc04_services: bcm2835-camera: fix blank line style check

This blank line patch would be still separate of course.

> >   Staging: vc04_services: bcm2835-camera: fix brace code style check
> >   Staging: vc04_services: bcm2835-camera: fix brace code style check

regards,
dan carpenter

