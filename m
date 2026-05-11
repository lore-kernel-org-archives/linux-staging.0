Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF2681ACA
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 04:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778475221; cv=none; b=s5LFregtFKojeEqR4nVW4zZYZBpFb5TIB+R52KueuKG9+5AKj3MpM+Hwi44m3iB+WyfsUJ0uEHDRL1+L2b2loltyKw858/IvH7ZIp8l2RgMJITkiwCC7EOHDNWsbK8IL1iwv2obgXnIyjCPgn2NHuDOyz3c3zcXxlHvGR7+QpCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778475221; c=relaxed/simple;
	bh=l4+9cYVLtDseRMCEuNm2Z0E31oRf9VLl0YyDvyKZQdQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FMNXawlkPRZ0SXZ0euBAlh4uvj3Z4h0BPzEYDOVw90M/tFRvZ8NgjTJjbZDQsBfVcQ41Hbau8TtSsd4h8My/TN/Xp6qHRKSP4SHYVBKjUgC8+qugkybauOeTlpn2CdZIBXg3JiiLXY65AzX2TQRr/Oy24MXB6Q7MqziD1QZIesI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQi2ycsA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQi2ycsA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso34916005e9.2
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 21:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778475219; x=1779080019; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l4+9cYVLtDseRMCEuNm2Z0E31oRf9VLl0YyDvyKZQdQ=;
        b=rQi2ycsANDrs/R0VBEOOGIBD/qClmk72qng80UanmzgSpmmA7VIbHqsCEbdpmKD+GL
         6Rt6cw77Mh74aYHQ7EVlZFWl+nojFcZYnMBFdsiRgWPNT6Zvv1n9nVXOjhbaQtKin5Un
         8yDOhf7RZG0xAlbyiTzIJPTKqSuX1eASJPjLUB/sZGZ4GBnvUbzBZx1XPKuIpeShSWE+
         tXqBPqiD+yGI/o0MzX4cuAwm0jr0pp0yBXbWJ5QJm4UfthxiQP21g6KbH4b3I1qsOBQg
         L0rPDUcw8ggvgc0xLyw6ltFQBXeHgBo7fSJ9VSHRh5VbMX6Yw5JMc03McUFZXbSsP7fc
         Bc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778475219; x=1779080019;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l4+9cYVLtDseRMCEuNm2Z0E31oRf9VLl0YyDvyKZQdQ=;
        b=W5WSyljBRY0Ht7ZhXNsqWOAkXRDLQKgsLQ2Bu/Wwm4B8NAM09wcjbTmYgT7vhIbNLQ
         f+q4q9JfXlXLFO+Rep7wzhamHGgHkUh3Jran/8rXrN06v6e1aS1vWFCd3wNRhyaQxEHC
         IBu6RZTSG0iYppFhQvNGUwhBaG1UWbE1Uen1IDe7VRzVnfLZ1vVs2FXaNBorLs0ExKjJ
         JqvWDWzzPjxDlTRl32szV8uCU3/rFTyDTBw8TfBUKTXJ0JgIZwT1hS7R1ZcjPrRGHn7P
         SP41VNpewrSRSb8qguKQKg0qFKF2+kkjwhMbe4SePiCqZIHWrkyurKsP/gLOmeSDgFVx
         Cm2w==
X-Forwarded-Encrypted: i=1; AFNElJ/sez0kJPq2AjyLIqTEb7tSX3o2L+3S7HaL0/xVvwoeXyOFvk+Pp9IRcwBiyzrTdCjY2ap3kSOrh85XmPx5@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0RLpboYeEu1UN98EjWK4kX+DYboGVPUCCxPeSKjBlkX5YIeTx
	WvySd+Zh6W12/oiErAYmiOlj6EnejtliF6RJVVsZdSDE8sXGqcZOvnNA
X-Gm-Gg: Acq92OFolKibuqSj4tRQWcfkgrMwYBLAL01LdmoAQV8gp1lEwmd8ydrdyRnkhQ+18KF
	UwEjDIB0YjJkUcZ6p3xvWNQwjlObJ9vIM0grdsM1cHsUj5AJXdw2iQ8ADLgY/rLvh9GuRP1u4MV
	3QIrQzZlYHHSJ7hfIrc/AdpqdcGZ/EP/MUmPAPbCtwsFJ5CjaHZW3+Z8W2PNvBHd8gmTMIqYOYA
	v87hHpD/97yZF+WBLtcE8xzuDTNO+jqpnRFlDt21axPWoYTNPgAArptJyc2JAN9yzpZLpi7EJ7s
	yca0XI+JRNEPPKzu6rAZTOzIGH5hx9YEbV84i5rqyU/2yMjqqy/A10in7Z3jL4PqdMT+lhLfRZc
	sMIh9U8g18c4hnPGiQUdYq4zm3h4pAWwoRPU3lLysvv6J+xYviCb5yKu2XOM4BD9py8acGmDHYN
	CUXZEn70YqhkfStB4CDJGz8E3NDPVq1vzTukoXbEydiV/vJ7aXPzHIFqQzJF2fE9dbZSlgyxCsU
	KS6/R5+pJyotk5QZwiCkr6o4j2FDj9/zJPNwHDmvwlz8m4+h5G6Sg9mla+5mRMNQUJrnq80ROjd
	Z0QpshQc
X-Received: by 2002:a05:600c:3107:b0:48a:93d2:60d2 with SMTP id 5b1f17b1804b1-48e7045624bmr127752795e9.0.1778475218742;
        Sun, 10 May 2026 21:53:38 -0700 (PDT)
Received: from dynamic-pd01.res.v6.highway.a1.net ([2001:871:25e:8576:c50a:9875:702a:ab71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d8e3247sm54518465e9.8.2026.05.10.21.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 21:53:38 -0700 (PDT)
Message-ID: <07de97580c24bd2ff1599f200dc157473bce9548.camel@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace non-standard BITn macros
 with BIT(n)
From: Michael =?ISO-8859-1?Q?Steinm=F6tzger?= <m.steinmoetzger@gmail.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 11 May 2026 06:53:37 +0200
In-Reply-To: <agDViiv4yWW13z1Q@archlinux>
References: <20260509032202.146240-1-m.steinmoetzger@gmail.com>
	 <agDViiv4yWW13z1Q@archlinux>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44app2) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2026-05-10 at 21:59 +0300, Nikolay Kulikov wrote:


> Can you solve this problem in a separate patch by adding an explicit
> type cast in the right place?
>=20

Thanks for your time! Fixed in v2
>=20
