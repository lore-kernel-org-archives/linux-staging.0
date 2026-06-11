Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D17C3EF653
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 12:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180535; cv=none; b=p2ELGurGUtiYp33wTPIGG7zBJ/8WVIv1AfoTsgr0CtjbmGcIsjBLZayUQ1xi5peHK58UaCTZU3GvsAqeZR4iCBI1VM++Ghh0tVy+LX1e5Mfvk9wRoXuObh2OzdoxqjZV+9GWSubW6QiYvwkbuARxdHx/Wfi1Qlbar0A4QIJCSfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180535; c=relaxed/simple;
	bh=6+fL2BPGQeOG72B1oxvEVeT/7UrpbAqXAUb99d70qpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhRcCEdgx1yHGqN453uHcrMjUDawps8S5XEkrgj9Uoc15sr9qTONDNa8TcX3kMA+9ANLbckB/10e8QPxeuuYm4KAeqfHR9fC33zK/8SU5bU6fDPXkyrx9cOnpgpZ6kvdkG7LcppBsnuNSmv0ZMrjU49vP1u5fltAhfiAPLSpS70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dloDrCVt; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dloDrCVt"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8ccce57762cso79984956d6.3
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 05:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781180533; x=1781785333; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OetJ/hLRU1JZtsBJPzrmV8acCOAe8IH+hKBZOGdqGTI=;
        b=dloDrCVtTTljhU7iYesv+Bbv+CjKGQxQQvV7bmyPGi7+f8QP0WZUZpNb/BRhn0GcQM
         55/5zsNg98vNHCN41NUdamTUoxu9tUY5I3oDHEou+GlFub/nkWcLf8sgvoxyggbr2zwh
         n1sVqV+tSQPcVgLkHpW+UjuER+ABxi40su86StzLPrlERf93euF9Gpm0EtU6zJFIK+/Q
         GrvGfy/dOfhv26vVig/lKSrcmTUwANOgkSkPjSkoZi6iCBZKgM5gi4lJAzd4pzRMhpgq
         3jCIybNxyiksR2CrvqExmNkCU7X4dRYj7I0ozmQijLUQrJAYUblqD4IQqwsEMWUsCZD9
         iZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180533; x=1781785333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OetJ/hLRU1JZtsBJPzrmV8acCOAe8IH+hKBZOGdqGTI=;
        b=eMbUULeM7enRC4oiyv3vuWOx0gos8MyltuArenKBHcQu3Qhji8oCj/yl4HfZ2la+Vl
         y4V9iM/z7czep1FI2woheOkHWJX2Xw27hJBLrzOBPvTTwcAo1/goz8H68nRZW7ESrzYt
         E7kjdhZAHrgISfz1lAZbIBdWmGwzgTXTQ2t/m3A+hOn0B8Ol8r9rrB5XQdiNziY6k+Eu
         PWYooijZ784tgoCZqOy0MwRjanB+OZwZRX1vppAqeYvJdcXBBsefPXW9gH/rPDQFm9du
         ii60CQhlSCiV1jCDwaFhXlc8QQF0f0SK40+viPqALBc2NnDGxy0Wp/lPJd0WnOJRDfH1
         Yx1g==
X-Forwarded-Encrypted: i=1; AFNElJ810C8VVepr7A7Te53e3za9GUvjaHwrwE+nS3goFtsXMZGS2rYAyeQIN+os8X4TykGMdgkoXjMJBi/+W1m/@lists.linux.dev
X-Gm-Message-State: AOJu0YwBKWPgHUkfjS01KcTqe1+Zy1T02fONk2HjcsiQTOciC0qphYbE
	YtOoFSSWVzjMYCfUcepz/nBG/bYVKPx1flFQ8VE14fICAPghd8b+u7/1
X-Gm-Gg: Acq92OE71v4pqe629oQcakFONeD5jsp7M4M+DKlzcNKoYC2L4QDGF6XWdaQ/uMTBKq7
	iRxRUEvbk+j1cAUq5COrqN0YpUJqrJo85OcB6nl5WQCNJaYhPXgXd6uOmoWez06BET5wkPKjZHK
	sL26+Oi7PMdD54Hb0g/N3i6xzkZuLErNvFqtCzYc2tbrKv95Wr1CtVNo1Cw3mD/YBe/VPr9t/4y
	8QtfcH1ZYgUzoF8z4J18+rtVHSL3QxahKc8GaOCB69jWxn5mDzPcUC0PW/xQJLXaA8w+zFu5eUR
	tspvipI0XUgSwLpxnlWWbhMfTamnEevBKKlh9KMo5ZXXm/7SuYaXs0gdpoqsreOUwIW4/1UZz7j
	6ft+Dx3sv4p0Kz49RC1alxsaIQM6UAuhKWJLSuHnWSzJzjXBy5JuS7qKEPyyiNeT/Il61ErNWLi
	ZPz/gGqhthmrXrh7fGwGsJKipRMgA=
X-Received: by 2002:a05:6214:5a0a:b0:8ce:b018:89ff with SMTP id 6a1803df08f44-8d1dc1a5122mr43035196d6.36.1781180533295;
        Thu, 11 Jun 2026 05:22:13 -0700 (PDT)
Received: from localhost ([149.40.50.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d1eaf99e53sm16296606d6.41.2026.06.11.05.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:22:12 -0700 (PDT)
Date: Thu, 11 Jun 2026 15:22:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Siddhesh Sable <ixebec777@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: fix CamelCase variable name Bpp to bpp
Message-ID: <aiqob86eyiauQz2M@stanley.mountain>
References: <20260611103748.29584-1-ixebec777@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611103748.29584-1-ixebec777@gmail.com>

On Thu, Jun 11, 2026 at 04:07:48PM +0530, Siddhesh Sable wrote:
> CamelCase variable names violate the kernel coding style guidelines.
> Rename all occurrences of 'Bpp' to 'bpp' to fix checkpatch warnings.
> 
> Signed-off-by: Siddhesh Sable <ixebec777@gmail.com>
> ---

You're working against an old tree.  Work against linux-next or
staging-next.

regards,
dan carpenter

