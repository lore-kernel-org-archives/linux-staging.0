Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E552F0685
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 17:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773077703; cv=none; b=tuE3uujPK/B8LClBW5Dd9E3ktrzQKYDHiW6ZO5EKtPlHZVpDasbGvap1Z/r2YSIj+/kywZfNNUnzbZPacxwepYwKRFqgVxkiYOgH0rOVOZxoGnDYWmiFsPwZGATMabsx5h/+K0w5eujBpb5l1Q3M+4sfZaSPgF3GXx4phCxAHR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773077703; c=relaxed/simple;
	bh=pRnc7Yxu9auCFHEhtnCL723VK0fTWpEuRSJkzVxXrlE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=b0aROFeFb0+oG05a09NoBTyooWgyjcI0T68mgRp/hi4Z+FlA++PQifNsjYq5DrmVXGcoc3jIMupgbYsp2Db+heG/V3aQ/61XkKDD17ZhEr8ufXCTVcyuemKp2LCfdTotVLKCftLiaIEWc62SY2kyhe2siTThC7pAHux5kERO/AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijEcCjUH; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijEcCjUH"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7986fb839f5so104287327b3.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 10:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773077701; x=1773682501; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpPZRgs6YSvRgQdPmJj5qL7xEi0ww8/LBsa5CjuZXdo=;
        b=ijEcCjUHSR0kGvUgUD+IscsOcDnUQqggTAzbSMT8rGYb9DMsLlW984Rgg5A+BgppIH
         hrxrUQSwe13iIpx0CTLvDPhTtKJ9UD+qtDmdKjy1zVkjNP64lcw/ezfVGeDyb7oi6B1C
         rdBTzSAFcqIInUjWmcKdXjTZ9yO8uEecyPWX1yMSoixlKL1nxbS02qsZYNnjouCXdHYj
         v4ygtiHl1jhgcYZYIFf7DvvDyaquQSZ8GJ9y1KnXkLdfR/eirj3AuUz+/tC4BM7NVn6Y
         BpGbz0wq8h2At52d+sCs3Zw5coA7LDYxi9tqA2wZfwxalf4EkpeCVyran5R5GprMbA+N
         f+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773077701; x=1773682501;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpPZRgs6YSvRgQdPmJj5qL7xEi0ww8/LBsa5CjuZXdo=;
        b=gURDSn1Cm2oCXcMOvI9M8ARoM5y8m9oE4FdZ1WKraGfw30W2LoI83bXWm6dbH+XkjR
         Hhwjna18fWfqI+XWV8zOmts3AgQr7Ei3yQgWfV064qex9HBYNXhgQruglpyunyfiAjdT
         X8rxxif5cMDbVsWaWBiEz8bATbDQmn6FSuv1bWmyuixZWqDvZ9EJTXV9zi1hndEfiVTW
         uZKi8ATvW1XYxNWoNYLZn/aOyj4pje5nS+/0EkpjH3wVEZcnhd/QrlYuXSO7gllre440
         N9dxnbcNcC02j2EXZW1iwQu5gYk3VIA2YD58j+THiAATKI3RKpVu6BwN+pL38zZSatbA
         bAIw==
X-Forwarded-Encrypted: i=1; AJvYcCUTGp5fJwiVsyK1PnGnMmi3zCnYvvM7oTzug270Ircijjl+yhcZy1ssoFRp8fFq1hWUEMmwBqh8OsgB2O5C@lists.linux.dev
X-Gm-Message-State: AOJu0YxNXgR0jUSgoJnx9PekJbgZ6v/9yX4Ksxsmnv+Izg9NoNeXY4bI
	lcXs0L+LFdb13v7JYli1iz9O17mc31giMQ1lfZytm2O9yzEfsReo7M6r
X-Gm-Gg: ATEYQzw8cREHLS8V0Zxmmki8SOrUAlduxOTTcDp3I1NL1/qoZUUzL4TlnJIOuCCp1st
	K7g49+hN3GKa7EfSHkF2VI33qS3sOI4Ll9+52Bcu1e0cxUeeVdtauOeocpYEGMfa9f2QkMTJbYr
	TWYalpHxQivM7u26EJmPb06ENtG1V1ZBI7GH8BmvYpu2bwVin6TAjketilvy5Ss2hXoQhvmFlB8
	mXGqc1oT7FLfvaS/XqRt16GiLyIYonWt//JBWAD/XFpNh54l6yKxk0sd9sae+cBWcKqLoK9I7CY
	gcMmXX7PtGGZkzToKVugFvfLxBhPb3z0foeR/9SgjiLZZ6r4yn5qQ9Ke7uBrXPQBpudUNuSZxRB
	ruKVvFbU+a8vvt4NyP7gzXCdNxazeyfWoUpQXXKg0a8PvbMEfz+5BtOD0rJ1XgUFyuj9QAkmpbj
	DTac+EIByw1BKzAjF62inNx17/RPMeM4u1gU+HdWbYAHGnc/fI+1+buapiLRl9rXh9dieQuGjKt
	3liFpTTKqTnkLRhqumuvaSaWfX4+eqIGsbWGytwvtkuUmXAnN/dlAlB9EvWjwI06VU=
X-Received: by 2002:a05:690c:9:b0:798:67be:f915 with SMTP id 00721157ae682-798dd69da7bmr119013807b3.14.1773077700987;
        Mon, 09 Mar 2026 10:35:00 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00:151a:1f16:9af7:946c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7990a53ef14sm1707557b3.13.2026.03.09.10.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 10:35:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 12:35:00 -0500
Message-Id: <DGYFL6JZH51S.1NPWIN2SJ5NOT@gmail.com>
To: "Greg KH" <gregkh@linuxfoundation.org>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
Cc: <dan.carpenter@linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: Add myself as reviewer
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260304003014.2558653-1-ethantidmore06@gmail.com>
 <2026030916-debtor-math-44c6@gregkh>
In-Reply-To: <2026030916-debtor-math-44c6@gregkh>

On Mon Mar 9, 2026 at 11:29 AM CDT, Greg KH wrote:
> On Tue, Mar 03, 2026 at 06:30:14PM -0600, Ethan Tidmore wrote:

...

>> +STAGING - REALTEK WIRELESS DRIVER (rtl8723bs)
>> +M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> I don't want to be a maintainer here :)

Ok, I wasn't sure, I thought it had to say M: if there was an entry.

>
>> +R:	Ethan Tidmore <ethantidmore06@gmail.com>
>
> Do you have this device to test changes with?

I don't have the hardware, but I plan on buying it anyways. I'd be happy
to get it now if that's a requirement for being a reviewer.

Thanks,

ET
