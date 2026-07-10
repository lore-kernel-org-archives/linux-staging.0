Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970EC35F607
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 04:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783658472; cv=none; b=W7PcwzfZ06wQOPdJcGXZAX/2/y/gj4EEexuAvT0opQNaWm1nBDvTZF9TUSEWFd/8Nc0C5/h+PWcCjj39/9wRJysscejd4cYnmjg2FseFJU7ic/HBDcvC/e1Ut+Pev7tAg5RjXywzi4TJrQjcQ72iuwESdNleqawtJtjY1JSHZYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783658472; c=relaxed/simple;
	bh=DCFMHYxeBnoYQrKEoQsIMaN5DPqCs+l9VwNHik09HpA=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n0xvHBNXlk3ILMhOwRciQXuLXCAMDzn470aMrJGGprp3NeGD+owlF9lZmwFHgsn3kOZNC2XhjOx2ghFsGfv0c9g0ntQt4xBKWUHz2Olmho0iZPZkKZUJik9NbmpZtnt/dZ5/HuA7VIqY7sAGkfFvqbJXdNCWpfbzoX0kNoV1lPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQ5j63lx; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQ5j63lx"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381018b9375so727785a91.0
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 21:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783658471; x=1784263271; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=618XwBlkSXmaSNWDLp2getHPTEbLpmZi3PDA41qTTi8=;
        b=sQ5j63lxHR0PV/NcOLL2ZPQGtGy9c1e9kS7tFr3p5mZeskxz7Wm1zenEIMuyrxeVdK
         YTEsoPzD9KpMeDiOKrQzC7Aqa0nwLSrEE/eYRcXiARpxQJPzWm9hpBMqNzt3WTE9CNdb
         GOb8EZ8x1Zn65wRUKirD+1FwvTz4Ej7fWTtDCiXPIu0Am/oHcJL4OBFC22jzV+8BwN3i
         q4cDhX3s1Dmw0+BzDRylVvObTbVT9gsVGfBWeRtWPbc73aOwOlcjipTWh36PPe/F0RHH
         g9mPEw4tcZCE2zX6HWBdCFyQ7jAwuA/vp6Z2/C5x8bLPLFkVzl0JLS+lFFBgQeMmcAkC
         lJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783658471; x=1784263271;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=618XwBlkSXmaSNWDLp2getHPTEbLpmZi3PDA41qTTi8=;
        b=lTSQZrRKEDF3TS4HFeuu5Hz9y5N3dgklb6G/O+K5osq6LmuFf9fIVA/iuxV13Bma16
         ZYAga+deI7MFq998gotj+XZJCKXEYS05ZhjLqWugqfts6O8nsUw+AdpvdNR1l0wkyIHn
         d/v1BdwlCaxQRcRS85Lou9l+g6f0xKR1HREj3ZfWIJH+EhP68tW0V7jjo4tjc4m9743t
         jR0ib11L1VjAb4HIn5PCoO6hrBKPajzA+vWEPwr6mcVk5HwlZdeacPoGgETegrZmFDRe
         euQ6Hp3s0Wraxh+nti8Trxg2NX1/mq7+Vas0cn+8ukHrtH1O+7tr30MThPj/58Psqlxo
         ojbg==
X-Forwarded-Encrypted: i=1; AHgh+RoJFsOyYUKm3pTFigefOZBV8Z0RioRlq+LLF0VbYngIsR4KiGLJ0d5ob8hqkywcdYin7d2v5VsWbuiQnH9K@lists.linux.dev
X-Gm-Message-State: AOJu0YyCMpE+KtFQHV7BpA3CqWgsbFEp9t2jfVB8T5G1pRV47KAHt9dF
	zc+/8HZEbuzeL4j1QZmZO88umhd1EOzHNQHZ5lTcnduQEV+lHQMuR2EB
X-Gm-Gg: AfdE7ckcaCNnitbyU5Jo39Mz6fkdJkcb8tmc4Fnj60VYZIPNFdHlf/Oo6FAPZkkqmuq
	KiEdEy9938OL7gnGFy1bRFaLHL7eIp0XYdNch22GPUaPY1//zqIqG/ppNl5BXF2RlYHs/rntKc5
	HnrKu6mTFnXJ6/K6aNCXv9RIOl2u3Msua/YiZgRD48IE0ZzU1L+ke2tAgop7ZCKvxzobXNKoa3+
	chgBDuzo2KTWptxNL2YIUxOE9DbyP63bmWcLVuiNlzpxv5CYl/e2g4jKUO0LS4IdEGZgLUwLgyi
	D8FLmY26B1LOjzIfOf6fbDlNawZGixQHrSEyWHnva6qWxO+i2MeHhzM68/dCsq+g/ACPqFDrNaL
	gCoDWer29qSAZ3qUEWwxBu00Vw2N0wF0kpECEBOK5G9oF59at+Lv8FYjbra2JHC67CgOsw9jNbj
	/OIVQlvE4SfTlQrJxGUsrlxdg=
X-Received: by 2002:a17:90b:5703:b0:381:21ea:9147 with SMTP id 98e67ed59e1d1-38940924754mr10622856a91.13.1783658470929;
        Thu, 09 Jul 2026 21:41:10 -0700 (PDT)
Received: from reply2_full.eml ([49.216.173.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516ad85sm2119312a91.2.2026.07.09.21.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 21:41:10 -0700 (PDT)
Message-ID: <20260710124050.31335.alvinhuang0603@gmail.com>
Date: Fri, 10 Jul 2026 12:40:50 +0800
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: hid: fix SET_REPORT return value
In-Reply-To: <ak_tgJC8-d1HPKuV@stanley.mountain>
References: <20260704081613.434445-1-alvinhuang0603@gmail.com>
 <ak99bENMWC8saJL4@stanley.mountain>
 <20260710020644.6728.alvinhuang0603@gmail.com>
 <ak_tgJC8-d1HPKuV@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Jul 10, 2026 at 2:50 AM, Dan Carpenter <error27@gmail.com> wrote:
> The bug is not hard to understand, the issue is that this changes the
> function completely...  Was nothing checking the return before?

It gets checked.  The value flows unchanged through __hid_hw_raw_request()
to the callers, and they look at it two ways:

 - hidraw returns it straight to userspace (write(), HIDIOCSFEATURE),
   where it is the number of bytes transferred.

 - in-kernel SET_REPORT callers, some testing "ret < 0" (hid-multitouch,
   hid-sony), some testing "ret != size" (hid-gt683r, hid-lenovo,
   hid-razer).

So the old return 0 was wrong both ways: the first group had a failed
SET_REPORT masked as success, and the second saw every SET_REPORT as a
failure.  Returning the count or a negative errno is what GET already
does in this driver and what usbhid/i2c-hid/uhid return, so nothing
working with those relied on the 0.

Thanks,
Hao-Qun
