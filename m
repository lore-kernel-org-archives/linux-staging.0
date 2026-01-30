Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D3F2F8BD0
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769764077; cv=none; b=Ds9uf5Oq/3S9IGvlI7AIGSrj4LHtH79UyoEk7wwMRoscoupCg0RB6TWGCup2Kb6wo5RFpFmvTrB+y8YjFh0Z9QTNU87WFWwvfv2omt/mO5YmNkH5E2WcXxA4XlRocOhMYno52dPd4fJ8eC/ddKE7JhXZSz8xY14Ch0a+2dQpQbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769764077; c=relaxed/simple;
	bh=1SnfYteut4GCl5KCt6lVmzXoLsIbYqa+8nLCzo5Jxgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hl1eb1qqnEIGQ28W+6dGSZT2E6HZXjPO2f1wScBxz7KnjfSqh6PgynH9VRclC2euxzlYLPWsS58yKQFGA2NGaboYIcu6Ypm0pEaXAwK79zzWT8/Wkavvh8YHyer/qyIMyJELmduB7IvUWo4FYrv4Nnhton3IXtwglsDctajsXQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VwnhgxIe; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VwnhgxIe"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbc544b09so1819046f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 01:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769764075; x=1770368875; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1x5cz/G6bIEUDLXvp5Ag3NYOCmffhKeS9wCcDi5MCAE=;
        b=VwnhgxIezfWlzi0tbgeQBGS+yEMmM1+41PR97IrOyW3QtgCtlKHSAdvYbhx20cB/Vt
         CoCa+8SVAP+38yQRcxqfW9PL0EEkxK8yPk3uFeS0sgRVRTGG5Bou/CPO6hiOltNmHEJ9
         4Of6/4ur3usqXSnhXMoxdynPNeeN3GOGswNbcBUP/126n2t0SPphRk9U6ag7ZBb5Qysm
         76d1Qt2lq0bW+/NE0crojm3/H1vjtawo7iMFKBTSgz1G/13+wZPco8yYle9SXYM4DZyp
         WFCJjcG1XWABDv4b2FUZ9M2kFTXPLn1Zae7Ux7OzmuQcGqRwjhzSp3sdkYKK5esHYbF5
         kBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769764075; x=1770368875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1x5cz/G6bIEUDLXvp5Ag3NYOCmffhKeS9wCcDi5MCAE=;
        b=UBRwPIR0Aaql+h+F2XvjAQrkPc1uCpaw9LbcClXYsIKTOzDacKifvvd2qcliH/PfO3
         OgTrtkPKhLxvbiACq57bl9mTpMbmAZEFMxBeDXKUDqsHdF2q4fowt1jhsBCB8F2eUZ3o
         COQVwvE9GRcDdqURjn2zJquXSdR1uM+75AmH+VqqaZivv3pBO1rijHT/z6YEnZJZm1uO
         hJajAs9MQUwiqiwkUcyLZUjo2bChYIs2plHBGema8wrqr6T6Rg4De6m+aEjdJ/Jy1qGj
         81oYA9fsyOskFWMNTf1pcaUVrC9ZF618wY6B4211AHiFYNX9ulas6q0FawuiTuP6nZvz
         MWsg==
X-Forwarded-Encrypted: i=1; AJvYcCXxv9RCFCJSDxu+AzRd5FG48pFPC6BrehKhymMfS0IowN9GssAcQ7q7OkS+GQPc789lze8fxP8KRpNBpqv3@lists.linux.dev
X-Gm-Message-State: AOJu0YzMZqOGRxKKTRKAO4u1hxZs3zKUtJMLxuvjO9kR9USCV1egNw9+
	b7tY0/I9WCXrET5Ew6oKBy77qcMkvfuQRW7sJMjxgB9v/0qoOy5m+XWJRVbO5XMdYPY=
X-Gm-Gg: AZuq6aI7Hq3PSGmcp+loX93Ize2FTSVpsmZK+oj9dd1vSAZ3s3gAfzQ+khHm/7Jw7Em
	+jmktLRy1ynvYgZ5+5TU/ARz/GkfeNFUEYEjPsxb75thNvU21hcomqQiUdEDGx8T2jq24xmDr9y
	EcNTEtTPTxTAu8C113GeRO3SFNSoa44hbIYkqTnpuXvAPc092aC5aw0wNapdLCp7c6cCgpOLhIM
	iOipXcs3i8DLX0lTWuQknE0AyOEgU8meU/icYQVb/92U7J6cF+EknXh/QchRKiQstSBnkoKUMYt
	alyAuIBKfP7GT84qfzfDaTB2QwYX2G3mIgyT7FZc0cMdGIubU8Yw11KaHdsW+PPORWuZ/5BPjyM
	DTexA3vKGg91Oq3GbSdvmowCAGh8IrQq+XfbhmiDqrfPArZ8DBDPptWqxdQU4SPGXy6KR4u07Gf
	KyeXv7N1siTaYwMwD6
X-Received: by 2002:a05:6000:1786:b0:430:f301:3e6c with SMTP id ffacd0b85a97d-435f3aa7a0emr3036966f8f.34.1769764074550;
        Fri, 30 Jan 2026 01:07:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e474csm20459988f8f.2.2026.01.30.01.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 01:07:54 -0800 (PST)
Date: Fri, 30 Jan 2026 12:07:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, bqn9090@gmail.com,
	abrahamadekunle50@gmail.com, straube.linux@gmail.com,
	bryant.boatright@proton.me, davidzalman.101@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: fix potential race in
 expire_timeout_chk
Message-ID: <aXx05zTOJeCyQ5zo@stanley.mountain>
References: <20260129023214.1149822-1-s9430939@naver.com>
 <20260129123342.309946-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129123342.309946-1-s9430939@naver.com>

On Thu, Jan 29, 2026 at 09:33:42PM +0900, Minu Jin wrote:
> The expire_timeout_chk function currently do lock and unlock inside the
> loop before calling rtw_free_stainfo().
> 
> This can be risky as the list might be changed
> when the lock is briefly released.
> 
> To fix this, move expired sta_info entries into a local free_list while
> holding the lock, and then perform the actual freeing after the lock is
> released.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
> Changes in v3:
>     Suggested-by Dan Carpenter
>     - Use list_for_each_entry_safe() only for the new code.
>     - Remove blank line in the declaration block.
>     - Keep existing code unchanged

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

