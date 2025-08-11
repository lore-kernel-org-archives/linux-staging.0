Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0418C2D77E0
	for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 06:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754894908; cv=none; b=jPblYehecIpzs/TU9jAsmH7v2HOSCxQeLYz4S3NGiLEhZxjBfuE8/TYbk8PswyjzK9J57ZvIZX7zg3Xwbbiwt6H9RakEQrFK+0fcnEVk9Eg9uODABQ5lf44LjGYHxdGyGENrCRODK/jdCXMUM4I+sbdhqaJz+KwOCszButdqv/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754894908; c=relaxed/simple;
	bh=yHO6cUwmh0vJOqPZB+SSFPl2iqxHXEQyLC70aK/82a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcxN3vbzy1P8G4pG0E99Pb0b3P3vD+2Qao4iRMSNvRte4F3N8G09Qj8snAZ8Okm6kTVrHLsfpW/lZHkFWkqcTAV4bGyZkFafqTrz+g0q5b0PQWVp+UuljVCU7booXlx4je2xYp+9Za6rxW03Aqz2XFQxt1fsifU3rLXY8H21m7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wX5sF0TR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wX5sF0TR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so24903705e9.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Aug 2025 23:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754894905; x=1755499705; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iB0+YESun9o8RNjTK8Ze6bNBvftWgtDMToMEaujBCXs=;
        b=wX5sF0TRF6aGblkM2agA6eFYp7aGNgz3w+v9YTS2rioZHq+FccwSfs8fY5N3tkqAT5
         GCRNvyLlYOSfENXe4VaWcv3Qd+W0SxK8RP5R0WekTxPx/bpz7Yty5VGiMx37zmnLyZZ/
         iAFEOWdnVU7Ws7xN9Qx//0eRjDBDUmyI2gt/huMa1H/2w6VkpWlwX3/B4FcnLVTKAxvP
         wQkV2SA1i6MxOM3VXEAQpuTGmfA3p3PReTcNYQhKgjm6Sgsc5vzJUWyFerH66t2NtNwe
         Nkgzpd6vD2F3ti2EP2hz4GMHw6IUrTqPlnQaBltfaiHVFXZdb8BBxBJ0vYvtC2xWuAOI
         WpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754894905; x=1755499705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iB0+YESun9o8RNjTK8Ze6bNBvftWgtDMToMEaujBCXs=;
        b=j8+wxN4I52tQaecCp5cIc9kBylvd8rSOctpME+AfkSKSC1J8Eg0DUM+814jIfHrXo3
         AYDDMUZuECxBfy5sp5llh5HViTPXcT0DUfRGSXNxlx1KfiXVU0qUxHFmJ4k4NwFgkDTz
         7swEp1S9rMC4hwu9mp9DEtCqSaSRrZgvu8BxBISnSP29zGpvXOK0Q1DyThzsSWNangh1
         TNtqo6nSx+FZaglzdM66R1fxklCEWyEfobfO9n7EPpX9M5Ggmt4wM9svd8iOhzHEsInU
         8vsiDzlvHA9jajcArdRMdnDQUktTmCLSv3kXEusi2V6TwbFFeGRJT7zMzn/lQkejxRUG
         mTaA==
X-Forwarded-Encrypted: i=1; AJvYcCW29dCsQss2jzbZcCmEeRiP0ayYzft1skM7mdiuAbsT7ikwA7RYCcQg4pzcAp2WCys8mmQeLPjmZZZMamEp@lists.linux.dev
X-Gm-Message-State: AOJu0YwuESDuclzVvXbI6EePMc1vok0J65X1E14OfyEgd7vH25auJdVu
	Y2C25rn88JTKcbSkTGqS0OYGb+jFe0UggKTkrjU78pGNL/LA9/P/fM3qiiUdskWKnvhvlvW/DaT
	jB0QZ
X-Gm-Gg: ASbGnctszUyACgnuVG89lgFbS+KNWFPsNdzislFZf/dNIVXE1PONTl9pe2T7E05vpz+
	FvNes+/2RKm+uSmiNQSSy2oSC6dZWJkR/a3dmZ11uZPcbDf9b6UvQ57/K23nABlqpspeDP/lEqI
	PcM9u7/PLE//jPmPfmjhep8pI/xQduaxn6Hf72FAQyD2cMDZcMf3yTMQ8llw8n/kQlShaCIqEng
	ccznnQAAsxG40TicMEyn9ax7Vq/Yk8uubNedXeZ69LRW3rpo+iq4WkRFfDm7Op5mblA79Gvjktl
	NgsmXS5iTQaI/ONpRk4Ha7N9leqqAJ6brTLVF1uutNXOsFhywcmQ/2c4N1xDvJSIE0RpiVqy1W4
	nQF1u4QyOmmZPQeowMiHOjxB2jjcIWKZUf2DRyg==
X-Google-Smtp-Source: AGHT+IHc5PKNrzT8LiPlLkDgs/sPhW/NBYUBD+Ihu1W/7SrUvXMLhGjZr2mUKqRPn1RPV5oYAIgf/g==
X-Received: by 2002:a05:6000:2083:b0:3b4:990b:9ee7 with SMTP id ffacd0b85a97d-3b9009405a4mr9368958f8f.22.1754894905296;
        Sun, 10 Aug 2025 23:48:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e586eef8sm237573375e9.21.2025.08.10.23.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 23:48:24 -0700 (PDT)
Date: Mon, 11 Aug 2025 09:48:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yao-Wen Chang <changyaowen19980629@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: refactor code for style compliance
Message-ID: <aJmSK7YWWBDBenTm@stanley.mountain>
References: <20250809182835.863172-1-changyaowen19980629@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809182835.863172-1-changyaowen19980629@gmail.com>

On Sun, Aug 10, 2025 at 02:28:35AM +0800, Yao-Wen Chang wrote:
> From: Yao-Wen-Chang <changyaowen19980629@gmail.com>
> 
> This patch refactors the rtl8723bs staging driver to improve code style:
> 1. Ensure lines are within 100 characters per line for readability.
> 2. Add spaces around operators for consistency with kernel coding style.
> 3. Convert camelCase variables to snake_case for uniformity.
> 

Split this into three patches.

regards,
dan carpenter

