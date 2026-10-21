Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573268;
	b=m5b7dDoTzdh2QdJ7vZcyfqM9ivXmK2iZqdHghTJu9RAGl1TOt8UbIjaN7w6kqHOrnoUf
	 fRaKVbqA2JkDuC8Yau/GKxCH3C3yohu8ScUWJRPDlOogQnVjgtJ8/Nq+GLSslWJKxdmwM
	 1/4xCE8MzZ4BnIWx1dDWHucZEZBE7R/4hrUMjZV9pbS6Fm2c7exFmIl3oAIFPM2uxm6bt
	 XURlwgv77VHwbyX7zZP9zNioC0/dd3pgITCHkm1QN7km89znc5MkQdjNntx14b+OzTHdc
	 HaL7ZxrFf9UJjEk7QhuHEBMfAPK37coEoq9xXYoTszr+kHyEqUV5o7+4tk1hxK4eZng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0CvtnevARTRbuMliMhrk92TVJaPzyyAEelWrOhCsJKU=;
	b=0YEYy/mlcPU12Ift4hklhOUSlDGQXUrSa7/wseM8VwwDJOc/OiRD8BALI+NcEmYiOD8v
	 zPOAwYSny+k8ulaL/bucYV5hbBk3BAMWe0VhbH4YWaktTyZQBQjc2m0xuvefwLvfRKfFu
	 0B5Yzr7g07NpyMipo3TffmzGuuXnyEW5quEzmmpYzR/n0fxSQ/3YbPVg5+qsDKfDhUWJl
	 1cx7CdH9cJHBNM52zeW4hXXefZdheSzqqfcRVxl2qG/6/ooPWlWkqwTgdZz5z6IIBMhPX
	 R81EpMAPSGc+1FISj2YA5K5k4GUSpq8R5DhcUkbfpVe1+Z4mCdYCGi+BA4vyy/H1n8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DTCKzSgX;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BE1606A319
	for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 09:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9BE1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DTCKzSgX
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso3977895e9.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 02:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792573266; x=1793178066; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0CvtnevARTRbuMliMhrk92TVJaPzyyAEelWrOhCsJKU=;
        b=DTCKzSgX9nx3F+Fu9R10q9QuqfYSBgUHpvCd9t4qSdbEbcMioqxohtVw5WTQAWNwFD
         Pc3SoD6HwFMC+9ZSmozlbbze5Gz005pF62J8NgI/qxW7H6L3sO+2PTGoWRCznY2upffC
         GgzrM4RGhM7EQOEA1n8urHTZw1WfM9JtU8mqS71unj4DGssblk+CaCBHnSrziRVYN10S
         /iokGwwPi2Eju1xmAetnrJBKcifaMXVYYkS2zMr5+Ng23u4uOjPuTWrCBw3nZKJTF1pQ
         r7x+cRL06jtQ9ABuiVomoR09lKeAXh05Jtl6LtBwVtioTExMJth8JAhroa+bz+ESUs4I
         becQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573266; x=1793178066;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0CvtnevARTRbuMliMhrk92TVJaPzyyAEelWrOhCsJKU=;
        b=wLvzLcb0wy73qI2SwUNey00jx0OwBCzGNwIqgoNS/WQzdhoYCzHDrtN1bbIVtHGVHr
         FUnObEFH4bPEu2spOIlFzj8RktRWC5ShWWA+957g2zzl4eDCxcHYiK1xYnDzMMiVSgN+
         gQ1bhTQyG8zazB/qcaxuPZm/gJwXTciMQOj00ryNdMGkxm6iRlLY+phwIqHhPWkqyl+E
         zFWdARj6vbMhu5tbtEutZ7mXuohgfxvZVYUqr4A6Svoh5nO41fsa2/sPyMk3SUBRmtVA
         LNKJ2xKREyMdPEotP+seU3fZ8coOfn6ZB6r0REicVFz2Rb/ppr1AaNux0rv/oK1yP+j6
         Yv5w==
X-Forwarded-Encrypted: i=1; AKwUvBzZ5IvxYARcBL8ISID/DZAh0ZZ+LGFBHaWXAxKojYrVMuTYUL7rfkGFwkPKF2IzQeXf8iTDgZiw0Z2EShtr@lists.linux.dev
X-Gm-Message-State: AFq9FYJDq2ul4exNalVDNeRN2rYsZEJfqgOQv6KplvCp7S5YN4dSfvzd
	BX2hvhWhOQVTaGXJ6VU5Z/AsS9Hic9LIuOR5CyJ+kICX8ajTiY0l0NUU
X-Gm-Gg: AYBFou2Gf9rOrrXIWUIjb6Boxg2umHKMaWILcoZjF2Axvc0Hibq0hc9ObzF8pff2sX+
	4KCjfMMglRI+8TB50XrNj6pYQsqAAKxRDSrv4z0DtYhtQ4/rjfgIftEx3WcJRwc/4PcW58B542N
	FcsikJN4U0bojtEhuduKiyOEJbdwopRF5BQ8Uq00ToUdtAXGu8/0kL5Xtoq47CxcMmN+tezhxHl
	CVLvJQRUExlHDdvjiysBCKbi71ly1L+2T8EOYnNz9kkRh/y0enak2f9WpvsQJussH39l7T/Btah
	n2AchfedQ1F17nbDMnd01XBMpS8NFkkOn99iQCxtaEoLiUYibtJppmCOXbFTbITzYt81UQTX/3X
	dbWLyN/+pzvmmpl/z5v3sJG05V0FxwMHMqoUTDjh+wMCa0JmPFlmxU21qhi6K6JaCU7DVGu8TjL
	1xexFssTlkkgh+G8rYFhHWP9NZOVwPtJqJllvX+MKKG4s6PEaASRO5Mqn7rjWE3A/VgXMvUfFYH
	vkrrFcgOZYDyy2pW31iMu9H9pgq/DPLGPCsCbmTg5bBJ2Sgo3rB8AXtR5fyPlcgMpn+npbbbk1g
	nU3LK4OkrA7R9Bmr
X-Received: by 2002:a05:600c:46d3:b0:4a1:97c6:d2e8 with SMTP id 5b1f17b1804b1-4a1fdd234a6mr27427875e9.32.1792573264449;
        Wed, 21 Oct 2026 02:01:04 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f69d9b1esm110340935e9.7.2026.10.21.02.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:01:04 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:01:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: LiuJunyuan <2058432396@qq.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: use scnprintf in
 tsi148_alloc_resource
Message-ID: <20261021100103.38338356@pumpkin>
In-Reply-To: <tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A@qq.com>
References: <tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A@qq.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Oct 2026 11:13:49 +0800
LiuJunyuan <2058432396@qq.com> wrote:

> Replace sprintf() with scnprintf() when formatting the resource name.
> 
> Signed-off-by: LiuJunyuan <2058432396@qq.com>
> ---
>  drivers/staging/vme_user/vme_tsi148.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
> index 9447c00bc013..a0a7c8341995 100644
> --- a/drivers/staging/vme_user/vme_tsi148.c
> +++ b/drivers/staging/vme_user/vme_tsi148.c
> @@ -745,8 +745,8 @@ static int tsi148_alloc_resource(struct vme_master_resource *image,
>  		}
>  	}
>  
> -	sprintf((char *)image->bus_resource.name, "%s.%d", tsi148_bridge->name,
> -		image->number);
> +	scnprintf(image->bus_resource.name, VMENAMSIZ + 3, "%s.%d",

That looks like a very strange size...

David

> +		  tsi148_bridge->name, image->number);
>  
>  	image->bus_resource.start = 0;
>  	image->bus_resource.end = (unsigned long)size;

