Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A6E1B580D
	for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 16:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722441917; cv=none; b=PyIFfILpw4iSk1YlwbsjTkVxijPYxflqoIpa7p7TfaIG0VFPIxKAVjm3jmHYX1mvXTHACoivNbB+caZeHi6ilSwjIc8fD+eStNy9czo5kAfnTy+PQUK8P6vlbb6DfFlzk7A3OlbgcfbT5eS5eGjFcGxSrKMO/TIKR9X/NwQHQwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722441917; c=relaxed/simple;
	bh=a6TO/KMWRyZ62evV+V32rHbVhpWXfPPpsymd4oMdEK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rgn6STl4UphXG2+lHdUSwthYcvdTe2jfYw+55q+X1Rl7vscs652d0HkqNUoNezWgAmQiEhLk5DonPZdA/wF4HFM8PyMmVoY80b3k2K4Qgs0pispAtD9Mrfl9mPE5g5qXP99ZAz/E3hODz6CsxvqQQI7RzEo27CtPLYjoxOzBIyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RJ53jlH6; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RJ53jlH6"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3dab336717fso3978859b6e.0
        for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 09:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722441915; x=1723046715; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QXyhYvjtECustBaF35QTJ0n/1JR+w0RoGMaJ7n/9KQg=;
        b=RJ53jlH64NT3JyAGnC3+5UMD2GtoakYYf2AEGk5WbzVdedfbiNeRPCqAxaVTfXduHf
         g8s6oyIIiFg03Dkfabq4zfr+Z9NInXL9RkX/8LWU3JZsUPiOcfLoN3d52Pcbl6QXEVrz
         eL5EhJhSPgp8V7BSPu3QAHW1S+l74YVZWVh2x9s3kwz0DZQ5c7mcN8p0bbbRLg2vIP6f
         AVE0wcsNEeO5ik+8JJuuMpEu22n6HoHYSJgpqvcUldMbT6MRnZfYr5GVBFGhD/ijaYen
         0Anl6CCM0rd0WyybrzwYJK68bN5FrasUKEHxLUgAiqzbDvB6JFYcCFW7krmIRCwUDFQz
         /j9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722441915; x=1723046715;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QXyhYvjtECustBaF35QTJ0n/1JR+w0RoGMaJ7n/9KQg=;
        b=LJe4a2wXyq8OQqWTnB1gMz9uUI0JBUpXDRSzbDu3N4JPNH16OPRsChD5Nn7wK/+FiW
         BCaUZ8I9qTFn1ZT2v17MMPQd1Zfg1yqLAH4K6bUidhuT7hEJNGEc5I1yCspabDSBTKaQ
         9vC9GUxtgu+iNuaCxw44Nxk6XOUPQzn226L/UA4FuJ3xpM+EyDDFelckZOPFiQMH7EdM
         QXOhuHrXPH/19hSKPHPvOncdjXg/y8cBbdjj1olGlIPTEaiyz4ZCKg8W2wSbQtO6nCTq
         20qi0w6JBAX2nXs40LQRCjpHEmYAuv2CzSASi9eKdZtKtsWTJ00xIsr+9xWH1tI6VpBf
         CKIw==
X-Forwarded-Encrypted: i=1; AJvYcCVMVSJC+Cue0g2wMj57fCZx38LPygMAuAx3MYD1skl9oaNOr89w5grerCQBOHrrm3u+1/5hjbfB5jHMcsCC@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1MRSgf/B7SC3WypVbI+/JEZik/iN30+2QgBILWZLZOFMQXmDH
	upJ6XG46IQA6LB4UNd5i2dp4CuPkYCaYsVVWQIOh8YwmLHPMsherfShC/WJKFxs=
X-Google-Smtp-Source: AGHT+IEWqqB12HAG5XXwGLWqO3LTdY1XVVq0hNmyNyCXnKeUBxbjaS+soaAUYehjzReJQa3OriYoHA==
X-Received: by 2002:a05:6808:2029:b0:3db:215d:71f2 with SMTP id 5614622812f47-3db23a2f80amr17817651b6e.35.1722441915021;
        Wed, 31 Jul 2024 09:05:15 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:c572:4680:6997:45a1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db46924878sm492607b6e.4.2024.07.31.09.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 09:05:14 -0700 (PDT)
Date: Tue, 30 Jul 2024 16:41:34 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Santiago Ruano =?iso-8859-1?Q?Rinc=F3n?= <santiagorr@riseup.net>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, helen.koike@collabora.com,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v3 2/2] staging: media: sdis: move open braces to the
 previous line
Message-ID: <3f885f2a-681c-42e8-bdd4-fd2e2c077f5e@suswa.mountain>
References: <20240730212854.474708-1-santiagorr@riseup.net>
 <20240730212854.474708-2-santiagorr@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730212854.474708-2-santiagorr@riseup.net>

On Wed, Jul 31, 2024 at 06:28:54AM +0900, Santiago Ruano Rincón wrote:
> Fix checkpatch error "ERROR: that open brace { should be on the previous
> line" in ia_css_sdis.host.c:253 and :258.
> 
> Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>
> 
> ---
> This is one of my first patches. Could you please if is there anything
> wrong with it? Thank you
> 
> V3: Insert the change history (including for V2)
> 
> V2: Remove spurious [PATCH] header from the Subject, inserted by mistake
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

