Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461639;
	b=KyR+/QirZ3SZ1IZQrwIEqqDYGwhLhf4rLcd689RDuNwCRTZoLRU6OHmcQFjR/6mJ3Tiz
	 BGTqpmknFwlg++YDc56qj0ppt1vqYxgaYJcTaPJnp8UVKjv4s8i0oxIyodyU48YFPYbu0
	 iLC+vsEZSJNwj8WGdZP4dn1bnvVxKZyKJRRmUSDIKKd46U8B7sgHeft/AqrIsehEEF18q
	 x5CNCV4NTHqdwwCw64PTCLwF9rx+a4cP+3jmvHVefII3TzZ6q5pDeCMBHlspxikyYgfUv
	 a98yHHzSK4M7gLbaaw8wOUXjn0f0dNwDvb05iV49pWAhwPKIrhqZIO4moMDndhb8aXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZXQJnKNrm9CNYqDP2KdE9WO17MoeKpLXejbqdj2HY2M=;
	b=ANByug6ENbFUrSs+id5qdwHgWH63NW61mgBm2CS4AA8FIXoulPNWVB6EQvzJi/SSOdlF
	 o6122uYID8YjiqzseOJVC7EKspKrB9+51T3nzP8hSE4hgmwYRWjE3I1vBlBl938KOp2js
	 vUjX/AkbCBegV9tMVCXJYU9eAsxhqVJYpZS8FveEjbRGieV2n6t+R0uWdsD42t8iUbfIW
	 i3PtnF71OW/K3DezRQM2ewdhNk30AsSL7ORfl5aKbVI2/KZ/Meq5nc+QzFviUPgUdO3s7
	 pbmefYa4ZYVhu0kapqtR8zZjwH3V6lxW8+GtZ/HDUYSX/+WmCCqU5aZu2uQJN5poSgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFeR4BmU;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F3B606A31A
	for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 19:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8F3B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFeR4BmU
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so39228065e9.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 11:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795461637; x=1796066437; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXQJnKNrm9CNYqDP2KdE9WO17MoeKpLXejbqdj2HY2M=;
        b=QFeR4BmUXcqBhOrszaxpnJhm2Mfoy4q1w2EBQzwjXL2DXqM+c4sLxggagfyJDV67jj
         qVv8NiMNbmXzeKm6E2MJH/E4THtIitNGC7k6d0mal24I5J365HvV6lRNt79ksQAgmh+w
         wJbFmO5VWs7r2HJOAeWuRYbVjK5HOwAJi+xgcAJGbIarQl9cE9J1sES+epYC7MBzyH3D
         9I7Cc+bVA/QAkJLLANdd696Myy4R7Fw0gfgbMv7ALiJ+NoALOwyos/cfAR+kH4wiOzS5
         v6joxy2moaWjHGf0p6u9WEw3Y1M5gmBpjLdfT+t9L+vq/TOsEO1dWEA3LtDUdTFy5Ol6
         KCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461637; x=1796066437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXQJnKNrm9CNYqDP2KdE9WO17MoeKpLXejbqdj2HY2M=;
        b=euce8QSJMobNYFrcF9ShgZOEfz4HYroReqpKNC6mdq/gQvHlDuYjpOAnn+FXYBmDXS
         wXa7iATavhhqpy3UU1GzqG7tdZTXCZj7bAhnaj9exBXmhNjpq6uWe1+abjeFHVc7eOl5
         4tGaQgX7/ihfWKoxGO60LQfOFs70pOsLFmuMFnFt2hSOaUKpeIIrUG4sttO3DzOgXcFe
         tpmq0mfvol9pSVoJt/QSA62+U2VdATnPfpjqIyAKddrt7U2/0eW3Vqz+W4urhotW+mtD
         0iVSgj+fYtJ713OMZYkYTYeYbUjmZgISgWhWOy4hQxEhN93nCdvMT2HVU0i2ZlA0u9f+
         qZSQ==
X-Forwarded-Encrypted: i=1; AL+hErE6vEksU5Sm/XF0q9vXfHs8d+Fv/iLKAy/8fIetL3Caf79Y7ER6IBAtpHM4fRGiTUjjqrq3EBGSNZ8QCRLk@lists.linux.dev
X-Gm-Message-State: APuU4Z8S6xTVNV7pMKWlhU7YKFbw9M7Qkj91vyHjYlFwtgiMtOne5JEr
	qEdQUT6gTDaiunityeRphPA7gIvzT65tSiWkfJ+Q3dnSZpiEW0HoWrWy
X-Gm-Gg: AZFdTZcf47zcSHop0e5b5SW/baCPI/9r4NiPaf9ieVpicpncWmyYLne/9oR0O2z5/9Q
	LNBeG0byAsGNLytQMmvpimG/83t9BIqm/E0HBcBUBAtOSp5J/oHyQ/D2vfXQlrFY+TPDN13ToYK
	WwUqgEISQr6HMrWHlBPCYGKLGZLtRHMFZ384cJT3DS+TzRoTyyVSlEKWJuBXKsM8BrgfKMmV/o/
	9ddKvQaHV4sZA4er1A8W320lAxb7lTFjZ1xyMwYvh3opR2cv1drJQKHZQ+feKsF7J16w7I1pSHl
	o20gA1jP1N1LvZMd9IfgJNL3BdNonXAGDqTyD2b+fX9s9sDc4XGr69MGXTrJ72S/ScHd8fTJao3
	3PggiGSYYxfZAfvxXWfc6YOSj+Nt++y/Qejw2RnP6+XyvZYSJAr9uIMZM2gqEdkWIYkRNeclVjm
	4UVfj+FYzG337o+bDu0yXQg6dnZfUpj3ieIXEq1CbLgfUpmyt4WNTdEBUR9QnYRSo721FPw0/YD
	2KIDwpqXjtco0AuwNy+PjiKiXkUkLWukmhBiv0HbDk/Zwj09dnscwozSbWVR9RvRIcjXFim4v7p
	M9CriSplwIiLg7ZcH/WIaxJ4Oc5eOPhEm0eDfCjR+krKv253MWbZVpQHaSB3t+gISCHmxXohi2L
	ECE1ooRiC8KnZciA53wcA3Jlkm9SJ9D2b754KRrMPMZMjM264RbuAuHo9cZCMQnowSAM=
X-Received: by 2002:a05:600d:82d3:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4bb8880f0ebmr286089705e9.9.1795461636822;
        Mon, 23 Nov 2026 11:20:36 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm403082675e9.8.2026.11.23.11.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:20:36 -0800 (PST)
Date: Mon, 23 Nov 2026 22:20:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: Add trailing newline to sysfs
 show output
Message-ID: <awSSAAX_x0zj_cCp@stanley.mountain>
References: <20261123191849.232589-1-hmjm081106@gmail.com>
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
In-Reply-To: <20261123191849.232589-1-hmjm081106@gmail.com>

On Mon, Nov 23, 2026 at 01:18:49PM -0600, Hezekiah Mogere Joseph Mayaka wrote:
> The show() functions for the name, vid, pid, intf_id, ip_devices and
> op_devices attributes do not end their output with a newline, so
> reading them with cat leaves the shell prompt on the same line.
> checkpatch.pl warns about this:
> 
>   WARNING: return sysfs_emit(...) formats should include a terminating newline
> 
> Add the missing newline, matching the other greybus sysfs attributes.
> 
> Signed-off-by: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
> ---

You can't change UAPI unless you can test the actual user space.  Sorry!

regards,
dan carpenter

