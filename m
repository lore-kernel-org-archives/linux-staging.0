Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661622D8765
	for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778408; cv=none; b=H02kbbItAEhOPpgdITBc1Yi0SfSQuFuOWy5E+mB9Ipaw+6kO62ARqEuCbMcnHU5u8Pqku2w3WUTRtDcb8hDObpqdZF4ugUTcOt5urN9VrwEiLRdMavIX1SYIu4PPA1Ey6p8gJsja/hOOb4bftcQqhzvhcBDvI6xm+1p5p6nwYwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778408; c=relaxed/simple;
	bh=9WOZ2U16bU4qdb2Fyo3eqQ8m2kp6QdcIvW61S3g6rps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ElqGipHq/qSoJAs+5vjQ+sARPef0RpK8RCeIhe3Z+1LiyRbIcqD5w6Mn1Ypt2099SbKVbbEpjXinByw88dLL4ZsOW8ZED/i8rnFhxubkJFHPury05c5lhPdGX29gIKQuTTYpPGMbCEbwaDSjb+B2pLRESCk2BTDc67diA1LZqAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bppDZYUH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bppDZYUH"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234b9dfb842so49903285ad.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750778407; x=1751383207; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Gn79PJLQC7ePGyYkvVQEXF99s8ix0dYxp4JZA4p7J4=;
        b=bppDZYUHimWKblPdB6hBfMlocRuxrEZoUNTWIzJVNsN4H8os9dPhKgJ4Syh5Bybn10
         7BE3xAholtTysJDipx81SZty+f1QLkWQ7CfCXSS7w1yzXINatAd+9CiB4pAGEVMwhFa4
         RHVZmre/Xt+PGRzyGzn8tvk9itPajtfPSURZVmpKVyCTQn0vC2A4zvOguSy84RVlSSIB
         j80zOYC0HbHBBmjnM4SfWYXU4BvfLkwPbE8AebZEf9nnphVfAGyINKXFdHGMXQRVs6MA
         vMdiliKh4C+EB5f/0mzhpcAF6CgR+mDGaPl87LOKgONcCYsr4UYN/RycGVUTGOPeE0Cr
         zzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778407; x=1751383207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Gn79PJLQC7ePGyYkvVQEXF99s8ix0dYxp4JZA4p7J4=;
        b=bq40EPWRqNdgT3BPNnrQUDb7ty4G/Eqdx4y+XUWygzGyBS3I/FA6Q3l3BMvBNwXbxg
         ioVpNO43nXxLQZ63BZCFmDX/AXXfCz8En8mif4NNvt+hTDDlBSk7it3XuWRVQT93l0h8
         UQthpxGgpj6eU7+sC3VYaqP9XTlTYyiLHSe/GA9JH9GhDCtNe0ebKVfmLnaKE0kRTk2m
         166ig2NK9vtVuBk0kFoYD9djxephIgEenhrM/LdiE8MWCGS/RvbI6aSlnydhj0WRqCKh
         6fzqIyrAYOXw6hmIjDbeHngcna/p59W2yBXXwx/JONtIXsHiKnl1vM9pqrRC2MYE/17t
         yfZg==
X-Forwarded-Encrypted: i=1; AJvYcCXMBXdfUwHkTkWzV7GnkrAkuftESQCRy9F7lsTyiCAowVMfN5N2vqQNRZfARQiP67657ooY3KPfwXJriwru@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy38fVLAZdAjFk2ZRzDo1fHxmJLaOonTwYLP5c9QTOr5YIACjn
	i2BmES8TI9APVir0zCtLDHheIAsfPkUwbnI+zfV/g7Zh6sYoI5+iJsH4
X-Gm-Gg: ASbGncsSWebaGuW+rggoVdtxLYhkTkb93ZaxcZCr9X2gqyn6M1LeVrSj1Ut+dNwE4O7
	KCyWMDYgUICqL+LLBu3kxw5W6+uUrFjAKvsxh2uOTy/jpG2fO4uPQCJ6iiqC8BsnyAtMNGIPrJa
	OZDBZR7q4BJkqgsZUVboHbU2VK4wiZJoBuha5Je+8auLuVwZ3ccB1zwqI21Yln31mFu37yjMtOu
	1HsiXOBO75tKQifQzaNsUYzU63R1pFi1YFUpnQcDn4PIzXNNAFroyD1+EY07xfswZFE6gRW5L8f
	TU9G2deJgsmSXAwwembxcbPizwfYQKY/cV3yqAOq7FVcGsjl8WCZqk02ScvFz/dK6IaTQQ1UPwv
	4/ClTgiSuzBT0ohTgTxlW6cWQEeW6BpohlgesbpnsLd+00EfUFw==
X-Google-Smtp-Source: AGHT+IH1Csh1hHtPrY2L0DzN9wun8J1kFW3ajVUEsxPwcR2fKElwEotatpGo0o+Bff9Z9QctMzExug==
X-Received: by 2002:a17:902:da8c:b0:236:6e4f:d439 with SMTP id d9443c01a7336-237d9965716mr267845215ad.23.1750778406609;
        Tue, 24 Jun 2025 08:20:06 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8672498sm111979465ad.166.2025.06.24.08.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 08:20:06 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: andy@kernel.org
Cc: zaq14760@gmail.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: media: atomisp: fix coding style in ia_css_output.host.c
Date: Tue, 24 Jun 2025 23:19:58 +0800
Message-ID: <20250624152000.489-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAHp75Ve_G=ziR7sJmKw4t3BRASogGQ1kWUsNNNWESFmmS4rVhw@mail.gmail.com>
References: <CAHp75Ve_G=ziR7sJmKw4t3BRASogGQ1kWUsNNNWESFmmS4rVhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Subject: Re: [PATCH v4] staging: media: atomisp: fix coding style in ia_css_output.host.c
In-Reply-To: <CAHp75Ve_G=ziR7sJmKw4t3BRASogGQ1kWUsNNNWESFmmS4rVhw@mail.gmail.com>

Dear Andy,

Thank you for your suggestion.

You're right — the driver is quite large and contains many similar issues.  
To keep the patches manageable and easier to review, I plan to split the cleanup into multiple smaller patches.  
I'll start by submitting a series of patches, each focusing on a specific file or type of issue.

Since I’m contributing in my free time outside of work, I may need to spread the cleanup over several days.  
I’ll do my best to keep the patches consistent and focused.

Thanks again for your guidance.

Best regards,  
LiangCheng Wang
