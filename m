Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F021F7E6
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 01:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724634915; cv=none; b=RzDJ7uQTH4iReG6KHZz0es3hqNKQigbaLoQtmfMDDbLgwbPtMgz6VyuwElDcK72BDOQb86yFKceZ8QPMD3l+zzoaWUr5jtnLoMolcwdQjPC9jaci6kG6ium86WunrZsC2mdAMibTJWlwoznYK+wLdxASOix1/ddJqc91kecOeb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724634915; c=relaxed/simple;
	bh=yey/safOiJjvcVc74bPJRECTUO+McyoN9PWKBMuDuwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fOo6wyRrCyYPzduQuHPUK0cRRPK3xOwIHLITeKSfSygtQs1iYwz6g8ROWMXF6AQF1JKjF/VZj9U/KqsXSXHiSBnwKwcac9DrXPs9wSyHJQQrl/GKkdDH+f/20Oh3VeOJ2wStjchYqeF36GpVk5nJaMpdYLDPOG/pTH0CbA77lzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngbZBaco; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngbZBaco"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8677ae5a35so373462566b.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 18:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724634912; x=1725239712; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XH41IRwsrbE+mNci4UYQWCo3CzLco+pMM+xg39EvIWc=;
        b=ngbZBacoU6aZflp0x1amkZe1YnXIoa59mnJ14sPHxitn+wZhd/0a12hQ89a5+rqatP
         McSXcgeLhbIUSdrlI6m1M9xyEVJxP7ojp50lYTVwxRfMpxiOJliMZ71dCx9GNEpMQDr1
         tFx8Zmj0GdZSMsNEsxlUoOVUPJVHYBn2Ld75tA0yA3I2q6t1+cWMb5sUx7i1AJyfCFax
         LKzGvMHA++WOv7f7ddYDeDcfDAzSdJdsUNw2xi61P1+qynq36NegqSoetssvbOBwvFhR
         qrDZqyiIMZBFgd30JHGwU2Bm410sIMzPIdTqpR57AO5Xon1DXq2hyQtztHG8drRthSRi
         v8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724634912; x=1725239712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XH41IRwsrbE+mNci4UYQWCo3CzLco+pMM+xg39EvIWc=;
        b=f7TvXtPxIvzokT6bdO8s8MXiY70UM8hNszBKcFNG3c3r0H7Bu9d3DbkPCHV67twlbP
         2gsxhUbco3kx+XT1rzMvKTKzh1f4MbcRuovjwc1JBEpwdjZu4NT4jqmvFgYwVaRJj8lz
         JbxEP/sahP+MnGzcTblW6v89J/ReEcZMUaS+psPo/5iwZmr2AKyPbQB4cSXbpgIZEjuz
         y2swwTBj1zUAAR8UfdVaN8Qh1NtLJmcSVglPdnrNsDm2URRBNyEvfvzo3lvWUBGsWz7i
         L4ot7/XVG3ibxFjbFLKs7QKhKl6lA6Dtr0HO3B9YgPrIVvLX30XdoUlC252P4I/o/v4c
         q91g==
X-Gm-Message-State: AOJu0Yzdh4mLsPLJ0wRdUBX4PbtgAhAzcj5pWEoN05KwDSvUhZNDFfcV
	oGAJ7ajHOkDh3obwMfq821iikdDcSSXabuMPXEs6wcOGGVBaMu45
X-Google-Smtp-Source: AGHT+IEuW9jo2qd0tjZSuQYtLVjW51vjim5vwz/DEilzUnEApZl9dc2seVq8uxArc9IVu2mf6Z3IqA==
X-Received: by 2002:a17:907:9814:b0:a86:a909:4f67 with SMTP id a640c23a62f3a-a86a909505cmr600104966b.52.1724634912067;
        Sun, 25 Aug 2024 18:15:12 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f220d76sm607307366b.15.2024.08.25.18.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 18:15:11 -0700 (PDT)
Message-ID: <94f3e86b-3bd2-40e8-a02c-9aaaa483a7bd@gmail.com>
Date: Mon, 26 Aug 2024 03:15:11 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Staging: rtl8192e: Rename vaiable cleanup
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240826001724.274811-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240826001724.274811-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/24 02:17, Tree Davies wrote:
> This series cleanup up camelCase variable names
> 
> Tree Davies (6):
>    Staging: rtl8192e: Rename variable CurPsLevel
>    Staging: rtl8192e: Rename variable bLastIniPkt
>    Staging: rtl8192e: Rename variable CmdID_RF_WriteReg
>    Staging: rtl8192e: Rename variable CmdID
>    Staging: rtl8192e: Rename variable msDelay
>    Staging: rtl8192e: Rename variable bCmdOrInit
> 
>   .../staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c  | 10 +++++-----
>   drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  4 ++--
>   drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 18 +++++++++---------
>   drivers/staging/rtl8192e/rtllib.h              | 16 ++++++++--------
>   4 files changed, 24 insertions(+), 24 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
