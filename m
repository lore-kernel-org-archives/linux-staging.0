Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7817121A459
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 03:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773632523; cv=none; b=VIIlP/u1QhGiOx4JyloKjsBmvvJY3Wb9rHueC+8bYR70G2zGdTctKD8KdztvrIU8OQNzsTrHMVBok6cSpdI4H0sfcgMYCuqMMYP0R1frGdnEduV3QElNyzVnMp2VvR3T8xWQcyhe7Q8YS5vMc3X54Po/qHayAIG573kZHyVyFvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773632523; c=relaxed/simple;
	bh=NPCf9pAP10mI3HaScl9LrDwoHO+s9iccF7eZHjZ7P8c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EyybuRcVSn4tBwgOt4xFTdeqHJM77OGDYTpTs/X5+ZoHAKmm8U9qlssylIsmSHXpwI8F22f6/4S3Cu2Uv9TdaQA8+6tslpvPUPFPnrSOOnEddNoj4ur7Lf0qk4EtHoff9qiZeAufhsJMlxyylVDUM5jioWLw5iaf9R6d/WGRYdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FturBGjO; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FturBGjO"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-798374d0f44so71271427b3.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 20:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773632521; x=1774237321; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPCf9pAP10mI3HaScl9LrDwoHO+s9iccF7eZHjZ7P8c=;
        b=FturBGjOkGoRXKk9kWQO2qUQiLDcujgCyLT15HTtGD62Y7NJ6vsIEnGPjf2Tp7TLpe
         mw+h6G+SuHn75kORDvXurjRt2H2R+g7pE75aI9quhf+/tdpe0Z0Cb/FycmG/TTnOc9qS
         6qRAP8lL7vj2ODoWV3Rn9vSfz+d/cYYAjxUUBbwh/EZ4cY5G/dL+VL8Hr+N/YBWjFK1l
         cP+pKZhmIvk3LNeiLgX/6gagersCSJpmx2Tg5u4Q1Ustvfslf6gyeQzpaYCB58tV+PQA
         Q3rXv6Tst2QDeoKvliApRT6OPtuibXh8CcNr7PNFL5GDNcQiTZRqrd+armwkARhKZFub
         jFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773632521; x=1774237321;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NPCf9pAP10mI3HaScl9LrDwoHO+s9iccF7eZHjZ7P8c=;
        b=pwj5pzXMDKheosOgBm3eFwf8a7TXAtAmZ9nP4097z445jKHMSU5Wa02JPVEz2Aq5jz
         qkRlqLrNyZ51XdgCAnT8n99fm6L58AhVhqJLPHucV/Y4Ix8fWyUipIvwk6OEB4kbfrjL
         Dv+Csk+XkiJCGASQk/8wxJUwDmjA26sJBDopWPaf7cBmCVq0K5YSonFSV0XthTQW8jzE
         B5gZPvqyHjJo+prD4yzhJZsZV8zxUo2fVqqEQE9lNckCFwvfJbYDL6y8AHBcH22PPr+G
         Zhg+LIJrluDEsUw8nU1WTsmeOKY2yjcFfieGg5V9H92Je23ErLj3IBsFkgghXtugISoJ
         DK3A==
X-Gm-Message-State: AOJu0Yxrr26UCksWs1+KSFKE7nxZH1N7mgk6h1r2ichfeTnMmEtYXDlv
	IcDqW0zAuvVp2TmPb7rw3RQCOOXYBd2pxPb8lmS9CcIy+UO+ghgnHzT8
X-Gm-Gg: ATEYQzz3Ipo8Rv2NjvbkGacMxuBxsSiohVhuLsjxelj1q1m67Oh+724IaFX52J72ARI
	ZPOc3Fb+7Rn9JPnvDFtRRu8KlDxkdEf71dxy2QZPwewaSOn7FDDXcYTe34HTtUGinIPyDvWkslM
	DHqeBcY4tBgaqWCnEWz0wrzm9OA5E1IWC+6L/hqM010voTFMhwhit876ZtpZhzo9ooY5jqN94nj
	lZZ86n5HA/77KmRjcBwVmX7h+wf3bzdSXLSv2ORUPDmOcI6+svIFiSXi8UNQ2e/kL0uEgw5aJJm
	XkRGWbrGj+jOFvoDLtpndrcSficUBsRUxm8L/ZEZfsuvEf2qi2flTIogkd4s3LoU+FYihE/QDOT
	xRAHM4w5eztK48ONXgq473F1ObYyB7rc17oHx7UkkHTgJChCyLz6PCyvAh4Mfu2l6Bs5biyWtTn
	mzzvnPcUKx0P9ht41n7UPKmUzt8Pn7ku4RsxZOOUXw/d3CudHGZj7Hugq7c0XlqBWdFquchH+f4
	jAc2qqXjH2UWOYs1QXZgPHaIdZhYCI3jSgQgEFrrrc=
X-Received: by 2002:a05:690c:5312:b0:79a:3564:ee8d with SMTP id 00721157ae682-79a3564f2bdmr34997337b3.26.1773632521453;
        Sun, 15 Mar 2026 20:42:01 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917f37b98sm82565617b3.49.2026.03.15.20.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 20:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 22:41:40 -0500
Message-Id: <DH3W8Y5OXAAH.2QLQCJE60O1L1@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove unused global efuse
 variables
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Marcos Andrade" <marcosandrade95963@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260316023037.11437-1-marcosandrade95963@gmail.com>
In-Reply-To: <20260316023037.11437-1-marcosandrade95963@gmail.com>

On Sun Mar 15, 2026 at 9:30 PM CDT, Marcos Andrade wrote:
> Remove several global efuse variables from rtw_efuse.c and their
> corresponding extern declarations in rtw_efuse.h.
>
> These variables (fakeEfuseBank, BTEfuseUsedBytes, etc.) are completely
> unused legacy code. The driver currently maintains the efuse state
> properly within the 'efuse_hal' structure, which is encapsulated
> inside 'hal_com_data'.
>
> The removal of this dead code cleans up the global namespace and
> resolves multiple checkpatch.pl warnings regarding CamelCase naming
> conventions. Verified by compilation that no functional code
> references these variables.
>
> Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
