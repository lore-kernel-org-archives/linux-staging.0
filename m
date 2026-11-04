Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778447;
	b=oA0POtfQiwnfJlDbqbcftT8ic4ZsNEHYyPZfe8Gl5UZQhD+W0O2mSeh0KtMQN22SRmud
	 p+u/jq7jDALaTfwrLvb45XQGF23ruktrRomkenMbIzwgw0k6nmEePcchffRQ/8qiTiXmz
	 NlzxElh8/VTTSlODmUiPRVcyQ+z4kJk74ytOZJNbEhOSpM9i8Ahh9QuXBjsSXx7JkQrji
	 ypSNOT5XWyBPLyWWkSr+3QUFpac/bWGTZZ5+3Be9f8j9go6/D9y1Nul79VGaqiyLZgoZO
	 A+MIF6nGTAIM3+E97YnUbQMnKcZthki9zQdwXFOXwd0BXdK+0Ad3Jmj30GRQHla0qfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CJrVpzWSqXnZyMhmYQZlXezsPnpuAEBGvhZcWkwrTMY=;
	b=tUfnDb21LX30FTSuFrnAy6/loJ1nUZJWzfA9ybFFHONyMMGeV3dz16JO9hLmfwQRXcjW
	 qL3WM471DR358FUDmKK5Y6bW0thN7/uNx0Zqn07RMeYHhlWW7a8NIWMFPQW4jsWru1Us4
	 dzX/7Zs3C4Y07szsUMoiMLNSnYYxoFRZaYehrOqSCMHy9ZJidjtNx1vNKu5WLS0NzgF4Q
	 mYXDCRxxcsl1rE5G6FqjOYF9UVm50gdmaczyHKP8FHGB+tTtTdJ90ghlm9JpdY06kgFUC
	 Sjz0UYV4xsQUmtEbK8i/+vMzTCcm24H/TiZ+RZCEwJdjR26trXHDO4cWZulFCqWXwqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FpXguuY/";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A427606D805
	for <linux-staging@lists.linux.dev>; Wed,  4 Nov 2026 07:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A427606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FpXguuY/
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so1756155e9.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 23:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778445; x=1794383245; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CJrVpzWSqXnZyMhmYQZlXezsPnpuAEBGvhZcWkwrTMY=;
        b=FpXguuY/gG9NsQd7FoNRar7awS2/rBRpGN5gq+xcsYrx2lFEF9sUPLJ95ejeOGK3zn
         AeZ8CsuLjSvlKSzGFWm5EXVbN6zwR9xvjZ80n1zQJtFC2HDUVk2rZNjWJdEw7kYTEpYz
         TB2beOOXAAMm3Jbfx9FkI39pS5XBwQtAhvL0H9j9PPHqilAnPij2+OF20M3xl1exf7aj
         h3Ar7o8BcsVDxkXWKeTdkX9kG0/J0b8+IzvV6me2jXtFQ/zueLTmg7aBScqG9G6rhspr
         pZ9fXH8qfKXNZMIESsvd58od29mS+eR/NRHomg3feBD6ok3XOZYHoq2LBrlWsLohWljj
         uHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778445; x=1794383245;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJrVpzWSqXnZyMhmYQZlXezsPnpuAEBGvhZcWkwrTMY=;
        b=lkvMU3GjXzVInU9bMcX3xakLERUb9l/0qgZW9T49HbCb8GLxhHBZE07ez8BkQct6e6
         t9GUSl1RmLRfh6T+HC5n3QQ6an1wycWAOrPrDe1yW/C21/fMXDKpIHpL4F1rh3VG3VUi
         VoW3+hwwIneJt9e1mdW46X5Yz6S4i1tU5y6UgmObS8dJ9ZwDdrfYjgJxpZR6KBUhQ00z
         9sYk5P5GnXsO7qiUuwjQrc+YwDzFJzs3Ih3hdr2ChjEHg0ROqWVCXUz+YRfo2y49RP6R
         Nibd+Oa+t+cuq0IsMoMGrvGf0opM2AtpPpaAlmp3VWccrptcyjLB6aKXGoD7/EpP6FDP
         GOVg==
X-Forwarded-Encrypted: i=1; AKwUvByCTughPb5ylphOwAW0yMgsClP52/oRc8hEhuwcyStRm20r6G4s0SaaHWGY+zjfL/R5LT5VEU+Hb2/YPujz@lists.linux.dev
X-Gm-Message-State: APuU4Z9rvP/w0RoLh/Jm5L5F38ww5NsPL5eVxNdQr7dPj8gHZj/0a58B
	BpgTemZ0iCoNbGv4BSZn+TfXdzJykNH2QzJkK5iAWmsSZZ5WHQmI7pEd
X-Gm-Gg: AYBFou282T182uxwIHa9ATqsrEDwYvJsrJtxjFrEpInHrdar1fDJBKVGcjlQGgUxtKp
	l/LXHtvbfyGebbkoud9z6VuEo3Eh7Shd8ZtvKJlHnzkr26q0Q50bSCU7+NnMYSSElAreetqOIDs
	DwiF5MjmSEhwuBMxUPD978aUo2I5xUWOpzuET3stFrZSMpINZvE9SQhgT4UiDNRQmzQymeomVHc
	RlqahhFg0eakW5SIa6aNs4Phyp7YeVeh7TyH0QgtWavocTgwCvlZz1MQrFkeeS66bO5osJlBEyU
	UccLcdx5mfRb0/zULjD9t8yA2GEDYHGsQjAjN8MFjnZ05/yFUuwZbgOEtURplMnWlpYNAhcIedQ
	k0cd4h3XzEzL5x/0lRAtlStqIWnvE85HYkaT/YIzAKdyA8r6KAPRD3LKckXZBTmLznZ2p/mJNVx
	XuAZq7Z2ObUYLFFndHah9I2equoqibn8QtVf490Zxr2xsHlQDa5vUpDqXae8LpY43o8h30jF8V+
	ax9Zv0MTQRkbkklBsA8M2vBojabuP2FrY/UYKDxDaqXmrwhw9oYHzxcEISAvlEUVLyOqreiOmtJ
	9vTqd1QNuiO5AiGbQya1E6fd7wcCa1IaKLfbSL8r6JJD/6j0+AFJ3rInIED2uMryKUHNpY21G8m
	+sJAkQiAQLb1g5dhujdV3p6rIpAQYBAJ1XmGkubXX9blrPv5KRqX4vStWXkIMnxkxBpDHIwjDgh
	/EP98g8AsQRrY=
X-Received: by 2002:a05:600c:4fd4:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ac180f2ff3mr345570805e9.17.1793778444927;
        Tue, 03 Nov 2026 23:47:24 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab010a66sm164324185e9.13.2026.11.03.23.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:47:22 -0800 (PST)
Date: Wed, 4 Nov 2026 10:47:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maria Sheikh <mariasheikh812@gmail.com>
Cc: outreachy@lists.linux.dev, nuno.sa@analog.com,
	Michael.Hennerich@analog.com, jic23@kernel.org,
	dlechner@baylibre.com, andy@kernel.org, gregkh@linuxfoundation.org,
	linux@analog.com, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: addac: adt7316: return 0 in
 _adt7316_store_enabled
Message-ID: <aurjB1B5sRHC6GsW@stanley.mountain>
References: <20261104041237.7978-1-mariasheikh812@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104041237.7978-1-mariasheikh812@gmail.com>

On Wed, Nov 04, 2026 at 09:10:45AM +0500, Maria Sheikh wrote:
> _adt7316_store_enabled() writes the config register and returns -EIO if
> the write fails. When execution reaches the final "return ret;", the
> write has succeeded, so ret is always 0. Return 0 directly to make the
> success path obvious.
> 
> Found with cppcheck (identicalConditionAfterEarlyExit). All callers
> either check for a negative return value or pass it through, so
> behavior does not change.
> 
> Compile-tested with W=1. The disassembly of adt7316.o is identical
> before and after this change.
> 
> Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
> ---

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

