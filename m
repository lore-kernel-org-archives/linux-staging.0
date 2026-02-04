Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317DF3E8C52
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770201674; cv=none; b=pBG4z/mZy0POyuTs9WJUMNZcFd8/mhtlcUnbuHrZaIUMAvyZzVehPefKV3BFdnpL9m/o4/CF+F8Gt6/M87y8I441/Zchx63txxVLUTGtL9I0KG6SPYCGdOa9o1CLc/NvygG/+/8m8Tu8lQ+yXo0wc51759Ts43Ll4KxzPPYQE44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770201674; c=relaxed/simple;
	bh=zGRDoeqWjvvsxSiTdNedN/KqGPHK4idX9GpHauJq50M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dw+Ps4UJVaqQkP22VKKVH4+frZKZtbquGBbvb88M+AzcuckMCTxED3/FYYUMz7nBT6sbB3ya7IOOzBN2q6SwALdfrpXb+XHLprWMaINIIDa0orZ1yV7cqeL4HXklFPZsa8FFeISMyD6OQA+WT+ZgYMSTBGyKVfo3fq86IJ6WA28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p2NA0MiM; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p2NA0MiM"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47ee07570deso56331375e9.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 02:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770201672; x=1770806472; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9AxpllCiQp1cWF28sAzya8eycPmht7frGe47a1UxWmY=;
        b=p2NA0MiMZxdrepPZBHsUDEU6JsQ31yvrC1ov1st19ffvdZinzn24ybDDMJ60Q/bn40
         PyH6c+LwkYj4Ls4nRIwcNa26QU09540MBdaQse1Sb+5bNNPnzoNZir+0NLhOjPCqn+6T
         JqqJ0GMLf0G21TsbadYFeNneG430qZ40cBHtGwDqVS1tymAQO2eLQ8cGHvOi6RgJNqhy
         Md1KnKJu7zYohhMLbXFMqW0dpBmo+FE6PxpvwF20oSuLQDw7zCpuUGg5yn72wtZr/sE7
         R2mVKeC24B0HCppLx2a2qY8keBe71+F8jzWuJHIwq2gcsB1tfnkwJM1I2y8dg/xcrbj+
         80Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770201672; x=1770806472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AxpllCiQp1cWF28sAzya8eycPmht7frGe47a1UxWmY=;
        b=gbDui5xrvMmKm7kJutpgCU3h5jhs+5svd/r0YRtonaiKxgyzZZsVBvLdP12j6jWp6N
         U9Db8QzeYpqU/4J3bI6KKjHNkuJuDDe0eSiNE6rj1LiJ0gdhD30FWTFdaxZhIA+4YZda
         NQ0Rpb51SzrWXPPLsfJY3bSCXiRuPFbD/jCubp4Q7gFlYE/Q8+KTHstcBmGv6qwVf6y0
         FLrTU8pzRfRAsY6HTV0yaBq0PBvh9VKNTYOKLlFNJXaMBccSbHeigfjduX3Jl7gl0Q+J
         qOmEpVlycGamzycDJdoKWWU5OWOi4nZw5LREmZaakiHhpbQfd7YPKSG9kK/oIaqnWhTw
         SkvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa/kJRodXOoXlTTIbYyR3iRGAA/e/P80kvfeISABvfRH4A9MK+CJ+r5bEGtDtkpq5pPHKTHdTlkHK6XZt0@lists.linux.dev
X-Gm-Message-State: AOJu0YzOebovjixKsBYX6087zrGcAC5U6Ag1jlPhedRfzABx+VvEZ5MC
	U85TTxsOLFcHXyUWoZNdJMZtnMkEYKlwyPK1Rbc+CJIRYBsBa+khGidKXfRHGPt4MVQ=
X-Gm-Gg: AZuq6aKNYG7iaXisByax+5lRYA+XpYnfGgQ/O+2DMTkH5iKh2w+506UXXbC8hcM/3fc
	s9GBB3MsBPGqMkAXvVbRe5FxVIHqoPg91tIx3ZeQpadefkHrXwDcubJPG7+IKT9C7DBjpQQjqMh
	7fMvEqLnaDYW8VWLMQXwpQkhST2H9PnzUwJgeSbUOAMWk843pDsKGo1R2/FAlwzIcusftcPJajC
	Rt1uf0NbO5Bs3CAB3NrzkS9UY7osx+mHH19qnHn9OI1i8ws/x0384+HwDxskB/NBQloHZvKvCAv
	UT17k+mrBIioBtxozkkc9J3TJwpvL/IOxmUALyz4qF7QlhWouxuJrFx15miDOu+KzsiVamDMlGl
	QFksH3y0Ql4cpX1n7bq6V+uKwa9szzzb8xfiX+vf4JNtGRw04AujpgGkjemX/L0vHlK+DRCzlae
	akIupQPKND2mYNZMHz
X-Received: by 2002:a05:600c:8b88:b0:477:b0b9:312a with SMTP id 5b1f17b1804b1-4830e93eb34mr34801235e9.7.1770201672426;
        Wed, 04 Feb 2026 02:41:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48310919211sm50865585e9.11.2026.02.04.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 02:41:12 -0800 (PST)
Date: Wed, 4 Feb 2026 13:41:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Neel Bullywon <neelb2403@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: gbphy: replace sprintf() with
 sysfs_emit()
Message-ID: <aYMiRAuE_GxwQMWt@stanley.mountain>
References: <20260204101342.71267-1-neelb2403@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204101342.71267-1-neelb2403@gmail.com>

It's best to wait a day between resends.

On Wed, Feb 04, 2026 at 05:13:42AM -0500, Neel Bullywon wrote:
> Replaced sprintf() with sysfs_emit() in the protocol_id_show() sysfs

I really hate to comment on this, because I famously get annoyed by
people who act like it's soooo important and we have one "reviewer" who
wants every sentence to be in imperative tense.  But past tense is kind
of ugly.  You did it right in the Subject on v2.  Use "Replace" instead
of "Replaced" here as well.

Btw, if someone provides you a commit message, then they're basically
obligated to allow it.

> attribute function. This code is safe, as replacing sprintf() with

s/as/as-is/?

> sysfs_emit() gets rid of calls to sprintf()

The line break is weird.

> as part of kernel hardening and sysfs_emit() is more appropriate in
> this context.
> 
> Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
> ---
> This was compile-tested only (no VM/hardware used)
> ---

You need to put a little note here to say what changed.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

