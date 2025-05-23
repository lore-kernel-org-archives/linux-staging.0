Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5847DA8C
	for <linux-staging@lists.linux.dev>; Fri, 23 May 2025 08:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747988390; cv=none; b=P78F34cxOdvnx5aP1cMzylh7BGLYKxQr/BYTRdMKSV4hQwJxryowaJfabEE/6PAEQUPfpuyWBn0qICmyGkDqFW2vyznIrG5zpiRL/rflK/4KLgK8NRT2ysC/lt4LaGrrpdvuLbX+gwxOiUQGtwfjpY7/htQi455RgUMkhi8HasY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747988390; c=relaxed/simple;
	bh=HNSWagAEX12O10t4eRkKH1SjIDKexCjBhWGMr16Yykc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gl03Kb4RQ09ywL0ZJongVg7JzGQixSPg227H4Hl4V9PrXV6cB0tBOJAugkUMKfOi9xPSDimbeaP+QLEczBlQ4XHCCFw72zHvotzlAoBR1VDyU/0cNi4H5yilLXW1JMlqu0GQf8at2qdbk3AUI0XfLXvRxeUemnz/9eQtHqFUa/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K6ElvTzp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K6ElvTzp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a376ba6f08so2961053f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 23 May 2025 01:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747988387; x=1748593187; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=flkPxGTAPulzErROQlZpjAXNRqaIuRh5Y/yxPEIKvFM=;
        b=K6ElvTzpOw8zomR+Om1vFz+WgXG8+pfA0GugFGDm/8G4XqpngJhE5gUoJ2nkR3f6Ee
         dnGF2vaIVRh2AsAHEj+itpiMPLHU3H1CzsH2MX0FGfEpEHg1KlJPN/FiV1LPDpeBzf01
         mdgRjso+rfH8pfifKTgtkoBa16K6WlkmHltQNc8CVm05WM8XjlN+1qkyqO4DAKAajd0S
         Gk7nz2upT64tc2QCnlGqjqFWo0q4mzqK+O83Ybm2l7Qcp4P/bQ4JwXtF8oGIE4vUGhdd
         ZnJr9p+UuPB+SwRwUWKRLTLdXzcrOGT1iB+lN3+ilLJbMMW/MkJ+eIWB1iTuqYUSFaKk
         wZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747988387; x=1748593187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flkPxGTAPulzErROQlZpjAXNRqaIuRh5Y/yxPEIKvFM=;
        b=w/OgAokOkBa4VbgqRs7mZp6lByWTfZD1dms3iVKHB7jIyDOa5ukfwdhhvpNc7UySW0
         +H5R0hdHKyv4bRlvReZ8hg/iHJkJg/mnivybXSsYQP/a0QQgPDkNT3c/82sw95cJkZfX
         orPRAGKOKJ23cYzUsQklz88M1E5XVAkOG/r7tGKeEB7QGeO+b3r8gLTIkd/uv61+XeIA
         /Pe75vDOD3Kv6cHNbiXfVk5rj3sZ8Td8qNw2frwoU2QijRZn2wtpoN0eFcDQ7uzwK3Qd
         9XxbdqoQmtDnzceZXd+0Ovrnu+FKMogrv9nJ4CGyTUTS/4+v7A+YMSlimaU0tvGc5sP2
         LK+g==
X-Forwarded-Encrypted: i=1; AJvYcCWXm3ZQhA2WYlwkfaCamG+IpSqYOGifw2sa6l1ClOIdADGaASwq/UamugcV8juwTbjb/ObZPiM4sHSsct2u@lists.linux.dev
X-Gm-Message-State: AOJu0YzQv+7/LsSLIZL7ZXA0naoXKEoLigpJIJpfYZCBtuT7979qsazB
	3VwuSMeZYGNzRgwnEeV0sA/nu8qh4jWqjKO/LMf333du0cRxASkpBp/Z9A2foBr8wegqKZBCXql
	GRicC
X-Gm-Gg: ASbGncvzbbfGmcwnNWJdzVn7zvS/fbU3GojQb7FOW2q9G+fEA7Id7FrNa71eTeig8Y3
	E9qz7Reab7FK1K1Xc7Fgdr+9iGRH++jfCSYDwZDN90kXhJowqPuTz1vPuGK3xm5VfahtMjC99qo
	f4ukbt2MvhJDRjmDtOITJht59gegnOw5DeHgUQkHztAXLvwwi77RNF/nNZGquKoR1281MxBCmJo
	6sORwppj4g/eEMATsWeZUc+Pw9ds6f4os/QBaz+fxqX/XJxEDY8155mwodTo0v7tC7Nq/PJMgmF
	85S3bI4/yo7+0J6mZVSjukWgDB1d2zrjczZfUodqkbPMfzopg2gJOvfu
X-Google-Smtp-Source: AGHT+IF4/Q3PO7+Wp7rssB2fh/14f8yoGc7vb2xypco+l1dme8+hwhmvGGV/4fhj0blkBQdH6++bgw==
X-Received: by 2002:a5d:64c7:0:b0:3a3:77cc:539a with SMTP id ffacd0b85a97d-3a4c2103d41mr2588162f8f.58.1747988386849;
        Fri, 23 May 2025 01:19:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca88978sm26223360f8f.65.2025.05.23.01.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:19:46 -0700 (PDT)
Date: Fri, 23 May 2025 11:19:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: rujra <braker.noob.kernel@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, elder@kernel.org,
	Greg KH <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging : greybus : Documentation : firmware : Replace
 deprecated strncpy() with strscpy()
Message-ID: <aDAvnmtgnssj7K5l@stanley.mountain>
References: <CAG+54DZgF55R2pEtkVBdnwXEyNu9TrSMA9zkmw7RjWrDqX4SsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG+54DZgF55R2pEtkVBdnwXEyNu9TrSMA9zkmw7RjWrDqX4SsQ@mail.gmail.com>

On Sat, May 17, 2025 at 09:11:30AM +0530, rujra wrote:
> To ensuring that the firmware_tag is properly null-terminated. When
> copying firmware tag strings to prevent buffer overflows and ensure
> data integrity.
> 
> The maximum size of tag is GB_FIRMWARE_U_TAG_MAX_SIZE = 10 bytes, and it
> may or may not be NULL-terminated.
> included in "greybus_firmware.h"
> 
> changes has been made at 3 positions:
> 1: update firmware tag
> 2: backend update firmware tag
> 3: backend update firmware tag with unipro
> 
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>

From doesn't match Signed-off-by line.

The patch is corrupted and doesn't apply.  Read the two paragraphs of
Documentation/process/email-clients.rst.

This is a usespace program so I don't think it has a strscpy()
function.  How did you compile this?

regards,
dan carpenter

