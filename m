Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC1414658D
	for <linux-staging@lists.linux.dev>; Thu,  1 May 2025 14:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109005; cv=none; b=o+LGxCpTap7brK3HzDhDM7PkhTXub9FW92IZUuK9P2mxhuWn3iN/flsDN9MgX6rirctcWSKVtGxsZtnCZgIjGZjXmoi79wilhnN6UMYi22Noychpfs1Ga5WZjckyc2qLzkiDZT1cjd08h53CJxoj/dekiMaz4zfEniA6GI/5/m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109005; c=relaxed/simple;
	bh=j5318m9W6gx9LdmB8iOipKQED2D4klFe6dI9Bxzwyac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wbvg6MgKOy5OaKF5FOr5drFGO0PDNosRGv4q07EOV/71hfHULmpd3j96vCHWnDstlciML7/7BCTAQvac57/pVYmoFPyYxys2t/YWkwbUOkc/aL+FsZmvxEhLm/QNBnXRP1psctXd5tl630S6zXnNvniCiNYbIY1GJ7YWq5Gd7eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PqglJWgH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PqglJWgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746109003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hh+psC7IriBNgbVFATZKlPoKU4gpMxFOg5Sx9dcAY8Y=;
	b=PqglJWgH6Ll88Mb0b1GhwygOUkUNZLeU8gMW847d+fp0WX9t+WqUARlt5KDw+gUSWrLq00
	euWbm63NE/vCDmyMyV5HX2YPmpPZMS3l3cqb7JGmhYznrPKddcEhLJ4C0WIuZmOg0i8t0z
	bC4q8EtlyXBV36KRGU8kA6yp0HCPSpg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-PP8K2Oc1N4-zHfs0Dijfqg-1; Thu, 01 May 2025 10:16:42 -0400
X-MC-Unique: PP8K2Oc1N4-zHfs0Dijfqg-1
X-Mimecast-MFC-AGG-ID: PP8K2Oc1N4-zHfs0Dijfqg_1746109001
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5f62fb80999so998555a12.3
        for <linux-staging@lists.linux.dev>; Thu, 01 May 2025 07:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746109001; x=1746713801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hh+psC7IriBNgbVFATZKlPoKU4gpMxFOg5Sx9dcAY8Y=;
        b=wkOqiEz10/dBTCEoZRBzBP6tKaVhOtdsJmcqzYKo3e0Z6/cyjcXDsxam7k8fygIcKE
         Gg+nYE1bv1KQtjBIDGcYjHn1HN7CMpzSbUtqJOg/DCufKCvqEZtowD1gjfGaTlkVNv3W
         QTR/S+avIPJ1MObiWJL4PyMg3YTtp0AMMYgBE/iz+ZZZACli7p/zpwm0/hJZcPqwI137
         RemlXT7puSJT58uKevcuY4hej4XzW5385KYBL4EijON2NOtOk49g/vYmcpL467bMLzsj
         pDL9FFXQ8395l3D+78bl1I5unLY5dZAGsV+mUl3UsDCuDQemIzSeMbPj2Yi7oNsYMwyT
         2k2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUw2Np4MTCkMXE1BQMGybcvmO1ZxZYLyVBSmxqLkaKmgHKDQ1Dqe5EvuGvRbbv8yDYdKMQImI7QGVdjT6l+@lists.linux.dev
X-Gm-Message-State: AOJu0YxEd65j3BsMUTG7UyEmwrmVmyfjI04oQveSgJk8hveaPadVbnna
	Fn7OVJChUBFEAuNnmbTFoEMlUK7EDRlah1PU4zZoYTJL+ZoJTrMTVLt8brQ1pYLy6DecK8uC+lI
	mD6txzOjqKkRvE3OcAkHLrZJ7xe3SIvGOzA3PB3pXJuZ5FmCYH/eftB7t8w4iuUs=
X-Gm-Gg: ASbGncsJwNHPuPvVJnQZqJUEUq2nX0twQvKpVJG6JwnWyEll86MBviyIh2kE7cI+2rI
	ynNF3RorPtYQdVMw6DHU2zx1Vfi8BSYTzldRM4DkFGJQN+k/Vb9+r6ZMJXJPtACtytEYk0F/7+C
	rX2t+OfP9zwU1KbUuqoCSSIUhGOs5HBeO00OR74jL4BAG0NUZLWr4wijV4WihmxlIIe+zfVCwx1
	1BFwMj9TI4y3eSvapyQKzM2rH+pIVdwPzemsa4OkI2bSB2Q4946HFFT3WShZrxp+rE6abh03XWB
	mPKQJ7ERdJJ56LGMWZcDeQat/e8dBvMh/UHPdEDL+vCrn36m22MtvY97c9fuz1C9VqvzPUgEqqw
	JAOduwvZ1N8EXlOJIux8TKBMpQJiz9cIGsd3cHFrwGHKgZE1JzooIK+QNaSflDw==
X-Received: by 2002:a17:907:3da8:b0:ace:dd27:7c68 with SMTP id a640c23a62f3a-acef49a523amr286269266b.46.1746109000790;
        Thu, 01 May 2025 07:16:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERxZ6UQgY7nJnQihqgXO4g35TCN9e9LK+eXe6+W9Ewkl+z5FgYaucMhPyRZQ4ao8P7tj61SQ==
X-Received: by 2002:a17:907:3da8:b0:ace:dd27:7c68 with SMTP id a640c23a62f3a-acef49a523amr286267266b.46.1746109000405;
        Thu, 01 May 2025 07:16:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da516a9dsm45118166b.122.2025.05.01.07.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:16:39 -0700 (PDT)
Message-ID: <4200c8b5-ec1b-49f4-b530-9067b1dc22c2@redhat.com>
Date: Thu, 1 May 2025 16:16:39 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] staging: media: Remove duplicate NULL tests on a
 value in pci
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
 outreachy@lists.linux.dev, julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, andy@kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
 <26990d4a9d4419f9d4155a40595bc213acb671a0.1743685415.git.abrahamadekunle50@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <26990d4a9d4419f9d4155a40595bc213acb671a0.1743685415.git.abrahamadekunle50@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5oTLOyskNBQPisvyPV7oRuyeauMaPn0_76qrIghwIAM_1746109001
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3-Apr-25 3:26 PM, Abraham Samuel Adekunle wrote:
> When a value has been tested for NULL in an expression, a
> second NULL test on the same value in another expression
> is unnecessary when the value has not been assigned NULL.
> 
> Remove unnecessary duplicate NULL tests on the same value that
> has previously been NULL tested.
> 
> Found by Coccinelle
> 
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index e176483df301..0abac820299a 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -1292,7 +1292,7 @@ static int gmin_get_config_dsm_var(struct device *dev,
>  	 * if it founds something different than string, letting it
>  	 * to fall back to the old code.
>  	 */
> -	if (cur && cur->type != ACPI_TYPE_STRING) {
> +	if (cur->type != ACPI_TYPE_STRING) {
>  		dev_info(dev, "found non-string _DSM entry for '%s'\n", var);
>  		ACPI_FREE(obj);
>  		return -EINVAL;

