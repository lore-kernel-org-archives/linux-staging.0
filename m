Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A4E15ECCC
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 21:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773610514; cv=none; b=meJcuTczph1Obn8A6/7j4eup32ichB9uH8lB+RvREkFGYQoCKKeSZctur12/01Fx1qEgCL+U4esQiiclwp+7Gwym+xda1DP7W/Y68Bd5QuUusNoeN536IcqOLGiXcKyebRs9DkZo56TjOBYbmpG+pKIqGChQLLrHGwv+/EdM5aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773610514; c=relaxed/simple;
	bh=pUotmSyw2APPxjstZiniGf/IKgOeM4KvYW+6N7YDvTY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=poVvz8bIDgOSKkn37DrfTycwEIPFWwqjrJzpcg93+1GfDsuJzOPiuh5JQPuhXHk9vGL9yXouDKRpyGO14Sybh9lhf8SNkyxP11pNU0dicQeR0zSzpP7JIiNP9ZMhFg/5d3v+RHbavJCrMXmyAUNgZlOIzKZCkN6xQzjZdqfUPpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9v9pnVe; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9v9pnVe"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64acd19e1dfso3580183d50.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 14:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773610512; x=1774215312; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUotmSyw2APPxjstZiniGf/IKgOeM4KvYW+6N7YDvTY=;
        b=c9v9pnVej13hcyEMzGSZRIRJ9zRw7RWEbI91OfNfikV9fs0ZnXvd21bJuDU99CdQ0d
         CL3zqUDSXPXmNffiZ2jPduZ78M9BluOxe9g43D8S9s2yU5VfiQvYxRh7mrrQ1HhSxlYt
         o4TrjQ0l9NjGj135FIaPlEEIctkwCt6TM+ejPYY+2us8WxfGuomsG6BDye+iZPTr5f1U
         aEIJCEYAShN6mrHOW+8VvZAUzYYpvCOYgah4aIkUl+/Ml4smD1k8SrLJ2pxpuqu4qY6N
         0k0daS2g6Kvfrsz3qIqk0LYnyUnp87lQIod8oXEAo7/2bahqZDCTDpgNtiE0QxX4FFgf
         KYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773610512; x=1774215312;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pUotmSyw2APPxjstZiniGf/IKgOeM4KvYW+6N7YDvTY=;
        b=UhyaaBw/AhKA+JZI2FiHG978aoZTwDqIWz8S2YudT8JrB4hEAKQunDRIUlL5mzYiUV
         fJ9054BqEBc+EIoTZrOkQXBL7K9/lD5JZIIbM19VqxryuCOJeZfP19MMF+GhxOIgw2aW
         DztYxpDI6l1AwZz9ebhKKLqTXPmMruiT2D0A3F/OifJfQCti0otIXvJORbR9a6l1og+u
         er4jXqQhjKQauvdwomhXxY8+142vdIeeSULYa6RE1KOx/VaC4snseR4ZC1eSsRg/dydf
         vNJkiJo5h2YUNE3hoR2UUhNCm1hFTlGi0gQq/1t7gL4HgxvmzHGAyWNTlBg6z5Db9gAi
         m60g==
X-Gm-Message-State: AOJu0YxoQDWQ3TrgmHNwuoeNxOQr9891Iabcm2dN+sMEGMS3SM8B71b+
	vAYhqdZBYOOAnBPAclAPiNP9d6TcAXSjlT5ul+E1yjOZanyUMnHHFOFIiEwL7ID0
X-Gm-Gg: ATEYQzzRC3fsQe/Jz6Vd9umS6p6TD+QwzGC5jxhVs6uQ2MwD4DYMnZeO7YFkHC106aZ
	9ufE/uLrHHUGNcjS2nrPRG7kk7ZCZXxGb7Idbm5Ca+6UHXqyjMD6WaHTnLnXlamC3Sa/TkP1Q2y
	hENxPhjIkQ8HJIk7PPPH0aYruLYZJR4fp3IZz1ddvFuiolr2vYUSogTaaggYrHF7oNiSFjxVEvR
	S09QmDB91nSy1ZMtJHSpgQlsjFHbx0JBvZzUGdEGlT4cTZIOpIv0ccCDf+gTrYY4woug23mSg67
	AAvofslyW2FZ8mBdV3YXOOxyer130fqCCOX5SBFiXvSr4A6PH4KsRcraEtUxkieV6F9ZqrBGfeW
	DQje50zmLCZB/qUBfRWPdSZzWxVyXwzPcl44l9s+aej752b0uCvvAsCeeP3810WO8WR2f/TM+SS
	zk+VYozR5TMrs5posJOc60YmxUO5ODYI2k6Q6lXus9f2sSTce31wLp+gu2hf7sVGlLRTj7OQhrh
	AHwQoH2JiraDVGRWYFlGU4uA0DQ25i6
X-Received: by 2002:a05:690e:1586:20b0:64c:a5f9:9b2d with SMTP id 956f58d0204a3-64e62f3793cmr9468105d50.21.1773610512045;
        Sun, 15 Mar 2026 14:35:12 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65a50ceasm4635103d50.6.2026.03.15.14.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 14:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 16:34:51 -0500
Message-Id: <DH3OG3HX0NF4.2MXS1NZ3H580K@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant blank line in
 rtw_btcoex.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Joshua Gu" <joshuagu789@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <abcIbKgPQWkIB6vg@ubuntuarm64>
In-Reply-To: <abcIbKgPQWkIB6vg@ubuntuarm64>

On Sun Mar 15, 2026 at 2:28 PM CDT, Joshua Gu wrote:
> Removed extra blank line, as reported by checkpatch.pl
>
> Signed-off-by: Joshua Gu <joshuagu789@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
