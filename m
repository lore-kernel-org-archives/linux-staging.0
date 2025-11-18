Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024292417D9
	for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 04:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763438684; cv=none; b=hntrpnP5KypWXtnzqxE5qHaGNGz2EEecvhea5f+UgPahLhTezLEIm7EPMh7TmWYNmleKr1g3S2l+fZi1YH7FuTUo9POz/NJ7Db7Z+GVkbdWKaY0kOrECseGgZ5XAZp4RYgvY8aG769Yscb4l6X4gLSw9BpHt169eq7TXkbQAVck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763438684; c=relaxed/simple;
	bh=PpSAw1zSfMgLsIuPximzVxVe8SD5S4PAXxVNBvamlz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WaUsb/CDK5uBmTUZ+Kw29yWOdg6rWwferayou+NGWrRGjR3/k+2GcLkcduP6zRTNtq4R8hF1r+i4zWRPjQD1WYkzA7RNnY98Mo+OtwfyFxKV85Xmj6NOeiMtXtbARPMF1jv6/PBYc8E97NpgYZU3hjvAHmbqcEjsXi+4pD61GP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSHXrhsj; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSHXrhsj"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-298456bb53aso56694985ad.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 20:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763438682; x=1764043482; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wC+feY3qzBWI5faUCV3T2V3Iz0yHnRlIALjZtVQOaPI=;
        b=JSHXrhsjYemm6oj3vfEdPESPtuj7z69BiKq8DMEz8Wk8JVsBy76giFUCgsVriR9j/z
         4XMMZgBGceYicTNtEwGDiWqahZ632gdiz+jT1Y8LywMPg+g5/eqMUuJB/60tFeM14qMh
         ak/yQuxXc7oagESdSgMRlc9F8FArGf457SlNZd1NwMI9uJQsrQbccFmJ5CGG2uLu+hjQ
         n9FuXD24QIzexmhifT/qELK60UYXcRl5oZHPb8i0BlwIZWx34jU0BiVuqXvBnrFtQBjI
         vfhPztHfRARAtzHSXp9efY1tDk87/zaKM/YI+48WDKFQeiJ7uBXYmfOCJSMk1JzCAtdT
         WiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763438682; x=1764043482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wC+feY3qzBWI5faUCV3T2V3Iz0yHnRlIALjZtVQOaPI=;
        b=j0JpVzhy3hnwbTTtdBP29cLOdZjXiWzxzN1agMTHeULmqhK+UJDVFjPqnFIYwvqoLf
         BmRCvnpvvYR8FoqKIxhfa/YUGnccGRC/eGmuwgZz3iUNQPZxPRZERsy42hOWpCzWE2Y1
         hzJlgpY6sWU3CwwK0rw3QfyIhbyT/NcmpSrs7T+LsIPx3l7gbNBbHtGLREz5xx6nUsdC
         SLQPFzb5LXt0JxB7VzmJTiYq14QtAkvFIstmdW0K3oGXBFoHJkAXheITYtaDrwqnUX8G
         54sYn0tvimUr5AtgAQU47mJiumnCIyrBJ8OxVOTA4Ch1Lv8HOhbvLnCqD0Jl0SncF/nd
         MXYw==
X-Forwarded-Encrypted: i=1; AJvYcCXHw2TlPzuFz/5GZNr0eEWDxcXklje5Ga1+dIht3nKRI3mzXxRz3pqyE/I9x4S/NAMI4aM0a7NxKg2dOUN3@lists.linux.dev
X-Gm-Message-State: AOJu0Yx31Xa047rleLwsx7na2qmT9PcEYD5fUGy9aqyBDcg3rTlkwpib
	S6YHbVgY1J3tWTI/s2r/+Hih1f6RKrl0DfLY5U9PVkVlgfvi9rYsyBaT
X-Gm-Gg: ASbGnctKAcXb/B+LPUXIgJuTmlkJgJFfeKQIB7YIo/i8TAdnmTrCbd4qqJ5NP/a/R0P
	G93pRnYcI8nt1BBDZpNAboDLZSOG9lSrii/i4s9qFJwpttslk7KjmughD6jAJm4tIVS1w0o5TAO
	jQ+iOpAkavtZ3zkSf2mSrgsyFxuVxMvF+bIUV53zSHpkMGNHv6GIcqWJy85Iq1sWiZyTPfTc2MW
	GOeDmJC6UmFyPM0AoW9jmSYzz2tsuXR3SL8Jg9UhnsH1U5/Q3zxb5o6yimTWkgwxKI8CgqKOpx0
	ZsEeWt6SMdZEmbHUTJNEQaZhTF/uthSL3pvuasmfshjp4l98UoQi+spDMF7LD49TqCzIlFJmIdC
	LS+jpeIELeYNNmp4IfIofuQ76a9iIQLZhYMV44WPfF920n7f/DjYOVR7sakts6JYfryDo9sYEwN
	qzPFrgNSp4USeGIw==
X-Google-Smtp-Source: AGHT+IFT545HL7cW2e25KJt+R06w8oqszsIxfb4dxlMAMz1NI+ZeTUu09LQHTiYeM6nZQjKUC69tBA==
X-Received: by 2002:a17:903:24f:b0:290:c94b:8381 with SMTP id d9443c01a7336-2986a6bc29fmr167104235ad.7.1763438682255;
        Mon, 17 Nov 2025 20:04:42 -0800 (PST)
Received: from essd ([49.37.219.248])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36f42eb0esm13669955a12.13.2025.11.17.20.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 20:04:41 -0800 (PST)
Date: Tue, 18 Nov 2025 09:34:35 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: gregkh@linuxfoundation.org, johan@kernel.org, elder@kernel.org, 
	linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
Subject: Re: [PATCH 10/13] staging: greybus: raw: handle disconnect while
 chardev is open
Message-ID: <amtyeav3zlevbv5yq5izi3acoezndxijz7p5mf5vngng57sdvu@2fms574jooks>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
 <20251117181818.118139-11-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117181818.118139-11-ayaanmirzabaig85@gmail.com>

On Mon, Nov 17, 2025 at 11:48:15PM +0530, Ayaan Mirza Baig wrote:
> diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
> index 71de6776739c..74818ca829c2 100644
> --- a/drivers/staging/greybus/raw.c
> +++ b/drivers/staging/greybus/raw.c
> @@ -24,6 +24,7 @@ struct gb_raw {
>  	dev_t dev;
>  	struct cdev cdev;
>  	struct device *device;
> +	bool disconnected;
>  };
>  
>  struct raw_data {
> @@ -231,10 +232,14 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
>  	struct raw_data *raw_data;
>  	struct raw_data *temp;
>  
> -	// FIXME - handle removing a connection when the char device node is open.
> +	/* Mark device as disconnected so file operations fail gracefully */
> +	raw->disconnected = true;
> +
> +	/* Disable Greybus connection before destroying the chardev */
> +	gb_connection_disable(connection);
> +
>  	device_destroy(&raw_class, raw->dev);
>  	cdev_del(&raw->cdev);
> -	gb_connection_disable(connection);
>  	ida_free(&minors, MINOR(raw->dev));
>  	gb_connection_destroy(connection);

At the end of gb_raw_disconnect(), the raw structure is freed using
kfree, and so subsequent reads to raw->disconnected from other
entrypoints would be a use after free.

In addition to adding the disconnected flag which you have done, you
also have to convert raw to use reference counting, ensuring that the
raw structure is alive till the last file is closed. Please have a look
at drivers/staging/greybus/authentication.c where the same issue of
files being open during disconnection is handled for the gb_cap
structure in gb_cap_connection_exit() using reference counting.

Regards,
Nihaal
