Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE8310955
	for <linux-staging@lists.linux.dev>; Tue,  2 Jan 2024 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="as81YTW+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40d2376db79so86832205e9.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Jan 2024 06:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704204216; x=1704809016; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qqTKJtifBPnETv7np6pfevn5UJOzWmcakMBHLMWLps=;
        b=as81YTW+K7aWqwfijrpzg4k8Z2vfndZ5q7S/nvtCP4wf3sVlPsoLC2FludMsod+GON
         VEq/yJEQvVH1OgXBwj/aagA83Ib2yLG7z1EzYuODl44frYPQi1xsQzA+RkGXB6eRx4CE
         Pmtc7lGiSGcPsIomZ6fYXm/zvzInyrKaVSBvj97n95q3CA9UAxxG/4CRl9ZB9+xshTvt
         VElGaHWXgyCLmK9HffZC5VYV0FDG8djOMRyXlHmzXmSOYKVQqQZfzXNiPiWWbDQln4LM
         7CSG66AzHvxSveOX+L39qjbKqP4FErh6kfVlGj4z8V8DJGMVZexbmD2YEDws1p9gZ/bB
         Fc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704204216; x=1704809016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qqTKJtifBPnETv7np6pfevn5UJOzWmcakMBHLMWLps=;
        b=TgMlCb9E85TbWvASayNgySeTuPKBls0Ambqz8ptnpEJvdW8FQnP6LirdsKG5QDnkq9
         3rlMHqRXHXDUS+/xYQu2W5rFe3ycTRGwlkD6f3EswWc5X22vpK52Su84IAE53V1E9kW/
         iQMJYSEI4PC+SAlPI6tS7+WU6VWYOxkdfWrM7vqOklq6qwVXP2enCEQ+J9egfdmXSzI4
         ifgPfudYttZ9jIqLo+SBM2pkDyWzyepWR0fCUbt02UiSG/IgAWZFOojdPMfyJ7+UjkUI
         OElB4WAxXKlLXuy5TpIxORuc69wucJo39uPoeAX7ZSrMHtKmtEI+ld0sKcda5/cc/pi2
         jyVw==
X-Gm-Message-State: AOJu0YxOCZYQShE9QnK7jKRIUPiEmsm211FWl3WKuQBGrM2a/ieeDlKm
	8dYloJbLevPjhsNcexguuap1PbvtataaBw==
X-Google-Smtp-Source: AGHT+IHszu5kYoPxaua17Zir72G8+47MdyzOxbuqM4YiER7bIwhhZFsyR7srK6e08ANasQ0eoLbNNw==
X-Received: by 2002:a05:600c:ca:b0:40d:376b:c640 with SMTP id u10-20020a05600c00ca00b0040d376bc640mr12050424wmm.102.1704204216035;
        Tue, 02 Jan 2024 06:03:36 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id d17-20020adffbd1000000b0033719111458sm11777561wrs.36.2024.01.02.06.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 06:03:35 -0800 (PST)
Date: Tue, 2 Jan 2024 16:22:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nathan DSilva <expitau@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	tdavies@darkphysics.net, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: Add blank line after declarations
Message-ID: <213d872d-8ad0-49f5-b6ae-9a1c69ecc107@suswa.mountain>
References: <ZXvevJ2vEEQ92rau@oatmeal.darkphysics>
 <20231215152918.532037-1-expitau@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215152918.532037-1-expitau@gmail.com>

On Fri, Dec 15, 2023 at 03:29:18PM +0000, Nathan DSilva wrote:
> Remove a warning about line breaks after declarations found by checkpatch.
> 
> Signed-off-by: Nathan DSilva <expitau@gmail.com>
> ---
> 
> Thank you very much for your response. I didn't realize you could select
> multiple --to recipients, or that you could have comments not in the changelog.
> 

This should say:

v2: Fix commit message
v3: Improve these notes about changes between versions

Otherwise it looks okay.

regards,
dan carpenter


