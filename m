Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562444;
	b=mn2umnsw+8um4ZZvr2SprJXSBkHmzaIqk3jcKsk2cOpYyhks8FuUqHZbagtd7oaZoVLr
	 qDm6VKVgdyY29BYGJzHvuuw/39L0u893xNu0MZZIGvqr6RqfAl6UYUMimSYY1fT3tAcRp
	 uRbPTe++yPqdpSiSQXuO3cozG+GGn9fMb5UumgsNjq1mveiC4PQMSHGUcCXwuOD0n6mqb
	 +D+WtsQCvK8tp7IbBH/LLJr6iY8WimMZp2HrNtJSITd9wqGwgL0+HDcZPmoqsyNCcKl4p
	 DK2TaVvNBZaAGxEeWNBXYJj4feBQDYmJj+lZRYh8kF6BGU91KebUWNVVWZ6P1fei+LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=379vudG/WJb02QEPDhkwYSsj+ty4CkjzG9JneqxsqDg=;
	b=EwHfLgGw3T5qNhZHdDro6IiBx5kCVE38HFUWrJxtszkbsoYEfrHgEfta21+WQSE4jNwj
	 jeZ9uea2fPDgSgGsSecPa0A9oRLZvYYOi9D2jydxRNoKs2Y/3Vs9gFSFO1JLdIZ62Wgtm
	 1Fop+F5urU7H5cKYHrRwUinYbGl2Dt8wiI1xeZG87CGm+hGMJoGHoybG1JXtrU8cTqBjH
	 FOH9Gyf55n7d5Wg5dTV503jpp/DIOh0tOcr/XMkY+xnbOLTQzXlBGs/JYlSkSY5PpqB1V
	 nEWWX5yX3hx0gahoUqU0P0qFyBQL3jIYUS5ulwz+9vRQs478wDvz2qXkNnJleG5Fi9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ie4IMP26;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C37606A31C
	for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 06:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34C37606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ie4IMP26
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c247f6687dcso39215666b.2
        for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 23:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562442; x=1793167242; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=379vudG/WJb02QEPDhkwYSsj+ty4CkjzG9JneqxsqDg=;
        b=Ie4IMP26v/NhKaCNc6ecjzdP3M4a110UDz2crq/atGgSXHvs2zul+KA3vIQacIwc1h
         ARSOLwaI1Hp4pxLCo32pOngU6Sn0FDENO2EmCSEtFm6qhNXobCXjWZZ5voDNaC0u+BT9
         O0yyn9RDagC/Wl+WwlBIbGmWb+PIunHzE0H9J9rFGRCTIXvYpX576y14JJNhBmkZQLeS
         0q2RrKEOLE6g6Ra4Oaw/gxlfKmGBbFaQs+JU7wHMFwlbqwVx/Miabz3auwa2mGG4HC/g
         bRkvMmVQcc+4SKqaHl9ZRfjl67BWKsSQlkNsWp9lGpvP0aRY9kADQRWHMHynHJS4yh5/
         990g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562442; x=1793167242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=379vudG/WJb02QEPDhkwYSsj+ty4CkjzG9JneqxsqDg=;
        b=21i3WtdBb/V0ZVL5OcCxWPOpTXN0JYgelOaCNDVz1yT9OsjURo5dDhW6LiRCIah9jP
         2njQ5BVzLxairLp+5JnYlMFlcbeZFgl5IQuJTKteUoQ0tM3hVKI2r3myRhEl4zW7ejRT
         JFTLxIh2ssNOk7JW6vMaveIoH4JI4wqv9tBNfdm2jVZOadtgHdj58KHEuhQTjbghdtrV
         +1RsCp9HrHpGU7wdFdjJy/C5MgE4cHfkyTBUkvNf5xt8CGokW0WPGfcKU4Jn2/Nfdp7/
         N4PyodGahcivcXnMAk0y5vAOy90Wyz5SNRd8Mn02d1+5Rq5enVsc++qD+9hBOSZAdO3M
         7O0Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/Au1otIoilLxbZBBkNSmNmfk60u6yJf5u8hfaf3a/nJD85hGvs85QkT+vW1q7XY4sbPbjSvYm+Uv7+0O6@lists.linux.dev
X-Gm-Message-State: AFq9FYJ72Xw/ePXgiGfv0kDuwX3aO6fNNe4Suko/Ejt34A17jIb0Jv6R
	IA6k6kT7BbLu8EKqnnmYfmq27nAhnaE4IgIKE2wz0/xnNJ9ZPDLS20iG
X-Gm-Gg: AYBFou0GbEUgGxKNcptYJOkgyJeMbJrpoH4RqlUt3EoBHn3t0bKM85tNnuyH/v6bfRp
	A0f1mP1DepH4re7xFvChDynDgm+lO166lp9V6dj5vsT8iUgYIx31LWEYBtJhGsqsgX1W9OoYugm
	b8QDqO2Nxs7k3jxVfVOC0Y3VcV1w4m1gizZhUYl3Smp5THSb6gCRjxbnKiShDy9MsdQGMk/KDI0
	/9jMd4anZhZKB9SFu6Nle5K79a1v4nsUF5O8DcTA1l/LcBaVCaUiKuu9xFAY+8mEV3n7+PXR8L9
	YkZ09QOdPu4hC5IwStpkEIH5iHwcV6Qhzn1ldSbrCmhsb8l0ZExs7mx6MAecpB+5qKouE8f1ad0
	y6GwwtSPiyFHdcVh4vlhabPkLiasNtlCoUdqSVucHSeZEx++3BcJfViM4RwEJ2GZ62NrMRuoiuE
	c+EQWQOkRzPRBSfZKCrEDVXg5PkES1WPaaW23FNSCVJzi5s2y2tVvICAbScwpH8JP0mlt1FnvfT
	QCzxj2CFEy8G8hcPmM8cNoCrn4RJUMWnjyINRNtQrAWpaZyJdkS
X-Received: by 2002:a17:907:6d20:b0:c3e:d2c7:c530 with SMTP id a640c23a62f3a-c467953b76dmr98763066b.12.1792562442454;
        Tue, 20 Oct 2026 23:00:42 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679005594sm41116866b.76.2026.10.20.23.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:00:41 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:00:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: LiuJunyuan <2058432396@qq.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: fix tx_fifo_depth underflow in write
Message-ID: <athVBXsjmZBvR7eI@stanley.mountain>
References: <tencent_8D0F8B2180750F84AF2D147AC203FEA9F406@qq.com>
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
In-Reply-To: <tencent_8D0F8B2180750F84AF2D147AC203FEA9F406@qq.com>

On Wed, Oct 21, 2026 at 11:29:08AM +0800, LiuJunyuan wrote:
> Check fifo->tx_fifo_depth before subtracting four words to avoid an
> unsigned underflow when the device tree provides an invalid depth.
> 
> Signed-off-by: LiuJunyuan <2058432396@qq.com>

AI loves to make this change, but actually we trust device tree
information.

regards,
dan carpenter

