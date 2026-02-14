Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491452749DF
	for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 19:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771099111; cv=none; b=ZBo93xJKGI+RV2Ow0Gkcw2kvedOOn387JXJtrNQNHfpBLYicxvY511wJi8MuDwQYYeDvVPm0q4N6ae7Pv3+MCS453sXY3ITo/CI8MMlgNuDxGVpzto3GfnzPCYTXDiAC2cEo2XNufPZGAUaTYp91YxEn/6xPpuShqiWPQ/uvPZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771099111; c=relaxed/simple;
	bh=AGPPkToe0McJBNgOMYSKBehZcHKfynqy9Q5BUHbQpkc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=b8BMCxYLUbv9H9xWJc8Vu3RIfLRE5nklVOr6bEnsDZz5kvbotkwMmQ5SHtzK3M5BlRWOG5ACmPLB1ZxkhS2uS+SAsdxGZefZbO2zCmm6XvdmsREClMMZXewwpJHfY2KVMi6H3YJiunQ8XjylsCUOz1lb2f0j3qIKSRatYRdAUGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzvDNbxf; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzvDNbxf"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-790b7b3e594so20528577b3.3
        for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 11:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771099109; x=1771703909; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGPPkToe0McJBNgOMYSKBehZcHKfynqy9Q5BUHbQpkc=;
        b=WzvDNbxf/nvNdVGMikQhRgO9gQMf/3KVYzeSDn6jqbFZTBytINLTNDzv2klfANExcY
         Hu30uqtkWwiT/pKUCvVMPZkZ1R9aAGugxuMZUsardZ0p0trQS55cC0ewmbIFPBpqHCBL
         jIEvgQvULTvZ0/yY3B9vHpQ1oo2VS4vdPnv7eTEjqcs6Pxc7x5UN2A/EX7Xsce/DsVu/
         zr+Qa9HTLIoLw1p9UenC5zzQvwm/Q/PZfZ2lBjGmlmXEaBiZXwG4xWbRfKQBdjypuNLj
         WJWAJKbqloLLC8GRsLeh4lJH2spc5XkN1WjWKne/1P5h0MIGDQbkX1NQc4QHHLWAsCSW
         qxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771099109; x=1771703909;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGPPkToe0McJBNgOMYSKBehZcHKfynqy9Q5BUHbQpkc=;
        b=TpZeI2FZo9Qoh5YYyAl17gtiC0t+Qy9+r6OHSYp+HCpQVhZAusBJZXQi9P9VN2PUk3
         XltKtZnl4fiX6nHybfpaL/y2Zj66oWl9ehVevjpsbkTjv+XdnmNhcKXhsyjrC6OrriZX
         /fZP5rcjJwUqPJ+775WOZfTtwF0GoqDzBIt3wfQnonA7p5huhjBZQIf4XSc0B/sPrm73
         E9InDgq73hOjEPpEVkPK05jdK//4On/aWKX/8sCOlU4c12xsfOjKdCdFr82DF8/y13lX
         LVh9bFZFqpl+WKJPrO0HA5MTqxyw45m0nyX+e+XSYkb6fRPckApu53O74SaOgXvyNzeg
         4qig==
X-Gm-Message-State: AOJu0YyNSjDkHToKX39srrBNxMczv1guTDjkkYlmExiF4zC6mS6Om8fb
	nWmNO7Xsl9JB1+ec7hcsyTxCfUegfgMaoTrCRxCV4x7jA+qo2vUn6TbU
X-Gm-Gg: AZuq6aKKkfrGYKY18ZqZFDKyjnxiZUe2OSn6C6l2vvpSrdV1cjd9AOWEtgzR9rMLIGP
	Jk/NCU+NS77UmF71LCwU56NvkZr5pUy7oIxLx62dKm+A/M1J0/AVhvgHuKsO54Y+nUnud5NE9qe
	oorOvUSVdH+KIPqXrRJV6YbI4baSOeExkYnvsxEke25q4AzZq7Emk9wKZIUteybU6jmw4AoXd8v
	s5eVcQdqZq1G2dbWl2pUdYrXdpYBLS6v8MXAj+la53OAZnfK2r7I4ofJTWgCMCfdU0CqBxgH8mL
	+2k2xp2wcXnKyHBdKC6OwUcGbWl6/NCinnHbmcBBtsIBsFabqpqOLQfqB0XRAvP7E5QzPN8AvH9
	GkS4zhAcGYB6xd621DHhbgMPawWjTasJCI6kcE+0gZDPz8ubWWh201KNnxB6kv3fA9JaSA0Edqm
	/lHQ1sHIATZcLq2m8BeMRi6RjGOYjlnrLfTa8Rl4Fdc6wWcf+9nsYPTLmrSQ/jsPIrE10YE489B
	DyiYPTWm9vxKNwMGPmH/OD3ueO5fRMnENocyM+YGxk11P0ChIYJ9+VdkW1e/Q==
X-Received: by 2002:a05:690c:18:b0:794:de8:cbd8 with SMTP id 00721157ae682-797a0c20f73mr47024027b3.19.1771099109191;
        Sat, 14 Feb 2026 11:58:29 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c2657aasm82616397b3.47.2026.02.14.11.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Feb 2026 11:58:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 13:58:13 -0600
Message-Id: <DGEY8B5LSM5V.38P5RNTJTPGD6@gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary boolean
 comparison
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Nikolay Kulikov" <nikolayof23@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260205224210.64920-1-nikolayof23@gmail.com>
 <20260214190958.68282-1-nikolayof23@gmail.com>
In-Reply-To: <20260214190958.68282-1-nikolayof23@gmail.com>

On Sat Feb 14, 2026 at 1:09 PM CST, Nikolay Kulikov wrote:
> Remove explicit comparison to true in boolean expression to follow
> Linux kernel coding style.
>
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
