Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4675F36B079
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443580; cv=none; b=DFEf9nsAM9JeMJXzylt7cU8D11R3M8pC87mPknk8j/yx+P203ZRlQ6yiTnnhGRDed1MwrhXQk4uInOijR0nElDrzKBjChnBPkOOUHqaS3GZ3IImIJOaxzeBM0Tb7Adfts2iMaghrNPWZvNiGVkOIJYiMo08/dJ9zBQOTXXRSUBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443580; c=relaxed/simple;
	bh=NvlfqQkFSjiKefhGJg1nl4VUtTSqxowA+e2w6Haf9IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4lxIBnsKaZ+Uziz7SfU+Nz+mPKqfjBmpEhEqJJvcz4KceyYeffF8bXRH+km2trBdVzLCjWaN8w3tqvlNrvUln07cDmIQGU6bUIN6ZNjlaOUkj88yvrEG41g43wjz3lUwOP07eva4XEKNCdJAek2GHdl5uefwkYFklnOAMUfelA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uGgH5y76; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uGgH5y76"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483703e4b08so36616705e9.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 01:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772443578; x=1773048378; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8OftFQTV8naufyqWqKOJ13Y+eOJO1ch+XainGBjNPzc=;
        b=uGgH5y76U1GeQJpLfaXZdPsgSD20BGpZazE6aAPMfNKsAQ8qgXvCok9gTw7mC8afKJ
         FPx+yzl5ihJ/5V6OM1z9DYgrM43aYzaOQbfHfHflYHCGq49/KxFPnK/iHKoha5AUUZFU
         edNrTF+l55z7qVHrzr0C3f8Iz6ImGA8Doin01BQY5D2ugSJdqyKaKJwfJxvbEt3wxFoY
         LEjfSB1JssTsF10u2T+iZkwXTVbdkTOsc7uyYMfOV3HOIi4qeKRJSh4TAcggXnIQSuIU
         cruDlolg1RrkXxOTP9OBHeCr1jCGB9NOw1wM8UStTg62X8Z1+dOa7xM2zbyvqvzTb85x
         Jkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443578; x=1773048378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OftFQTV8naufyqWqKOJ13Y+eOJO1ch+XainGBjNPzc=;
        b=XPHlR8VWTvH8GdDCx6va8/SOD/Nbubnn5prR0Nbabf75MDqVo6WDiNi19k7cKKqt4Q
         fFVEdAcxAlMkruGUc3+cuznrDoKAFV7sTdfaQYrR11QlrGc3m0PuxrBpTwYPQ4Z+l71L
         gBra3rYr3EoM7WkHlSOrZPWxawJyJ/ApzJYAVDFG3JRziZ/GwdQ5OsXCG4Lxw62JEReq
         4iM+jo0W9tZnW4m+oGJZGy9s7yKCVAdE5cUxDr6Wbmw1z0QZWgSE1ptQs8SsKqXns7FO
         cF/6b+q4Vyg2aVNjvxVifCBJBQYnukrWITM4pPIV+Ki0gN8CcuHd58fPr1Koi9l1eLKS
         VJ7w==
X-Forwarded-Encrypted: i=1; AJvYcCXHrwPK0ketUdZXHLA25PSWtQ/Q504e+EznaKObo/NBNnyYqTlSYP2Kc/JLX4/Dd4J7kab3bLjgapvw/XD4@lists.linux.dev
X-Gm-Message-State: AOJu0YzOKvPMwDKzRkbxowxExqX6C0JerjGgXrOzl07ihWl5DAgN3M2U
	Mghl0f4Ig6WRG643ZzSS1gjxw/QQPbjyt4Yc1zQXiOKc84wLmVdT0opDO664UUAUg8k=
X-Gm-Gg: ATEYQzwWFhPSrsKMj0RIgIxa5IBgRhfXOgEjUvSAs24d9WD4rmaVRCPQhzSYtGMgUDh
	Nmb/AoQmsoiGvYPpqEdeBjcz3S6pF0ILr3ZNmH3+AxACBkvPQbkTQOw+rwG5rfA1T+BvGRIeCeC
	6CJhDCeVPYFeCwyA7RZGum045noicGHrVGO7S+inCXo+/IG3KV7uGWDtt4MkeyAmins+BDHbieW
	jhImfEJlMCJRIQJ1b+FMdYdvyoCRTEYX+NH7dMz7t1LWVTMK1t56VUTUNC2OUhVuMKI9hy3Y23i
	ON9q9imXe4bZ/cMw8ho0pHXOYkO7sgNtDIFKYTeF3C5PpTuPRShfebQZ8PO7G1B04RjbxO09TsQ
	D7HXY6UHBwKkPptBjE2bfB6cYGIfT126H5PABu7bNNg4gRbRpXS0jiVPmgw6s7IIJCtGndFsFpd
	KbZraPrMr+zZznPYjFydDpFpf6glD6aXlCLQURls4=
X-Received: by 2002:a05:600c:c8c:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-483c992e3a4mr187337525e9.9.1772443577584;
        Mon, 02 Mar 2026 01:26:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b0549600sm11507548f8f.35.2026.03.02.01.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:26:17 -0800 (PST)
Date: Mon, 2 Mar 2026 12:26:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soham Kute <officialsohamkute@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: kbd: use -EINVAL instead of -1
Message-ID: <aaVXtbHMfUFJW_Tu@stanley.mountain>
References: <20260228202008.40063-1-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228202008.40063-1-officialsohamkute@gmail.com>

On Sun, Mar 01, 2026 at 01:50:08AM +0530, Soham Kute wrote:
> Return proper error code -EINVAL instead of -1 when
> the event type or code is not supported.
> 
> Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
> ---

Could you do some analysis to see if this affects runtime?  You'll need
to review the callers to see what they do with error codes.  In this
case they ignore them.

One thing which could help would be to build the Smatch cross function
DB.  But it takes a long time so do it overnight.
https://github.com/error27/smatch
https://github.com/error27/smatch/blob/master/Documentation/smatch.rst
cd ~/path/to/kernel_dir ~/path/to/smatch_dir/smatch_scripts/build_kernel_data.sh

$ ~/progs/smatch/devel/smatch_data/db/smdb.py nvec_kbd_event | grep INTER
drivers/input/input.c |  input_event_dispose | (struct input_dev)->event |           INTERNAL | -1 |                 | int(*)(struct input_dev*, uint, uint, int)
drivers/input/input.c |     input_dev_toggle | (struct input_dev)->event |           INTERNAL | -1 |                 | int(*)(struct input_dev*, uint, uint, int)
drivers/input/input.c |     input_dev_toggle | (struct input_dev)->event |           INTERNAL | -1 |                 | int(*)(struct input_dev*, uint, uint, int)
drivers/input/input.c |     input_dev_toggle | (struct input_dev)->event |           INTERNAL | -1 |                 | int(*)(struct input_dev*, uint, uint, int)
drivers/input/input.c |     input_dev_toggle | (struct input_dev)->event |           INTERNAL | -1 |                 | int(*)(struct input_dev*, uint, uint, int)
drivers/hid/hid-holtek-kbd.c | holtek_kbd_input_event | (struct input_dev)->event |           INTERNAL | -1 |                 | int(*)(struct input_dev*, uint, uint, int)
$

regards,
dan carpenter

