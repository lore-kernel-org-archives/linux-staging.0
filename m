Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280217;
	b=5MhII9eVV0lQOWaT2B+vW0/L01LQNvxDL9+9xoSloGM4e9FD3YcfDRRm+9khsiBQUQsl
	 Eh5SBGLD7tI2+5BtOlIImAhdK6Xw0f/B1Xir3nN/gYWrnTfNKpQuBRXZexs04na0Ldh7s
	 BPBueSiJbOYMkpYRuLEDzUO5NXPC2bzj6vZG/MWbCrtMkCPr8UWjhGj63ZOTBR22H87z7
	 zCBSiBPFLwlpLvOMtwqwhmr9di9RxrjJN/6eGPkQlbqAo2Ga6LvjHParKINrITwxejWkp
	 lys/oRjOmVmXEIGXTEGX+BAyTvyZ6h56EmeMhflj8E0sNR5gXHNVs/+zFwLf9JEX1YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OwYCnrVFV8I2f8pmllBeUgdIyQq7zFSBdo4u/NvHzyU=;
	b=Zkxdgwli40gQKivxic11GH8Xh4ob5dsaoVYsN1FMMiSy4FACFiatUJrytgOvauukgh/o
	 PRtWtd7OVvdaZ1WIy08UoJUYlk3kbAL266+Iw2ksje1tIY1BUUnrx/qh3Hozt/DyqQ+JC
	 wmeVyJwwJBOiVORrRFzIjFQdeYsrDprT2PM8JGY6NQ33Xx2fhSzW/NWsB7Su1KNfwhOFW
	 MKSg5iAdgfiz3aBLQEWm7K7P+USzzZl2P8eVeze35VcupEaI2IOzSXV4i2Yge2MmdCPSD
	 Skn/ZWstm7IbYqwCuzzfGCEgcBvosMpgmbQQIwWKG9xsSTtKHKrMaR6xODaT/6SKD/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bxLPrA0P;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30879606A31A
	for <linux-staging@lists.linux.dev>; Thu, 29 Oct 2026 13:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30879606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bxLPrA0P
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so25372335e9.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Oct 2026 06:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793280215; x=1793885015; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OwYCnrVFV8I2f8pmllBeUgdIyQq7zFSBdo4u/NvHzyU=;
        b=bxLPrA0PXTROJBECcH/3LonC/XlvxRdaWkIm/Cpsv+zYZmEYydhlQzo0JA3eJvQ9Zf
         ZPzemhaZG6lkrCGW1f69TXNZx8FRexQwR9nUwsBcjSnt6mTeP+GO6YzwV4OuYpDoIeY9
         F5un7YscHyijcx5Gywj1qc3uXbXF0CH5druqnDRfjrDq8Hy8O5u6DJP1BEd5ozw+mx4V
         ZDWXlVA1rP9N597jkxdN8KROyUsbeSKK+u1/V+b8KkRibG6/+VvJHlVMSw7hbrf+HEAz
         GYy0ntmyrHi6LGsatLnrakXcQJBnJnJx7KmUKioZpUVfcqJUKbbPVr36p9rF0E9Rm00v
         5S+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280215; x=1793885015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwYCnrVFV8I2f8pmllBeUgdIyQq7zFSBdo4u/NvHzyU=;
        b=CHG0hXhx2voyFTUMSV8zFywoWdyqoPYUOtCapqnpOROTjmf+HLAbydUcDVLhrm+UV5
         YJELz1GduzYFvzUzljflP7NnKwzTdd6OY5vZbI1Tcnx9DK2XorN7/pMsYpbBzRTagF/u
         56CqADVwdDcDm54eCaGn+JzfNVeQarKoc2bYYF1DS135Zat8CpuocGDHyEXQkcZBCIFX
         RZjfmgOesdQU/0BvZUsBI1jumRgERyoqiNP/6r6vbnCZRrTrqOwTgBfuLchjjjAgWNvD
         kB8qnjNZEOH3zngP18Y0rvLOOt4Vjz2Man8iC+L8Evmnudo+skoy+DguzVFYO422OQO1
         cgpg==
X-Forwarded-Encrypted: i=1; AKwUvBzxH9QApuIzn5hnpV/LY4asfErBFpEEcPFQPon2wZqZIj0jD3BhOkUJtrn+GucVLxRkTIIn8oDODoBN3WNb@lists.linux.dev
X-Gm-Message-State: AFq9FYILN0zzKv6ezaLPVgxbRNAMtJniGqnnbPFP65a0vh4hrtijOcKc
	bBTDMZ2hdGdVdxZ3xsKHGfTwFh+hxy32I3uDamAiIun4Wbp/fvo0Zbf6
X-Gm-Gg: AYBFou1ia3T0wx4eXZlTIvmjO6LBre0gvLVXBBLJzoI9EXDeyRs3pO4FZzOioh/s79Q
	+vxLhiWgCK3u6U1QEIfbi0nGsPDCP6jcPPrzaq7xyn2sMZC/QoZ1JTID/JGMMkl37JqpdD1KJjN
	hVbI8vIv0Bq/lyFKIb9eygk+Ktjk/p6gB+MI25smq+xVoEdrCqK6M1hKI9OAT4OruALkSr2nzUu
	I46jeL12wHbjKHppx9dxyD8kQ31R2O4GQiXbHxrbEUUFUTPeRXMsvRp4s/9+jv0gtdhw4Nh9uAk
	DEtGDJTVY9ib66wre0Z+NRrl1+Ik303NOGfa4SYJy0Oa0PEfzMkvMXsoWsP7wzssDmWoKeyuCnR
	w8lWU0ntSs3wfV4QHt+tjNg0u0BdxZcIAjNm+Mn3zHu35hPNeNfV+1Bp1yImhX//3v5Qxb4Ux3K
	nmfEXD757L5yZZcmWy7vaT6LvG+6YKffTGwo/dzZVXwNhzDo6bD/kXHykInzUChSQS8cM7v3WX3
	zOXySyYQde4yAMcROHywd0xonXWiOnbyp4l30AbTHNCcJXD60z9gn4GlcSwHmYk+B2E6KTOygmp
	GEnqHhQrrUpi++ZLlQ8kQgPLgbRhuTCHzUTg03jVeq/9H2TsQHb4RShXYFGNZZauCdwTe/toK2i
	MISCWzv9XnwtUK2rXKEtLXd2JL9EGJONj15XFiTMQkbDloiBAIWfFLgqkPHufkBgByvKuQxd8DP
	x0/73ja0FNRoLS
X-Received: by 2002:a05:600c:354f:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4a965ec95f6mr130057815e9.10.1793280215255;
        Thu, 29 Oct 2026 06:23:35 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm23216785e9.12.2026.10.29.06.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:23:34 -0700 (PDT)
Date: Thu, 29 Oct 2026 16:23:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jose Nieto <jnieto.alaber@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: add missing newline to
 sysfs_emit()
Message-ID: <auNI0owLeK0gwOxF@stanley.mountain>
References: <20261029131122.167464-1-jnieto.alaber@gmail.com>
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
In-Reply-To: <20261029131122.167464-1-jnieto.alaber@gmail.com>

On Thu, Oct 29, 2026 at 02:11:22PM +0100, Jose Nieto wrote:
> The sysfs show() callbacks must emit a trailing newline. Commit 14c91651df34
> ("staging: greybus: audio: Use sysfs_emit in show functions") converted them
> to sysfs_emit() but dropped the newline. Restore it.

This would have been a convincing argument, but it's not true.

-       return sprintf(buf, "%s", module->desc.name);
+       return sysfs_emit(buf, "%s", module->desc.name);

There was never a newline and adding one now is a change to the user
space API.  We are allowed to change the API so long as it doesn't break
anything but no one has been able to check.

We have recieved this same patch over a dozen times now.  :P  It has
become a challenge to keep rejecting it over and over...  But I am a
stuborn person and the whole point of staging is to teach good habbits.

regards,
dan carpenter

