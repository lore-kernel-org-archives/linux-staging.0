Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF6849B475
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792330728; cv=none; b=eHbEqDBtX71zTZnNUxe8WSEHlboDZS3buWWc38N9mv5tuK1M+yl8p109VuT8kT0OHcd5CcrIkutzjD7ug5Amak1prbD290hKesQIeLn/Q5SnP6sasflpdZ+/U4Vm+/23KVgdomIWrSJRsmX6Ck3TPer3il/8cUkqVE1QlqM44V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792330728; c=relaxed/simple;
	bh=ldNYRwI+5doEBl3C1g/4d7rWHQk38M49uk56iBMi8q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StGQ0qPAOE2NBYpjIERGAqYNakixrVjcWuh9IvKAQQwdmqp2xm98DXLXzU6ieBBAFyiH9SOIzEvi4qmsmJTgezcp5Ckwxl8OHmLU3wXlkJ+v4UzVOpoXYJu00nGRzOKRVn+eVYNXZgj0jLZLyj82N9Z7UE3UJtZwt+puNWeJLIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+tm0t+h; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+tm0t+h"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso13610015e9.0
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792330724; x=1792935524; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KgtDcPhGOMWpmKP73xncVKfTZT69mE2yBqqaKdxCDiA=;
        b=M+tm0t+hbPD+72KHguheJYiXhSHzBaZLlsK0VopLlYwCR0dsQvoNUYSiBsTJd/JZaU
         oJJyCAT2KkDLatcF6s3rNOr67pcyv7izkm5RMZ8DcmkjlaTam42oYVx/O0//ohEsvUxf
         FD0IeRWBFJbsBZHoZ+pAueJfcFw1kDNOWa0Ibnp/OVrMdgvK4sFcjR8UN0broPu36D3r
         f9p8ADiKH6riuYH12xMIMdgqOO3DJBBR2qJLeA5Kk3FgKHrtDyjcPW2vw6FNUMdL65R7
         +y1ThvmYm1ZqS4hz7Tuz2nzQ/t0k080eZ7+/wUg2Rks3g3bZy/FZOpu2XpzM8dteE4TD
         DAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792330724; x=1792935524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KgtDcPhGOMWpmKP73xncVKfTZT69mE2yBqqaKdxCDiA=;
        b=g5Nw23Dx8qbrfsZJc/XfkQNVqRTcNYgNju4hoIxyGBCXoMiLtQ9Jv2CpiPwy2ebE27
         +bVOznwyvPK4RK6wF8iErz2XI3Il+bsjneS0GgZYhKxmChEMGjY9M14pfjrP+RpFSYXD
         wPYccC87AiVkTJoasXB+c2VwLjR6hXui+kjHe2PZ85Ggtpffy3W/pA7I/GgPOPg+QcPr
         9PQvw+2wINszxYCdmsLpCwwwCJ8qZcYjw0aB2io3ExeAJ+3ZtvTJrXb8+TYqkPvGIMpZ
         qU01y0mX7C2Ok8XFNlKPjXZFdJg0ngZuqQfNYkFizewlAlCYejTWLoLoD6Lh5p+Y2Om0
         l5DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEgNW3WaQvAvV7nmXjlMMFB/snADwBIngIsjSBqQUtPthJSyZVN+jfSLbR2cSMI7quQ8CwT3fFvw2cMXQn@lists.linux.dev
X-Gm-Message-State: AFq9FYKIfyCXW1iUm/P+lZDT08bMnN4me9bh2vTq9Epyo7brEBCmBuCf
	5pNGEaEQ0Bd9LY1QKtW8Z9D4gEd2n3ksFDFmn1SzPsGMRCnOM7LXBj1mqKwxFi8OqBcEz5Uo
X-Gm-Gg: AYBFou0BOwwHZBjev6dsJo9Zr9+C+g/YqaavWJvFqeRs12/Dn2b6CuNc/1cmpeJRmSH
	8nWDZwqmcT4gcK1+8quDOgwdFfhqkrhsU5poQZpW98fcva4ih9kqRnmIfUFAyiezNV5V38BfD6l
	ExBxEYW4Lbw/YwqXBV+m4NZJRFc+vMbQFI/YxbtFDrx6t9L5bZMfpcmFJqFEvQL+1/7MDaFdjEd
	O4wTUyoO9D8DymUy6FUNPXec+TqEmeIQWB+jsNyek5p2YzP1gSQVkPLzvEiz4iLkopufmkcgHHq
	n5jOsnEP7OkjdP758t2rT+TiWeX0tgsEioPz/SJicUo48fqAKt8tTER/dzKVdFenb00d9b85hSU
	icu8QZZ5Eu9SJEHfBX+oKf32rUS4LmTOH+ntqDnFkmZAvZFzzTw7/exTRuHBRkmFc+DWGJ0N8Kd
	ELqxd/UKEFFTJ0LhAVNm8EdtFXBdl73mEsKi0zkET1oHDr/FJAkSuVJdvZ+9J2Jf3gA/k=
X-Received: by 2002:a05:600c:1393:b0:4a1:d248:25b5 with SMTP id 5b1f17b1804b1-4a1d760e327mr104897945e9.24.1792330723415;
        Sun, 18 Oct 2026 06:38:43 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d2e93a01sm188694095e9.0.2026.10.18.06.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:38:42 -0700 (PDT)
Date: Sun, 18 Oct 2026 16:38:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bashirah Lawal <bashirahlawal017@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: fbtft: Fix continuation line alignment
Message-ID: <atTL36chMY_21NCb@stanley.mountain>
References: <20261018123430.148379-1-bashirahlawal017@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018123430.148379-1-bashirahlawal017@gmail.com>

On Sun, Oct 18, 2026 at 08:34:30AM -0400, Bashirah Lawal wrote:
> Signed-off-by: Bashirah Lawal <bashirahlawal017@gmail.com>
> ---
>  drivers/staging/fbtft/fb_tinylcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
> index afa8f1c740c5..d58b1247262b 100644
> --- a/drivers/staging/fbtft/fb_tinylcd.c
> +++ b/drivers/staging/fbtft/fb_tinylcd.c
> @@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
>  	write_reg(par, 0xE5, 0x00);
>  	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
>  	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
> -		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
> +		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);

The original was better.  Search lore for the function name to see ealier
discussions on this subject.

regards,
dan carpenter


