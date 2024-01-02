Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B2411195
	for <linux-staging@lists.linux.dev>; Tue,  2 Jan 2024 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LbXkrwDm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40d89446895so7099505e9.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Jan 2024 06:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704204207; x=1704809007; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm2hXx5OxeyOxmYs9z0AMxVtmT7lZ2HwF2TM+0OQnV4=;
        b=LbXkrwDmcyMzEv36ZXv0clShQ/HbvmDYobPoXDZJ3lQJhilI4MbF5gabTYiw/Qf7ne
         is0gKebVQkiecR4hdVFergU/aqw4IBqXMCy11v9kOCDVGNhRUPTbjZp4uoV5belHQWS+
         lgwqeztossO9vaGxkemRIVjtSO7tMe4oTx23x5fM3qdKY9GFh8085+03sgHwvSjS2hpt
         xM6XOn3sOJ93N0ksxstwdYlntHaTwaB59WEBzqRM+l0qA0Eu+gzlMEydFIZtfDxV6sCb
         nt6RUZA92Hk8lScwPhjTwpbuYKQXAYQgSZX+xZhsvWZNfQRpUnULTqEEmtB3s8H0fD8k
         KnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704204207; x=1704809007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gm2hXx5OxeyOxmYs9z0AMxVtmT7lZ2HwF2TM+0OQnV4=;
        b=X6uQimKoqwPoHswkxMPp0qMOXCR6bexwEfsZOtGImLiseCMJG0betjyb/szp92TEy1
         7FgZfc6OoHcBw+pzBX5UIUhK+1u+EkHyazqwMIryMoMXK0tdbf9o0MXd3aeDB+7PAHar
         bBkNTW5CvQk77ZM+YlpT/mnNDCJS/VIN+okWKWxWCxJaRQt0mEi33VmNWLteirgPal1X
         rKv9LvnR7LNzolchPTpnRF5RvoIJHJEdSEpUeESz1iHiO5AQ8gE7MPEGubSEXPteXdyg
         gX1VKyLlBH7B0hUL/2vvrW1RRHZJS3KzSzQGRkp+2nVHBfXV3qLshqmG+TYH8prcSHuh
         +sbg==
X-Gm-Message-State: AOJu0Yy7zv336O75cBzHg/fL+rGCjiNzOJs782+b67dHXt36zn3IduRZ
	erdzAGBa6yRJGomHNLmBAzAZxBRP63+BkQ==
X-Google-Smtp-Source: AGHT+IG+uVM0QKMD5sZLNHS1LUvENcwUlvFjpNhHg7TNOtGjSQFVBrHtal+ZV4SNZgV25Gs3/ZVTkQ==
X-Received: by 2002:a05:600c:5195:b0:40d:88b8:1bd1 with SMTP id fa21-20020a05600c519500b0040d88b81bd1mr1277633wmb.185.1704204207378;
        Tue, 02 Jan 2024 06:03:27 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id iv13-20020a05600c548d00b0040d30af488asm49616502wmb.40.2024.01.02.06.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 06:03:27 -0800 (PST)
Date: Tue, 2 Jan 2024 16:17:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "<Tree Davies" <tdavies@darkphysics.net>
Cc: Nathan DSilva <expitau@gmail.com>, gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com, kamrankhadijadj@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Add blank line after declarations
Message-ID: <9802302b-5aba-4675-bfaa-eadd3e168d1e@suswa.mountain>
References: <20231215032852.501316-1-expitau@gmail.com>
 <ZXvevJ2vEEQ92rau@oatmeal.darkphysics>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXvevJ2vEEQ92rau@oatmeal.darkphysics>

On Thu, Dec 14, 2023 at 09:06:04PM -0800, <Tree Davies wrote:
> 3. For this driver, it is best to send your patches to Greg, Philipp Hortmann,
> and Dan Carpenter (error27@gmail.com) looks at them sometimes too. And like you
> did, cc the mailing lists.

You don't need to CC me.  I'm on the list.  Just use get_maintainer.pl.

Otherwise your advise was correct.

regards,
dan carpenter

