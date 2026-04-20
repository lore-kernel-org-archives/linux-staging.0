Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7886A36C9D9
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 14:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694110; cv=none; b=lXrYdZHzWqmM6FRlrPrRwyFvJYdOtFUFw82l+wgXJzAct056Fo0Rl+NxbeWl6NLFnACZGvojUnnlOstHlz2cGWRLUQTqxSUM7JzcrIOoEJCUytx9Wgh/HgX9b3SmelfKSVB/HdIc2KCVv2j5BbiQa5VfA8MLSoh6b/FHSk+wUgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694110; c=relaxed/simple;
	bh=Cat2TIKspfsmN4PqK5E9xbQJRMaz1v0tlIYdDBxpwdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sv+aO1TRc6K7eIwAV4hIQdNcRFuG8G6gEFh5L4rCVIZxR9FySpVXvXYONa5I482L4Z8e6QYJAO3MiBLBvR4u/fka4ufcjFkoa+TpgLiB2ZR/ibeOy6LkTBL0ewDIIjSG+0ptUtnKGGz7lXC7Mor2l6eOD85kTizaC0Ig38Md01I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cjiyu/p5; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cjiyu/p5"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6763c34b1e0so1553789a12.3
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 07:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776694108; x=1777298908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cat2TIKspfsmN4PqK5E9xbQJRMaz1v0tlIYdDBxpwdc=;
        b=Cjiyu/p59QpASiYSXrI+KMA+DXAJy6BbIk0sy4ePG6L7oMbzylw/JVbcKrPttHYCfj
         rBTIXtgQ2klXQqkXdCqd1F8SsW3X+thlSx62orwuIvUCVrtVEcgNLW7a3YsL5S+qlfCU
         v3kbCEpCTJ5EgY6GheTnkEq9h+AaTM5xLqscRnUNvNp2TjYup50szPeHIF6On0zRcpRB
         ZemwRqSj4rCjuNpVnDlMLEDO3wBeHCSrbNtWUxA66RFI2kw/4SZ6wdzox1VlHgpvYcfc
         8JwHoBVA0ydPtxDqIbQ09IOKB/9YUNfwa2lt1tLn1Cym5eDTcJ3Z8B8BI6lffa4ksseN
         YH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776694108; x=1777298908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cat2TIKspfsmN4PqK5E9xbQJRMaz1v0tlIYdDBxpwdc=;
        b=Apf2JjHpMBXSF6x3Wp02qdYChwFEdAMV0BdIam5HNOoavpJxOTLRrccFmErbq0Uw7x
         gj602/+WuoGcLMIai7PhvVmgzb3qhPfxNZkXXfOeRJRSObX+3dXDDuewUeOUAe6th6zW
         KFShC1jxEBNyZEju/v2yAFs2kWZ4ILG2UGjI6Z1Ee+xPkZLqLuqDPYoiUeDhQl5kuccv
         QjIT/spc0l+78xw63Mfbz4bFiZmwzXZ3aqW92qMnEPoHfdr3+sz+RPeZOdVFlkRaYEsP
         TgG29tWFAPyhsU5TxJLfWyUSFE09mnlEKzLfs/49GCXPgspXiuBxc8S1oBq9W06dK+D8
         hWXw==
X-Gm-Message-State: AOJu0YyKaF3x19TeabrmK33ZyMVe4kwjfOzvpvC+mHKAzKEHfWek6o8S
	eP3o558IOwEE/5zpeUUlB7f/fx8zgCqprjeGlvG4ohK9M9fydAmybOT+
X-Gm-Gg: AeBDiesXcqGaPb15oVZIjkXgvNc0oS+wUQmF5y6uZ+Fw54V7TJXWIoKS+q0m2RMKiX4
	6cfNWLUvq1bpmgManFXm/6Wm7iAqYkxq0bQl1zp0A+OPx5Q7bjTecLLuPQkT0EiXQE+7MddbyNU
	QPWudQ0D1VeFOkvcObvttUxCVK91auon8zmsHkbCFQ0cX2sXUITr3VJF95P734HLz6LDXFKh2rP
	/sV2DS3v3bSCIKpb/cIk5zPms3hP49Au109CYvllTtcBPOWZWAq+OZjf98laDXvs5EDdIzU8orZ
	nC8bHwIbIxqBuP/hlr4q0tGAnmHcUlABYf4uS/ibLmmgoLIaU7GFKlkhO0g8Qy8Z+likwezuhpj
	1qgL9XRCNNnajBVDn7KFCy0tzXbsYiPhFHIbQm31EAjba1GzjARTn9nLiW6MYTBw3ksqOAvDQLG
	oUNrc2wITLtPUCkAS/5/vFo3ue0qLMVHTRcoXKSzniL65Z9KyD2QSnvGF3zc+Ryu1vVm93SpCaS
	STyX37X0n03Fh2Xf18Qk/iv2r8SrRELgT030btMOVZw3YtjeEM6Ma1l+dp/QxCv1+jwe1egz2nv
	ovyZPjm1Dmzf7/3G
X-Received: by 2002:a05:6402:370d:b0:676:8928:9f3a with SMTP id 4fb4d7f45d1cf-6768928a03cmr803976a12.14.1776694107660;
        Mon, 20 Apr 2026 07:08:27 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d51820sm2243279a12.22.2026.04.20.07.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:08:26 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: Re: [PATCH 1/2] staging: rtl8723bs: fix OOB write in HT_caps_handler()
Date: Mon, 20 Apr 2026 16:06:51 +0200
Message-ID: <20260420141000.apology-hossu@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420140432.150431-1-hossu.alexandru@gmail.com>
References: <20260420140432.150431-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sorry for the noise — the previous series was sent with the wrong
From/Signed-off-by (university address instead of personal Gmail).
Please ignore patches 1/2 and 2/2 from Message-ID
<20260420140432.150431-1-hossu.alexandru@gmail.com>.
Resending the correct series now.

Alexandru
