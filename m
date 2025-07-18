Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20EF2E719E
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 18:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752863399; cv=none; b=ZMD50w1kzJk8SKuSnZMFpGYN3xe8bJyE/dhQjmNAa51CvAVZN4UfdLd0ZOV4vHN+YHVBTbSP4XzeFhNFBPmHoeBIz0yLxk2hhF1INVww379/v7DZagD/XxRBYRTTF8zceguvd3iznrjOBFckcQZ/hQMGAY+bQ/dJgE4Gs21Do6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752863399; c=relaxed/simple;
	bh=YKJ1uovM2EggmxTJohVAvKuVCz6yqNmxfdLf7g8+kts=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lj/8rfqNalNw5ehdFC2Sk9mRyOAO6BDDR2uFZR9imb1feSH9nQ/RLMkfWVqBBj7jxC7tbXpKxK9p34am+0cdWY0RSATqey2lIrqahCXqKFn18BA8urq5dXqmvs0p9Qqfofv3to9wLuKViXHLYY4LfAlrpLHtre33U9EeVEePo0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsorF2mN; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsorF2mN"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ab380b8851so21488851cf.2
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 11:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752863397; x=1753468197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKJ1uovM2EggmxTJohVAvKuVCz6yqNmxfdLf7g8+kts=;
        b=WsorF2mNRwettja9Gr9JFCtiqp8+4uTastj6i3RabNQw8VBwxRyH5+kxNqIuLG8f2A
         wZVv99R6LSlqwDgwTzd2nLBpeEx2TFJebFxesBcMxeiMIZimkKWGLScF0S797qsZJ4hZ
         Ij3dMjBlg4ESDnYEopn5s5pgo9qZJdzCxxEuIxuYVorT0XENJ4eiqxgPBVgYmSGyhp/M
         AMaRtIekFRkQ0v1PD5vw3xm91JHTEXwJDgqosCDlFKR1yBiI51HlMQ0iagjJkQlVzMfN
         Vb7hKfPk4OVH6mktNpYkKVQbUoJhg+knqRZZR3YDDasdFyi/7R5zdGVutt0IlrhD8UQy
         pkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752863397; x=1753468197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKJ1uovM2EggmxTJohVAvKuVCz6yqNmxfdLf7g8+kts=;
        b=ryfofxQRHUbLqFZXO/mNNNgIjWi4OvgCliwsV9gmNx12lrXR12RPKEiBSk8iDU6M7f
         0Aaki8nzfUOq3gZ9qW1UTFizvjlG5yvzo3oAt+xukW6bGUBAy1nE3PttmdLgk1Jm0mHa
         p4ohJAJo7HQH86xyjSk4RW3JIf09qx4cEpLgdjEdot26AWs/K2jZ0DnW9a7sBgwkCFoy
         v8sp92TfefZhnOTucj1igM5uE7IF2zFVp3yqruhukwk8SC5wHO2/KVavW5J2WH8fnGBq
         BZJlrdaajzzvFtq4Ty1Kpn9FU1BPuzE0vIxbJbKEIEo8v0A7RYkDD2p0CrIHmp4wxd/a
         9Vqw==
X-Forwarded-Encrypted: i=1; AJvYcCWBSRKDZkn9Cg84CFai2r9IquDG1WHO/8UYZXDn9VdtFU2DbgRnE97f61EdmbhmTX7Akzt4no9iCINaDhgr@lists.linux.dev
X-Gm-Message-State: AOJu0YxpGi61mMC+vLuWMyAlIS3/tAwCliN4w5a7NzTgExL0Bnkgdyk2
	jPm3xvtwnReKIpAXIVGGWHSvYjhk3jyhVe5KjsKN6yuVYAupBljJyY8v
X-Gm-Gg: ASbGnct010gyHb2+Rw5bRPrNT0JG2fg4AllT7VWAG5C8unJJsEjINT021GWRtFt++Pf
	HeNQ5/cBb9Sxx7gJkdEDl8MzJ6QphkoIdCcbJc3egah/K8TgjGlb9Vjx8M7YIv9BCMTljAvnkwK
	rX9XoiGd52N7Ng142KsmVj8k7QqGfbTXmqCCL34gegsB8KRJyHvEYtzDtv/+tYFBk5eRTrelStZ
	HwbBqQs7rysD2DTKJ6lNPjQW3hblxgztm1JqABJpgn0s0xK4TFneTIER33q0ZO32BSUABWurHDX
	Py9M0mf7RpX7M/Vr7iGCWDMTBUYUhTWYOv/KVJ/rRh0VMUrcMUZVIzkxKVNHHberMENiCcY/PHd
	/fGMJSAqGxKuibxhNK/kW+5GYEjVj8RwldT7nyU0TT6J7UniH694=
X-Google-Smtp-Source: AGHT+IGS41v+6MhJMyaP5uh0rlE//WnNcesBuHP1dQ3r5I+puFmRIHytXffnkbGwgpihGdMRtnpkGw==
X-Received: by 2002:ac8:7d42:0:b0:4ab:37bd:5aa5 with SMTP id d75a77b69052e-4ab93d8ca54mr130410341cf.44.1752863396346;
        Fri, 18 Jul 2025 11:29:56 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb4b42618sm9815701cf.62.2025.07.18.11.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 11:29:55 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	vivek.balachandhar@gmail.com
Subject: Re: [PATCH v5 1/1] staging: rtl8192u: Rename ChannelPlan to channel_plan and fix index name 
Date: Fri, 18 Jul 2025 18:29:38 +0000
Message-Id: <20250718182938.188395-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <2025071809-sulfur-unvaried-8e9a@gregkh>
References: <2025071809-sulfur-unvaried-8e9a@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

The `rtl8192u` driver was removed from the kernel in commit 697455ce4110 on October 14, 2023, due to it being broken since 2016. As such, the patch I submitted for renaming `ChannelPlan` is no longer applicable.

I will pick another driver from `drivers/staging/` to work on for further contributions.

Thanks!
Vivek Balachandhar

