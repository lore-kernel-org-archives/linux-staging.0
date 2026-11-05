Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869958;
	b=toDUZImomQwOrfeEQy2P7+HpXdzpgDwkKetDsv7BfZJ7EyKOP0Cd85dogFhJFzFxCzXM
	 DMhfWyoC7eZjXqQk+fmCSqaFDQAzzGE3qoFyZRm4dg8Pu7n6+31UmQxZDpUcrCJE9kvLG
	 G56a8k6cMjs2PTluFs/zb3eL905GuXna42YjVDA92kKqliS7U6DIs2yZtGmOJXS5dzAot
	 aXQ3NwrPwF8y5KzSxBkJ0SZGq9Jom3aQRZ6zysFyK25AGqdRURQo34imb6ga42esOOSvL
	 oMptHtOgbXDz4Lc/HG/vljCQc3Gb/9C0vDbFIiJEFPe0FuwZNvGf65AvI1DNngURsag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pQEU+Nq/6GczAyz2qU5/jfNWYEMY7F7Ws8orF2Q5XuI=;
	b=GvdeRCcqWGeCZGbIfgtshZ4BS5SaHuHJNe4o0v/9th2JbpGduzN9Rc/bdM2akQ1AKXJC
	 QecS+hpNJvXIuo4Ut3eIPKPYn9ey2ANAYQpNfwnB/+Y4W8KzbcUQjBmFf0lfDz67y9CWa
	 yufhM3s5JjdGt3OJdP8Z6YMKzmD5Wc9jsHvF41nY+QnxrfAaGkWwyvrKNkjilLONVlpzb
	 fBw/nTXBBYJZ8aEmZ3BQpZaTSuvQ9ENIhqo933Z0m/QyGvlcblXM7kUXn0lFS9QAWMWyP
	 r4YBBzfXJbUlhgJaigkHX+3+6NOIsIZU3ABqZG5ScdxsZuhPBRHsHuqjypZzmE7Kh2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NZ/xUS0K";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9705E606A31B
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 09:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9705E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZ/xUS0K
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so9697685e9.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Nov 2026 01:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793869956; x=1794474756; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQEU+Nq/6GczAyz2qU5/jfNWYEMY7F7Ws8orF2Q5XuI=;
        b=NZ/xUS0K4s5+TaZl1PdPPM4ehSZPe6ZZata0kyMJhcVBwVGi04Ig0lkEPLC1cHHibr
         coZNpVs0c0+/Wa2RssUShcW8bUf6LuieAqayRAu3/BsrxPRpqAuklL4AfJtnkamy9mkW
         I8YUfKggD+TDyVOAD+TvoqUXbCd9D+lBRPcvxFPtq0CbtegaPih989JE47RV9pjPG/Fm
         vnXIEjKpw1TO25amKtkzh883f6eO7wlo7lDMoAOT4aFrxsdjinEV9NAx7JcY6P0iYNte
         xecrj15IY9sxVhBgdU8+eMPXyeZGtuxRmG1NNOh73N3wT+f0wBFS+0hNpel2kgTJi7Sr
         wNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869956; x=1794474756;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQEU+Nq/6GczAyz2qU5/jfNWYEMY7F7Ws8orF2Q5XuI=;
        b=WbeqgvCjIOUknmDrHrZvtfXTpvOR1Cl8V57MATpCGnb8am9JiUjPbaqYoYYJMKlzuW
         sVcye1TMHmMgNH2GadhjxV6YcVxgH846ArnlZoF8lVzHO2/Pbu76jfM5Xs6BrtsDDijI
         N4LbC5nGvIxH+PwfOTlwTDQlhgnJ3iMADJfpWfh8TP1VbD3pc3LW+8mG0FBo9phydKXb
         yLoj3Zl6JMzC01v0w0YZpxkhhYGT0nAzdQoxrwvfA4IccGcTUaCFbQbw4qWeiEVpaauN
         7MrfMXJh96Ov8aMAApPHGhVcRqGQw1CsxfX9aAT4/e67BveF8QiDX9kXzD600i/NOzpv
         d9Cg==
X-Forwarded-Encrypted: i=1; AKwUvBwN5ln4ufDz1H2gK6cMzkjRQNbHkAKRd3zy9ABNigMlN62S7Fj13c8RnJeqoEeT8xGBg3rmut5S7iut4lSj@lists.linux.dev
X-Gm-Message-State: APuU4Z8WJzIki4QmIY8uYGaql90kdN311b9rK49SbFtWUPbIC6HFRXNA
	K6E4zfOHErIV8RpsO8+wS4tvEM2Az9FkzH7B2HK92ynvEsQe6DBXVhJY
X-Gm-Gg: AYBFou0fLWrr1vMWr1w2W80WPYdMvEu6fxbB1QplE6oXN7c4pwzbSd515UywvL/Feln
	epg5QXLpElrYZYm9dB9G+XynW427Ao95CWKcHPMrJYwZjwa1QKqjLobhJB450tMwyQD9pLBdigZ
	wlfKiUaBigaCE92M6dziNxBgxInKRP9amGTdPKoqFgSJ2MBqM6S3A1WqLtU0tgIoY6qtpDUVoHe
	i33DT1xb8E0F79GehVDRFOIHZOz3LGiiXFo7TXCVwSRrxDnPHdQBfsIhVptd1pgPbpWT4X7vApV
	IumSU9Bc+hE3s0wsgUTRw4R2fkgjqmZzZ/uDFVj78l0LHszTTAMMnP/KtRJORk0UqdqTBISttbV
	R21mmUgTuGa9qQe9TwkAuMozok49p8IK+j4fJstRmLBJ12kWL7tqEun28cCHsu7DU73AHkSjMja
	MMUDPERFof24tCIkhC/5zffaOfQVGtewyy6MCvE9b4q+DcgIrJF2oDLNjfkktJ//Y28U4NtChNw
	ULfEepb+F49kGTYMXY61D3Oi76YDsKAXUISWKxjOrAskhExJLQwHjwwAEvkzE+mxkif+qo7WCC/
	X7GJl6V9UOFwhhxowLEFUTBoJDQqN5a8BY8uOvLXWqau6b+l33Jp19vl47BjPSS2
X-Received: by 2002:a05:600c:350b:b0:4a3:2f35:38aa with SMTP id 5b1f17b1804b1-4ac1932bac0mr362719635e9.29.1793869955983;
        Thu, 05 Nov 2026 01:12:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm93063255e9.2.2026.11.05.01.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:12:35 -0800 (PST)
Date: Thu, 5 Nov 2026 09:12:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Daniel West <daniel.west.dev@gmail.com>, vaibhav.sr@gmail.com,
 mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Add newlines to sysfs output
Message-ID: <20261105091234.008c0c2f@pumpkin>
In-Reply-To: <2026102808-stunning-headgear-4355@gregkh>
References: <auEmTBqbAPvMLRcg@daniel-HP-Stream-Laptop-14>
	<2026102808-stunning-headgear-4355@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Oct 2026 05:19:45 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

...
> > WARNING: return sysfs_emit(...) formats should include a terminating newline  
> 
> Please read the archives for why this warning is ok to ignore here.

I was contemplating a patch to the sysfs code add missing '\n' and
also remove trailing ", ;" that come from generating lists.
It would make a lot of code a lot simpler.

I found one place that puts binary data into the buffer (horrid).
(I have a plan for that.)

So why is this one special, there is nothing in the commit messages.

David
  

