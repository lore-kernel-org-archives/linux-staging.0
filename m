Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793924536;
	b=eWZE5bLqfredTHe9ks3sX1qKq0og887SzxbDCnyKVR//LscRldpTO/5bxeuL+gnPLWGI
	 QNOeeuR5FebtStfffc9JtKrEHCdr4EFB1Mz/ic6agQzJIlqjKCeVLNvNarxZAEVpv+9Nf
	 dz/4cT7VusWJHJEFXWtxh5UJeRdiuVp+WjC4L5X+dtIoXnuuc7t+akG0Cg2mlU+iRC6rR
	 2EI1rXLxV0R2dgfgwdJFmkDV5zZBjwfVduTRA44b8VxsBhI55B5Okkztp5iLGtjiTSRCi
	 9n/+b78P2DUH6Jig9hvcPgt9Hr2n5DbKwRaI5BPwqXOrE3m1t+g4CBd1WEgI4A+nknA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=sUCl/9f3hEKU1jzVhTQT9nv09NWVWMgehGoFAgkpdGM=;
	b=Ormlounu7WJhPosjsqsmVK6CY/1xHsMsqEiclwW/me9Kmh/UcmyS9wxVPTmK46Vjzw5m
	 e0zTExIGcPS+H2kYrMSrVXmeqCXrrNdEn3B29Nd2tWDM7nzO7VgmJafWY4FGb9XVw01PT
	 hddLpb4MPCPzSgPaq+85ZhwKzebTiBdCJhUHUIxr0zYTl42W+m2XC2FVE5S6N8Ya5iLkE
	 I1Ibby5KU0kZ4b+3DCq931HIpvyKkd77AKRMJDzUDYZP2kTHl3QFrZfLNxKtT/Mrlbi93
	 vCSpV4NKj9LFZHVJVG8I3KObxKHK26bThhUih+18aL4yWDRUHc9v7cT06XAaf/jmn0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=byOhpzE8;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F31606A326
	for <linux-staging@lists.linux.dev>; Fri,  6 Nov 2026 00:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39F31606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=byOhpzE8
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b335eeb340so211087b3.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Nov 2026 16:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793924535; x=1794529335; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sUCl/9f3hEKU1jzVhTQT9nv09NWVWMgehGoFAgkpdGM=;
        b=byOhpzE8/sJWhGl+BJ6ZvZJ6aGnZda18q5+idyymfy9zupKE/GhVc9HYak9ft5laGM
         //eB+iF/ydq2Rg3QwI8SiQJQkc4jmMg7JpFSNcVMjwPgGbHUfRSTj6Tu4q29uUR40Nrw
         0GCq1FbKEmQAZFVkmVjFFFkD0x6+Je3xkNdHjV8p4uJE3o7YwgjviMvZwmA2ksuedRWl
         bHsjH70JmRbKttAuLulzWxTm6PXPU3mxVCjrBFwjO+u/b3pLlg84t36rCwpiIM6JLdib
         1kqGXP1r74v5tAGReFPOIVbXBtk4W5KC0vfV7EToBz38GFrBm5NizDDmcbI5Jlp0SnSu
         I7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924535; x=1794529335;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUCl/9f3hEKU1jzVhTQT9nv09NWVWMgehGoFAgkpdGM=;
        b=nu5e5V3UnGK8C3A22riRBhRzW0DIgiyictD373JlA3HWMgGfWWV7M1H6x/7Md5BBA/
         PJLHwVVb5YySBVJEhoTNCvuYhhZLlFGgbrberOWr4Kc1VpNZYiPoG5yGUq+EKLmdpX6y
         DOJFH1rxSxwMbl9lLXp2yPTkrw0OEntpqj+VYmWn9EvH1TdgG4n4rX4GWmiY/y1565Rt
         bWacptp2o+IHdEA8S6dJkcm7nJulDfPpM8g+oT7GmB+m77e74ewcH0+6HuHRqa0kNJ2u
         gyWdkvi4t/YZ55UjfWMWTB3cWjsVkqzP+2t0hi1fEsmXANBnx8oi1//VluKnklMx4u0o
         M/uw==
X-Forwarded-Encrypted: i=1; AL+hErEt3Mhx8SPFBC8Lc56lvjiOUihGrsVBItCZq31VTDMCt5itVcax6VOKb9KvHQhnATWcuEgDCvs3P+suEG+u@lists.linux.dev
X-Gm-Message-State: APuU4Z+B5Ektd90nETUxxLYhmVegVa5nCcbGu9QplUE+/dhNbOcDFGqQ
	qggntHs5yW8zAoBUfd+u0KbJRncsltq+ZGAJn+MuYh2lr76KnWezMbyF
X-Gm-Gg: AYBFou1JHpff+bPNl95PSK/6x7mvAlGdhY3JxFz1+ZXcS9vAh4sdl1Ot417zOdglziB
	S1F0lPgdzeG1jVPR9Q92dW8ZsJ7RXHyOFikDpUHe9XBmefjYkInjn60WpbvTsQYfDmLv4NUAbrj
	koS3azaIEM+k55rymi8epHzBPY9/1TXyg3WDrBVxAjLKbh27XvZ7iGzEdyqGgeBS/ll9k/Ed4DG
	ZRRH2/8L3aeXelGuXtodeRxoyFZolhZr4lGwD77AOjybUIsGZGwc+qDuMBCdDD1VifulrZhav/p
	AGkLrpN8VRLNumwgk70kHj9/fE1dJhSq00W/+/w0+UonUyiVSRJj4JqP7YOt6tvYk75LVgqAAJl
	sngLqJQy9W7bk26GMn1/U9DFC42OiRgJFGeqjTLsKGgROxRAXOzEzNlugItwkh4u/lYHLAtDCWN
	CjKFOKHl7q5wOZdoo4pakTNp2dmY23/0jZcOBKKWkV0ICMu7HhAKLDHtqgaUIPuvbLJTwRPx+dF
	lVpJ1+pTJnMDTQopu2cEk1vhMehQN0Kbs64Xw410FgQ0Ps5jMWYr+Ssjw89k68k1ZpIV6B3J1WB
	OQS6JsrIZcuISCJ0
X-Received: by 2002:a05:690c:1c:b0:8ab:415c:d733 with SMTP id 00721157ae682-8b34178baa9mr3874997b3.7.1793924535092;
        Thu, 05 Nov 2026 16:22:15 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:135::7da0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f8394b9sm7441337b3.31.2026.11.05.16.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 16:22:14 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 18:21:32 -0600
Message-Id: <DMNP5QPGP3Y1.2V7SL7MODHHC5@gmail.com>
Cc: "Teddy Wang" <teddy.wang@siliconmotion.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "open list:STAGING - SILICON MOTION SM750
 FRAME BUFFER DRIVER" <linux-fbdev@vger.kernel.org>, "open list:STAGING
 SUBSYSTEM" <linux-staging@lists.linux.dev>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode constant array
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Francesco Giandinoto" <testata.nucleare13@gmail.com>, "Sudip Mukherjee"
 <sudipm.mukherjee@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261105211344.17532-1-testata.nucleare13@gmail.com>
In-Reply-To: <20261105211344.17532-1-testata.nucleare13@gmail.com>

On Thu Nov 5, 2026 at 3:13 PM CST, Francesco Giandinoto wrote:
> The g_fbmode variable is used as an array of constant string pointers. Ad=
d the missing const qualifier to clean up the source code and adhere to ker=
nel coding standards

This doesn't compile. Also, please keep log messages at 75 characters
per line.

Thanks,

ET
