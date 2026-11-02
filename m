Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631281;
	b=TbnoqGPHIz+zQticlm3hNCEnVvf44pamN8gMG9FDlxVyFBddgMXBpBM9G0mkJTBoWRBG
	 kQ5SPhCOzBH4ZhRrjCjJq74BypuDf+wkYWpXU5T719VCQ8XNtpI6gw8g3WSTolvy0zGln
	 lvwoQvCvvfjryNRb+nQuPsbiVsi95+LkjimguUY9T+kWM00OEVOfer3UuP6w74h3cbjPu
	 qXcdH3qnL+OYNYrxoPRoqpRSmf9naF9YIcjRzCjtERD8XFwyHurNiSlurpzYCpAK+dngZ
	 UmpRIxYjL5hYcGtNI85BjspmzQIkH9+9yQMcEkUBLWc9dik3eug0zHLD77jBqPYPDZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jHCujAV4TSmNU4uGy8hxkAD9bn+1UUbLxy5pyDl6AaQ=;
	b=0yo94riG+pCuKgpvuxBkAbCD/x1nGw2ysuT/vx3hxVogmpSoPxQjQrBfQDf/fZcDq9jf
	 zbEM5GkPBDflIEqQZeBPJaj80HPj98Xc7wZ9+xB1pimEdxSX4kV2W+boNQYQsJl5+N/kM
	 0xDIyMC7EKUu4vtGjDiZNVcGVaBRqtsX9Z3/mh1CtWlNJQNwbGJp47SI9wsye332Re/qY
	 0drSTmYJ32bF+69Sgf3/53sIExr7LUYuvCx0+In467ikuHdqNJraNU5u+vgYRy7Ajbs33
	 SHvV6wf95ZQ8l0Vc6+569IulGxGEfnCYNSfiOKA30XxbnAWd/u2gXMQ+w99Xoyh72+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nn+H+qCk;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BF9607B466
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 14:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82BF9607B466
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nn+H+qCk
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3267676f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 06:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631280; x=1794236080; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jHCujAV4TSmNU4uGy8hxkAD9bn+1UUbLxy5pyDl6AaQ=;
        b=Nn+H+qCkc0Zda0vm1J1K8ZTZJJJporbC/2bTUK5Nk3otSUWhCGU8J/2OSbnrXDyr+t
         LCFdiaPjoJWEyS3XMI6sFfnJjnKHNPpHDjd3hFXmjXB9qettXjGkNjyAlCSwzf/sdBKB
         IsgEWCwB2USWNmAlWU17WknXMobFQMdA0LxjN10ZWk/QPGtnmzloZuAD+eiRwvzJzlyN
         6n2pJRNYt+SY2VwFvck7eaGulQxlNJIyCGzqgthodSZopOCdpelqnSiBqAZb9kPzQd7y
         AiyZXoiOHK73b30vFzGvioqKfITwdyIrLtKN/pdPV1RP98aFy9Cyt0FxCEfCVGUlLxIV
         W2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631280; x=1794236080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHCujAV4TSmNU4uGy8hxkAD9bn+1UUbLxy5pyDl6AaQ=;
        b=qb3POI1m44wExwvOuXEWssYS6qztIUNqQNFh2Mb92WotqPQqAHPgLHIoopi1mlJKna
         +Kr3ZI72wTQ8PChmBoaPLhYfCe/s88Z5JLFi+n1N4BPvB3pgWlvGMFuyjkTBwV2t/LGS
         dpqDobxaJw6aPyZR9xghQ8QZtzNQaYheWSUkGd2zAvdkKIfd5534GAvun+qL/47ggCj0
         X2s2tHqPf1psMFImHoW1PZBVv6ZcEGd3LogX53uESfm+plXRNWm+IueuQbJv0dP9+mr9
         Sv4fF7/EH/DT/dlneKw+YPOheo5Kg7bG6JFt2sq8Q5Tx0RlgZ2JLsQY9MAzNRuV60tAz
         vWtQ==
X-Forwarded-Encrypted: i=1; AKwUvByNrjAKQPc7WOe0rd5I+dDBeS7bFk3H/oOfszNHynCmGGzwN/v4kHLKjxe/NfPg79H3sOdfSznK23OO6Sto@lists.linux.dev
X-Gm-Message-State: AFq9FYJNBldJiarcZyslZILwvwv/JXzSVuXp0xDRkwU46xiDuodbtZcK
	23ph56clqX75o/PeGpfmUaTMhK9r90N+bQvtgfksDyrIIYTT/6P37WJibSO0hTvI27U/CT2R
X-Gm-Gg: AYBFou0iQW9oHdDDlcux3ueN3Q+vXHYxjEMgT4UteaqCTeQB/bsIMGqEpMjpafs07Z5
	j44swWnp9u6R3011NMkO0vRMp7aq01RN1H0KRBSznpYbPMn5QxGZLo/45xJzHKwjMFJ9Oy5O46k
	UV8UCA2J+MzCuexEewkGLWsplzcpTgi5TMlcuBhi55DGR64z98Q9b6ExQPWokNuuW7qEgZLf1cW
	YQAZA+C2P1/4VqaiYrgIF660HAUFHw9nbmp6TFhsQRo3hsZN8+CVnQ5mUYR93eowBhuQXxWSCe7
	sQx2VS8IJ/9wNdGNr0wCPX06AvWRK6Z16TCbQ4T/vUWC40Kg0S2UAA0qjJlTNTuInXY6F0xYpcN
	Fv7jgykI4OhXL20gJTWjSn/PjofgB37myIwqA4q5dHxjlHZneMxTcCM82oCw1bCUxzYRYuf8Mnd
	KgD+zuUR4oJa1DdoUcv1szXU/qyVi5saPxB+zJzm75ETCAjK52qgEICplOpBbcjzYEHRf4F2LkT
	UBBhQLzhRvbfRlVpfREyEH7BNdt8dO2zl+EGM5/Vxv6H2hv/uCGL9sPJZgB/fTh3dRgnZuBAa4G
	P39gz5ojy9UQoorAclM438lTFeBy2NMCUb66dR77hItBViCLHzZCS1AbRMW1llRelAsHnY2CRID
	m00Gspgn9J1FdPXxjERrHWUQFGgk7M0oIzXQtJhMtzB9EHx7Vv8IVyKYq2LgaGYl31O4=
X-Received: by 2002:a05:600c:638f:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4ac17d168a6mr229177725e9.10.1793631279890;
        Mon, 02 Nov 2026 06:54:39 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09ad5ff8sm195665515e9.4.2026.11.02.06.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:54:39 -0800 (PST)
Date: Mon, 2 Nov 2026 17:54:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maritu Hone <marehone12@gmail.com>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: fw-management: validate firmware_tag
 is NUL-terminated
Message-ID: <auikK_2xehWSG4eS@stanley.mountain>
References: <20261102141221.87646-1-marehone12@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102141221.87646-1-marehone12@gmail.com>

On Mon, Nov 02, 2026 at 05:12:21PM +0300, Maritu Hone wrote:
> fw_mgmt_ioctl() copies struct fw_mgmt_ioc_get_backend_version,
> struct fw_mgmt_ioc_intf_load_and_validate and
> struct fw_mgmt_ioc_backend_fw_update directly from userspace via
> copy_from_user(). Each of these contains a fixed-size
> firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE] array that is never checked
> for NUL-termination before being used.
> 
> While the array is eventually copied into a Greybus request via
> strscpy_pad(), which safely bounds its read and always NUL-terminates
> its destination, three error paths print the original, unterminated
> userspace buffer directly with "%s":
> 
>   fw_mgmt_backend_fw_version_operation():
>     dev_err(..., "failed to get version of %s backend firmware (%d)\n",
>             fw_info->firmware_tag, ret);

The strscpy_pad() function returns -E2BIG if the string is too large
so if "fw_info->firmware_tag" is too large then it will never reach this
printk().

>     dev_err(..., "Firmware with tag %s is not supported by Interface\n",
>             fw_info->firmware_tag);
> 
>   fw_mgmt_backend_fw_update_operation():
>     dev_err(..., "backend %s firmware update request failed (%d)\n",
>             tag, ret);

Same for this one as well so these are all false positives.

> 
> If a caller supplies exactly GB_FIRMWARE_U_TAG_MAX_SIZE non-NUL bytes,
> "%s" has no terminator inside the array and reads past it into
> adjacent kernel stack memory until it happens to find a zero byte,
> leaking that memory into dmesg.
> 
> Reject the ioctl up front when firmware_tag is not NUL-terminated,
> mirroring the existing check already used for the equivalent
> Greybus-module-supplied field in fw_download_find_firmware().
> 
> Fixes: 013e66537273 ("greybus: fw-management: Add firmware-management protocol driver")
> Signed-off-by: Maritu Hone <marehone12@gmail.com>

If this were a real bug then this wouldn't be the correct Fixes
tag.

regards,
dan carpenter

