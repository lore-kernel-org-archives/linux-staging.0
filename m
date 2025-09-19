Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9712571BE
	for <linux-staging@lists.linux.dev>; Fri, 19 Sep 2025 08:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268895; cv=none; b=e2TbpdFa9lGzgANNRij+kZ6wc3c8r6Eaj6OOVEh7rIOusPf6iat6nKglsx/vkWh5tYNibdha06Fh7KlBljOWYqC3orOIbSzt8MMeX3BikYA1hMz6IKRyhRavBe428CNUV11eo7a8I3pOEpXpgNM/tMeyDxMD8f1vz9gqLQaghDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268895; c=relaxed/simple;
	bh=G9EfOedZLRlrPC3wZ2bKvgfY479PkPvphVW71kg52sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kipVpwNCKq+B17eQ+El+9MLgsIsPU15PljkAuKP3E+z6oxpnhPQp5Rt9vqwl9rXO8dSOXTOr03nyuFVbmJzVfWQl5iZyJ1KbxsZxTbREm+MzLiqR2Na85VGMoTKPJzWpySqrSDdigY1KoleYHb7VHMavKZzytoetZj3b+Zjftzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r6ACmyie; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r6ACmyie"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45f29e5e89bso19868255e9.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Sep 2025 01:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758268892; x=1758873692; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a22LDubTXvHim9B6ODtrijf0DgwZwF84jacr83hWucA=;
        b=r6ACmyieAZ438edlx4y48CzKjeX6OvPz4Rd+waeaJNixVNTG/3o3cWgEdVTgt0mHK3
         WueqL65OGs5qcnysDiWEJrEElNPIWFEIUcyFNT3YXq6DBoGJMtPpKybNTyovf2pXzH74
         EPQAVdFt7yBS0q2VUo8ccT5OxuUgIB7iiXiVSQfyszUmqKvec6HVtGIx5l4Xq6FLF7wF
         MpohwoxF/xRo53z8YvVibwGDGxCgeaKefoMgzlTpeSMI+vn6Qrp0Uep+dnDZleozV517
         xwNp97I17fNGxb4Kbnp5ToHjy+G3aAegbQXdaYwdR1AVrziY+o8oYTu4192Ty0NYlWDk
         5lEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758268892; x=1758873692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a22LDubTXvHim9B6ODtrijf0DgwZwF84jacr83hWucA=;
        b=ruel9J2S0nuUG1r9ZnX19Eov5asHVukAp71IgwjU4YFy52/+ZD/qG+p3Xq77JdSr9m
         q137JnzE5Q1/W52cPrmVNQWEOzdF+oqrmkeR8Om9oBtSv9uKiVkbhH/PpUU1ed5Ftkj/
         JqYLyGI7VTXMxkIS+E7VcT6s0DzlDte7wrdL05lyMczn5V0Z3nGyhgbx3ICAK9+wGhUq
         SD/DVoelqyFcd8fpHhI28VGNhUql9yGptPzBXrNSWP6zigWSnYg4idyjMkQrC1MaoevU
         upCUijaniHGz7cqbD4Dr1kDSj9nDGos4nLD6AhL8189zXqJ99M2+3zyZoaNJeXTrxo4Y
         eXTw==
X-Forwarded-Encrypted: i=1; AJvYcCXCrboGvRQ3sNWEF0QPY91nPXCxFNfpgIFXwSU3R7ddN+iVat2HfhC75/m14ZGE1vsobdxiEEYBR1LhlAhX@lists.linux.dev
X-Gm-Message-State: AOJu0YxsV03ESdH+UzHjgNcKFaTSZ+Z9erBzJ/kP1R4Raqciu5AaJ+a6
	5D5RejtSecMSo+nkQGJ+O1K32YLRidOcCT9UYgNMQYQWkV+4Uh3Ql1driZ7Ev1pb9ogffJboc4y
	O5yuK
X-Gm-Gg: ASbGncsY9Qq82gNr3NA6L+wnR/TVgKfVE33NzDLkavWrkNZp8MhJYYJi6QK9MVcU8KT
	r7Q2Iv43bUr79011ZjPfMBcpUHM8yyF7jVzPG0Yt/L2TvDQC5EN30RmK/Z32uSYXBq/aZO2+6zW
	kbW/FY8VTtDsMe5XnD3HAWXwlLa6FE2MeQTJ6EpqG0/9VUhDiz4vo3pXPAmNyB/4/GAR94yP3AX
	/KSNxffxZEnVCu0o8cF1B6xWGhyJnu7qoA4FZrHhDk0zGms6H/Hu60Iw2Oa6ikCY9ywsWPWSLJg
	Gy/e7a3rSel50uA5089A4IZNNYsms9iWarWbYg2RXWL1JoZR4i/HhMvSUq2malNO8pvGKSryBUf
	jL4Q7rzSsCXXa6nVKM9IDKD6nryFf
X-Google-Smtp-Source: AGHT+IHAUphO53ZLkTrQ8X9O84Iq88RKjwPXCUorXJ1SdYoKX4xMrjbq4DzBe4qxbr0QGAkpfmeJPQ==
X-Received: by 2002:a05:600c:c04b:20b0:468:86e0:de40 with SMTP id 5b1f17b1804b1-46886e0de83mr8273625e9.4.1758268888777;
        Fri, 19 Sep 2025 01:01:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-464f4f9f4e4sm84977755e9.13.2025.09.19.01.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 01:01:28 -0700 (PDT)
Date: Fri, 19 Sep 2025 11:01:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soumya Ranjan Patnaik <soumyaranjan1812@gmail.com>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: enclose macro values in parentheses
Message-ID: <aM0N1aZYErdXsOAc@stanley.mountain>
References: <20250919070351.586981-1-soumyaranjan1812@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919070351.586981-1-soumyaranjan1812@gmail.com>

On Fri, Sep 19, 2025 at 12:33:48PM +0530, Soumya Ranjan Patnaik wrote:
> Macros with complex values should be enclosed in parentheses to avoid
> unexpected behavior due to operator precedence or macro expansion issues.
> This change wraps the LINVAL macro values in parentheses to comply with
> kernel coding style and improve code safety.
> 
> Signed-off-by: Soumya Ranjan Patnaik <soumyaranjan1812@gmail.com>

That's going to break the build.

https://lore.kernel.org/all/?q=LINVAL

regards,
dan carpenter

