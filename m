Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E595F3793C5
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 21:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773868960; cv=none; b=UzOUYuLXCvQCMOQ5KnVf9jwcIJIPNMHwfe1WaMs9wocAx7ANl0pblva2CAdGlqmRL4Fa8POqboN0cc1uclKa6Y/EgpaR7yRsx/KFXd0v9le3LyApCrygWpU+vWOo0vqnhRCL0ZqtbQn1mqRAApL8GkeMp7xn/mJXzukKvui90pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773868960; c=relaxed/simple;
	bh=e/CQ7ur7a6MnYA0L2qSLFUmtc56MkkfCr/1gwKq0upk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=DyEEWKh6HirX16EXJpMpiyKMI6n6J/4YDt927LP9Bn5mIFhUYwh2Od+VFcdsD8NLJn/SeQk6z/Adf6yvOGOqyePNjeleJmrTfGxCEZIUcrp/Is5PwkI7cCC5nkUY0alvt3qS6yv3XCYfsd8po9rO5Cx1afBdjvGlvNILmnhfdWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWSFRmZR; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWSFRmZR"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-799001d73bdso3441957b3.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 14:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773868958; x=1774473758; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/CQ7ur7a6MnYA0L2qSLFUmtc56MkkfCr/1gwKq0upk=;
        b=QWSFRmZRKPnYqjJOxrAFgr9EhVveGqeCQDaGnS3Em7873HMEuwhA9t0RgEJXvKMFgn
         pBFaaF4QBC+ekOkW3+TRgqQ/+UeOjhSCc3roFbTNP6kG+M3G0D1kwe/xNqs/L38uor1D
         f/+lqvKyD4XMDnOkiZjae1AIzLGgeosQKH+3IwQ88OoHGLaXrGL4j9IXleNu2ndDGkMu
         mYG/lK/l3iFvnPS8tAdfsPlCGS/qdA/1sxmH/G7t3T9KqYYecVXzxUvp/Wu1oUWmE61S
         6ccF9Gvk1ptxCNPe+7405rfpqANct8Br06Rg5ilEHQyw/0lZZOjCMicggKvuYAf7vWie
         r5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773868958; x=1774473758;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e/CQ7ur7a6MnYA0L2qSLFUmtc56MkkfCr/1gwKq0upk=;
        b=U+A4fXGs4y/UJgP2FdreZtwqBOCH/Czaxvr+hn6ySKkD/VYjSpml/Dmxs3K6TVan+V
         2QENK1UsAnccqPdnhrKOQi8gbgVW+b5Ngb1S2jivKmAuHq0nq20OMBEYgPLtnOeRH5PU
         fWosmGpmmL9xz+C5dJRApGKsx6O2pCxfSHdgQ+Tn5pqEFdrtiIcxbV/4+RTBBK1RykmF
         B0je1o8CYZ07/tMhzMiWR1yUtqfD/3++jSIQCOSeqJY6U5uN4tnP7T1MvdFgd8AKzu8k
         h6iVEVirSyQ0niQuVjJkKWlzWBBdyNBaF/YKSZeKJRrXXZd0/Qky5xPHX/vF+eh6sTJo
         ZfZQ==
X-Gm-Message-State: AOJu0YyqtmXAVehae1MvaMfiwEE4IBuhncYqIxm2TO4Gv3OarmV7GPDN
	+Qqd5KO4OaAcRP+o/zqcMc1emhGEPxgNWcq09MInLw3Wt+IpkuNfJY84
X-Gm-Gg: ATEYQzwagm8FngjEK9BbcNNTLoeLp+kRAmh65/CVDvH7uxkz9Y/zcqZ05VKo9J71cIU
	+EW1DIF+vRMOiwOPW+DXtZMm7NnJiPY9iD8cn/IUgj0dMplvaDgHDgRC8S/pIHMgcJIprOt6fq0
	h5PxYkBYSFVTpghsgblyP0KKADV3RX8kVRztCHMQUL4KrBCKL5PNY9cXmHhuRj4AS5Tvx6iWmDT
	j4KFOi96Wi57OKxWJ6BeykHals07Gd8gYpMzZr+3VVSfNgL0WjUqZaU34r58gVbz+xp4oNQOYQA
	yhWvkjyc9b9sEBwLoy1KwGY41LQM7HfwtjCPpR15IvIUArWYcG5tBhfYvWz3PA6JirFMYzM/COL
	kPxVvg0a3GVFtfKM4oU3DGy8755ni3bnylhzWR7bvpQrIF7XBvRMt19RQZcK4XoZr4vgA6bdzRy
	jzY4Tw0UhZleI6RHRwXoEha/D429UuR/jWw9lYuRFsxANxItdMOoLvb2iixFwtPFsVi2h0d/YZM
	GvKca/5rxQ/nsPMwHCtVlUKxQhb8l+I3CbWfTVMSoY=
X-Received: by 2002:a05:690c:c14a:b0:799:1fa3:c915 with SMTP id 00721157ae682-79a71cbe82cmr45135367b3.56.1773868957718;
        Wed, 18 Mar 2026 14:22:37 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a7136e51fsm24126357b3.4.2026.03.18.14.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 14:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 16:22:36 -0500
Message-Id: <DH682COPWLUO.LR79AZZP050D@gmail.com>
To: "Malavya Raval" <malavyaraval@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: Rename TrafficTransitionCount to
 traffic_transition_count
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260318195924.2096-1-malavyaraval@gmail.com>
In-Reply-To: <20260318195924.2096-1-malavyaraval@gmail.com>

On Wed Mar 18, 2026 at 2:59 PM CDT, Malavya Raval wrote:
> Renaming CamelCase variable to snake_case to align with kernel coding sty=
le standards.
>
> Signed-off-by: Malavya Raval <malavyaraval@gmail.com>
> ---

This didn't apply to staging-next.

Thanks,

ET
