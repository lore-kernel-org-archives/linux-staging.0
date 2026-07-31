Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE093D6692
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785495839; cv=none; b=uCHSFAqhUcQ1zBIrH0vZ3ZT+hrwSBEdiRhyIAz8xBRbBFEXY99ctqKGeyrO/XONp7I3KEbqlTrXjtfy1HPHHVkjXVDOarsFIDTcpKb0nInoGnmYCuPWa4OGdtzEJkurc7vR0JG2RE2ClQngMtoD1cXKWPqv1jF3G1LXCLWaiMZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785495839; c=relaxed/simple;
	bh=sEi+tX0MQ53M+EjMBBODNoAR3sytsf15B59aogLgzi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6oQqtIbphUtJAQiByv5N0h2iLvXj23o9AVeITOKRIleXuUWxbhQWV8PGz4wWMuO5+ny5wPCDdfACQIQl2h4Pgqn3KgtolVfFCvGVM7t/O7pgyHwHaNdEnRsER9grnCPvOaoovlwQQKHeGVpWP+1QJKdDpT0eC7vsnrRBgT1f3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNIoxYo+; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNIoxYo+"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69ffbd2a277so1652596a12.0
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 04:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785495835; x=1786100635; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AvWCcfsZhC7SHwl/V5kypAzLsmxgXVBhLCLYNj64BtA=;
        b=nNIoxYo+Jbe5mYfyK9QlGi13DeXjXos+fQbopL8qr8WX6LTCIQpP9R0a80ni/Z0vQC
         oeSUhwUmsKsd6V3uMoR81vD/VLIJjjXCOY4RwkVFjQ9CCfp1lf1KeswtqBqtdbDFSMLq
         GpxOs4doQuR2snf5jCqx+bCwN+iHCBonmBLEQMHnIMjn3ULvY5KbGmmrR3k38WOvoRxb
         KRySJWa9c5lxxVf+VpyOjV8FEumI8suwhmmH4RmkCMPPBYUvTpLdMThW+zm2Cm9to6BH
         o5AKcBBX/PbtXZnmoEE0HLcx69ytoUpTgxoJQY91dweq3dq6JlR3hOVZP3V51xzTkZHp
         XGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785495835; x=1786100635;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AvWCcfsZhC7SHwl/V5kypAzLsmxgXVBhLCLYNj64BtA=;
        b=TFCT80n/jJ5yBJ5SsG0KKnm9yg3UXOc88bEkWdMVHk3EIYqA2Sb7tz8HMjaDHjqevS
         IwQyw1tCpAVrT3sLsvzj0nhF4M42PWtaH4aw9lljIB/6L4TEDhSZ7uK/4NdwmkbqspSb
         335sQI4OxOv6Tkh85LDnLKvKfzq1+1NF/yy/5BsZOP5+KpkH8hu4pfsHIX8MOvot8VDa
         ddKB0hkD0+q345ASUzdmPfz7SZzze6BJ0xvbtaxl1W+xkZ/VHFd5BjIq/TVQWHSb2vEj
         mhJqBzX+M6i+iqCV0vK8WARYcRcPLFpYfjN/TzJHN9Vpet9H0dzqI9eL9Ekk7ynCSj4s
         FoQw==
X-Forwarded-Encrypted: i=1; AHgh+RrQTESSVS/2e27olu6xlb5K+J9fCUMhOamJU9O/JVVMOSq8IK44X+X6EA6zirAIJAf0k8B+B/1Yw2GBPdGS@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1jUr4GE1wnsGYr5NHSzYrpcRxVOwP0rnKH0CBlqnkwi6JlZ5q
	m0lJBxUYk7turKVKD8plYEtaP1tf1d8mJWo/sG3Y3PBlS4FCrxFELtUwjtH6A4if63s=
X-Gm-Gg: AR+sD13Mku90+FLIeC3dIu21AH7Gpzm8mBj6aGf5M09XB7TzKDU6WhoH7mtmeK7ftWA
	YhuvbUz9PNCbtPHBQfqc1svI5N5gem+PlbHdZZtv9ZTE2TvS8hI7+hfjHz8Dt+qGL5stqzASshK
	WZc0iXvaMOIdLDI3M9LSVUGh7hQLAftV2bf0NVLPmAtYJKHwOMINr10au7D1UsKNRzsEUKXVwbm
	iVxlQ4fPOyRGOwAeOzYQBxdEhwSt+qFKN3Nn1mg5f8Z22HRsDMUbTS8f0nAcmLMsrRLqrsSmdrN
	/pZxQP4L+v/uZyXmYcQ8XIXDKuVBk4/Zzg9HNMmRAF6ev0tJXtbqnQzwmdM35vhiovevZHsw3w8
	SHVl6q/E7lJcrD75m/LE7qor5UFVneR9VxzdtLosPuEBch3J1SmdHAnMIlK2zvD4BEZ9+OfTD8n
	+DIygKhDOpXsxlLlmGF53/628OHGfSGmFxjAywtNrYDNPLknuQKh7un8fi
X-Received: by 2002:a17:906:9c89:b0:c1c:62b4:1ebf with SMTP id a640c23a62f3a-c1fd2567b29mr85574766b.60.1785495835324;
        Fri, 31 Jul 2026 04:03:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5b365sm120650366b.13.2026.07.31.04.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:03:54 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:03:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8723bs: convert mgmt xmit coalesce to
 errno
Message-ID: <amyBFxWUIR2MgLke@stanley.mountain>
References: <20260731070546.20959-1-dennylin0707@gmail.com>
 <20260731070546.20959-2-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731070546.20959-2-dennylin0707@gmail.com>

On Fri, Jul 31, 2026 at 07:05:44AM +0000, Hungyu Lin wrote:
> Change rtw_mgmt_xmitframe_coalesce() to use kernel-style return values.
> Return 0 on success and negative errno on failure, and update the
> declaration in rtw_xmit.h accordingly
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Ideally the commit message would explain that "This is safe because
the only caller doesn't check for errors".  But then the question
is "why don't we just make this a void function?" and the answer
is that this shouldn't be a void function, the caller really ought
to check for errors.

  Change rtw_mgmt_xmitframe_coalesce() to use kernel-style return values.
  Return 0 on success and negative errno on failure.  The caller doesn't
  check for errors so this doesn't affect runtime.  Later patches will
  hopefully add error checking.

regards,
dan carpenter

