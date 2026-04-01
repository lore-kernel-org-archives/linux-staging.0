Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C903939AE
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 08:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775031507; cv=none; b=f421P7r2+AfsjQQGV2cT6+AH25HoU9MOJGAb68tr1jkrAbsHknE9X8pi7qs9tuRw0NElQYzBbZWoQC1UaWt5kREYXth1KFw318eO41n6skuiCLFtLG+g1mOVFWVOQP0EDqlejQB/s1xcY7AvWbCzdYiL50D4VCD7mPv0CDXT+4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775031507; c=relaxed/simple;
	bh=tPpOIhzPQbV78yvJ++CHgqCd7CYutxMZ2Og1TlV2joA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkbF6VGon0bWrsAKBJxpWFd4uxEG+i9AHsqEoppgI3GXuIhOdr9baQMqzmUDY0aGCQWQrMUZIE0KAg0wqiaWQDfvexzHINTtgoRxBxRwb/DkJXbhHcBGafFBM6WogzSAMa2jDW17zi4jewskKryBBY2nFzbFCohYPFfgne+1tTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FD5K2bY+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FD5K2bY+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fb14227cso86959525e9.3
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 01:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775031504; x=1775636304; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9VyhGXIMVM2G+Tkj/VECSHc/Zy6KBhU0tWYIjfPk80k=;
        b=FD5K2bY+uLx8Ah2gjxqL9MibH99UkenWIm8ovDPh5gMys6H4uxzfDa3ZD1zUWyPYaY
         hXtImU6hF6t6Uk15CHZATTwTiP5Lkun6Y2BUEbv3M+mxf6N8/aEeQlCgqCDfDA9hUeAj
         CaGxOQZsHtkYAJNo1W2O/QPihmtfmQFjAuwczplN1Dkt3nycjdjCAmvqWcvi+EFy/1oQ
         ZQvClsMw1eaVkWcIivXMFglimo3XtUsJqsHyC8e3vr2OzPe5a9QpYT5QKMUF9k51hXJu
         haXGRpny1EXXlaAJrj7VRL2+dAYKiRCNirwpL9xrDCy4Vm/WkNc2AL7BBiVCFYj8d0L6
         oxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775031504; x=1775636304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VyhGXIMVM2G+Tkj/VECSHc/Zy6KBhU0tWYIjfPk80k=;
        b=bvT3JCRZqcSojexy+efrQOrDXBOYr19ClaEtP2xMZS7CiITuU866mQ+O5AxI91gmzf
         QO1N1NV+wQHLSytLufRy1m+BP06il/AOsQVAVY3pHbBvGYbmFP3SOu34o5DLFZEUSwQn
         I29eJNcnYhOdh+zW6LY6u7k75QquNCU2FRagXKxq7Q8Xx+kUamOV2kDabCndYkESRkA3
         uQ2R29cIGmrimOrJKkb6Jcvua996EbfoeBC4HgAjRhbe7W+ERMR1TPJqr3RoqiL/fSW8
         WsWeXwIJx3JB5TG17CRvDYIPulV1Q6+tqREugIahEqnN33ZzU2KHrfM6mTv5TkinvUO0
         R5BA==
X-Forwarded-Encrypted: i=1; AJvYcCXJMHJy/e+nF4I5YHA/ZxHqd85BH2YtLNu2ELW+R5/4qadp0LGmuraNBe7dzBe1MnOEs9bDFwivMtBTW0FK@lists.linux.dev
X-Gm-Message-State: AOJu0YwlHi2v2hmnKg4Isl3pmIw8fyvkcivG8ZXn75DkgvgtYCkgrV0H
	34VnY73lQwH71GbSYqW/zO94C0vaRlcrpvqcpme1obYUsJsLiDYEY+ou
X-Gm-Gg: ATEYQzwXGJzV8Z81sCH3Iv+UH2q8f5bWm06J2yPep+uQNdHtQQuehHIXsCsiKGHDUbQ
	KPNhD4S3T19fq/GS3cAG/Efcli9vB9Z5c62E4vPEGbRtsJyN27c+t53cuPzeEd4hOvEaHeT5Q+4
	oZOcGx1pBnTnpg+bKXUihpHRwVL8Xy3T+SQeVdI6xFB0yrx2DsD5pVy/rY2JWyVx54IvALuVEaf
	cZ4iAlY93R+cxKA2uOCbJniT0JYht0ceZ8pOEQnvZBFA6qQFL+64rWlUW7ZEiA6f21TRoZBOYec
	THvqhoCvih6+LSIeoS4122mXUcVpBIZ56YQ2ckhgO8qT/FLYRXaOV4D8w83OnaKBx2uz1FbgqMT
	RT/yy2f2RsAb7EQFXXhUf5LRIzwyJQ9o9+1ZzcpYwphb6v5cdGas2C3nWcCqhGKtR9VMWWTeBOi
	vcpQoNi03nj1Q2oBL4yVY=
X-Received: by 2002:a05:600c:5298:b0:488:7ff5:2c67 with SMTP id 5b1f17b1804b1-488835887f7mr44148155e9.12.1775031503705;
        Wed, 01 Apr 2026 01:18:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e86ecf6sm101366785e9.14.2026.04.01.01.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 01:18:21 -0700 (PDT)
Date: Wed, 1 Apr 2026 11:18:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luka Gejak <luka.gejak@linux.dev>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: simplify boolean comparisons
Message-ID: <aczUykCMQVYbk5Ej@stanley.mountain>
References: <20260330184640.17795-1-khomenkov@mailbox.org>
 <20260330184640.17795-2-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330184640.17795-2-khomenkov@mailbox.org>

On Mon, Mar 30, 2026 at 09:46:38PM +0300, Andrei Khomenkov wrote:
> @@ -1943,8 +1943,8 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
>  
>  			/* indicate this recv_frame */
>  			if (!pattrib->amsdu) {
> -				if ((padapter->bDriverStopped == false) &&
> -				    (padapter->bSurpriseRemoved == false))
> +				if ((!padapter->bDriverStopped) &&
> +				    (!padapter->bSurpriseRemoved))
>  					rtw_recv_indicatepkt(padapter, prframe);/* indicate this recv_frame */

I agree with Ethan that you should remove these parentheses.

regards,
dan carpenter

