Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D233321DC
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 12:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788698880; cv=none; b=CDDbA9LIDa1EbyFuiQnOQ2l/8q+kZO9lEWYZypwrUs3xpMwDmbtFyYgRZrwJ9ogxmkhShctfjDaCVfMoNoUROoBd1KXJCyX36bEkEWLo+tR34JCsy5ygbjP4dnZrQ1WoKYDvjXNz2iVfNzfhR6ZxeXyt9IChHGt5KngiZZ7fQKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788698880; c=relaxed/simple;
	bh=CtI9wf91kDkK3hqy+q7OaA8A5qEvEvaUsLl4pXaqWBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rxNSazK2ufghL+ZzPs3il3JjIBbG0QTDHPsfNriWTkIOhDzN2JeReUuWcEwQwwUmoneqBbizsQX+fvA3WMXLuZ6InGkJB2SPl0uQ4/SvF13zAUh62fhbkMDEDhQS/7TOPUR71QxiRo+m0j2/vA3ZTsq6SmX5UBf6UcVQen1whwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mF9eHfHN; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mF9eHfHN"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1c9879395so1795205a12.1
        for <linux-staging@lists.linux.dev>; Sun, 06 Sep 2026 05:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788698879; x=1789303679; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CtI9wf91kDkK3hqy+q7OaA8A5qEvEvaUsLl4pXaqWBI=;
        b=mF9eHfHNI3fQNBoEz8tkjNBGcxDvtuMzf/tcaltSf+pYefGDeisAqgITjHAtoWPJgu
         SByUdv1LRIDbMbRr3CVZbKRPIOeNn/YFgLOOtNoLdh0PMhnX4vmrZIpLuOJZnqu3uTEB
         zLeBe1FGygtG/+HJahVOMdTYTj6OsZnzkFyCtUVwKd2S5BFjsix0wXZ/JzB/AJ/NF3m6
         fPVi/psnYLa7lG4iLsJv3Q1y/AG1BjYN73dbzdp7sCcbGnSUc59X1LTy/sLTPm8+cEpR
         Ri62tmMAsOnf5dFEmV4vBXpxug+QXuegktMGsV6HSGWr68cvqMyk2XwDMZbmAsu5K5tS
         X7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788698879; x=1789303679;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtI9wf91kDkK3hqy+q7OaA8A5qEvEvaUsLl4pXaqWBI=;
        b=JZSyZjKGJWBJ0pHS+SQGd05MoejWMSsg3TB8zx0M+F7xs3vIC056NZPMxrWCjIRp8S
         2Z5cDUkwXYZLe/gBF5Ei6fkhkAi02obM+VKp+wLNvvtdRB5nuq9zMtal4fxFEtTNTRr2
         rzmDnMjckx8cKEPDT2mkxxuUDWbmboyUONtZj7Hg/nRzZ98avcp3d6kVk2kSKWlBy4BG
         RkYfkLcSPJbmAy6H+1a7MW/Ebxc2kYJvJ17YXrZ9s09wNquREnnV+y1L6QAj2fquExNd
         PeylBltqUY521ZotIYogL9uae4tjvdx65/gDQxiYfGIyRBKspq7arLHFcp9FP1NCs2Iv
         nCDQ==
X-Forwarded-Encrypted: i=1; AKwUvByX63GKOMhYBrycN/XeSNRBqIQiywZZZ8UDVNpwIuoboPLu7QByOXU+eeuveNpvQ5vpITFTCthXvKnLNPDF@lists.linux.dev
X-Gm-Message-State: AFuF++k1s5rGSGkDa5t65R2vvMwGLIPSjibRC1eCaKFUNBMDzeEltoJT
	jt1kJVqN6PyVGcthP99CwhQfyeTsraHEJbgalFvBJHSMc5+EB2zs0Auc
X-Gm-Gg: AYBFou036U3uzILVZRpuOjJuqwkxF+LDgt6nhlyItvybhH9K8bhrvJFu80Q5xkwDQJ+
	6F1ThEKZCCToxcqVma1+xa/yTn+cjanRLiGaAMGLCTDQeg3gx4vW89YZ8//53/Xl2sh/Plhy2u0
	eiFSi+EwywwZkYEsN+5O2WDSH/kcwuafK1U4fDF3uPOkw0bT8sAeI83mQ4Zn76nfM3Z1eAVyMJd
	OLlj0g/0gmcM3btKJLvu32gdoJ0o4A21XbazzTlfqe8asGivuDS4QjZ9FOfHliqk+0tY6wYLi9y
	+Yn0sWav7mZ3HVweBUd2hHEw8PjKuGY/gmvBvgKDl54gJS8tVhtos3WObrwVmuMa7ZeUt0cgPk3
	gkwY8nS5jOnM3uSZaC6ZCm1XA1YtC8Hd1ryx/GXewGZSGRZNXz85K/BGeIyecf0iT0dUntXIJMn
	Wvq3/4QXXP+OP5hjM+7FgdDuOkpysFwNnrtqxrso6Aeg51zgeVyeIqnJgmhgZCYnV6I3iP/YvPE
	DQM3ju4/Z5CyCSEQSgjrMNdYWEtxnIzaCRbAMw=
X-Received: by 2002:a05:6a00:f88:b0:847:8449:2bb6 with SMTP id d2e1a72fcca58-86168e87b0cmr26739278b3a.4.1788698878729;
        Sun, 06 Sep 2026 05:47:58 -0700 (PDT)
Received: from DESKTOP-PKFJL56.localdomain (36-234-53-90.dynamic-ip.hinet.net. [36.234.53.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8628622d20dsm2157418b3a.51.2026.09.06.05.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 05:47:57 -0700 (PDT)
From: Hank Yang <s950343@gmail.com>
To: b9788213@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	guojy.bj@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: remove dead 5GHz fallback in GetDeltaSwingTable_8723B
Date: Sun,  6 Sep 2026 20:46:59 +0800
Message-ID: <20260906124711.10084-1-s950343@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906112956.101264-1-b9788213@gmail.com>
References: <20260906112956.101264-1-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bera,

Thanks for catching this — you're right, and I missed something
important in my analysis. `bSwChnl` isn't reset to false when
HAL_IsLegalChannel() rejects a channel, so an unvalidated
ChannelNum can still reach CurrentChannel through a stale bSwChnl
state. This branch is a defensive fallback, not dead code.

I'm withdrawing this patch. Thanks again for the careful review.

Thanks,
Hank
