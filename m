Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1E522578A
	for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755784458; cv=none; b=tGkq+ToD8UTD627tmn7QO82G/QU3WLfLpCvh9t2u4X8X2mt0e7wxEmkSNf3YRv0hvi3ofeXAY7q7GVtEPBCxVSGRu07cKh4o1vouoL5zf2qHJY3xDV8UsM3DfewJVRcnnani6QEOxGE8eMg8cW4+ISDq97cwB8VPqhJa6p+OMJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755784458; c=relaxed/simple;
	bh=zC7C7olZcUe9Z8cx+F7Mg0Zp4tUGSbUZ1HeIK5G/2j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qml8nSEuzVg51J8jmnuRAwUAEi19SXZsEZPrs/GttooGLg8e537fHAaFVOU/5JvN2UBBqa99XSucT6itZxMTirtJy3IM9FuyzpKlgJicghM4uREf77yY8BygVf3uzNPOjH/+avFNfAVwKASgBNHkus1PZ5AKhcwnRqQ8blxMUMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zx1G8xeN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zx1G8xeN"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b00e4a1so8998435e9.0
        for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755784455; x=1756389255; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+3RckpGmvYMoNZtx01O704Cre8/z3CXAKxswJRZI57k=;
        b=zx1G8xeNhbQf9t6n5lehZVW0aITlsus7SaoF9XyqPTnaB48AaZOfWjUSi1xJV9AZrf
         sOXziFexkPMEEubtguQQ6q5IPRS3+D39F7G4iYlg6BY4t0tQR4AICnNncT0LDaxa2WM9
         KcsjrByFqmpjJQL3aFYO3Laz6TtOTScpXNMMpjjq8OXdS57q9woB+dNbqWFlE2cpz985
         FJLAEYTu13MVlXFmRZqePTnT9egLQqmjb4smUbMTrdu/SzQcfP/tNk4z4RIiqRGvOIbK
         QdrOqh6tswYADSDutdhpAB+68Vvb2//mQdFOUjTgTE8S++h8+UkQM9IEcM9R3ydV9GiZ
         lorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755784455; x=1756389255;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+3RckpGmvYMoNZtx01O704Cre8/z3CXAKxswJRZI57k=;
        b=lwG08STXSgV0YAWI7kiXTaV10ggtQ2rzzDeDQFnzj2He43A4Y0Dvsxjbx3ZalOogin
         ZcvvwaLiYe/CNfdSUTLzmtjaDoelt+CY0Iez3Xwq9jZbdTshreWb4sKXvhrOhd4ffAqv
         F00JchuTVJjB7+DP6jtdT79lIGadovpefNwkQaahSJNkdNxeXmwa+3ZBevYyJSrSm+9t
         rsVC1hfyKDlgCvsIst3lmE/yDbijdPuLG5I01aGJ4v0d36PrbAQJWLwfNop9dnpBWTso
         Bt6WfFCUFdEMkP5UIhtxbRK92QJAaHF50Sv/F0rr87qWdnPkPa3NRRzEeLmpMRsVHBaA
         cncQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPeW/YDsZyFm8n2EyJotqZe/ydayUBpMO6+gOh8if4fK2etqJhDQmItgtiNWX1xPXzvK7KdNGfzjc7OSLX@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo+eWKVOdT1Q4nZm2RhyqD1T7W33IV3BEhduGn+3G8l6PGOxvV
	SKf8OndYsEgB7J7JU0P08w8MchEY4ZxWIbGBpBywwlyjL/wDdUK1ZiiQttJBw8vN46I=
X-Gm-Gg: ASbGncvQn5yBiOnZod6zDcVUVPLiV8aOABk/EbP7bqoxcQEil8dipcLUNARx650eIx7
	OOU7q5V+eFtZ4+PhqRYum6OrfYWyEqpnJdDA6IUc9E4iRXaTLml8jnyVcTgCOimOab0hMOn3pu5
	Y+2+4H/Pd7ov3Ydl1f0oFsA75RXLDsKETMfr+6RShUac8VHUCUXL5W+W85//gsC29vBMkAlNDXk
	+CCHHn5fD6WHVgKrnr/LnyihR/nKPJaxcsgTFkx0NujMLGSfdATC4/FAeZUhwZYkPhjprnygCgn
	5EgaIDaZamIAfK+hnFS2ri+/gfy4SXnzmFJuvWkJvGsiYqZKq9IpifpT7Tj4XW7SwZ+eSHby1op
	jb/NNLSq48ZY7Bj2mStpbiBKWM2E=
X-Google-Smtp-Source: AGHT+IHiR4UgXlDVbxv/WGTxxHwGZcE5uF0kFr14Nzs0vJdVHWLv9FD7z21HRn/vBRYJKN0FFsSjWA==
X-Received: by 2002:a05:600c:458a:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-45b4d85d764mr20115275e9.32.1755784455144;
        Thu, 21 Aug 2025 06:54:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4dbfe2ecsm28935915e9.13.2025.08.21.06.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:54:14 -0700 (PDT)
Date: Thu, 21 Aug 2025 16:54:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 1/3] staging: media: atomisp: Remove unnecessary
 forward declaration in gdc.c
Message-ID: <aKclAywjKpHBd7QR@stanley.mountain>
References: <20250821133521.2665734-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821133521.2665734-1-abarnas@google.com>

On Thu, Aug 21, 2025 at 01:35:19PM +0000, Adrian Barnaś wrote:
> Get rid of gdc_reg_store() forward declaration because it brings no value.
> 
> Signed-off-by: Adrian Barnaś <abarnas@google.com>
> ---

Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

