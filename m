Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E358D101D4
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 06:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717999691; cv=none; b=aC3n3h0dimHhpQS/1eZTYZ0hYI2/zc+/0VHVLJcVkaQVOcPQ2F+Y6udyqIal2RhcbHpiRtUNxqzVIZCbf+0fZFT5s9lCeQcdUckXMu6HO+eL9NgoI5aQJq/kMCNWnisGKOGv+WRbveuKDN8df7/vGB3AVXW+j9kZD9tG5/fBUZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717999691; c=relaxed/simple;
	bh=5CmpMQ5KRNxApdYrHcBMYUq10a/yj5KAKMjMhnTxKY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYi8qTQTIERY0nO79QbpifVhG2q2pqSVdPrlsatsYhOncDRJxIVX5bLAo/2DKMpNdl4Minre8DpiSr6rlby8aJyF0urMAnfNpgT4qeVSpmuaXx8NDWwrsiPmLoqMtMvV26kYeW7IcK1QB4OiH/FaYCmpIabebnnm/YU4UoFyRNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zoNc+zU2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zoNc+zU2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42172ed3597so13834785e9.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 23:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717999688; x=1718604488; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1/J87sE5WWCxANMtnNec2a7KoufmyUGsipNDanWepiQ=;
        b=zoNc+zU2Eh/XiKErU8v333FToXE6PKND87FRGvhv24YA3wjKE08HNZbzLRiTtm8VI4
         WHzaJcsdTv3aAzmQdDcuk+Kv1Ol33bf0h8SNpBB8u8pIAAHG3fy1PqhqN94kuDKqkguU
         cM+SKBBjJmMdi1c/tJZ99GXwSwsh4vblG0PSN3dnYxE5Nq7RZ0W8KSM+wT8mp+ZBfyjX
         rah3oAPKFaq4voI+De+LTcA4zXumjD4y/Sg8IjLaUQvdMBFEHqhbgOf0SzLOU+Sm8CE5
         EthSKtiAVy0299jiHZPqSvZkazWjtD1DmIdBJwR2DYqWgPE+v9YxO1UZA2mATb5vOBWY
         CsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717999688; x=1718604488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/J87sE5WWCxANMtnNec2a7KoufmyUGsipNDanWepiQ=;
        b=UBv94sxEKtiWzn5HmLg7JO+boDL2qJZlKU85Taf5iJpvF0VQRVINrzErLIVA4bl2SI
         daVKWQc06jx1Boi1H9YK+wVj36r9WFpE9vPW/Tf/7gQBqwxGEZEPQ8iDep1IOyYsDVSt
         CiPafymnhdaashtLoq9QJ3CijvOYqz4fX1OVQIgdBslh9p2S3oF+cBnLyWpea9+/vRH7
         1IOkC1b+aaEk9Mu9h7EsHaR4+mOVPP6qunRFVSv8nLyE2QweV82hLEnVxQPwnMHw2sqq
         JlzCs47YP2IhZ4atnYwfiar0ELIFHv1NfiWWsD0BkpL+PJi+AaqXkQmS6cSHO9VeAi3i
         ZWAw==
X-Forwarded-Encrypted: i=1; AJvYcCWYW4jBqi0Q/U85BBsCREJUPE2c4kgS9GMVnZaDa9CdVMUcdcoBdUrH0wAkrculBBUDaDleleYZbweEuLXappJp6NKUifunYTUdLz28EA==
X-Gm-Message-State: AOJu0Yx6vxHB7luW5IWGt9sbeq0ldmP7PstMmS4QwvFIte1p5VW+zJyL
	qoptie+HQFMGfMszHdLz1cGPjhPqSJOKKKzv+hMr6WRG9uCFsjdJ3p8nhzeOw+A=
X-Google-Smtp-Source: AGHT+IGzRdIwGC7ZVECSHelhkNw1xi169Id85SkAxS+xVHhRG655lnQ9cAHpX+PeqgP1/dH1IQAdLw==
X-Received: by 2002:a05:600c:4f4a:b0:421:20df:c6d7 with SMTP id 5b1f17b1804b1-421649f0744mr86433385e9.4.1717999688003;
        Sun, 09 Jun 2024 23:08:08 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f0bdce051sm7008759f8f.75.2024.06.09.23.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 23:08:07 -0700 (PDT)
Date: Mon, 10 Jun 2024 09:08:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/24] Staging: rtl8192e: Rename variable bforced_tx20Mhz
Message-ID: <5ccfa433-f1be-45f6-9138-348cb4093866@moroto.mountain>
References: <20240610054449.71316-1-tdavies@darkphysics.net>
 <20240610054449.71316-10-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610054449.71316-10-tdavies@darkphysics.net>

On Sun, Jun 09, 2024 at 10:44:34PM -0700, Tree Davies wrote:
> Rename variable bforced_tx20Mhz to forced_tx_20mhz
> to fix checkpatch warning Avoid CamelCase.

The correct capitalization for megahertz is MHz.  So the original is
wrong but the new name is not correct either.

regards,
dan carpenter

