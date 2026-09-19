Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657EC403E8C
	for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 10:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789814433; cv=none; b=oMPsT+ihHB8g5F/Fia4TwJ+dQVKCycwjLq80yd2x9qiLDV/sSeuAIU+aj7K/6eBB/NzPptIqeDHQTIphYMZCjw8C5natcqPnXX9VfI74smDU1XCzDuVIutncDh3FlOwMaCfwLLSy6Iv5UQ7KmM6+WFfc3jWXRhG933+722dk++A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789814433; c=relaxed/simple;
	bh=VIlPKBVlHgmbaZc9Wtvv51Izc2ziBzHYlBLpPbDty5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyoGSpPWnnZvGRdKm3Ato/SCMPaQLWP2j9cKTq+x5oM0yqFmhN3AkH0O+4QEZmPjzxCQ4SNvDAOpViZTGNla1owy0anj0VFYwOjA/kOVBVKfGNmzQn7atIKeUw57LCfeY98o2noBeYfVpcoQ39uZGZ7INgmuZTgAonlaCLcABBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvYIx3On; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvYIx3On"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so865007f8f.2
        for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 03:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789814431; x=1790419231; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfnsloL/wCnbrkfyDwFsxsv9htsOG10LpVReejUHfY8=;
        b=IvYIx3OnEWimH72S0gdETdSpZSW0Hr4nli1/yqTXYaMgO7/1G8pXvD5zLKPEoC2te/
         VyaXC9u0wH/mOBYrNBFNqRVpe6sV3ySSih8A80n2F1hlpOFP68x8O8LGfRFOygYjLdyd
         PKK88JHKi5SRlSjmYV+0K9WUO1sfOfOKsutQT5rSK+qmz6b2a4YwFvfXg8jkcSWZJc6H
         CqQf/EUxg8Rwxs0m07u2aBo/XNtkiypVi4rnBM8fsfKZ+KRvv/P2nO5coP6nGe78dVnF
         wyDR1hQI18W2uxl3bBN1hpe5KwxI2BwAWLX3bOitQcXfWn+Ta05NtmnMR/FS0fHbOqVV
         WKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789814431; x=1790419231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kfnsloL/wCnbrkfyDwFsxsv9htsOG10LpVReejUHfY8=;
        b=fRlZGk/V4f1ZVxM8HLKwtA9ZzTRxaZSvFHrzav+u95J/W3v7EVSoMIsHkB32WTjdP1
         a5hM8LDwVTygR0re+nwor2X1YkUgrw3+gV4AdEVpAa5x3+WtfnyRywFa2z0HHyGxRC6I
         8hFIOFWm1o9UBwkobe6p4r0a2//0hefU1AF67ort3WKJvtOQqA7MJcGsCLlOXL0z4rfK
         wX1iDy5SBQR4k16S/9OrJK4YMGngROvKJ+pMGmAiOoFPeByjGIvQ8E1xr2g+vmg7Kvk6
         tCU+JgwYxgg4EBvLD4KrD9qmj8nUOc+0t/w4oNpcuc8rGurnDIoT387rS2k6pcXjACoU
         qXVQ==
X-Forwarded-Encrypted: i=1; AKwUvByNbQQ1CNXDx99gjUwznqD/1VnvpDBg9B3RHlTjcDmnmI2K3bqA6VAzCvJYw/zmiuPwTlNAmX/HYD7lnDcJ@lists.linux.dev
X-Gm-Message-State: AFuF++nAZTggHGUtn0OlLcIhKxi1w7YwbmQ1i/Dx38BgUTvchUubBjJM
	8SwibNrkAoGwMfN4asDjM2/eFGQQ9MxPkeqja4f7RrfxOHXdVJF1QDrL
X-Gm-Gg: AYBFou2NkI/E94KHq+4jXLnObRgtmoEs0dKglsoaFnKoW4GcT9ObKzJtk6jSBEnvkFh
	iu6NxCQFsGAOzUt0TziEI3JxnOyNvldwFmDxGf6kugbJYhXCQsgVgOmE9tFKBdAf5oH6SdYEkMU
	lYmRTIz91q8/261OwFtmfALvKLRhsbjlWs0VvKfXGmkc4QbxYboUKps/gmOpbIzP5yMkcv5WXil
	rlJCjMSW614Si2UNEbemLx5ekuxtadfpuhZd4DyCoC/o6QhhISdoaC9Ows7BSjLcTlnZABJ+v60
	EuVBTCGucXdu17tv13qtnkJ+hgh/yVAA5vje8VPbj+XWmPyMiIYnUMk22FsdiQcdFDQQKYbuUc0
	udXdf1iFUI+bwLLPr6/geBowqf6MHbBcUOZRxoMRC8qN+vcBLGaTgH9yRqhN3Q/Chhccp9GoYdr
	u6WHWdX+Uvb3sNkcqFshuTNv9SJkqpZ4h1OUorWBL0jCIlAiWchRDfEiG09je+8s2m5dSMK9LFK
	yXZYQ==
X-Received: by 2002:a05:6000:178b:b0:487:27f6:a4d9 with SMTP id ffacd0b85a97d-48727f6a70fmr1482923f8f.41.1789814430518;
        Sat, 19 Sep 2026 03:40:30 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487244229d5sm6576617f8f.2.2026.09.19.03.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:40:29 -0700 (PDT)
Date: Sat, 19 Sep 2026 13:40:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: remove ia_css_circbuf_t typedef
Message-ID: <aq5mmSZeWXYBrs0o@stanley.mountain>
References: <20260918214132.1135549-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918214132.1135549-1-vladurares@gmail.com>

On Fri, Sep 18, 2026 at 09:41:32PM +0000, Rareș-Mihai Vladu wrote:
> @@ -320,24 +319,24 @@ static inline uint32_t ia_css_circbuf_get_free_elems(
>   * @brief Peek an element in Circular Buffer.
>   *
>   * @param cb	 The pointer to the circular buffer.
> - * @param offset Offset to the element.
> + * @param offset to the element.

Don't make unrelated changes like this.  Also it's not really
correct.  It's trying to describe "offset" using a sentence.
"Offset to the element." is a sentence but "to the element."
is not a sentence.

>   *
>   * @return the elements value.
>   */
>  uint32_t ia_css_circbuf_peek(
> -    ia_css_circbuf_t *cb,
> +	struct ia_css_circbuf_s *cb,
>      int offset);
>  
>  /*
>   * @brief Get an element in Circular Buffer.
>   *
>   * @param cb	 The pointer to the circular buffer.
> - * @param offset Offset to the element.
> + * @param offset to the element.
>   *

Same.

regards,
dan carpenter

