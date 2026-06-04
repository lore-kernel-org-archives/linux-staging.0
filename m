Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F063845CB
	for <linux-staging@lists.linux.dev>; Thu,  4 Jun 2026 07:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559909; cv=none; b=ZkIdUNacfYdhRxBCDvTROD+X6rwXk6Pd/qfgVxdHfbD8TQDZ4PGZGKBMctaOkWvpfCGFrZZvrt9BB53bkPDu/3xpM4slrygC5ID293ClVRnGHecSWlEfhDP+bXPbQHMdkFEz1Exx6qljwElXtseAcZmkReZnLr3CvPWLeNeTkQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559909; c=relaxed/simple;
	bh=UuFyfnBxLDJQby/SNgkcPJjeKlBwDfw9ymISOLmhuIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UyHOudTNdcqftSDWhU9sJRPpzBtGPSmzyxW6imfGJ2Fg5xQnrilZT2OmpGXgL8VJ3cbBeNA3NqGT4+NhhvtmWoY5wO9YQVxaOuRXgjsc7tMgMODmbW2NYOwo9IzomXlmfYONeByrtvLRmxfG+U/yjF5btUB7ty0K/0TrnV21MMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhsJatwn; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhsJatwn"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-91578122305so80713785a.0
        for <linux-staging@lists.linux.dev>; Thu, 04 Jun 2026 00:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780559907; x=1781164707; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lut5XuTSnmwiBdSG4109L0bbC3YpWSUfYyKpQA0USYo=;
        b=JhsJatwn6hwp3KaWBtrmyxVUu4nJ5EaK8zh1zdkm+DZvRhjBTkd957J7MqaUBcKvgy
         dMeI24ikXwaT4oEm75/xzxbHFbyi8G0EsgXctJyUiwE17s97hoR9LKAABosfRabXwwqF
         Qk/ey86eLDIZCIsmg05QFtjsZpL151V+U236pvSK/+rSlbrIIdpKZ994P8UhugD+CTBs
         6NtHYmCfzlslUSqe5KoAdS7mZh5HMRxJgaU5Mx3bKTQEV2zaRv3iRfqot2TtEEQXqrv3
         SJvzIDfh2+dFPFKepHgwHyIv4BtpoToZuW948ARugvW7yhKCYDsgMca4e612ODnpMS8G
         xL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559907; x=1781164707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lut5XuTSnmwiBdSG4109L0bbC3YpWSUfYyKpQA0USYo=;
        b=XFPB5LGvBkq8GCRp1ftd3kwNxmtkEYaVl+JjpxtVbbdice46zLzjq1AR8Uoa87vc1K
         Oqlk0nRQJjHflEbvjosvwMMumHEPqrt6jwUsyw2q0azzWNMt6chPDkXGOJuVIFCozFpV
         NmWMYxtBUUYOn3oF3DPYVzQ9rS+80FkA8YoSTqzBjWAl5xvLlsQ5tZ4NRftuv1kCAOBA
         dBYBIDNimVYfLZiodk+qTRVmMIHnM/F4hYP0hjUahARW8o8mZpW5TV4On9e2a4srlRCZ
         HOx6gx15ocDsKuMNNLpzYFo8CBBfeATT8COPTlMBi2zsbIS4Oi7k8cHuOw/pqTv3qOnY
         LtTw==
X-Forwarded-Encrypted: i=1; AFNElJ+dbCLbCyf77nB/oFlCFiAo+w6/9/eJhZLLThJRMbq31Xv6HkI/lgoxNhZtPQVa+bTB/zs/wUZ1TYJ5xkRI@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv6Myo6jKssuDtUvVE5PbuS2C976Yg23coLpKgA/d/bfHsCvu7
	ZVU41XK/Z//97bgAXhVEW2EBiFPM7gnItLMFFIhMwpzs46sRUi84IcJq
X-Gm-Gg: Acq92OFrwv6pK/Po7FBne593advPpsuckQHWbKToXlkUnytID7IsI9XXgIoj166SFIN
	5emShr4MHD8MTuJN98Tmc+eJaCWxlGJfRvsSIi7wmUO0wnS/k74Tqq9j//cnX6Lw8g5awuXdA9K
	v82b9qEFvbbIqweKHTpvL3owiWZm7MQyuCtPbGHCUkztiaAarqKWaNshItApbHus0Ux1qk79W1O
	nfLhV8WXP0l1riO81uHOK99q4WwtOzfyPzTfsSthPz8JKdAqB9T9lG4hy3T9j3ogFdYiIsKLB93
	erpZDVVHL8Mp1A+Pqb42eMOdSlztXG/SezjlMFF9PvTTtfA81qzwMGeBkP15/t5JxBsNRKU30cN
	EKv+GKW/HCgG5E80sNBWuDw+5L2Uj1LjMHz3E3hDxkGD17uT+WGxxA+fZOURTSfsJHqXeKOof5v
	1k5oD+f3gaOiEv2Bz5pNNU91iIDks=
X-Received: by 2002:a05:620a:1d0b:b0:915:8f76:8001 with SMTP id af79cd13be357-9158f768409mr982190385a.48.1780559906917;
        Thu, 04 Jun 2026 00:58:26 -0700 (PDT)
Received: from localhost ([149.40.50.195])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3d7280sm508837785a.41.2026.06.04.00.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:58:26 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:58:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: William Elder <williamxelder@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove comparisons to boolean
 literals
Message-ID: <aiEwHCO8mwv1nYOB@stanley.mountain>
References: <20260603193753.195640-1-williamxelder@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603193753.195640-1-williamxelder@gmail.com>

On Wed, Jun 03, 2026 at 01:37:53PM -0600, William Elder wrote:
> @@ -847,7 +846,7 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
>  	if (!pIE)
>  		return;
>  
> -	if (phtpriv->ht_option == false)
> +	if (phtpriv->ht_option)

This patch introduces multiple bugs where true/false are reversed.

regards,
dan carpenter

