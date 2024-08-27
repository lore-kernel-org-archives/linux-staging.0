Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3848003F
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 04:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724734426; cv=none; b=bCRNuKKFMIPdKK63iyLiUwKBHmnF65/gtcsWF2UAx0A2K5j6DOZeOSS6L6a1WXjwMK/WjUCEswK57cCeHKm8QoR9OaJ1I/KOlVxHo0d8Rg08py3dPwTNEIRYk1y5qHTqZOV11KOr0PV7mBkiRWzOdRHCLkeByYCw9Pglf85N8Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724734426; c=relaxed/simple;
	bh=kOPzyvAC8aNU/3TnytzRlYYlzPt98C/Ead2vtFcmScE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MoHuFe3YUjDVKjOcRer4RNa0H3dUIxucD1HKs9v1zCYpWiZxzWhY7qOIYbwyXo+c8bGDsw7o8nexOMqyZ/dEki6DJJXowJmNPYNKItdxvjWdNSyVZNLd3hSg/6Lu1esn5yJb8Yjt0CXkBLykgXQzd4ocfy2xd/jpt3eOiLXpsko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZwJ8MN4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZwJ8MN4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-429e29933aaso41489515e9.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 21:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724734423; x=1725339223; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3iys++LOfj8pdlpHxM42IssXw2bmawf0GVi7L3mAqks=;
        b=DZwJ8MN4SQTgGwKY3ZFIVvwvNZbnEo22iWmHlAIqvhrbGMo4VhiqwZiX8MPV7eVp0v
         uZm5yAKGQdZcTMTDKiQvLN/Xg+F4iCnsjMCCr3Owky+QJmMLEDyJhz3VL/zKYJzoAuvu
         z+dFN/bqaWr7uULqcCo6e9nfqATMc62TfxAkFuyqjfqdFDiBq3DR61+aFISIwusHEFMy
         rONPbvrdVwVSbQhJyu07jXRh0Tby4gBuXPThivQ+/dWQQgKn1DMuE09c3jDKLDEJWO8p
         FTIuctNnlBeYkz2IGbATuf4eMan4JuySUT5USUIdTbCLKcsLfbTNGNyZeNwiA0EG5BSQ
         TYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724734423; x=1725339223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3iys++LOfj8pdlpHxM42IssXw2bmawf0GVi7L3mAqks=;
        b=cXo7L/9Ivl6glIdhM1PxnTcgiU9fl72RSLOngLxqo5w1braA1hVY5obtYXl4jO6tGb
         blMLTbqeOHyKEcQh6EJK3p0FIaSbjDpWIgZ5ZaUPL3Zi+k1s3mM1PQ2jWXFqq5Qr9Qe9
         KWIR/PMrnUwgzMHbMbBfSVpIeHrhIL0VrMAgp6g00WJIW8ZUPQNuQtNxpdVyJV30j1eT
         7DxlAxgD40JlUvG84NzumuOdQGlRwDQGuueuKmHJHcUCdMPUiPL40TLDinFgTQzE3V9p
         Nhq4H1wYZRy/prefsNczmSG1ro955rKmGwnZlni7wdEBQlk4DB3j6ttgfWCbV/fsn3no
         gPaw==
X-Forwarded-Encrypted: i=1; AJvYcCVsM6bL5sUREfpyKA+16pVjL8bupoSfry9mpdtH2gewRVSPA+Vsu74/j331uNw8Fp9vDq8H4N6B6jusYHJn@lists.linux.dev
X-Gm-Message-State: AOJu0YzbXlHkR9s7vAzJ8614b/c+u9+Q0AXhwlCiXuphcLbuJAnXcSGd
	ij3QSQUwINZEwPQyOQRAS1689EDoxzXIWdB/ABLkIMuiy3FkLXGBQRtAeg==
X-Google-Smtp-Source: AGHT+IHR/GMdTc2p0xuThLBO00V+v2Q/g2fhDIepwtZKNWzPVuBEf6annKsOoOHLRYpxdS4XtEs2DA==
X-Received: by 2002:adf:f991:0:b0:34d:ae98:4e7 with SMTP id ffacd0b85a97d-373118e35b3mr7063180f8f.41.1724734423283;
        Mon, 26 Aug 2024 21:53:43 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e5878434sm58442966b.165.2024.08.26.21.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 21:53:43 -0700 (PDT)
Message-ID: <397a0f83-19d8-4af6-beb2-76d50ecf0b33@gmail.com>
Date: Tue, 27 Aug 2024 06:53:42 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: rtl8192e: Fix parenthesis alignment in
 rtl_core.c:325
To: Gabriel Tassinari <gabrieldtassinari@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ~lkcamp/patches@lists.sr.ht
References: <20240826214853.21003-1-gabrieldtassinari@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240826214853.21003-1-gabrieldtassinari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/24 23:48, Gabriel Tassinari wrote:
> fix parenthesis alignment in _rtl92e_qos_handle_probe_response to
> silence checkpatch warning:
> 
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Gabriel Tassinari <gabrieldtassinari@gmail.com>
> ---
> v3: Adjust the indentation by adding one space
> v2: Include the modified file in commit message
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> index ad21263e725f..75192041008d 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> @@ -322,7 +322,7 @@ static int _rtl92e_qos_handle_probe_response(struct r8192_priv *priv,
>   
>   	if (network->flags & NETWORK_HAS_QOS_MASK) {
>   		if (active_network &&
> -				(network->flags & NETWORK_HAS_QOS_PARAMETERS))
> +		    (network->flags & NETWORK_HAS_QOS_PARAMETERS))
>   			network->qos_data.active = network->qos_data.supported;
>   
>   		if ((network->qos_data.active == 1) && (active_network == 1) &&


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
