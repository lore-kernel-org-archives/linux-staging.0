Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E1436B
	for <linux-staging@lists.linux.dev>; Mon,  8 Sep 2025 05:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757310513; cv=none; b=A3N0ZHW1UU8cPrd6s+1amg2b6ALo2SMaYK61pWhtLQziPF2YnyHKAjtJzyVD2uWIhTahuNCrN7Q4HNPo9dz+/+Ck+QjejP6qfqsYTV72K1/bCHwlxbe69aBj1URaIbp1X0SWCfCYtVRL0Es79sYAlkrfocHUHNm2FSJeoKDG+Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757310513; c=relaxed/simple;
	bh=O8NNu0NVF2vSad/YWy2TjskknzxZXtBC6d6bSAsqhDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDGnD6Z3rpn49gvQVC413azF2yecxLGkR0qHJyxSFXEIFI5DBhVNceLmgJS71/H/qEtdqndJtfo+5O2lsjSmTUMMcqLmITdk7Om9Ytkf+N4UsRnXAjlLPg0+6lu4XLVcqLiMrVgOKIMHAqYJXFHSRTL0PDCxWT3r9Vds070a8Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a4+QFlcv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a4+QFlcv"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3df726ecff3so1882410f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 07 Sep 2025 22:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757310509; x=1757915309; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bK4xCCUkJgHnNsrWJUX5n2h3qweAwpi9anD1X6vMswc=;
        b=a4+QFlcvcxBIknAoW3U5l3cvh+CKGw5IWfsdNYPm41tm521qE72RwsOjD2Zfw7Adih
         ttDpDvU9zPEMnhQEHs0pSqeOtZU91DGhp+GoOIZSfNul+XVyyU7VTRiaVmcg6A8VYq0+
         NYlcsiKrsbNtnNktrE9RJZyA3v8t78KnJqzwyuvYqibQr/uVB6LK28MAMN7RoX8ZzXYI
         BKsYvv5bjnu1Ae32VtCpZJy72ZU9HOVURUNVdNcFD10PToj3/SSt/PFJBF8QPzckFg7j
         VGZ4JnWr5HgaNBTF66eIHYcsWLEqY4U1WI8vFb4C4CuGqSMdOU2h27piHsIk6Yc0yiqO
         C7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757310509; x=1757915309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bK4xCCUkJgHnNsrWJUX5n2h3qweAwpi9anD1X6vMswc=;
        b=UYJ2iILF3Ukau0VxTDO6jHgmYws9v6rr4uWuc9lI1eB8qFK/kbgbu8EUq+SnV5qCp0
         qjzeqQuRcQNNS43rTHIgPs2n00Nb5VQh4vfol0zL06MJDVPB+dMeOP+Z8F5xOkXklDxL
         OVYxgaoyoXi48PODmoWhWbrL3k/tzD4fQwdVADb7LXx7Td8KBh1sKMzJ3UdKqJ9BJpio
         cs7LHseIvMJTpP1p8XEvmTuqKnTOIvw+gStxQvAZN/eS4BIUngfKQUjTAm6QT4b/ShCm
         poQe0tL3Gz779fuOmJ395phMGUr96wEfB9j5WLmKLNQE9UPmjgxIMHw6Ujt4ptTIqExf
         3r5w==
X-Forwarded-Encrypted: i=1; AJvYcCWz3SgUQd76M1wT++k6TrQGv8EUrvVjfFKyBJZhnwvxfLrd2DxrOY9npL+uugBx28tfRfh7p6VlwSC/z3z5@lists.linux.dev
X-Gm-Message-State: AOJu0YyVTpMS63CBjq6+HJAQO2Tw9op4MerEdIsYrdiS8RgHojLP4aNY
	8zKc+8C5nU6l+VKc5RvqfGnLJa4Dce1FEMssUCB/yWcDY5f5G5XyAj01N8HfrgNF/QM=
X-Gm-Gg: ASbGncu60FQyK+GxBRTPetcP3bl1i5CdginDkSB48hFOZz/4QdFhWgd45oO6aWZNHZV
	pXguEdkD/fspInW+gZY9cUnT4k3PWX3FOadxdiO6TdWvj7+lqI4m9thilkSYaLkmiFz43I8UBFo
	1KpSL9/xxIW+G9UpSjkanQ/cJlRNy3ewFhXZHP9i9+xMyZy1Mk2IE87NoU/DBSSmZlvMOVSnyeh
	ningHjWbVqKHfV8UarY15eLZpEmDUxjOCSdAOIsAPFN7CJWAsFr2tko51UcBqGf2/1NlinaE211
	b3SUTi+SHXy0/Ci6+NKo3fYESiBSCxGTbjtPsjReujIYQLGs4yOKdg8UPchfbCFwphOZmH+V1KL
	rtx4uzb/aMIErdcJhEwpN+oWS/0KRBlHz2WQJwA==
X-Google-Smtp-Source: AGHT+IEEWpQsJ4943vbis4w2dbJY/QBn55s5lkkvnQbqeLGZJhfjukVhzvhNNq/IsiNBzEyJkqP93A==
X-Received: by 2002:a5d:6e46:0:b0:3e7:46bf:f8bd with SMTP id ffacd0b85a97d-3e746bfff15mr1956825f8f.23.1757310509421;
        Sun, 07 Sep 2025 22:48:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3d95df59e50sm25155604f8f.23.2025.09.07.22.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 22:48:29 -0700 (PDT)
Date: Mon, 8 Sep 2025 08:48:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: Re: [PATCH v2 0/5] staging: Destage VCHIQ interface and MMAL
Message-ID: <aL5uKTiEYZP68xLd@stanley.mountain>
References: <20250907-vchiq-destage-v2-0-6884505dca78@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907-vchiq-destage-v2-0-6884505dca78@ideasonboard.com>

It's really hard to review the code when it's just sigle line like
this:

>  .../raspberrypi/vchiq-interface}/vchiq_arm.c       |    9 +-

It's also a head ache to do a cat -n filename and then copy and paste
it into an email message...  I thought there was a trick to make the
diff show up in the email?

regards,
dan carpenter

