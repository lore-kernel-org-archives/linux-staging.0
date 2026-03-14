Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE5C125A0
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 21:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773522053; cv=none; b=YeUa8BRaV4vR34z4VCLBtNzHkc9r6OSy0yY4K9uqFT76BLBrwZjtZp9a0IqEz+hS2HaEhN+vPrkEL+z8RKjWxDDg4T/BdxcRv9Y0T0BbRrE29G8ZTbhhHi8gGRB2K+JRLOK7jhnmAyEKWenjOgpQjqOJYuT6wxNDYUZbEOy/Hmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773522053; c=relaxed/simple;
	bh=uDfNz7QTueF+Ff8cnPvOoepC/R4/bCCLN/gWS2H+f8Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YOApN/YCoRqQyHAQsOPQ8S92EK+b74Ep3kVpzAhJNiGdEhV9M9I4NuhkUtOjG5Au48hJKHSNJidJv5WgZI+47WR26AJjf/HedNEr/lvWy4OhtcNtkU8Wihx+g4Z8tVUe+U6662xj9xYvkPBmMZtq3Jr//ityGRfAKbAHjm7IHRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqkAg3Fj; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqkAg3Fj"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64c9f7576d4so2658793d50.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 14:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773522052; x=1774126852; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDfNz7QTueF+Ff8cnPvOoepC/R4/bCCLN/gWS2H+f8Y=;
        b=HqkAg3FjhwsEOC7XOW2NOX1oXTnz3Z9HU1/G/Bkug8Lo4SDyz1Lxdv0oE9V3oITQYf
         5XKHgbNz9GpOisJOLgBkaPN2S80X4Qn0jVSiHe6JJdi1qUxeP/qBubR/exFwmCzKYGJU
         CmeBvIVWcaMDl/ngXG9oBdOTZGzCB7qS6k/1eaUM2OMDLoo+6CY81ebJOUrUbVvsYjFh
         /HsT+8FFNG/+3Ia8IYrX/v7Ssaz2kpkvyIRD7ZFZ16QAUSs4uiCk7sZg+oXC7pT4+lNL
         MkpYMVC3VgRVK1itq/8o9fQSJcrt1BzYUgP85COjM0Xlyy8tmieBqlEwioe2NIMyzWCM
         BGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773522052; x=1774126852;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uDfNz7QTueF+Ff8cnPvOoepC/R4/bCCLN/gWS2H+f8Y=;
        b=dxi7pRLdjJRrb5Re6qg4K5CIK2J7V5tAmyd+QIwRWbqgYotX/6S0Hli9G9YYkjEeBN
         OjX05xYj0pVFRMHzautVejYJmWa7xy/RzgPiGFsJQZ1FWTatiwMrzA5aGKj5xwSczmiC
         hgupFnsp9aGocuLlc0a6JM1GL2LeS/BoBOPfHY8UM9g2ypiyZOm0wN5VHb38Gq2NWAu0
         vy1LVr4Z2xNS2S8wdXmZi4xoQRkvPZ7ZBU+5YPv+g4sPnrOHSd/RxpdQMsTx7fZLeAM6
         KjEJpdSpV9w6lvoRbbASUzS4+Ov1Y8XA59LaLBVIQf1jBu46dH9V9IgXM9QVy8VYlyTX
         /evQ==
X-Gm-Message-State: AOJu0YwsGqyzDbW4OwOOSnlg+KulimcseVJynfYqaZXES+Yfy8A/t1UL
	D0zCy1sXzF+UjNgufh2vl/iOJBYCX7zcmEUw6xtGRVsecBGYEnAsF6Bb
X-Gm-Gg: ATEYQzyBTQEZ1F6qErypIgANe36ZLBtbz+j+kvsBLC6LsFWg8Ix0QYHZRszopaotCtW
	cVkpMClTgj6D+CHeaHn3BdhX+UjSYF+h9IVNh8aTr53GOYfJDPZrjM5vZUaiVrvtlCzEIJd/nZB
	wAl/oBYYOk7iJ7FW41xxRz5w1K+H1ilMa4ca6nuqZnqXDJhsLlbsQ0wze+EcC+7B90xT7pzdLFh
	1jCSDbusMKfeu64q3fd9/FvVEzcJ3gbEGatbCmLHHu5U2GTBW/nT8IfnlRQkH8lL+i9FUAYgEq+
	Ru2QlvJb8SNz2/WJ9HLGFQ5HyX81/38LIWNkZ3fxgeazx+1QBJ92Vz0V86N3OtknB+nqkUR/1Cm
	JVonD5wmiSm0VN72lefwIuFC131+xFMJ4u+NXWd/W2ZjUOJ5ECRwz5BkmyUnfKFqbbraDG0J1hk
	kVSueh8TzjPIqAI7U8WZxuAiyV5rYsUx0tu9P4wjG1t8nSi4KP03zgXOAnCj3q8yf5RKUWn0aFv
	J+JFZ3F877ITQZggEpREf9n1yYP+yD7s3yYJaqTlYg0KdEOkzzfiDRHzfU5LAWbweU=
X-Received: by 2002:a05:690e:43ce:b0:64a:db39:f002 with SMTP id 956f58d0204a3-64e62d3c938mr5006562d50.0.1773522051679;
        Sat, 14 Mar 2026 14:00:51 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00:f174:ec69:bc86:8883])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65a50ceasm3194574d50.6.2026.03.14.14.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 14:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 16:00:50 -0500
Message-Id: <DH2T3IIS5B88.2JTPJP62Z7F02@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unnecessary braces for
 single statement
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Marcos Andrade" <marcosandrade95963@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260314083400.1774-1-marcosandrade95963@gmail.com>
In-Reply-To: <20260314083400.1774-1-marcosandrade95963@gmail.com>

On Sat Mar 14, 2026 at 3:34 AM CDT, Marcos Andrade wrote:
> Remove unnecessary braces for a single statement block in an if
> condition to comply with the Linux kernel coding style.
> This resolves a checkpacth.pl warning.

You misspelt checkpatch.pl.

Thanks,

ET
