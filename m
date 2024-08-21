Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249447405A
	for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 21:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724274264; cv=none; b=ME3Vg5jHL/RrbupOPwkfP9u6T2zT+hiA2onfp6LiRIW5Qs2rKzJzQ0simyuFuM7sYgKjiaFHbuyJ+g6oQQdFwTwNu+epI+vioXqkmSZycau+ofbEFyq98myhfl2w0ah1zzVsYN2Q69Y/OUPNLQwAT3qKJoKIRKpB+b4PMEg3W7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724274264; c=relaxed/simple;
	bh=SAb4zDtkx0tlEKYJMcHCp3X5xRUof9qOVZxADAha1h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TB+ET1fmsYFhYrRcgqd6EwrX8GW5jD14fnXrSU4SbFvN3LQBOHQQ+OccSzLofZHoYuc5bQGPIbtrwXu7PMVc9NDgS4p+wIYQTdz5WeKIre54Y7U+f2OASfojAZPSpNNgWcEaDoDkvQKktUTwa/P+Dji5bnuuYC4cgosVQqjZb5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hj2i1wR6; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hj2i1wR6"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a867a564911so12243866b.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 14:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724274260; x=1724879060; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bca90P9ChDkgtck0w2Stz/QCYYqZlcBKDKfLWKWDSCU=;
        b=hj2i1wR6xiqvdheAzIjE+tGikoCw3ICqpbZEGzDKM0+ka4uTrlds66qbMrgdGD2g2M
         dN20cuHsv/Z6bY9/T3DmnZ9hnCUWQf2Ybz25x2n0CxW2YoqapHVKRrsEJMCZ576s/DtZ
         efMqPLafO0BhNclucqlsxNfhbJzjJgxcNzbXB6Glu0OpV43Fsdfl0vmFSVUydSS/Cb22
         UKN0Jz/p1Hgr0Ca5S0fnyT0f+K5bOv9o9ILaVvjKQ/mqPHICHk/V312CNOcrK6RudfE6
         bAYH0MGgVPINMzR7S3VNqNUTjLfu6VpP1JmqL8NTLeTWBLqiUgVCPyD+kJjGvfi2WC2P
         slOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724274260; x=1724879060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bca90P9ChDkgtck0w2Stz/QCYYqZlcBKDKfLWKWDSCU=;
        b=uFGUfFOEiyMZa1z03kctWAzwFh3RBWaztCO81oPfdWMBCblWX/DbKamBhTFRCjoybU
         QEcF1Sq6F+aavX2vMVkltIvtbKJ6ME1yVUBTf80mYsUP4CPm3kYgSAyZAts/l/I90eRi
         JJHGRC+ONtqWT0Dp/4rTAtnk36s7Ug2MXAs1LFmPFAHj07CN/YSBVpWezXJIEw3csIde
         zfPn038kfwu3piQPPr/3yjXbJwYFaa3Lv7QsTKecc7JZlrtunNkb2dWnhQPntWACVlUU
         aaba1c/DrOwEtOJnvcnEH3QuUL/NgPGCzPDZv1ayuUXtYOEiQmkb4ez6z2OYGxl6DlMI
         C6vg==
X-Forwarded-Encrypted: i=1; AJvYcCUcdfmxaXRJkbpFKk25k2pmAS3fcuJYWTs3u3L3SbgSYAuA0ZK2VHHw/oqhG7x/33A8zXE3A1RYWN8b2lap@lists.linux.dev
X-Gm-Message-State: AOJu0YwgvJBJFk9wkQkawKWbFAnJDdJ9TGiBXCncCV4e4WIgBJnr5Flw
	eKohwcSHJR4wQlYslu4WKff8sTwcbVnj23BwNJ8HPh9V4wCW01MHJ0qxZ+6BaAw=
X-Google-Smtp-Source: AGHT+IE9oj4hFtvRpFwqlNQh62iYP5rFySRwCQln/eAoZs0xPHX/uhuC97gaMUHeBpLyW4gq8rnotQ==
X-Received: by 2002:a17:907:7da0:b0:a7a:a46e:dc3c with SMTP id a640c23a62f3a-a866f2a00a5mr237191266b.15.1724274260340;
        Wed, 21 Aug 2024 14:04:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f220d36sm11170666b.20.2024.08.21.14.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 14:04:20 -0700 (PDT)
Date: Thu, 22 Aug 2024 00:04:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vinicius Peixoto <vpeixoto@lkcamp.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH] staging: rtl8192e: insert blank line after function
 declaration
Message-ID: <3953e259-cc8a-4076-a5d4-7e5107eda212@stanley.mountain>
References: <20240821204714.5839-1-vpeixoto@lkcamp.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821204714.5839-1-vpeixoto@lkcamp.dev>

On Wed, Aug 21, 2024 at 05:46:45PM -0300, Vinicius Peixoto wrote:
> This adds a blank line after the declaration of rtl92e_config_bb, in
> order to fix the following checkpatch warning:
> 
> CHECK: Please use a blank line after function/struct/union/enum
> declarations
> 
> Signed-off-by: Vinicius Peixoto <vpeixoto@lkcamp.dev>

Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

