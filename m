Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0E410E3
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 11:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769252567; cv=none; b=C08RbCvSg0rQmbgfvxg1liQoNiPO2Twg1RTm7frxXl4v7neFuXG3hhS8gPcsiQwvZuGJTI+t8KJQaw0vsXSdaG2Jl1FwBgDZtsWxZwt8UAJcKSRWpw2j3TXl5lcelgktQ6AZ0jA3LInUTYBGHRgNufN/TF22vz4bRtXt9FUpaQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769252567; c=relaxed/simple;
	bh=qUARUFZ8A8lYJL8cSBZA8a7/4JmnMnUrSXRQU8hD3HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNkPMFbrgRWjsVrTuw3DatyaxGyh/gkWuPleEvpsRa9f8XNy/X6jF3j5wqaYLqrpTiF4fLRbBC5PiwgLivmT8FY61f7bxnp3o/OZBQG8xekfTMfDPMcW+DSSxWyBLimNUc8vNNsYRdnqYEKY0WqcGaWicQ+qSJ07sa0dsfX0g4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AU9Q/i20; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AU9Q/i20"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so3101764f8f.2
        for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 03:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769252565; x=1769857365; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qUARUFZ8A8lYJL8cSBZA8a7/4JmnMnUrSXRQU8hD3HM=;
        b=AU9Q/i209lRTV+rkw/omYfMsZIXKY0p8HrsJiH27W3xCd9ViCIgYZHK0ys6EEYmRZm
         JJcEsW0YY7Nzfe7esHLwI8DdC1vy2ZiaoW631wB0LjxURhV59bVbPTrewG5Y9jfHm1DH
         dWjhCAz79h2DE/4offxf0CMiZPuSqdXMJjUS2HSbREN5ug7zPqvdfN/IOAMvLfVdyvgE
         6TMJPqJu9s/fgQLMZlX+7VWdDC4DYAMN9O4XQZxsHuNumlkBM+zOgO11MiAzuxSBLIu9
         WB+pR6e2rUi9gAF1Y0eWMmdhfMRg5Tx0AaadUuTiyPDCoboWrpN21WB5eg8XVKMD6Tn4
         eE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769252565; x=1769857365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUARUFZ8A8lYJL8cSBZA8a7/4JmnMnUrSXRQU8hD3HM=;
        b=T/H48p4flGUHjW95d3iYyB5YylDvb4/DO1XQ1we/ez1iQZUO9dVHPY53nGweEesCU3
         DeFF/E+hsN/bklpeLwnRHzaCjx28qtaVuFvM6Oqg4nsWw701XF4soPYYoksVqvvY1Ohl
         nj3+jD3/uRioKE7R4LbiiDwk9nAEf43O6cOlUHf7fsOJjRxWHkC9bY5YXHhADZXSD0/n
         0z8V4mZ4oa7uXnmrqczhYjuf7Yx0jaq/0BHz5aoNrx6GDakq5h4a4Z4m9ILoc+4XfCVX
         lWMOOfcJ5w7i8UX+Eb4Pboqqozpvi4r8KDGg9rbjuPkSXtw9eZdT9xAirZnoAbmL+Fuy
         yyyw==
X-Forwarded-Encrypted: i=1; AJvYcCXGjJpDQWlMtDdyZdkw8cZRTn6XgExdwYBOGddUyeDymR0mZ+a5ZiOHEc721BYnqQhnowEsP8E3udzWSnnb@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa1C/LHWGo5bG8F5RKrXMmRPPD0Y6LSfQEm/OCTQJbqT7cT9C+
	N+I2WpD7M/aIsFNrwNhbVfiJpN5eRAlBL5vS4DlGyPuih4XvtohHwI4a774kkSBfFC60GVbPq43
	kD5W8jLuM1Q==
X-Gm-Gg: AZuq6aJFK+t/6gSzcKxIG9uBxHZ7Eting3te6KE8Y03XvoEs0M+Bwr8AfQk4B9VamDJ
	u0p/hnJFLDFGL6NKnW/QpsOyQ8L8juSVMDt/CdP9LLOEemUJHVv4o6SsCKfMgbJboIA9yz246zD
	pHe8Ywj9+J86fj3FAwuTAAZhjXCFy8SN/41mwgAG3XR1kmwDvwbRuoHP3cDAC7Wdg7ybAq+F3Wp
	INH3Tm3vzwy4Gc76Bma9Hz84GpX/ECZUkoKNELvxOrcfwl12BKUnPH7IDmLjzVTRPG95psfUU9A
	e2eEkhmjhY5kKIkBLgM676XkHPihfepSDyRWg1xfpQwFnn3Sws7R1zI/h7vXcjuq+9fZGdPSiPG
	py4RA83asT/+WrH+HqYzT3xZDz/HqFtHA8DBj2veyHJObdfIEG3RsXpjqWnJ+fODiGEwP2i4JWy
	clvjdA+11CtQ/5vspx
X-Received: by 2002:a05:6000:2486:b0:435:a52e:7758 with SMTP id ffacd0b85a97d-435b161fd71mr10429701f8f.57.1769252564813;
        Sat, 24 Jan 2026 03:02:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e71562sm13469825f8f.21.2026.01.24.03.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 03:02:44 -0800 (PST)
Date: Sat, 24 Jan 2026 14:02:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Huang <tehsiu.huang@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] staging: rtl8723bs: fix line length and coding
 style issues
Message-ID: <aXSm0QWAHBCbIh0t@stanley.mountain>
References: <20260123211904.64589-1-tehsiu.huang@gmail.com>
 <20260124104920.5721-1-tehsiu.huang@gmail.com>
 <20260124104920.5721-3-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124104920.5721-3-tehsiu.huang@gmail.com>

On Sat, Jan 24, 2026 at 02:49:20AM -0800, Michael Huang wrote:
> Fix checkpatch.pl warnings regarding line length exceeding 100
> columns, white spaces, and unnecessary braces in rtw_mlme_ext.c.

Fix one type of warning per patch.

regards,
dan carpenter

