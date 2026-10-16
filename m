Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C573F3B05AC
	for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 22:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792190575; cv=none; b=SdTObwQb35nC3RvqUAAsPb1Dc4rFOHnaVbQMTiS1KRcNRGDGctFNaaN2nhk5EMYfUCymGs6id/dYaWBN71F9mCnFP1Yrz79uOWzB7pC1AwYSutlGrBmZH7bVuQOfwfqTFqrBglY09hypAvMQxw1eIJnBW5sKoO9/ul+D0fLYhOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792190575; c=relaxed/simple;
	bh=yRPqnIJzWGrFd6xMxKB1kIUP2dXi0WX53WeK1s+gxfg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UfT4uurtI/sIcZmnyWLfssHfI8o3iEL1YhnHFx2jBYz5xyMGHLGgG+mNXIyc1w5VQ1r23k/BQOsCChXus2wWtLuOXBeI5JiIECYAy7lJ5Dnz13p1PoYVlwfqnzvjZYJR7AOiqWKp5JnmmUfvUH+k6sF78Zfb6y1VWQy8nqFWorM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkJUAd1b; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkJUAd1b"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67992884b02so288155d50.3
        for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 15:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792190574; x=1792795374; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yRPqnIJzWGrFd6xMxKB1kIUP2dXi0WX53WeK1s+gxfg=;
        b=ZkJUAd1bBLaEGixS4UczznwLkWJ4ncrKJkb/ZrPdLftcWL2kE0srNFEo2U9mIY8dof
         R2Z4ptDeogrQpXJPC4zMYaMbSLCPuSfZlMAlVpoUVA5V67Lam8GAVlpFD3EmyHlnvKAT
         yzSIT92GHADe3EunbUZj4wA52pfT6WVoufnREMoUjDvw5ozwhgxY3eedLFHaZe5o/HzT
         qgQr1eWmyU176Dnn8qt41M1XG87Xv/EPsscB6DcaSsagkU5USbnS6KLw/xme7epLz+UZ
         fIEhPPAvQVEtr02yShGrR9FleaTHjykMd29cmTF9aKmTrbHiKsy5giWRQUF4lZdqCxkc
         jvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792190574; x=1792795374;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRPqnIJzWGrFd6xMxKB1kIUP2dXi0WX53WeK1s+gxfg=;
        b=kRJp2fvra34L128sUEUO3BbY1xZE0xbvUEE9dxmJKagZ7WJuS26zZECIdcwv0DEMEX
         S1mVaB4fxBx/7svLp5ueXeeAcAqqDTnDZ89bHWaopyW8uHvQBQNRsW+8quD//TMqQoK8
         EQyOptq1WeoZWnH55epPG5hPV+IzmldSxlyH4BH4P8/TZJ4rX8kC/3/oRbG+nCrz0NSx
         B2fp4yDH7LR97h3Hjnuu3U6QK2zrKpGDsI/tgHChNeTEx1aLknWXMCb2PmxzuOfdhZfS
         CVXOuxOdHPV//dtGsLI6YRCGJuQ3+tCSeCrFgFiHCc9f1ew85dkp8i9mh3XVxElNbZyt
         ro5w==
X-Gm-Message-State: AFq9FYLgbuI0yaDwBLqKqG9qYZMdSv0SsB1RuJWRjnqOTjnmEwE33VfI
	TKbVOfnDce2D9bQgfDS/jdZNrnxLhYv7DJYfvIn3XCuV2S28uoj6BAse
X-Gm-Gg: AYBFou1saNevntmkw7prc7n/eFhu0qUDlH0RwQb/Gq7sh10ZReWf2xByjgO7in45N10
	FjZthKZgII/wGEPMAw8t5hNjWqTqePjCrkBOd9ddmNCgislNg2vIr7uBBk0Mxc2h4prOtPCcPH5
	C31MT00YZNQMvZDcDq+n8OyuQaJdLdE3b1tHofeA3QGUyhICRRgkf3dkEyAnmb1DNQ8tepduZll
	nt9bMtCLSorz0DXP1ZwKWS19ejg1cYkChuhXrSwO/2ab0CjsyZa97SRQ2gNuVONRgr+SFSHBVhs
	MVlmKeajkFy+3GRlIUhDIE5ualKjxzC3yaeVzrEiBV3tLvZc7UjzI6k6GSUUQZ7tpE+eGcUVIqJ
	A0cIbkhOXEAOFJSXilGp4ElnwudYcQfKjHmImz0HNr7BRNqqq8KSxibjuC9q+PR1PLrZ5YuytEp
	wZo1JpMa/W4uXg7Vnbv6aYWC6lyB+oe6j4eGPbor2y/edTgRAf0iPv9K6JmuJ26nAoVjN9pOyGj
	iMFam6dwLMHcKF4W5wwuysmcnGiogx0n/j3FzHtsOY1NPt5BHokP6z2X1uUlMrk0X6k2uXbUTd1
	43g=
X-Received: by 2002:a05:690e:d58:b0:673:572:4492 with SMTP id 956f58d0204a3-679ca75a37bmr205770d50.24.1792190573851;
        Fri, 16 Oct 2026 15:42:53 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:135::8803])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1f29ddfsm1661911d50.23.2026.10.16.15.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 15:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 17:42:21 -0500
Message-Id: <DM6MIWQ5MROM.26MIBOH4D61MD@gmail.com>
Cc: <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] rtl8723bs: Remove redundant macro in basic_types.h
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <iuseacosbtw@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016012126.65939-1-iuseacosbtw@gmail.com>
In-Reply-To: <20261016012126.65939-1-iuseacosbtw@gmail.com>

On Thu Oct 15, 2026 at 8:19 PM CDT, iuseacosbtw wrote:
> From: Alexis Buttler <iuseacosbtw@gmail.com>
>
> LE_BITS_CLEARED_TO_1BYTE_8BIT() is only used by SET_BITS_TO_LE_1BYTE_8BIT=
(),
> and its implementation simply expands to LE_P1BYTE_TO_HOST_1BYTE().
> Remove LE_BITS_CLEARED_TO_1BYTE_8BIT() and replace its original invocatio=
n with the definition.
>
> Signed-off-by: Alexis Buttler <iuseacosbtw@gmail.com>
> ---

No more patches for this driver are being accepted. This driver is being
deleted in the next merge window.

Thanks,
ET
