Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DDE1CFA8;
	Sun, 17 Mar 2024 19:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710703079; cv=none; b=J2B1msxovgVn9Z6/9LpAp4ELH+qaGIyfFXWeM9td5icaOOUGUKJIRS4VqHqPIKin9VTitntX2jDN7TCCu6wPlXy/O1IVuYASyAcgvnLEahdHtuYotysxzyskcyoBNPwoq1jGfUWvvof+3+EOxI0p5sqNhaIu7Gz4pZO3SYDiRTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710703079; c=relaxed/simple;
	bh=++ul1d0Unl91N6s65/SG05m2vbJJag66Wm1LKGvdbKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l/8wSLHJ4/HULb8rMQlKLK6Y+MobRRxDfrXfmfvah6QiXibh3qCWcz3OIDPwrEy0BbhluFy/ITKjpGMtErkuw5O481xkuSM9eopnbVGaR436aiTSghN2BFsEa9jH9e99YR8zbJTc0MYDGgotmQJuMQ3uNQ+URq81DEp1RodmJmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQDEbxl/; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQDEbxl/"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a467bd57898so94088066b.1;
        Sun, 17 Mar 2024 12:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710703076; x=1711307876; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ntvLquw50K5KTQ/DhQSvB5fgjVopONkINXyXgWhChvU=;
        b=QQDEbxl/VPIbsGZHaAI0ZC1jjwYzCGS5GLdiEiRvkmxtngalkKsRTC/6M0ok/lCyVI
         y/36DrL4s3HnGc9SDFFUylF08HtfxnHBkce856MBEr1w+Wh8/JiArL9gMI013lsRgcpZ
         sUlOlIzHH8w0bPaPYb4+bgftIfziXs5LfnRyBiO3zyKgFmMWpuv6EzbT0nZudHZce6W+
         FZjwFTuklbde35SoKuB9zYC0DrLNzwtCYGH5uj8lA2uBEg7KjDh6EhauUYB8ZojhKCnp
         nu2Ab0UkxsyOO30WBKL/xsurE5HDUJS2fCWBhTasUm86WmHLve9yWru+lF9PlRQJKC6V
         L2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710703076; x=1711307876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ntvLquw50K5KTQ/DhQSvB5fgjVopONkINXyXgWhChvU=;
        b=oXgXI9BPkEasJCFttfhXAINnKZLE2OPikhYAEjxe1MGOwNg/STZ7WM/JcxHph64aW6
         zPCcTUTOqLbEe/txq1ECPYLKYrcSgOs4ZPVccfIuwsGnBtvM5fRSrSiP0CZlzSxgDyhj
         Ik+GydBfGGqtk0LaUSqfZNlsLeIBAEDvJrjmkxbdnM0V9nQFTNkitIf+YLGGVqcy9t+j
         52UVURkUSQHGv1+tXT49CgBeY2V89MWBGoSJP2sbujXjo2Vnk4QWbfVYxYY/ZfMEJpNW
         92MovHY8Kb+q+kmqLLgAhYCZ9kCeCA0SvWOSHef87g8bm5Bq2o6jrgPwo+JhrHNh7FKL
         SiZg==
X-Forwarded-Encrypted: i=1; AJvYcCUyX0zHKvMwXKPbz/+QlsymCaJQ/QuOCyw/3cqz0HNJOXq7YVfCtjKeFQkMu4eGUDWkbj6VvdpE4h4i5JJqDCFT84HIbN9s/mDscKZWubgRckMOSmC2ozUkNGuRdSGxiG2djtIr+9o3SA==
X-Gm-Message-State: AOJu0YytavIjnY0AuImhUa3UPreAiPP2WH4tpYgtzvTOzJ1jaIBU27+2
	fMwxpfuVZN4bAkczhG6IGQlB0rAkxsYKbg7SpTE9yN0TjUGcGjlf
X-Google-Smtp-Source: AGHT+IFUtyB+ZQNKTnDIhzFAjZHqmnepIQe/IumYz/FkBtUG3CqodLT91QaoFCJQbvAYNLprHh05LA==
X-Received: by 2002:a17:906:f911:b0:a46:8be0:4f64 with SMTP id lc17-20020a170906f91100b00a468be04f64mr3747778ejb.5.1710703075740;
        Sun, 17 Mar 2024 12:17:55 -0700 (PDT)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id jw11-20020a170906e94b00b00a46be5169f1sm308565ejb.181.2024.03.17.12.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Mar 2024 12:17:55 -0700 (PDT)
Message-ID: <1ce07f88-eef0-4d26-b129-f949c8ce3b53@gmail.com>
Date: Sun, 17 Mar 2024 20:17:54 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] staging: vt6655: Remove unused declaration of
 RFbAL7230SelectChannelPostProcess()
To: Dorine Tipo <dorine.a.tipo@gmail.com>, gregkh@linuxfoundation.org,
 forest@forestbond.com, linux-staging@lists.linux.dev,
 outreachy@lists.linux.dev
Cc: julia.lawall@inria.fr, dan.carpenter@linaro.org
References: <20240316204207.1779-1-dorine.a.tipo@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240316204207.1779-1-dorine.a.tipo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/24 21:42, Dorine Tipo wrote:
> Remove unused function RFbAL7230SelectChannelPostProcess declared in
> rf.h but has no associated implementation.
> 
> Commit dd2837bdea0e removed the RFbAL7230SelectChannelPostProcess() but
> accidentally forgot to delete the declaration in the header file.
> 
> Fixes: dd2837bdea0e ("staging: vt6655: Remove unused byRFType in rf.c")
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
> Changes since V1:
> 
> V2: - Removed the unintended blank line after removing the dead code
>      - Removed "in rf.h" from the subject
> 
> V3: - Added in the Description Comment about unintended blank line
> 
> V4: - Adjusted complete description according to hint from feedback
>      - Rebased patch
> V5: - Added a missing closing parenthesis in the fixes tag
> 
> V6: - Sent the wrong patch for v5. This version includes the fix in v5
> 
> V7: - Made the subjectline more uniques as suggested by
>        fabio.maria.de.francesco@linux.intel.com
> 
> V8: - Put the entire subject on one line to ensure the function name
>        appears on the subject
> 
>   drivers/staging/vt6655/rf.h | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
> index 6f842ac00526..8eef100c7ef2 100644
> --- a/drivers/staging/vt6655/rf.h
> +++ b/drivers/staging/vt6655/rf.h
> @@ -68,8 +68,4 @@ bool RFbRawSetPower(struct vnt_private *priv, unsigned char byPwr,
>   void RFvRSSITodBm(struct vnt_private *priv, unsigned char byCurrRSSI,
>   		  long *pldBm);
> 
> -/* {{ RobertYu: 20050104 */
> -bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv, u16 byOldChannel, u16 byNewChannel);
> -/* }} RobertYu */
> -
>   #endif /* __RF_H__ */
> --
> 2.25.1
> 
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

