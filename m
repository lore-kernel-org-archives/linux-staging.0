Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFBB2744F
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 07:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772090308; cv=none; b=TdBHhlrKfWX5lA4+FomW7LwlYP405VgBUpjfY3xZbJTrixpn/6Pfhhfbz9i1rPGeoa/7xBVFf1tRnX57zRBbE+4/Fho2sAimkKf/G8I9YbOkgBPSq+zT1sZyaRnU7FDoIedb+sEt4W0FmHHX8ffb4fU80NokAnAxuvTAez4K5BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772090308; c=relaxed/simple;
	bh=D4xfYwOcwW2HAAMq9zKwJGSoH3BSqfrnfra8WcMLlco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZhRtPyXWA1m+TR/ao+xKJlUu+Rj+1nfhw+1sJPAB20JEwxHcX5cHJor5gpfDJQVACMyQyrafU+LIhbJ4Frz2F7NQ7BNHx9w1WvWEQ1BQdsxOaVSGFTSS9o5jUxvoZos7wY/jcXA/BA0ccrIqvY695Qrq0N7Zol4q8meJJgkBlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z5JxeUkL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z5JxeUkL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48371119eacso5856915e9.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 23:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772090305; x=1772695105; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L/b0TM5gItwBONUmauZFsJaKMK6IJTHKjNJ+b+n0OrU=;
        b=Z5JxeUkL3Q+gnq73Qf157XKdBX3GrmHd3qnsbcJRGYI36/cq5VPCVRy3MUyXLRm9JA
         z309GN4NJGvb7EHUaB+lWFzrwuOi6DHf+ha94qPdEpPt4GWEkbkUkPP9fWT1tE2GhIBR
         QjUW9WVVHVfA1TexZaVcmJeiyFrtePQm24SK1nVfK0DsmNN9tl/yKJThdMDlRnFsmC7g
         28q2RxtzVqxQsROnaZhmFOesdQrPSztY5jFPs2I19zfXZfJ/9mvntC604pZ8tZLUfBvM
         7viU5S+/fFE9pWHrfBM6vdJMXJ9XEyjkCy5cfHs539ieuo3EInan4EJkvwcVeqlz0sS+
         1WCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772090305; x=1772695105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/b0TM5gItwBONUmauZFsJaKMK6IJTHKjNJ+b+n0OrU=;
        b=QGP72cmPWQnBJ7rP2xI2UP/hf3Yw2i06F7fO29Hzs4tQaAtbM/i54RhfRD78fhYKWC
         PFyLOAYvf3Xs2WKVs4babq2VJgSgxFcfuG963dSLi+tovvsbFKU+vBld8rX9m1L8sBDa
         ZagE8Je505Za/Cv34HKGT8QLBSkM+aFiZ3e+pG/3G/Xz7vwmxkfIdzMihBN2zofij1BJ
         uVmeRYBUmDU9BRhYpb1GQtJwuGB4ImIVKVVf5rG+W1FlMM/7ns7LUCLmSNtznjhAW6h/
         ceAP3b2A1hwD5yF4TiyVmwlcjH2vk5Jc8nbxW6bi48lcN+FFoMfmCjf/QqiLvdBPjKpC
         2kcg==
X-Forwarded-Encrypted: i=1; AJvYcCWU/j/SSA/btFBY/ljyz2fuXVfTUioVkHHg+URStGkopiTCnmv3K73JhIMvweyiwdjGtlR6S51m5T6qYgJM@lists.linux.dev
X-Gm-Message-State: AOJu0YwQYOQSwz1suXKaIVFDBAj5ua/rj2I1ChHuy66RqYDdLCp3M2V3
	BQhTIIXuJU9hOLJeLol0l9zRSQ+3LLzKKmR07jeWe1Iup+KL7eElZZHU2YzTdP57SJoD+6tnCk6
	oaX2N
X-Gm-Gg: ATEYQzwQb+An+o2x7Q16KzWSfZtZbB8gLRY+9LOwTp8L9AKtotkG07cp9zhMSD7aSFW
	yNeGLNSaULIpbsepGdjqJaYgL3/qEClgjaYEkLs1KFRVHDfbf9sW5si4LmgOMkNQGFumNCWOmWK
	87tEPiqQawvufOtGA/4/i8OrzGsh/WvjxaGCP/M3YnfwWEdWiCnu7rXmJFdDm/teSnzM74cp3Cd
	WdxPWi7LzX+KxmtERNvjl/5k62tFgAL6t/oJX2Iq+kgzJQ8bgNmZP9n9q3gndE2VmxqoW6KxPzy
	WAH9ZK6dcdPADl4nd8xQLLu9GrIZcNVfaQWj+nDeReZvAxouTbRB46HVf0UanzeZ+xlnwQ4KD1h
	C7jOAtU9LW2ZT73kpYyWUIGu1P6sX7oS5nu+aCyzziM6bClENJzYo5ks3wJk4ptP/MjCwFyZ5Z+
	mGAoaj+PNsZrNs3gREchLCrS8TG78r/oONs9bkPjY=
X-Received: by 2002:a05:600c:1d1d:b0:483:498f:7963 with SMTP id 5b1f17b1804b1-483c3deae7cmr15690325e9.26.1772090305508;
        Wed, 25 Feb 2026 23:18:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4a121sm22994995e9.8.2026.02.25.23.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:18:25 -0800 (PST)
Date: Thu, 26 Feb 2026 10:18:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ruslan Valiyev <linuxoid@gmail.com>
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: arche: use sysfs_emit() instead of
 sprintf()
Message-ID: <aZ_zvtpatfhcCd0i@stanley.mountain>
References: <20260225212955.57102-1-linuxoid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225212955.57102-1-linuxoid@gmail.com>

On Wed, Feb 25, 2026 at 09:29:55PM +0000, Ruslan Valiyev wrote:
> Replace sprintf() with sysfs_emit() in state_show() sysfs attribute
> callbacks in arche-platform.c and arche-apb-ctrl.c.
> 
> sysfs_emit() is preferred over sprintf() in sysfs show functions
> because it is aware of the PAGE_SIZE buffer limit, preventing
> potential buffer overflows. This addresses checkpatch warnings
> about the use of sprintf() in sysfs show callbacks.
> 
> Signed-off-by: Ruslan Valiyev <linuxoid@gmail.com>
> ---

I really want these sorts of patches to have some kind of analysis
whether the "potential buffer overflows" are actual buffer overflows or
not.  In this case, it's really easy to see that there are no buffer
overflows so it feels petty for something I can see just by glancing
at the patch...  I just got finished asking for the same thing from
someone else, but in that case I had to look up the buffer size.

Anyway, just add a sentence at the start which says that "This code is
obviously safe".  And remove the bits which mention "potential buffer
overflows".

    Checkpatch complains about code using sprintf().  This code here is
    obviously safe as-is, but it would be more appropriate to use
    sysfs_emit().

regards,
dan carpenter
