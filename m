Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2D7390991
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 22:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772489009; cv=none; b=NTdIJSdJQqTghrTlofiVdTXrB0co2p50QOc5F1NhYA1oMnTIaxm6sepQAKif/J0UuadkbPN7BDFNflyvH1c4ZdFbDAqISBR1aN/dMF3NM109G+w7Ki9PvQFv3SgGfOzl89KysSF0lFszIZeswv37kbMwy7fr4YvGNTBcEqPs8NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772489009; c=relaxed/simple;
	bh=2Niqmn9igMmqsWLBsQS1VfiOS2ng2zV//VFZzaoi2+s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=H232a7XbuIrTuIDPIUBBA4X6ou1zgSacjsmpZTVTjcwmfaKjk87/VHvWt+MnMzTPYwpYQZ0QkQHnbRy8yITSpVoNrP2PyTvhXHlfS+tJ2vSIb0FL4WXTkDroXkOwMlebDE9S7FEzgl75MzvJ86gfVVEmH0zIDlaikmhrsGHnZrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLFKIk0B; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLFKIk0B"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79827d28feaso47753117b3.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 14:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772489008; x=1773093808; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mACZlo8IP/wjIcNaHZ90PI6UymsMMMRJ6WShDMpcYRM=;
        b=lLFKIk0BmqFFbBuzzW1ctm+ySBHaV4Km0Vc9MFuPlbhjxGn5FWm7jXisfHZC3aX5Ot
         QvnwPXRbDsp1gudtdqneiBTBuhX2T0Ms8R/md8sfEsC9biDT7/Q/orHo+StbtyjTmYdX
         E055vSJ8e8z98aAHJbsNULs5HIJbYaGrMfwByewyDp0wbJ14+ltq6PGFEl/KsoFJ/n75
         90o/BiNzz/31wwNW9/cPliqAX39ZGSC7Rlt9tFAvw1KwH86o6uW5kFZuRyOCr5lsl45I
         l0B4/iIxlxGAF+s8MsZ+yk05E5o4M0j3AheYcOhU/dYAAHG9jdv1TIuZUFb/8Td903WT
         yvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772489008; x=1773093808;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mACZlo8IP/wjIcNaHZ90PI6UymsMMMRJ6WShDMpcYRM=;
        b=YEHso2sihEgEhRiE7FZCTCP57W5DEbt3t3+FJHaBoobjH8HghU4e/n+7uJWiDyqQ/G
         L1I7KsTjLurUDYt7fmLhUeNzyhJvIYnRQB0FRPVEHDMVDGzNEBOnBHRqgs2kb07OK1RF
         nmv09NmmWUfIn9VSrjF2fh80OF6UVM1tO3EiU8BWErvAFSK7p56ugLtWnQV1j9TyqXmx
         PfJ7Pgqehc0vRLhOklGfsUFKMWHHiMQ4WjG8RLqnoaTrXGIrkZGk6nOxybO8iXJmFy8T
         UoIjk/kXQvEmRemWAepPtw6FxKLEJ2Nid9WjYm1oBsWr8t/nrmTaTjewo8yQQJxGnQdO
         rXMg==
X-Gm-Message-State: AOJu0YzS7nD5T4M6XwHo30Dn1hKvcnYsHsqfGye2QfGQyMHGF8BjHp+L
	9PZq23PgO+8sUjYyfMmiMWSdt+ib+BhGrr9awCpfA/+o2dxb/Z0GNO/F
X-Gm-Gg: ATEYQzy4sG1plzffDc4IIXSHNdc16njWUTLQXstImkSJDmILLyuFX0r5tKYTPQKwLXQ
	O7g5/tEj7RG8v++uHA4FZ29SoEKzYlulazB+/2OG7y0uW3YtxZ9ohqDTIG00xYjKojUrKke2fX0
	SqG8C4n6HSLCj6LXwNPQrkWHkkKq7rQK3fzFgSkrWtLaLoUqdcnd97bpfkg/dE1ycK0KJKOLW2B
	ww1NPMffaSb3qAystN6PBvi1P//qQnMrshO84IDlG6QmWWADeSzW4UGLdeyfwfaIWHCD2Ngt7C4
	GUjadSEPRNRA5ny5vxWFTO6TwTBWVRX+/EToJDmsTOI/Uz2Hsf1hbA+Od1wj8lg3ETn1bA2meCg
	/tMfphhdBp6Rcid4PPgWPnkLnf+6+waSeV08aePzB0SeHkCoDaBuaWR/ywo2q6zTRxNm1JL+m7T
	z3ACZjypalN9llrin4DDera5fiYX7kqkUzUqNHNvOYXmDmXfjp4MLPJsOpECM3I8mGiUFBVjnMX
	be2VCde77OvIt48O5BPsI+tIq7l0p2G
X-Received: by 2002:a05:690c:6e09:b0:796:4f04:bbc3 with SMTP id 00721157ae682-798855a5029mr125498897b3.35.1772489007708;
        Mon, 02 Mar 2026 14:03:27 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a9004dsm56524977b3.6.2026.03.02.14.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 14:03:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 16:03:08 -0600
Message-Id: <DGSMWOAQTXOL.2W8CCUWRIG7ZX@gmail.com>
Cc: <linux-staging@lists.linux.dev>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>, "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Nikolay Kulikov" <nikolayof23@gmail.com>, "Bryant Boatright"
 <bryant.boatright@proton.me>, "Siwanan Bungtong"
 <horstaufmental@gmail.com>, "Abraham Samuel Adekunle"
 <abrahamadekunle50@gmail.com>, "Artur Stupa" <arthur.stupa@gmail.com>,
 "Navaneeth K" <knavaneeth786@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: fix bitwise OR operator spacing
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302215208.67045-1-azpijr@gmail.com>
In-Reply-To: <20260302215208.67045-1-azpijr@gmail.com>

On Mon Mar 2, 2026 at 3:51 PM CST, Jose A. Perez de Azpillaga wrote:
> Fix spaces between bitwise OR operations rtw_action_frame_parse() for
> better readability.
>
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
> v2:
> 	- Remove curly braces for single-line statement
> 	- Move `!=3D` operator to the end of the first line

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
