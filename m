Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0003F3DB62E
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 14:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779373142; cv=none; b=lfJsg8Nce4z+DQeq57fGMTCaDDCPPLyTPVhM3D03dlOUrcrwM92tLU58MxfB+fRNzGZI4EMsM8mV33BMGM3LM83gHdXZmbka5gjVxuDBxqHCUXqHToXehkyy9poeLwwKgB6tTPzSwLmJdXyavLyohK72ig1sU3aZPTCzqsJoJXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779373142; c=relaxed/simple;
	bh=bmeraoj28RJVVEKy0iNs2TVJQGIwMWX6sf+UVtwTJ7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hoLnRCAwmyXgacZ4noTdtNpWusyue2oEKzWS8nEiPfMJ5xm+ax141ahkCAp8ZzjW5Qfkq8KSadbxIJZQgx/fu7+mmNKw1T13EOx1DMaJAVxZNj8ur3PCqO01AuAeuwQThyOF96RAzFLf/1XdVszpMcWZ8nQxVtwpf3OSKEXZUEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9UsJoAD; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9UsJoAD"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6804e24803bso13005201a12.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 07:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779373139; x=1779977939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmeraoj28RJVVEKy0iNs2TVJQGIwMWX6sf+UVtwTJ7c=;
        b=I9UsJoADdxAPaIbvjlhNVeF+UqNZsWk4EgEtvAF3GKSqDQGPqzsQKV5d44YApE8mP0
         jQO6AsmJqnmOI4y/xSoCQ0e3csOXwJy1m5flcifSbCRYNlT0D3GpqQKAp13a5Ns2+8oQ
         KkFYJvHluXmygir8jOiE8zsqUjFTCdPEdtOh/GWjEQeesSD2qkC1tgdQtbg6qwE0hmL3
         lWa0BMEmZJyvnQV3jqVJ26j8wR4sdMDesplZJSWUDAW47N/eYs14/q/v6Piv/6Qvc/eo
         FuRNFPggP/NCqGgnSyvjS0fLmc3BH1X6EsZP/VA+booTCfRMQFgTycs3B9+fbLAXknfI
         J+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779373139; x=1779977939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bmeraoj28RJVVEKy0iNs2TVJQGIwMWX6sf+UVtwTJ7c=;
        b=Vj8+XwY9cMP5G18tJH3x3sOCShjYnXIhAEI1icQhOkl3Ch+mES3k//e61ct2I22PmM
         uzaPW0OiLBpkQ379QhaH07ujCNoBiBBQA2RyXANr8j9AUP9QuByc3SEPRZqJkQ72AVxm
         iSR2T8jocMbP/cEucRPck1iTACi0v1w4OTVzRivPAcSuOFM16xim61whUcLh6rLYvBKQ
         kfusll7ZKqjS1aAAxFq1p1C3mQpDtlIqq2KZGDgpWz70gaf2zNL01QqWoVFmRx7RMnlp
         DaUW1FVC7vHSLhod3TU64/D+/uQir5OV8YqRd/nzCVVluWsTLX/PNtgdSzT1nQzqTG+u
         LG5g==
X-Gm-Message-State: AOJu0YwM1Es28QYzsTxdtfJG1w7by7L6j0Dh5eLyYhUF7LsfWlJEN2Ay
	1SKgy0Jp3ZBa1VTPxcps7rgVw/K09oUMwv2QPvQjiPb9jHq284KMl6TR
X-Gm-Gg: Acq92OEFjYHwB/LZ/Nn8wQPeoT6UfLr5rHmqhE1w9x1wFvQsR/yQyX8ePJFw7GVeGn7
	IKRpyytw9NDGmOXT96rkYLV5+pPYE0RCuCd1BSVx6DEcj9wD+el26o2+AyWbroH+1l8o0x9L6x4
	i53S0B0PobGUuqH7HHgEMoygm5yf/Qwu3U1FWLAYP6rdWPZmOuu2tOFf7r3hO3PHpCGoNuXNWtb
	HYpdzrBdoe6ZP97LIyGDNpFuZCMOC+vuomMAjuznpGBhbpN1BsN5AETN8pgFMA/+7Ni4MGzgveq
	PMalbPfNPxd+rB1LUM39NbRhVe/urvkI0k3rUsBKK+jW1Q0SPkixQktnfA9V5rBmQyqGzn+5Re6
	BA1hpsSKWpeX64u287qi4s/v22ILB9UMRWjU+9bGXiN3MVA3tOstn9syUdZfawnlIobFL12L/uD
	9jkE5tsprdrodENLsR3G5Ld7CYBrQJLaYVnqXJlo0dMW4alinnY08Vy4Pc7Rgfdlb5K0TSRRCBj
	s/ClG99YStGwOsF5ii6r9nNzw4bZsM+ExnZ9XyXsWQHIDOXQeJMXABTYBKd00EmAr/ZeY/NTFM3
	14Y0hpYtwWhvS0BjyMvBHpKR43b5
X-Received: by 2002:a05:6402:501b:b0:687:50d3:d9e0 with SMTP id 4fb4d7f45d1cf-68836bca57emr1750276a12.20.1779373139016;
        Thu, 21 May 2026 07:18:59 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6887e01f7b1sm225262a12.6.2026.05.21.07.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:18:58 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	stable@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: Re: [PATCH v6 0/7] staging: rtl8723bs: fix OOB reads and writes in IE/attribute parsing
Date: Thu, 21 May 2026 16:18:28 +0200
Message-ID: <20260521141828.784161-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026052158-mumps-margarita-afcd@gregkh>
References: <20260521130330.754181-1-hossu.alexandru@gmail.com> <2026052158-mumps-margarita-afcd@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Hi Greg,

Sorry about that :( was very tired when I sent these. Will add the full
version history for all previous versions and resend.

Thanks,
Alexandru
