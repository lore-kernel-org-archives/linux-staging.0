Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD78333E36A
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911284; cv=none; b=lYGuKnnzOENC8Cv7EI3ll+ktBxE1ecTjVDHDdbEOUWBB9ig/zCb11V8Cx2n0y3HjPqaNukJ+hVtSbYgLmT2/OCMdVAhaDaappdE3STHHVzX9ESELbUG4P8OQG3/Ygzq1C3YPhX8/muTo7146g1TvCVZjLQtwQxrmyo7hJrA+2o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911284; c=relaxed/simple;
	bh=orsjozxBZeT+wGghT0EHb8YkNsbbJw9UBRcSf69LwFE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ELuXyKnZXw6xXL0vVnulXN5HMdF3NogMhj1mHosDbbO49+wF10Dt5iuWRznvy/m49io5FH+nMftUS4mmRNGY322mTJwH95BnCqjs/KSJRxDbtExnEYYcItTBgIiURQiXLrqTLb1DLJoOdj5xC5WpvoSH6GXoNh4GdKGZoMu6CcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTRf4j24; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTRf4j24"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso8749425e9.3
        for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 03:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787911281; x=1788516081; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=THvdq2ntZwEYx4ps0NMR1RlHkdeyM/nQsNOsv9R8Y7Y=;
        b=TTRf4j24nd9xCR3fu5m756hlDM3gLVinTdb7HZAlvtSj3TavH9dD2CWeTR1/a0f7wJ
         kJHQYYVdjKSBS/QGuQDhZ0Ce0KnWYbSh+ElyxTGV0AjwkYZc81E4oL8hZpF/Z896DuOm
         gZQGTyeonjEMJbgbWTxc3eKUVyPUrmned4WGweoQUd9gLOVy2M1zyx9d+wMNlii1sxYB
         jRjC4VK0h2cUwNYKo0LFnwVnpfOQKwqIYIZzNfmtwcwB9LgfMKVuwXSQkuRvEMIc2QXO
         M6nrxbwPI+O4O9C6LHA6kb6XAvVqRG52dyg85Z5/Y4elrpRjklV3SIuu86Icd2RYWOje
         inxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787911281; x=1788516081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THvdq2ntZwEYx4ps0NMR1RlHkdeyM/nQsNOsv9R8Y7Y=;
        b=ZAUFmXmNQhY6c/B7mGCfE8CUFsccXsMgJh4rz9Cx68o/TGfxemXRDZcsBGhIk4KpKN
         Rr2BwDushpG4TDt8fx4puNiQW4kq02EVCbPQoz3+iKZNYx2xkcPMN91TXcpFRZDZMx5b
         ZxeOtb0eZjgsWpoAwTQ4tTgPtlYQNcESyBpg83Ol6/VWo08h5aybuW++dr7jAE1eh1IV
         0/vMwOzMSyLulB/8Jmi+oXvJCrs48nxhudLylZqACXY5ybYpZCrPxylOEUpLbYs29JqV
         fFGijdG6Nt0S42WkgRn0Es34BDwvAyUZ/UtBBKtYfhmT9/Gez2h2v8iHVl3ZkhpHJsal
         RPtg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+KEyvdCBSsTQfDUGQWSnBPg9dd25EQ2FAYNIW+IOhM+3872lxkS3Cp1Z2HegIi3BBLiGv5Mo4ctH/M2iN@lists.linux.dev
X-Gm-Message-State: AFuF++lxCatPADDIVXMOPJTU5R+zjfiT2Ir+NF50ydVpgwh3slfXygFB
	9tWRXmvq7nON2uCjp2AUkUrZj8hmXkHmYvlOPYKDirAmvCHE4LWwOoEs
X-Gm-Gg: AR+sD13QV+9J7/WotQwyiBjGINK3+G16QdofVyPHZ4ohkcxl0mFfkVZk29iYnz7kf1p
	/x1FlCDmm3TEu5TIb478GAv6/nVze47t+JBMpIOe4JvwULbHycxi8+lM29NV9QtDcwqA6tASFfG
	S2ttWeWfxc7RqhhJyTyEbKubNtEKTHmfavOEfYOtbP2dAkPNEiVPShbcGhrFqUCzbiX81dt8dpa
	o/5VDlWlXS+//u7B624F9Cm6SxGL+aaWtyPm7k7iDa3KGiCdW0O/SVDoKL+Pm2newC3VK3LfaPc
	JRYY3sDTMswT+TTRVERL8kjHvbycFaHycC3lezG7mrcCZsu8THR5NMWBuVRj/ZSAIDIypLP0qhz
	sdOqF/+R69lCvBhmZVGOViRZEHLwUhKux7DNU9xV1poqhFIBehcK1T4+q6lNILh7OFxGLqBVyja
	k95MzT8EVtUFPRjI7u+Sl9Or8x12TbNyd4cpWPT4BivehvCIJjSak/DYfxJ3koYXdX5/SGM+nXv
	VNHsTjUJj9Ok8la3mNF8uwyqq6yi3yIok/kxAXW6I/R9wxbEkrZDYl0BZhQf2F9jf7CCjIZUBwG
	regvu+UfO/MWOAam9NLBJXL5tmeOmI3o1XkJRYDt8DR+5/QZJRHSHWy/kFYrNwVVG7pW7olsepk
	Hip36Ndo1uxrlL8esIlOhydLxkMH9+4W50M9y4k8CgmR24spZ5r6skeTt0nRb0sn2tHyV4g==
X-Received: by 2002:a05:600c:a106:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49b92df8833mr53912515e9.4.1787911280853;
        Fri, 28 Aug 2026 03:01:20 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc103dsm36740705e9.1.2026.08.28.03.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:01:20 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:01:11 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Cc: jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 gregkh@linuxfoundation.org, andy@kernel.org, dlechner@baylibre.com,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v6] staging: iio: adc: ad7816: Use modern IIO attribute
 macros
Message-ID: <20260828120111.00000aab@gmail.com>
In-Reply-To: <20260827214721.19395-1-mdmahmudulhasan1511@gmail.com>
References: <20260827214721.19395-1-mdmahmudulhasan1511@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 03:47:21 +0600
"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com> wrote:

> Replace the legacy IIO_DEVICE_ATTR() macros with the modern
> IIO_DEVICE_ATTR_RW() and IIO_DEVICE_ATTR_RO() macros.
> 
> This includes renaming driver-specific callback functions to
> standard <name>_show() and <name>_store() formats.
> 
> Signed-off-by: Md. Mahmudul Hasan Mabud <mdmahmudulhasan1511@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> ---

Also, as trivial as the requested change was, please wait at least
24 hours before resubmitting, let others review the code as well.

-- 
Kind regards,
Joshua Crofts
