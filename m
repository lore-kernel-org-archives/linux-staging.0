Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6F1208A9
	for <linux-staging@lists.linux.dev>; Thu,  3 Oct 2024 07:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727939975; cv=none; b=VpJbgoNh4qalcokXSCiDswOyKsc7ShghOnQXv7GExTLBWyJt1zmklpbergqaVheoRDl/ywa/0F+bTMo55SGLLgTYXbqwMSXKmRqMbgFU2TNOCPiWDKyRzgxfVKGRtQ+ZdzhEj+mDTojY/BzgQ/Kl4IRySZ8yALAOInJgMiV5Nfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727939975; c=relaxed/simple;
	bh=7bgTiG7YeKbjyvm3weg8CgfyvQ0BL6EN1OXX365N2nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T98INdEt6eeY8nJYdUxQsmn69qD/ptITpWhINatLO+6OAaf289Lilhwp9gq60+VBDaAiMbFwh0tZ5IyYzAji1O2/YMlXGhtDwZbzY3BwEk8Fw6zoSWrp5JtSRl8/wt6uTR0G1hwY5ApZk8W8GcVU7UPW9243v4QDfLfARVxU5Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NbpbJswj; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NbpbJswj"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37ce18b042fso480010f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 03 Oct 2024 00:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727939972; x=1728544772; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Pc92mG/eD1qJhIHap4UGeOuFlUhYYhxaqjIeGx4a50=;
        b=NbpbJswjRzS78exOPYuWHpcEF4WEgDhyOIJom+Px9lPOl75+BzlPk405aziFGQ6hFl
         GT4kFh8l77uQ1FeltYk/4hFb/LsypYF3QeE5iPBTUC5n3Wp/2d/OGru2v65ncuIq0+ZP
         PdRUzGbC3q4pv0gvcD5tA1Lvqm7P0beQ+265KxM9Vf+eiBiiDg34AkEUD5gvj4qfCu8Q
         V3/GYnEThQpzifvjrAKr5rPN2ZiFl8Zbuij08Q2sdQQXQBGkFNEZtbnNLumpvnGltrWb
         uJ2UyaeyihNcaZiEggEHWerXo629/Bcwc9qGCUaBWtpSJp04cdkRqfUDNtsRC+XZirEG
         PqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727939972; x=1728544772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Pc92mG/eD1qJhIHap4UGeOuFlUhYYhxaqjIeGx4a50=;
        b=wXskuUIezpLl2AdWL2m2Mgdo8qPj3czD933R4GSKZy5G0ZXqVRRzxjOcLVxF14tbHo
         5wHalwTbzV8zfWHL0VDoSexUmqg2G3BWma2T5jyTumx4gSBgtM1uEOPlymEl9ET8uBqJ
         wp6jyqzWQHH81gQSek0npUJn0CmIDCgVE+VAH7Dbzlt59//Lmc0Q6B28JqsR1kDFl1pp
         wZpbss2ZxP0pZ6gaMAOYpi8mlaKMYXnX+AMQHdALvww/bS0lysEzi8RJTwl/yMFq8KDZ
         loRHcx481mFwLZyWw+3JbKoULfLH9NQYHkswsanxJApzI/HuGkBVSb2C3pCPVLNwaUwZ
         m8PA==
X-Forwarded-Encrypted: i=1; AJvYcCXH6MAsjv8MnjyHySlqcbha5Vjzk2VpjigqhVvXs0kISfyIS0B5qF6YT0U8pc+Y88FfJBditJRiMUm7U0+d@lists.linux.dev
X-Gm-Message-State: AOJu0YxLpQv4rA/LIzqJRYev5dow1TuJCcXGuHXvJ4ie0Zlzm9eiR2nC
	ar49+ACvA2aqcRacwYwgQDEk90I8CUfQVKhzPZxfda4Qdrc3onHPWKVfh5tA0Es=
X-Google-Smtp-Source: AGHT+IF3Xq0ydl4xX68VdKsqgflTf4PtHmWzxVp9csAq0PeQmy9j3pKy1BhFrZRNHaPzHHwfg/Pmsg==
X-Received: by 2002:adf:ffc2:0:b0:37c:cc96:d1cd with SMTP id ffacd0b85a97d-37cfb9d3364mr3530233f8f.34.1727939972450;
        Thu, 03 Oct 2024 00:19:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f8025b414sm8087565e9.15.2024.10.03.00.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 00:19:31 -0700 (PDT)
Date: Thu, 3 Oct 2024 10:19:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xingquan Liu <b1n@b1n.io>
Cc: Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: remove parentheses after &
Message-ID: <99ca03a8-8ac7-428b-b112-ea1efb53adda@stanley.mountain>
References: <20241003070353.65998-1-b1n@b1n.io>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003070353.65998-1-b1n@b1n.io>

On Thu, Oct 03, 2024 at 03:03:53PM +0800, Xingquan Liu wrote:
> Remove parentheses after & to fix checkpatch warning
> Unnecessary parentheses.
> 
> Signed-off-by: Xingquan Liu <b1n@b1n.io>
> ---

Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

