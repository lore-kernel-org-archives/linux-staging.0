Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCB8385D61
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 18:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783620436; cv=none; b=WaJ7943USfK2J8xTBfDf9fxu5QMls38QK6uxm1/SqX40HoqGd00hv+k1I7IqOA6Eivmsx8OI28KAmqbeyboi4cSOzQ+tVXhMvpmZ7rqdFfJ0qJGr4uZJy+eRRv0eGNWK57/6wsGcnkST9j6C5/P4XA0uIbBoxozVtUwNiganNKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783620436; c=relaxed/simple;
	bh=oQOseecGKDFNJSZZXs3hPi/MUWkyn6FC9h7zrLmB03A=;
	h=Message-ID:Date:MIME-Version:Content-Type:From:To:Cc:Subject:
	 In-Reply-To:References; b=O8aSh9ZodttB8VioWDpqw/csdv2N+1wlM6tMIUqPr31NI5Njd0/Ihe1EYsewxGzCabV91Qtj65EeqRoGFULQTY5Jm05btP5Jbs4pb3+pA3/RXiRLk+isEs0n9xWZq0lDCEaM4SYKUAtKUOiAHsx2k48XtfewyTL3TvicmN6gBAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjpbpOp6; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjpbpOp6"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so179156a91.2
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 11:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783620434; x=1784225234; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuKvNdMtfPuGOqhShdOewBpMLJ6Se1itd0me42XQ/vg=;
        b=GjpbpOp6EKThbnlBiu7MiwurdX5sNc0v3pPc15BBA/LXILbp39+g+i5pc9iFezj1DR
         MfqDevyJRl7GKvHg5LL99iwh6DkThoexHoBz7iwvtk1N5XOFXDfyqAIG/2IWLXC7SKUj
         CxWTXwMm7ZihAKbJfd6jTRTbUOYQcmM0sjFfEx5Y6AuNQN+sY6Bspfl/Vff93xT0GABJ
         dchRB47FhPsTIzbEyxz+HvXpyxb8iLGl8TZA1yctUjhogPHO+YVwaNIXCZPk9txeaYaI
         I1SZ1IGrrJC7KwT1uwIISHy3AFgBnVZy16otctkhg8Qs3mTkdY/CQi20gKyPaRREzmjA
         PYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783620434; x=1784225234;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuKvNdMtfPuGOqhShdOewBpMLJ6Se1itd0me42XQ/vg=;
        b=PFOFFNtCtFPzxur9vgGhgGnnqO/BAbb5ST5DFyu1cs1nyjSfva5w6i04XrwLuW8w+v
         sof3K/9780OtTGe726IacOdKC583Qq9V2JzEHUDC5hL1ZtKam/AwwfFHgOSAarS+qlpV
         XqKYNBVoDB4CtitI1/Fa7jfp4QG4VIZbSMbYudkLZB4hsI30bGGU3qfKnLQVNhL6ua0Y
         g13/sAxVaQmu+xX54fc1vjPn3rnHp7yZIv+zTKhujBIz+q0/NnYQKcqn5oFI86GPhRB6
         riVGtIQHmqIg1P05TUGuMo1n2ALJfCMm0A90gO5ifp8yCES4x1H75nbFuXqE2s1hUZNV
         y7nw==
X-Forwarded-Encrypted: i=1; AHgh+RqyeAQA4fggQAm47yGFPyyLF0Vf0g6LBVfsoKu8PQLJBQAYWsTlt9eAYhXBgMnq7yYEJi5RUbTzhyPWhSyx@lists.linux.dev
X-Gm-Message-State: AOJu0YwxvFIPKumrrYfUXDhosV/rpmbRoEt3gmVjqPEZEHxdGjQiRbS3
	6OGL9wddLQeXxO3d7cbw61z3QozA6cm2sfAuoZJiQP2wtCHFI3TT1Aai
X-Gm-Gg: AfdE7cnBgwO3U3iJhhcGmeiOl11w2S2YL3XB2iweXe24e9poFafhKHOI/JPKHWEh4o+
	vfYxz/OuN/FFqt6LM/yH6V9ZCHIzjQy7uMVqMqRlSsC9aCuJBRyBl1lQ7BrpmzI1k9wqDCT1dXZ
	YPYvYq7fGzQATx94YwvcSGrK3aXHJb1IohFMnNTM8TxdPi43EPcRUm2ZUWyd745XYJSeA4haBeM
	7S9lZ+T4idvIcLVMzXDVl0sLb0Ke+HgXpfnCPlVqK8tHMWlF+WvnnPRP0lCjPF3uPObbSv0quKM
	2SK4L2Gh+VeqFaDmRSoXMVDr+BE/L6hK3yhtWaYAdjtiwhXelMgacSHrF1lGlLawpat3HM5/ZnQ
	AY65yIrQjVNNossoaC3domzGIM7KK9i7w5BjGwyYAERFGx+wUnT9McQbECwcGjHTbvUsDObaO/1
	qyxxVEYPHQyPcehD+4+fdLRQ==
X-Received: by 2002:a17:90b:3d87:b0:382:3dcc:1487 with SMTP id 98e67ed59e1d1-389417e521emr8243228a91.25.1783620434200;
        Thu, 09 Jul 2026 11:07:14 -0700 (PDT)
Received: from reply_full.eml ([49.216.173.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a57dc46f4sm1618505a91.11.2026.07.09.11.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:07:13 -0700 (PDT)
Message-ID: <20260710020644.6728.alvinhuang0603@gmail.com>
Date: Fri, 10 Jul 2026 02:06:44 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: hid: fix SET_REPORT return value
In-Reply-To: <ak99bENMWC8saJL4@stanley.mountain>
References: <20260704081613.434445-1-alvinhuang0603@gmail.com>
 <ak99bENMWC8saJL4@stanley.mountain>

On Jul 9, 2026 at 6:52 PM, Dan Carpenter <error27@gmail.com> wrote:
> These kinds of changes require testing.  How have you tested this
> change?

I compile-tested it (W=1, building gb-hid, greybus and hid together) and
traced the return path by hand.  I don't have Greybus HID hardware and
couldn't find a working emulator (gbsim has been dead since Ara), so I
haven't run it on a live device.

The bug is that gb_hid_set_report() returns -errno on failure and len on
success, and __gb_hid_output_raw_report() computes that into ret (even
adding one back for the report ID byte) and then returns 0, discarding
it.  So a successful hidraw write reports 0 bytes written and a failed
SET_REPORT looks like success.  The GET path next to it already returns
the count, as do usbhid, i2c-hid and uhid, so callers already handle a
positive return and greybus HID was the only one returning 0.

Thanks,
Hao-Qun
