Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792759737;
	b=YLXjr+qVFqtLFR6SrXoS/4L7FYuDjUUKu6pXH8SUUMwoHlfWj70w0Kww5SaP/A0ilWp8
	 10q0jRjpyTlL3/3snTqgaZ4UbgwO4+ENRNFVQfEywaOitERPHER5l6W4nKGz0agXo3vGf
	 3O/blP5bZYAMXUy1WblaWirw0VLP2C0XyabobRTqb+WucMQrpldy2awk/SWttYjc1BX8Z
	 Q7dehmGyNBANVNDUlk5Hc+6aqweIgZ0jsz63ogKlnL9jaMHhm6D/Pqcx49LGCQVy8HkXD
	 3lDp3+cqqtezLPY1W9hB7tu2jGHRlGcqUQZEAdiYuEPrJsKXAAJgQIjp2iy1arAGBbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792759737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AauMIhJF1QGD9945xyHgO/hlfJd5Li+gb8s1bXigGyc=;
	b=hTd10fWyqYvR4wOmnWjd0VoWw31aFIdCxsqjVsdpPbEQtkVkNiLA+AqTQlfGrUi8Jbp+
	 3TX13RHAS0xsKTDZ/9oMWyKmnD4vZuueHMpXQECAUaUbzyofem8UWAEOGP5bHwnXvvGpF
	 KJqPiuEE6ZMM4dun8PznJT1xDGnU3emlb455rNy3+MOudtb8o8GSJR662/5mEnIVMaeWI
	 Bks8cOZLTDfvnp4deOSC/gfuJ9zM2sYI85TYy4aJKGhdMnHtV++iv3z63umBI9SGCPo6o
	 UhiFJAaoHJ9wJ8O5ZRkrwkYZGbg5Pxk+VpWpy/OrgsqIoUigc+aUzbXYyy5KYcQcJ8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=BaQM0NBu;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D45D606A31D
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 12:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D45D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=BaQM0NBu
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-81b54d0cb17so771873a34.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 05:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792759736; x=1793364536; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AauMIhJF1QGD9945xyHgO/hlfJd5Li+gb8s1bXigGyc=;
        b=BaQM0NBuFlAUgCaiWa6udwcOV4/krxkJt8kb4AaA8u7PPB3rVSwOPhnnxlsVV18m11
         U+WQTE6Zf025qe7FoHItRTX1OQm61R8yRmweODuDJsuDOHbcQmYhcgBTpRBftTwnWpEM
         QSWIt13+SfsFDcH/uS78qFIDGdGOhK3YimDvNJnhC2SWIj2M7+Ua4YBVu1f5mc1Dc+QI
         wZTA1zbk+8pnriixs/nXazF9rqQKIVSbtwx08cssjTEM/S+aRyOTfg9+jYWnBoArJGRL
         QfeX68QFfmED0ksMaCFQ4dTWDFVS4WIUvJkd1uLjWBVvXRlM3vyKAvjOdfEsnIoF1BRG
         v2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792759736; x=1793364536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AauMIhJF1QGD9945xyHgO/hlfJd5Li+gb8s1bXigGyc=;
        b=ZF0psLoT261vLzNqdFQHwdAq+qOsWVajFYCnFdbI1hSa7oKf1qcf3qvMLas0rsgHsp
         tCuX0T/7w8G3Igc9q7RRGW0x6n2a79Kh7VfpNrU8G0mCHPJJzHnqTszv6jLVJRdsJxHr
         qsWXJI2h5F9vaP5lHFtcVYSGMDWa+Z3E2SeHlF1xT8Ot2ok7bmaXBu5TMbcDiEMAtdpa
         cNTxqV+3xyyO61EpsJHnblaYpl8u+vMEXeELQSHvUaFc5xnTOlzuLfe1DN9XGM6SZ2d4
         ZBUB8osxKGv82WcXdDvyaHhWo6A3C+ctipAKlR6sD+Ea/uuYkThC1fTwInQQCKEHwTEi
         j3jQ==
X-Forwarded-Encrypted: i=1; AKwUvByO741aFHgWJ06borTtAI9q80mEXQQAJ+G9AKyJej8tRMqPeFiq4+1LwxXVl2k2if7dfJJwK8jlxCaZBip2@lists.linux.dev
X-Gm-Message-State: AFq9FYIuHuppx1f+Zaw3awSgvrXM2nGa5vvv/pH40fkzPSV0Ht94TX0x
	82UeVHweuAgW2mtfyYWyoKC/zCcPHyn3SNw5VN2dBvAF6LmwXxaZlr20ZK+p5iUR1Bo=
X-Gm-Gg: AYBFou3VTxuVDbgT7u6YjPg6J6/qnpIdmhxrSziX7ydGJOt8K6i0Qg41UiYMx8AD3Ec
	Wd6Xb7OpxpG1Pi945tz4DhgR5laWQsXEWYSQHixXTKsJK2e2hbobgFWSN1fsS9SclYW6QmUWons
	z8oIoucztEO2o9eh+GQZ4HKNBALMswPz+M5QXdWgkr2nZvn/H6leimRkJ8yDFXGtAdtRhLQMNTc
	wxKNo4S7PIveeXGRjVesenOpuUTn74j3LxERXcSFfj5VgVjdTWokGQWEfUd5XU8AR20rC41NybP
	JxMewff6Cyes6ZrZJdBMZpP5GhpsCpu2xu/zUTfv0MZOG6Z4b+h12cvkgL/4ts20Iec/CXwd+Kw
	/SqROLoAToqNyVGllEX+jW1z1Bxs6QkeuKFWS28lmtU0YrUypak2XkG4s7BP9aS7CfO5d7Z7ICW
	y+An6K+rI1zVH3caqY00Ej579nC8SvdDuY18dSA8Hmw3jzxrX3lYL6G/o3jqZsT+vBtsZp0erVV
	sFSI7FSL/gLC+5klglmd2tnuOLVhUejSALKjWaxUsRpmr2keRG4d7szNF/kw4HdxD9vliw+pyXD
	oGQ=
X-Received: by 2002:a05:6830:264a:b0:819:1804:d208 with SMTP id 46e09a7af769-84fb2906f38mr1294739a34.13.1792759736186;
        Fri, 23 Oct 2026 05:48:56 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbe66cab7sm1910704a34.23.2026.10.23.05.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:48:55 -0700 (PDT)
Message-ID: <a411ee0e-22c4-4797-9fdc-3ac11fa20d60@riscstar.com>
Date: Fri, 23 Oct 2026 07:48:54 -0500
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: greybus: loopback: Use fsleep() for delay
To: pavankumaryalagada@gmail.com, greybus-dev@lists.linaro.org,
 outreachy@lists.linux.dev
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261022202455.104142-1-pavankumaryalagada@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261022202455.104142-1-pavankumaryalagada@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 3:24 PM, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> In the loopback function, usleep_range() is used for short delays
> and msleep() for longer delays. This requires choosing the delay
> function based on the requested time and converting microseconds
> to milliseconds when using msleep().
> 
> Replace both functions with fsleep(), which chooses a delay
> delay method based on the requested time. For short delays,

s/delay delay/delay/

I think "checkpatch.pl" would have caught this.

Maybe Greg can fix this up.


> fsleep() allows up to 25% extra time instead of the fixed 100
> microseconds. For longer delays, the old code rounds the
> requested time down to whole milliseconds, while fsleep() rounds
> it up when using msleep().
> 
> These changes may affect time between loopback operations and
> the reported performance.
> 
> Suggested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Looks good to me.  Nice job.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> v2:
> - Add more details about how fsleep() affects delays.
> - Update the subject to include the loopback module.
> 
> v1: https://lore.kernel.org/outreachy/c482704b-903e-413d-ba7b-5bf31c0a6104@riscstar.com/T/#t
> ---
>   drivers/staging/greybus/loopback.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index efc69c10cffe..2fe845eaef29 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -898,12 +898,8 @@ static int gb_loopback_fn(void *data)
>   		gb->send_count++;
>   		mutex_unlock(&gb->mutex);
>   
> -		if (us_wait) {
> -			if (us_wait < 20000)
> -				usleep_range(us_wait, us_wait + 100);
> -			else
> -				msleep(us_wait / 1000);
> -		}
> +		if (us_wait)
> +			fsleep(us_wait);
>   	}
>   
>   	gb_pm_runtime_put_autosuspend(bundle);

