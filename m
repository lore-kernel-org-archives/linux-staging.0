Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4252A4446E3
	for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 06:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145790; cv=none; b=Q7PLMYzrvdQOgeO2ZWbkG9FhKAFDDRaMwE1UNJLM7F7bu9i0a/5T7CBLhPfLrD3FhzSzpVfDyfxwI9emujyxGfFB5w0WFb6w2/NxN7GNk8SFNTuEQt6B/78KhKvFbt4K10hpq9LP/92TB1nCFgIeG6RNeiUzV2A3GQcatf3WxNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145790; c=relaxed/simple;
	bh=onJ3LfZHXM5TccZdOtCipqT84Y/YNc95VAbG1f9eJAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eytvry5pCAQfPtS7cx/jslmW8nZlCjYZr6kPrN/E02p+7XEIRyNhD9paUmTKhH8xAhJWyVtf/ceMqEUHyJ8z1/7THRerPX8FWb67QjPDhz9+z5wfOKPCTGqdFcAFDBXoULVY8moJ79GMjvCebvsvxeYoOdZD788ICc8a6yrdic4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmFdAQN0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmFdAQN0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so3947065e9.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 23:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790145784; x=1790750584; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5lddRRedq6bhlZyqKs7quxCdrfUc0s1t4+2l/QqC+sc=;
        b=gmFdAQN0izogZZQjn2vPUKPSVfhY/gx0hVUvxs/768LINw7M1XYVnD4JfHIe1yYiwM
         dN7ItzSlvDQjAWPDjQQEc9oUw1MpwEqVRW8kB78l5cWjCha2ef6bTieD04r7E/ApYOBE
         V17UYP1UyU4QYneBC9Fiqcx9Xj4/lv3B6LmXe2471/HXw8UKYqE5HvzM/UPx7ZI0Cw+8
         TRxfhDUq+QDg5G/f166+2iwyqyv87zrFWjRBbR166hE/aTl1ATcBdqi5oiY0gIDV0Qs/
         xo8oadCpjTlXAhkh1bYqGRZzDGIvxUj4405XJF70JUw9knu8uoxs48gXyd1//Q25zUOc
         6KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790145784; x=1790750584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lddRRedq6bhlZyqKs7quxCdrfUc0s1t4+2l/QqC+sc=;
        b=QJlkr+ogC9bExpKjW3BEsM0zA2HbqjpM78hXXPxVVx2/9aB2zi5m8QopzCzwC8R73B
         BtLmZScj8FdIDgdXla0NDX53KWjFADsyOtx1ZNsMJVWF5mDlPzfNk21Ihjf0JmhwfiLt
         CSUwAeLLslSZFFzKR2KQRyFw44vT9ffzm4aiSeWKywR5bWgekKtc/qD5XOL+Fu7yy/iF
         4J49bfTOy93g9fwUGrjqXY+UyjOvPpVHMU1q6H4oXEG8r7NNvMaIOUwuAegxS/psnLKC
         cprBxD3+iBwH57ok/pgmWTzr8w7k7fgOsIGrir7vA9jmRsE1sKGEoih0p2I4bN8C7l0M
         utIg==
X-Forwarded-Encrypted: i=1; AKwUvByt8Mg/mRodLpS98iM5pID9lVCH6qDsZ2a1I2y8AcDYMuox6jfROrRbcO8ASyXS7Hp01AMa5LPxdbxQjkX2@lists.linux.dev
X-Gm-Message-State: AFuF++nx/0oHDhW8rllrlqj29Ans9YNoAK1+bzJiVzLUsJSguCEf7rQX
	4SgncFF3wAejRrjf4p1orAaCMyK0LtzrXhTCdtSEqXPO/KjanpKs0KX0
X-Gm-Gg: AYBFou22JYG0oTczHagoJ6SLNDtC4kqXDJLm+JZh5GqYO7WBEuuM07U1cLHuVJp5CwM
	t5/XmAtKLTFOooijwKNXAzAWHTl9p2BVnHRfk1UFmlf+PODKSf+3QbwiyDkisdZqqNDgH/vPRsM
	QlXYvxSSxAyji1p7aCE5LP9qELBYNts/P2GfaLmIlolhX1a8gZ5ZSwNWk1gR/+30QVnnMQYLgu5
	jK4Z3r3gBLfc7ynt56GXQ65DbEq8j+2f5Szt+hoD5gWSUhbC/zAgsk0sZonR5pAb4fRwl/rqCwF
	tE3wCXORdxT27C2JNeKNpOghCaIStbnIluIa+Ix1BfKPCYUlLIRut96cVoL/0JRcxaxKevLbcmQ
	3BdEujMWxLjGvc/RDGPGKC/nvTxE86tMSRa6lV52HllkGmSSF7yB8gFg/wB4XrGFcuqYB0+O2GX
	lR8LkP+APKmEbe+iX1XmlLe58jupQsxiRuhiKyQLC46vNk8gtanBW/SRxHTHnifBpvyl+g3dt1H
	CCoPg==
X-Received: by 2002:a05:600c:4e93:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49fdee0a952mr18172255e9.3.1790145783894;
        Tue, 22 Sep 2026 23:43:03 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3731fsm37103685e9.2.2026.09.22.23.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:43:02 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:42:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Vladan Kalaba <vladan.kalaba@gmail.com>
Cc: gregkh@linuxfoundation.org, ovidiu.panait.oss@gmail.com,
	gustavopiazdasilva2102@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: fix integer underflow in
 tx_fifo_depth
Message-ID: <arN08yVxjhAAyZ4S@stanley.mountain>
References: <20260922215849.16739-1-vladan.kalaba@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922215849.16739-1-vladan.kalaba@gmail.com>

On Tue, Sep 22, 2026 at 11:58:48PM +0200, Vladan Kalaba wrote:
> Fix integer underflow if tx_fifo_depth < 4 in axis-fifo.c due
> to check in axis_fifo_write() subtracting 4.
> 
> Fixes: 52ff2b840bc7 ("staging: axis-fifo: fix maximum TX packet length check")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vladan Kalaba <vladan.kalaba@gmail.com>
> ---

This has been sent a number of times before.  The information comes
from device tree and we trust the device tree.

regards,
dan carpenter

