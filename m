Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D315476D8
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 20:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922362; cv=none; b=Tgc7rmtz94l4PdUgjredzxBI9GV2zrplypeeBEDGz6G67wkq759j/desFFa23yzFPxWRZy6itvoCaVxCbzt5t2jlcLftoEWwyyx1S3LPueapLMegjcI+vIL9OtURmpsX7ZcTKGWlNpKH+INMMjY/D18rv81BkI6nBsjXv3A0w2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922362; c=relaxed/simple;
	bh=FHANVY32iP02su9AUQalbmIEZKYbDkKq71mSU0vrOUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNXCUlhbLBKEIzGHMA5BN+THn/cvvgKqutDDzxd7BycH+TJn8NMkkeVcS2tGvZBhp1DJf21wtYZu1MIARbsJn+xuYR4XaBkKEXBH9FjbYHIQO9W2iLKSQ2Puf39YlraeEsF0+m7EbAIXtCvk7sCrS0NCr1tw8MgXTLZtbMgC4s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=P821qV/S; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="P821qV/S"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53397325663so34832021cf.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 13:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1791922359; x=1792527159; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TBoL+oiZizwoAHZ61Saznx7uboPW5Y0xvzJblrFEHM=;
        b=P821qV/SEyG003q5T6KPU5MJm9cAK6LU8lZ3mED5Ptz0AGdsUJuIWe4dTHmkeSY+jB
         AeIAqbp4sxnG5vJOnr+nK7bcfGuSfIuG/o+kAQbD2ubutPs20wuz2l1QUj2Dvm47x8Gl
         U0HQtMB68w9emgpB/uLWXyKMAUkIH8DjkQJUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922359; x=1792527159;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TBoL+oiZizwoAHZ61Saznx7uboPW5Y0xvzJblrFEHM=;
        b=xZSfSADwrSXHRpkOaBw2n6zA61DPz1VarlKRvIow+Tl97ixsEHd09ied9nyPW1D3yb
         Bztz5hfPjgTQVPUfmmIp8Jc0urZK2JTPQ3yrnMak1PWVP465m8ye+aQ+99sTuF/EqYno
         +mwxfoteNvAdt4aWKm9a+Y4eF8XKHjh/SOKzEDuEMXkqIvqIVvjg9TMWL42vFV7OUdlF
         zyWVviKUEm0CSTiLc3Z30daOLzHKkwB5apOhlR7CXioBiOjwPFD80oU1CMqDxYybqUap
         CNPkDNDdthogKeuPcF2MglqkaovvF5fE51oYQZ/414860MECNe4oCFoU+Ks2GephXRYb
         JGnA==
X-Forwarded-Encrypted: i=1; AKwUvBx4q1jCVSKyQ6ZBJZ90Y7sqHDmGF/zQowoJiaAsBDyff9i8Bjiakz3/3QRa1w2AS4jgftYR8S1NDjar8X7O@lists.linux.dev
X-Gm-Message-State: AFq9FYI5l7S6nDgkDKotcWiUHUHxqN3Qlu1uhr5Q2OoGZJkcI7ZTxNFE
	FDJiU1wDTW+aXFoq+BrUoci4MkMR71qOlHK3U+hX0Jov/NgpoABfWbV7AeYsqV54PQ==
X-Gm-Gg: AYBFou2I2wsD5zwMlR18DeIOMDmWEMwFtznp23FzVOCKv0dB80e4qAO3DGwMAErLtT6
	RK9AWodamCDVN8fV5+5JxPTB+7JqaeLbDTl5MM1J+PH7zqeDedwZoK81X/FX3IgVKoZYiR9aXQi
	KBK+ls5I1JZ7zIuoiDA7r5CKYqxIV4usqxFsi/PnwHQ5UGgtXxUcfoSXgJjUdUy8M/s1cU5Zdgq
	tg5nAzj4Cr7/qd1l7c4oBJLuOET6LzUv0dHcdJXif6PXvswo+kKVqIf91k6hXjC9u7Q6K/yxmwd
	RACx5Q0I0VtgFt54AEjXvqi1wu5Wdj59YWGJ8HtXFmmE9bCtW79BaJf6mqiA7R5P1pLYSsMxHqK
	iEYp2jJKwCGbU3cmjh3lZvHY+cwxbhbXE9zPQV6iByaKm70FY/HT27IB5jNchWSAO0YrLFPhepo
	ukHWy/i3DMgijAy/vvbjyuHV5wYaO7fZZndwaj3+xigqTYMoMmbhPuQqQxSDI0ql9XdA==
X-Received: by 2002:a05:622a:5988:b0:535:dd8:b12b with SMTP id d75a77b69052e-5359faead5cmr230417831cf.13.1791922358809;
        Tue, 13 Oct 2026 13:12:38 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-5359b7e32cesm106156091cf.28.2026.10.13.13.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:12:38 -0700 (PDT)
Message-ID: <fc8053fd-5831-48fb-98a5-f3e81323b51e@ieee.org>
Date: Tue, 13 Oct 2026 15:12:36 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Remove unused function
 'to_fw_mgmt_connection'
To: Jeremy Dean Clifton <deaner92@yahoo.com>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261013181707.29830-1-deaner92.ref@yahoo.com>
 <20261013181707.29830-1-deaner92@yahoo.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261013181707.29830-1-deaner92@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 1:17 PM, Jeremy Dean Clifton wrote:
> Remove unused function from greybus driver to_fw_mgmt_connection.
> 
> This function is not exported or called from anywhere tree-wide.
> 
> Confirmed with git grep and cscope.
> 
> Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>

Looks good to me.  Are there other unused functions
like this?

Reviewed-by: Alex Elder <elder@riscstar.com>
> ---
>   drivers/staging/greybus/fw-core.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
> index 78321be80013..46b35ef55090 100644
> --- a/drivers/staging/greybus/fw-core.c
> +++ b/drivers/staging/greybus/fw-core.c
> @@ -21,13 +21,6 @@ struct gb_fw_core {
>   
>   static struct spilib_ops *spilib_ops;
>   
> -struct gb_connection *to_fw_mgmt_connection(struct device *dev)
> -{
> -	struct gb_fw_core *fw_core = dev_get_drvdata(dev);
> -
> -	return fw_core->mgmt_connection;
> -}
> -
>   static int gb_fw_spi_connection_init(struct gb_connection *connection)
>   {
>   	int ret;

