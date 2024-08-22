Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305561EB5B
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 14:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724336168; cv=none; b=moERL6fyyk+Ugv5cOr3hpa8F1+aPgai3Sppb2LSPsCIDEEt766QNolY4NgIzQTNiIwkQ7nM0tzwkDSuNwc/etQWOruq31NP8ldQeYemk1VNHvmwewFIMpULalGRDMnPPH67n2OiTdJ9diUBv1nKLFAJiez6bCmKGGBCXDPL+K4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724336168; c=relaxed/simple;
	bh=pnlqb54BCgrU88we4AzcecXX9ELQqqJgryvKOTvHp80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgiC7/nEC4VpnmYBOhW53UPUcnziHYtQKt64GstXT2Yjc7pPGW7TRUX3GcmmC3khYLlimFeeyVeQhOz5btG/TeL3N/DzBNAtdSOQAlDXd554MX3kdw3Tmqwtaw+cX9LWJEMhy/UuWiBWNo/6xshxDaVB69VRjAFV+McQuTr/zWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vzOI4zz3; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vzOI4zz3"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-429da8b5feaso8560315e9.2
        for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724336165; x=1724940965; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N3m5wiBO0uoqTyLuk1zEtLyS3nxtuNvj0xsiED0Pv6Q=;
        b=vzOI4zz38ucc2a8Ne/vrvGL/oXX+p5BjKduA0/E4PlG3gqDEGIs4+e4cWx1E9QsPzh
         dEYl2cd5Mw9KLTyOOoaXor/udQhdukB2Xc/g08/7kytc+WhQHh8yIRzxRcSGniZQREEX
         F4IFPbhPfKXj+bDdDVhMTFSg7Fv8ffkjtOHFoGVNrRj6keWXBGldTS8DxWIHBVt+OUJS
         bn3l6LH3aCD1FAK3DDYuyV8c/UjutzyQSXxkmpCGvMkZVzaRqic13Er0bjyHbPWlPsvL
         8TTYlC6JvnNp21u8rzkBmxZbJxD5RKXRJmNOWXwhN8ZQxe2wfYMrwaK0WfE7I4TeRamQ
         2zIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724336165; x=1724940965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3m5wiBO0uoqTyLuk1zEtLyS3nxtuNvj0xsiED0Pv6Q=;
        b=j5vbl7MB2cDvFb1ws7dXpvq++u4+tgs+HW8pKkE0T4myBSjkaM4WCKdhZ8qd5oNtVu
         bSEbColFnggJVM/5OEI7VHcvWyKP1keG7Dx/lLrl5TL+RsSbjbXYMnqyBYvxGvV0XfCp
         njdfQdg6mHv7kBe06bWLujDVQBpKfgSiRghX8ZdqCSf+6tMI4614wWtjQH+F7uk3gsVo
         rlxMrUQSowomsWFTub4kFvfEuxWFdDrgmhBNXKfwZI7UdaQTKzDmMI3MhPWb7PcWNZoj
         pe37PqTnd/k+UjFssvpi/Ezc35nfksXEFCxb5jlc5Ku8ofZAruXN1qTEjTHRABbIg8e5
         mhwA==
X-Forwarded-Encrypted: i=1; AJvYcCV8LnF3xRzbuaVOK6KDS3ktfjq7GNgva6Yfd5kfwMUFQdxipfqc85wur5XBR0y8U1T6TePSDcNA8LFKdmlH@lists.linux.dev
X-Gm-Message-State: AOJu0YyikG+X1a091e4AamY5QEQkxcmbZdWoCMVeUl8N15aS5kdPLKmb
	Zk/s35TRRaV4vD7EyKHao75rjDOf1IK8BA0Uvhr0c5xDoK9fmDWgUFRq+Iq4bbc=
X-Google-Smtp-Source: AGHT+IEn/cSUzXrM2HZrrKfRXByXKxSQj8B3nbVnGKe3lrIdC9YL0mqMoF1BsVccck4SGVbq3LvpQA==
X-Received: by 2002:a05:600c:4e8d:b0:426:63f1:9a1b with SMTP id 5b1f17b1804b1-42ac56371e6mr16898125e9.33.1724336165516;
        Thu, 22 Aug 2024 07:16:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abeba89a5sm64073305e9.0.2024.08.22.07.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 07:16:04 -0700 (PDT)
Date: Thu, 22 Aug 2024 17:15:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hans Buss <hansbh123@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v2] staging: rtl8192e: Insert spaces around '|'
Message-ID: <69883eeb-9c01-469e-b2cb-58e2ed1b1ff0@stanley.mountain>
References: <20240822140022.11197-1-hansbh123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822140022.11197-1-hansbh123@gmail.com>

On Thu, Aug 22, 2024 at 11:00:22AM -0300, Hans Buss wrote:
> From: Hans Buss <hans.buss@mailfence.com>
> 
> Insert spaces around '|' to adhre to Linux kernel coding style.
> 
> CHECK: spaces preferred around that '|' (ctx:VxV)
> 
> Changes in v2:
>  - fixed typo in commit message

Put this below the --- cut off

> 
> Signed-off-by: Hans Buss <hans.buss@mailfence.com>
> ---
  ^^^
here.

regards,
dan carpenter


