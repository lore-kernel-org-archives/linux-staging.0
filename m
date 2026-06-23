Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5409835E930
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 12:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217969; cv=none; b=cz/fjpET3S4hKKFEF3rr4u4Tx1of0OioEyjhaWiUP+TdZhP/dLYzXtJJgEJ2313u+TPbkg7XDQ9Z7uwznLzzSq+lZ/dwqoDYeOMvnt5vFlGNUAd51Yk4nYZByVwdZMRX5A3cjAFbOaiKHnFOeTWFXBVMXDSFvTbylo1FoVO1DZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217969; c=relaxed/simple;
	bh=ZIqUmkNi5rQo3X/c/LGhr7Tk8CChSx7SI9r9sPokKkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rL3xQ684pZf/XKRdOTCCqKEXCDMGuD8T7sIad579em7lAJO/v5fNqw0xggQ6NRqppgKv/+tZFnonkdR7MavZIKza8PzsTzDufjBoH1gT73zMdE5RnIPlDanHD+BiMOlRA2O8Zoaan63FjkIBKOMLNI4Lx40lNlyYoZPjJ5okyP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLh5Wfj8; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLh5Wfj8"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6978f80deb3so4106162a12.1
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 05:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782217967; x=1782822767; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WC2XZGGh/srfDbK4OYGAxVnIkZni5Q+dfBZ7/rCIpJY=;
        b=MLh5Wfj8vsjF2b7Y1pBNzNTZ4MiLNtkLlvtIqc9/L6K1NGBR3PDmzvBsCHpygc9UaH
         QSetW6Q9/DQM4UWhzXKAr5bYUbLn2SxsHtHfJ3GM3rjhmr5uOVHFf4KufPZvzDyDnBYn
         n+8RpoF3Vp2DBauzU4bhUtYLQ205tETIA6UhEjPdiYChMJJltAVhlzaCzrrxTn3M7Su5
         IOm7C2rxhhojuG/M0fVptItMnD6B/v+emxC1VYvcPN4Pu+5vXWjWhl2UlSasCD7AQCeV
         0/whB94SlpKS1k3elyrBYIhYX6q9B5TavAAh7/VVmd7MB1seeHoXQhgKfDopDcFa0ILw
         VXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217967; x=1782822767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WC2XZGGh/srfDbK4OYGAxVnIkZni5Q+dfBZ7/rCIpJY=;
        b=X+YAfz66WhjuWHTaIeC+o2LGJSrwlHc3JKtaacHRoIndZVhrovNOsZ7T66MDCgj0Ss
         yqObiTcXYh+prrYgykEzrcLmhCCnIQOdlEg8PF202gzJo8uBUUNQ/klZqZosowQ7AnsN
         E3ylPkxs2iYse7/FHtag0ixRCFJ8ZKTmIcWSa9Jbke/ipE0N+Bh+wdykAMJ6AM3BvRSn
         4Jvz5Wf0oUxcF1U9p9ZYv0Wv3A/iRRaRwDdLRuM5o5wRXRrCwM+eUyk9swaYpK+GAxPi
         x5SEm04mBgZiFkG/CjckqOkrUB/faSXbPyMxkEzmLUcfHrOd7rASreOLULdd3Jn1atuq
         SRnA==
X-Forwarded-Encrypted: i=1; AFNElJ8Yyh471VtRvTbGBPSwUhrwTc4llWNY7kfvmH0tQfwWl+eyD8OtsbY7fvoUpxDiR4kSTtBbbuG4bqXiQzvt@lists.linux.dev
X-Gm-Message-State: AOJu0YxoHPAlGrsUCGgsEoC4Q7BHzXp8MZlMoOMjlkLRAxBoBjpjaaHb
	QTzWI8mXU0QxCrfqWRLY+9rv2FdfPpVgHKQDdkrs7sqeKmMuEr/47ezA
X-Gm-Gg: AfdE7ckBomNOuJqZ7Tji8D8f5GtsxAz9MzKYBQWgCjIkLHoLJQVDCt71WzhufNY6n07
	Re19Wfkxp5gIYpyioEubNjpHjthY6XC/QqVvNq7wF2fSd8Ro4olptY/YA81NL8lRCb0bhgXt4WX
	ui4gLAfALd14EjBXPj5T93HqFCcDfjHQKMsSIayYl80A8b7+kZd4jKjs1mTQtgc24EoFqFoV13K
	ijWgsS5ATP/+GQA/q7JYI1yH/PTwQegPC0tr+utz9g+uf9IfkOZcTXOhUYrj+vTh9NfbI/MGKTx
	a93fsqEJe5hThKIvTgCrp9Kwk7uHDYm5AEb8S5vdiDX2EZJqUC+97YS5TemNlmEEVEfVRyfYfMx
	q5YZMBmSYtodpIy5Mjpq8JVD0cmf8JPOi3H/PWqih73wCGdGaJ0PbCq5haESgk/+dw1WGj43wQ2
	OZfnoWkGZ8
X-Received: by 2002:a05:6402:a51a:20b0:695:ec53:976e with SMTP id 4fb4d7f45d1cf-69711e162bbmr6445814a12.26.1782217966582;
        Tue, 23 Jun 2026 05:32:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be49b7asm4530828a12.21.2026.06.23.05.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:32:45 -0700 (PDT)
Date: Tue, 23 Jun 2026 15:32:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bruce Ou <oubruce1234@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix CamelCase style warnings in
 rtw_efuse.c
Message-ID: <ajp86uimX_-sl9ts@stanley.mountain>
References: <20260623112629.4953-1-oubruce1234@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623112629.4953-1-oubruce1234@gmail.com>

On Tue, Jun 23, 2026 at 07:26:29PM +0800, Bruce Ou wrote:
> Fix coding style warnings reported by checkpatch.pl regarding
> CamelCase local variable names in rtw_efuse.c. This includes
> variables like contentLen, mapLen, efuseType, Bytetemp, bResult,
> and Address.
> 
> No functional changes are introduced.
> 
> Signed-off-by: Bruce Ou <oubruce1234@gmail.com>
> ---

There are a whole series of rules to follow for v2 patches.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

But mainly please slow down and wait a day between resends...

regards,
dan carpenter


