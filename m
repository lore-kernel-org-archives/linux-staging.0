Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873E337BE7D
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 09:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780478012; cv=pass; b=CCXk0Nk7T//o+O0es6oSx51WQ2Gl7qQ7fx62w4SRUspp+ZCqsiQvijFkIf/gn4YZlxQDcWoAQo2zWVh/nD5luKAfO8GQGT6abPQ++fnR+jZ0WYr2DyT4VZ+mlTb61Oc04qBNLL6svcBBzef8rw8pZRYsZCVmg5Hd0YOxSUn8yZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780478012; c=relaxed/simple;
	bh=IbYUgc+Z5RfVyiB1zaY52a59shitcbpmklnqcweRM5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mhPQH91o4YZ6BSAasbD7P/xMfVtXL0CqhBzww7JoYsLdKumuNXiiluC1bJ6u/LMhTJevBzNto/TdC3of6mnd0J0QmmgOYISVRaOK2yZutxocs+W8YT10lc8Wqelxrak+MCnEzuDTxWXevw+xTUHQFxauUzta9qhm+so6r0Hm+1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giYhPYIg; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giYhPYIg"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eee266c6cso4734140f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 02:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780478010; cv=none;
        d=google.com; s=arc-20240605;
        b=DMig0KMLhKnOnYaTnYkUf2r5X8FKp47ARy4PwFUyWFXtwD8Nm/JQePemItAHOJx3YA
         82r+EEip98kXaQ/i3dyVwB/TDwa09IZYidiTwg2gkKNSo58oYHg5JSRc1QTTix/mTIrL
         kkZiFBh7PaRreZRFOSXhmU6z4YgVGIWRVeHyzIoC5/3QW7wou+r5nlnns29UGQmik1Vi
         VPr83g3XxYnOsUKZRp4PQROx9KEMgZVAZxXCrfFNBNxK9tSGGV1eocm0oD1eoA8c9KDH
         /SGFhP/fedABuxt4lTV2cPUlsHAn3NT/3bQrAxcv6XgCbixyOzcC9YlZtIBJUBvuWVxh
         QaXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J/IB4F8wtmp6htqLg8CaoDs0oxjd0u4Dbg5g8165e2M=;
        fh=A0xhDH5ghLVdtKcvQWXiRofwUEOwgif+E8zh6iWUQw8=;
        b=QzldA7BUJbXIM3yrm39Z8nDPIrNPYi1OEodpLvnVOCn6Jc074XL/K+jn5tdzysPdmd
         CDavJxZSdIgo7v8gHHzWzxvdxVVkvQr5aXvpm3p804sPRuwaPMrHv8UJf0KfV9xhHRem
         ZDyeGOjQbEeZnZV6dkUicos45+iqArvmn8rhpSzmSy13RD6wJFDYY9RST1gmaITfWZft
         kfEpjlY4RB0HqMJoaa7mLWGk+uWcEDy2jDSezpe5oa9eH8hdogJ4YX0SgrOYnGWEEzh0
         AIe0PPTwtf9m7vRyXOO/GPcZdo6he4uzMAdc8pZUfk6EVVy9hmVh6H0GlQNMUsJq2kTs
         jHSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780478010; x=1781082810; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J/IB4F8wtmp6htqLg8CaoDs0oxjd0u4Dbg5g8165e2M=;
        b=giYhPYIgAhmYZOvw5pTAqGKPKrFvI3r4GmlU5+pZah/lCYL4mI5NmRUFto2B/5aW2n
         w3esOdMMAu4gZF70XMg09fPEE6iiTYrVW5yD80Eb+quHlY9ObpyKszhl041adJmmlUwh
         Nqlqk+5wL3bZE4LlhL3GZPlaVLl1tGrfZ37aIywk9OXEr8/BnmNhF6aYNMf8px15IaHx
         rdRfkYi+ekqxu7HRyXfHt27ij3BCVcpA5BgZJpeJ4xxBn5FMsZDhUa42laY1XyGDcFj4
         XINNxnBmF3Jsd4rnw9+W9mx8CoKh4hJGX/SMzhbdBtS2fWLZas0sKLEwuZaqBjYDhrmD
         JHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780478010; x=1781082810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/IB4F8wtmp6htqLg8CaoDs0oxjd0u4Dbg5g8165e2M=;
        b=FSuxJvvlxL0SNXlYBgKQcU6nWKAPYYMgdLKw5oisDVhGVdNdYsF3TaSCPAIyy3qi/v
         H005HfInKpqKR3mYnneaRvwuq1riXjHRl6Wvpgx86B/5OIywNt6LUTFrv1PUqMghet4+
         NruxF0q8X1AiSDW50pOfKm3PRkIWZcxvMKg6i1At4iOHW0zW/+1Y82OdGObpqZaYvtxT
         C/xEvf+WjT3Qe5Fh+3LFqTe5rTHuDnv6R88mCcRyx3uy3x2VuttCHOEkcvPQuNeH8G2U
         CdmFPfTBxweT6ePHXiugayzPX01Iehi544gChPEiQcLabRx+pdVrZnb1A3okWuwHtVof
         FuSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+oFss9ajBZnKHqBQ5p/4nkEhimd2IXyvd7Fal54xEztQf+/4IjzDDrh5HdCECYAGIqpBpt+/apAdhL+JaT@lists.linux.dev
X-Gm-Message-State: AOJu0YylFoYI0W0QKzhZrcIChuAMVQM2be3s9EMYrhCylc9cOFRTU7gD
	qEHL2qARrb8jYH+X983pzWOck2qkaJ91OmO3kchwTILH5M46QZxnIXUNAJyT6jIxv8H+21FIleb
	36j9IxeL+gwSywoRBxm+xu/JNxJo5asY=
X-Gm-Gg: Acq92OFP6tZiVknre+gQ2E9NSfB9dffpCjxHUfJ9zKFVFwrpKteeLaK4yY7oFTuFSMB
	udfnFroLUxIz6rmIdMPFT+9e/7Hqfg8PxFFc9plhuHChOH1Ji8VKhy+ti9mOnHbbs734Ww8oce9
	NyoIXrTwf5qT+XSpvchqk4d9Tih8uy9lgVvsQ8mxmMxhSh18Mgo9/+RILRxF0ZPEm4WV1bVMtDn
	JTcssXf8JpnAUbXixz4Ny9fWPDu4RY4BzjiPOsJWHbK0ukDwetc4yfUjXSMx/Lo1jIFJNIdh5tW
	CJbn953xm2vbBARQna9uRAUIIGp8a56XSbBzTPZ/a0Tdfl2wmuuouZvLdyYisCKaHuOhdcF7OJm
	EZxeIt/HBf5FN59lnUHAWu64NmBymYsktmBJKumMDcl4le0jRW5tqh2vZ1xxJ0aJob4FywzVfW/
	5diGtoKe5181IXIdqd
X-Received: by 2002:a05:6000:43c5:20b0:45e:eec6:5023 with SMTP id
 ffacd0b85a97d-4602197e8f0mr2424451f8f.37.1780478009800; Wed, 03 Jun 2026
 02:13:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603123333.5608-1-tahanarimani3443@gmail.com>
In-Reply-To: <20260603123333.5608-1-tahanarimani3443@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 3 Jun 2026 11:13:17 +0200
X-Gm-Features: AVHnY4JWFwCvcrQtv_7Lobpb98peeHbSW84YciMGGf4bVoc08SZfJqhxO7KDQF8
Message-ID: <CALoEA-zvki0Gvzug6bueyf6p5011_rP94uEijrUKaJTGneo_cA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: iio: adc: ad7816: Use devm_gpiod_get_optional()
 for busy GPIO
To: Taha Narimani <tahanarimani3443@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 11:07, Taha Narimani <tahanarimani3443@gmail.com> wrote:
> ---
> +       chip->busy_pin = devm_gpiod_get_optional(&spi_dev->dev, "busy",
> +                                                GPIOD_IN);
> +       if (IS_ERR(chip->busy_pin)) {
> +               ret = PTR_ERR(chip->busy_pin);
> +               dev_err(&spi_dev->dev, "Failed to request busy GPIO: %d\n",
> +                       ret);

Looking at this, you could eventually move all of the dev_err() calls in the
probe() function to use dev_err_probe(). (For another patch though).

-- 
Kind regards

CJD
