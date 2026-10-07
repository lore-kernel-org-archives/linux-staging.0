Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B624480959
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383337; cv=none; b=MaEp0p4lgs5jDcGW8npFH7J5+FMKLWOccDxprdoZkRtd0oO5UhQqLIQbF0JCg+bWE31vxj+7IMdYjHnldv6kVcfnEY8dCYPxgTgct/1x/EDsKMN/ZWqjg+7vvys0KjlYZK7DY+ZJCientG6u1JKaj/cXkh8orDXln6BNJF/1SX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383337; c=relaxed/simple;
	bh=KVQ5MgRmaQYYQf25j/wqXLwVGYvs2wwXh38dzhL7l3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qB0wFIRTXbgVSSviMjyF/phjCMeXfkuuZmloNj5joOarQ5J1u5YQ/n1vkpDArI3YiEXMtjOcYqz+ATEYKB6VB8gcUEZGgs1k/S2FxJevRFY1fn148fAvvm0XV1JcBZQ/ZNqmRMGZLfRZm0FB5FDsX3PFoA6c+FE3+qvywkY7A1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=K8ZR72fZ; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="K8ZR72fZ"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-534e6545939so33175741cf.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 07:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1791383329; x=1791988129; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=95l/b3hRWMzn0R2We8bkKJczOlV+bNp1xvkg05eCbus=;
        b=K8ZR72fZHguQ3a8pvLNp6gtIQM58225ylCaMhOSkqP/EjScmnvmJW+MvciiCV4asdg
         toUI5bIEw1RtAHhBCmwdfdXlF/Wi1thE5JHp+t7sPVXQVeMKukKHzjfdEH6D3oGpe6kg
         6boXmzqmJjHiFfGXXqYJzi4y5mc1FGDCbxsO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383329; x=1791988129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95l/b3hRWMzn0R2We8bkKJczOlV+bNp1xvkg05eCbus=;
        b=g/A1bwzPU4rPrB5rxGh9PSEgp/cnmJuO/1Rf0+Yy0SG4B+CFdrgqD+RzDE5SZn3saR
         2RBMzPZ6/6vGLrfAUkKG+aWRnpIHdBwsyB9W0xCzrYdlH1hljpq7JYmm6HbdU00vcj5E
         oMxn/83xQe0vYYXz7DB8F/hEpEKZqln57bU5Pi4D1L2e0rHlcgCuYuy7b3wUptpUGPEs
         JHO+HRaXpl6SOwjFdY/iR303/GTcQ/9SICP8+QuCRBcuyUZSbkwRKTzMsMHqjfwdZ3tQ
         ItZWotvbvqGinEPulk48eLqGrTpHk1KemMl/h+kAYUArl/EDF7T0JKwUmSckWFVLdmEq
         vwrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEP9UQ6raRtoLNB63FFZqwfajYh5bcLLmRe1DOv7mrgO9GPa1XoV1fvYklOUsbo+cKFCSWo7fW9gBR5BB/@lists.linux.dev
X-Gm-Message-State: AFuF++miurZQwCnSxZyuKltsVDuXpVuqGrNBr1t3cgLaIKXB0LeLsozK
	YN4IQE7xilaHMnjCcuzZru+FUoPwkJRzwybWhdu6cLkj5BXTxLhQ4AYogfQLDkmR+w==
X-Gm-Gg: AYBFou0rYuPSliZDpVAuKkistkEdYB8cnUojWwaPORnR474vvEsumqo3LYzE41SEDYJ
	+qrUbaaIqjN4jVlJW0ObzBFUCPt77n096sdMVAMdNI5sYYCSnBqJR2+RxZJawGa9uxA+HibPce2
	cV+HDBJO14mt31MzanYhr5W9XcHUp0QjmAwYXSCSU5/eQqKJc8IbK9DBMWOa9OnsDsyWxcDLs0B
	pPk5P3EQvg9TXUfDI4zdoUVR4RgCuKhq2Q0hF33Om7Jc3sGgz3gl0XOlfsY/5l5kdQTLx91RwU5
	u0lENA0FVDpgQs+lK8kO/3CmBRNd1Z9Mm2VIybyyuaEqYCA+d4JQt5pViTVzXONGCQdNn1i5Z+e
	3YQAWvf302O1vpAc/UN+fEkiRq2XH754I+xBhvEb3yc8+snysIXfk3IRrG5z1MnBOxTXZ9XxaFM
	S5kcn48MsKjV3OKzNzPHSDFKJqJHo4OBdQN7GRwkFJLAlGw/rmFH8xps3YA9jqdfqukZbs7FWhF
	7qQ
X-Received: by 2002:a05:622a:2512:b0:535:d7e:dc4 with SMTP id d75a77b69052e-535753b8838mr37078081cf.19.1791383328200;
        Wed, 07 Oct 2026 07:28:48 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-535721ec7b1sm21527631cf.30.2026.10.07.07.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 07:28:47 -0700 (PDT)
Message-ID: <5b4a1156-d05b-470e-952c-1958982f5ae3@ieee.org>
Date: Wed, 7 Oct 2026 09:28:45 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] greybus: Discard pm_runtime_put_autosuspend()
 return value
To: Brian Norris <briannorris@chromium.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
 linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
References: <20261006231900.3230373-1-briannorris@chromium.org>
 <20261006161337.7.Ib0925681ca623093ddf812cc4de848e10ec07c73@changeid>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261006161337.7.Ib0925681ca623093ddf812cc4de848e10ec07c73@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/26 6:13 PM, Brian Norris wrote:
> Returning an error code from pm_runtime_put_autosuspend() merely means
> that it has not queued up a timer or work item to check whether or not
> the device can be suspended and there are many perfectly valid
> situations in which that can happen, like after writing "on" to the
> device's runtime PM "control" attribute in sysfs for one example.

If I understand this right, "put autosuspend" is basically an
unconditional "put" with the assumption that auto-suspend will
ensure the eventual suspend occurs sometime after the reference
count reaches zero.

> Modify gb_pm_runtime_put_autosuspend() to discard the
> pm_runtime_put_autosuspend() return value, change its return type to
> void, and update its caller in the Greybus power supply driver
> accordingly.  Also drop the redundant pm_runtime_mark_last_busy() call
> from gb_pm_runtime_put_autosuspend() while we're here, as this is
> already part of pm_runtime_put_autosuspend().

I support including this fix in this patch.

> Note that this resolves a bug in the power_supply driver: in tracking
> 'gbpsy->pm_acquired', it erroneously assumed that
> pm_runtime_put_autosuspend() would not release a refcount when it
> returned a non-zero value. That's a false assumption.

So is it safe for this code to assume the reference count has
been decremented in this case?  The comments say we're trying
to ensure there's exactly one get/put pair.  (I don't know the
reasoning behind that though.)

> This will facilitate a planned change of the
> pm_runtime_put_autosuspend() return type to void in the future, similar
> to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
> type to void").
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Despite my questions/comments I think this looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>
> ---
> This patch is independent of the rest of the series, except for the end
> (changing the return type). I expect it can be applied by individual
> maintainers, and we pick up the end once the dust is settled.
> 
>   drivers/staging/greybus/power_supply.c |  8 ++------
>   include/linux/greybus/bundle.h         | 12 +++---------
>   2 files changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/greybus/power_supply.c
> index 44bd8a72fa50..beefcbaf3681 100644
> --- a/drivers/staging/greybus/power_supply.c
> +++ b/drivers/staging/greybus/power_supply.c
> @@ -377,12 +377,8 @@ static void gb_power_supply_state_change(struct gb_power_supply *gbpsy,
>   			gbpsy->pm_acquired = true;
>   	} else {
>   		if (gbpsy->pm_acquired) {
> -			ret = gb_pm_runtime_put_autosuspend(connection->bundle);
> -			if (ret)
> -				dev_err(&connection->bundle->dev,
> -					"Fail to set wake unlock for none charging\n");
> -			else
> -				gbpsy->pm_acquired = false;
> +			gb_pm_runtime_put_autosuspend(connection->bundle);
> +			gbpsy->pm_acquired = false;
>   		}
>   	}
>   
> diff --git a/include/linux/greybus/bundle.h b/include/linux/greybus/bundle.h
> index df8d88424cb7..361a94d3499b 100644
> --- a/include/linux/greybus/bundle.h
> +++ b/include/linux/greybus/bundle.h
> @@ -59,14 +59,9 @@ static inline int gb_pm_runtime_get_sync(struct gb_bundle *bundle)
>   	return 0;
>   }
>   
> -static inline int gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle)
> +static inline void gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle)
>   {
> -	int retval;
> -
> -	pm_runtime_mark_last_busy(&bundle->dev);
> -	retval = pm_runtime_put_autosuspend(&bundle->dev);
> -
> -	return retval;
> +	pm_runtime_put_autosuspend(&bundle->dev);
>   }
>   
>   static inline void gb_pm_runtime_get_noresume(struct gb_bundle *bundle)
> @@ -82,8 +77,7 @@ static inline void gb_pm_runtime_put_noidle(struct gb_bundle *bundle)
>   #else
>   static inline int gb_pm_runtime_get_sync(struct gb_bundle *bundle)
>   { return 0; }
> -static inline int gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle)
> -{ return 0; }
> +static inline void gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle) {}
>   
>   static inline void gb_pm_runtime_get_noresume(struct gb_bundle *bundle) {}
>   static inline void gb_pm_runtime_put_noidle(struct gb_bundle *bundle) {}

