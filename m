Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A04F21ADC9
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 20:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278959; cv=none; b=fMpuD0JyMnHzQWs5jiJBeJq4Q4k2I8RqpMKRt23/l+MQYRSbZ0adZo8R7YAIswz9uB1DgnMKazUrC1TVfXeXn6lAq+D2DE+3ym2tMgoVrtJ21qfRqH6DapYxb3gxX6l8YX24B/FFLiU07StyUgXJur6YRv/HObwoCXoKB2NHXz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278959; c=relaxed/simple;
	bh=ahnd1Z6swvTss88J3BCqiJiQsWfGMkswiPn53f9/8bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cW3On3Kmgv1OeVaTbpPBg7pfhCSOnui73ZCxmGGqjFppB2/Hc9kvGQ1HMN2KdW0sqCFHyP62mvM5twDkF5QJxpi50MRHpASqW2ThQnxBjJkJKX9Z0UepYTpHOH164vK4qzG1u9uLE8IEK/1I2RTm9crbwdhZoB95kHVwo/7rt0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=unGTT+Be; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="unGTT+Be"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2d4e91512b4so26679fac.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 13:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750278957; x=1750883757; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ps3OX/Dhs7yZhLG+f0r6G5XaijgRdGcZ8U1aOoi8tuc=;
        b=unGTT+Beqstvd2GWA7+jaAtWAaCAyjIqqSLEu4dvr5ADfQ+8RmgC5qd2q8YdEYZLkm
         OjSugKR4xs2LbAGLt3ZkSeZAWVuEmsGdoDwdXG9eHRyzuwBKfFbqNBd4hf4cWE4zeBwR
         sneBbSpsPEpXqeNs8t9pukSHCzk0U+Sb5FWz4VN5jyg0+05ZKEvoCmGZL0g7KK5C2NQK
         TLOx7xCUd7Gp5/NmLy4/Vd8y3gXzdAedpf076ZZg7aYA4ms1x23GSCJUUlLBizlZmRE9
         DtaZMbCr/DCGuuI2Ds/OPN6T4o7Oa9IGVVnL9wRWy46d/sgMp/aq7cF6FIY3jT4yva7q
         GfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278957; x=1750883757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ps3OX/Dhs7yZhLG+f0r6G5XaijgRdGcZ8U1aOoi8tuc=;
        b=qiz3aUg//2MFVVgKq68ntyNFjBxmnfmW2+s+vgWMIO1vek3l4A5Fherah+KL6diBu3
         jVWmcoWSYfCpGBVtKOB1tUcgUKPuADK3MMpaffPkyUG3dpCs3Qjutrl1b9wGva5JE+6T
         uDxr5Bmh9RgS81gwn7GxLYWtbc09z2OQ7KqxRsAZ3AlI+MvrmzAp4Z08SuqjiQaW4J5t
         fnCexTOw1GyQs/2xQxUTtC+SBfst/V65+u/iU8LAnPN0NVoU1W0E7KvCkQCSa+olzM50
         25qSVHukea36UK0llbUDUjSMzYeIW6DIZNKeU7JtNoD2P1XpSIIrQRMxMchBU2O6l/zu
         naNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWnsDH+fikpvPzycg5migkTk6Bo4czHwGkUiW8NkWFi86EL/AFP0njfzSQZimqFWLXGn+CGL8F6nFqGl+d@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/XNZsJTSYtclZBdvKuHgfX5OU7rJi6ASZjkdEEEOpjl2I8QL+
	lQLlLoWGWWqgLD55I2MozXVbBj4OdG6+ZXfKhDObiYYB6mweQAG0HgRcYRiZNXBUy/A=
X-Gm-Gg: ASbGnculzAFYfAl/b7wykznBPPVkWmORvYgFsgAt4xGwrYxzYob1AyL3MWa4VFqGZPT
	yksgwFEK6BQSl5zq1dfBXLNq21xweK8+9l3hhECN4M8uR9+xWlWZ2zkSPOcKdVap1X40zoNS/6T
	TCH77v5NngYLz2eyjcbkTzp3OGQIfGKpr36UQAVkkXGa9SgQelRxO5vV1qpXKInmU04BIjYWHB/
	LROjaQOmJ8CK4Q0kCXFzwKrsZgS8SVcQxZ+vrVqfua1Hc8N3vefJJi+A+Xa0QhaJkMWyLmCyg4n
	wSe2ikwRJ3S65HYHYYbUmt0Ir2SxjvRLa2qDKA1WDB9UrJ1zjq3kLYBTGa1enkslD1E1eg==
X-Google-Smtp-Source: AGHT+IGFpoeUPUB3ajbzRme+oGBi4olRLqQl65J8P5ov+Se4sIOpLBgOJGgqQ4g2+IIieFSr5Z+YJg==
X-Received: by 2002:a05:6870:9720:b0:2ea:7d72:23fe with SMTP id 586e51a60fabf-2eaf089dd18mr10540737fac.11.1750278957488;
        Wed, 18 Jun 2025 13:35:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eab897a367sm2981625fac.21.2025.06.18.13.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:35:56 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:35:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: hansg@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 5/5] Staging: media: atomisp: i2c: struct definition style
Message-ID: <69ff7899-cb4f-47cf-8eff-13b5a828d94a@suswa.mountain>
References: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
 <20250615231143.1558392-5-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615231143.1558392-5-thomas.andreatta2000@gmail.com>

On Mon, Jun 16, 2025 at 01:11:43AM +0200, Thomas Andreatta wrote:
> >From `static struct ov2722_reg const` to `static const struct ov2722_reg`
> 

Sentence no verb.

regards,
dan carpenter

