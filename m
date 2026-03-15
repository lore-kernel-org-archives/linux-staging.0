Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D2C625
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 18:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773597794; cv=none; b=HylBDLcyuKaV5gdxqT8slYlQu9QOw4RULL4OpgbMmV6uvYZK5zpZx5xUdjx7rC/G+awTGgTheGmKBNTtWJIv7dnPj9KpUZ78atTxo4r7rs7E67NMsfzhu/Zza38YAHR04hWUHp+r87qh4uOaQSZfbOKelSkZcNJDb69My0tjob8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773597794; c=relaxed/simple;
	bh=154LhYxL0Dne/XuDlNmze/HY/gaed1lvygPHQNe7p8I=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=qvV2Yr3lNun9+Hqj7Pbpis5HJLG7zOSGcFRDKY0FmxdXSW2Zhw03wxut5m9mtjblTwedZdTN8NjChllHgUOtfw8cNhmYiK8JYnlqGszVLdYiQOGAMTXFLZignsfBFLigQbzZ89dAEKmfJwSaTjljVLDhE0gU/o50A4CxFhO/hy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXlPdOtx; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXlPdOtx"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64ca423ad53so3921085d50.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 11:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773597792; x=1774202592; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=154LhYxL0Dne/XuDlNmze/HY/gaed1lvygPHQNe7p8I=;
        b=OXlPdOtx8t5Hps3C4ejRO8LrW02oV808LgcJze6ejxtEDcRgub5ChKslfReN1gwoLa
         TxQy7e6zCW56d1x7ULo6hD4SMdAEnSHh7A/LWmRmTCMbwSBZP+PfyXMnzYMUt5s0pru8
         kahZFV9Zw+VMsuHWix/6Ys56fFXa4230/HUQYPKGL8kDM/Ejv22AngLK83x2JTMSJSYv
         hH30N3RU9qZi4tSE07gvk0+VZ3j+Khn2Bqk1oLjcqmyRNaCGsuzyq/CTXaR5N+sAAEzz
         72LIcShFglw7Z6lDcZa5hMR04h/oS/rCCEPf9qqDRCQMjBj9eQsw0ETYsHHckVcU1H3n
         D1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773597792; x=1774202592;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=154LhYxL0Dne/XuDlNmze/HY/gaed1lvygPHQNe7p8I=;
        b=hk8wH3vOkZrYdOcfDLCPSmreqSU/i2Vw5Dp9Y57TpJjrroyIg2VeChTLWrXBW/C4ZT
         C8lH4JXZYksrtf9vALFkauXFMhoDeIaQyHy2peeZOVwOH3i5Gwim3wEVYdRtefjbdAiP
         KA2bnDYAEzz7wwA0WMkJtw6GtqxFdGV779wRA+llTSk3LTN/mfAQCwYeoh0UO7pqamcU
         KLRMF/Fha48yeAfBIkV41GH4aYxCOFa2WMgtRriQqj065uWq8eHtfsFDl4lbz7dpUNe/
         AwfZ7cd2kZQB1ZkHi/prChPA5CUM7j9JYA+MMZBAPNtQgxnVt9hyQSWNzTemJUdBhDFE
         fcwg==
X-Gm-Message-State: AOJu0YxZoVMv097WoL9nBMgMYDpxRvBHWRHDm1qSvoJiU3sd44fI/RGC
	KHh+4vv9pb+xwMLTkGd+kR1njGlZjppB7zFY7SGGNjHCPyf8GoYdrLO5BESA6b3G
X-Gm-Gg: ATEYQzyfXpMyEyzFKHn+vX64IZa7JcSdyuKtaZEXAlsX570OIz0lQ5BIaFu1+uz5V4A
	m96qTCrVKPF5Y6vycwqitqlQ62qor9Rop8z7KtjY80Fcrv6e4vTKd4p+NNbMprU2/7r0mz96f0t
	/NMAXkSMy2k8CGT+hs+8FVO2/GT2b9/3jAtv0Zdll6ip4W2gVq5lKjKmcYknqOEGH6fwQt4Ng4c
	I01air9I8g1V+rNEZ75L1Pi3T7PXB/8aVhAXdsEKOBznjaxphuKryp03BPr15itwr9WLpXIYvnG
	l5YDxShzgHTIi4bXGEpHRo7mmur2D6VjPXmJ9Qspi3nN4zv+8JS/kWmQRlloXTezwggtdHmEgo6
	gqFT1Ahbu+oJ4QM8q0iYmE18iumWyYCR1SJbcrlvkMcfdbMike1l6j/K05krG6cvVPa+OuRwt3L
	cmaD7ELW+4CVSQM741sYLDvo7A2wxr1xzrqN5r5gOhmF3OrqHKrsIE7gZG1ivaOkrG2eSBMLm6c
	TU4Gh6sTea9xBeDlMBdf1xylyRfDrRH
X-Received: by 2002:a53:d244:0:b0:64c:21c4:d01a with SMTP id 956f58d0204a3-64e63095c8emr7064480d50.71.1773597792423;
        Sun, 15 Mar 2026 11:03:12 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65a50ceasm4414029d50.6.2026.03.15.11.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 11:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 13:02:52 -0500
Message-Id: <DH3JXSIQ3FJC.1GJ337TZ95ST2@gmail.com>
To: "Nikolay Kulikov" <nikolayof23@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary 'ETH_ALEN'
 definition
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260315131734.25054-1-nikolayof23@gmail.com>
In-Reply-To: <20260315131734.25054-1-nikolayof23@gmail.com>

On Sun Mar 15, 2026 at 8:17 AM CDT, Nikolay Kulikov wrote:
> The ETH_ALEN macro is already declared in the Kernel headers, so there
> is no need to redefine it here.
>
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
