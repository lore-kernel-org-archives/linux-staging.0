Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A3F20DC4
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 18:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293420; cv=none; b=fzj/lhIMowgKZfGF2bEdh4GiNf2cghmzFj2+ENB4ryosKk+a36XqlK1qhVUo3PsIk13fVAT+DHF+tgJUu3O+CS9PCihGVBQ9h5vTz78XvxioX6p95gps08M3zARrTBsNf8InJFklWEvErJurwGlO+803MYDfpvOF/r36PtOAsE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293420; c=relaxed/simple;
	bh=FKCzDr97iAmkrHekBXaL9AjNcDpyQUn4O75gsCDkIp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3zbEm7OkwzrxYAv4RKwJIFSpiKJTU62QaZOZ8QURqK169n/QHzQ9Lqa63rHHLDup525DBCPJqMSIP81YpZEKR8zGVr3gPvgZsaapYcg1N9uCyKlX6bwSwofjo5R7fgB0kR/vV0n+KgWkVFFZK9X5ZxY3k64jCt96SOSPpvFPQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0Y/0PTG; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0Y/0PTG"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a34addf84dbso18798766b.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 10:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706293417; x=1706898217; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfoCcWxXC+R7fi3WcxdiBA3r0bGMrkof+3fOLFkaCYM=;
        b=l0Y/0PTGxFAohH1ODFsfygoMrOA9iaa+AAYuMW4E0bgJZQ8IUXnlgBp6W4Tmd6qUec
         V4q+ma2dB+e+B/ADg07kbZQSM8qsuso31QTeEz+cLVPVLR/cGgQtsaX2dawzaE/JjlAS
         Qr/KGgw+yoiq+ZLAlAbn/NrfKRtT2cqKRyoaoeWcXlT1OFAIoRireg0oWUgSydkGJpui
         +kOUhzAuOP4hsA0ySFWpd1J0JAR1CoClNOCD0XGt3afIEws7lO0VZUu+9+qM42ooYyOi
         EzqWoQIfm4PTqTBLyfOI7Opy1gDLkD9P8StoaURnOUtUdCuvGOxROE57vy3DiO5Z7io+
         Nflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293417; x=1706898217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bfoCcWxXC+R7fi3WcxdiBA3r0bGMrkof+3fOLFkaCYM=;
        b=HS7EZ6d2tmv5mhVe7GX1Wjiim5OJj9bxMEKIFg8KAao8KDxtmgj6tfkseoZKW4T0nd
         B0VfQITZDl1qyuYyaks4S/v70oL4yPVAEltDFExcYATjOG7yWm3/GdMzDnsOw2ySR29p
         9iOmKiOBAomFPdGwo7aW7NO4kFvRBTgYN6u36ikvoaSS7JbnGexa/vfENKb8zVstMnyM
         ERYlYik0vs3rIU2Ie31JDGJ1COJ1mjjeQ6KtVNshi4aKbmn9CIL2wyWClkXGgHBnHUKT
         4vOe4bAdTj5dXyxdi4Ocd/XcHvAA2K9kx9r/hrjUldqG88YrUYnyH08F+pfhy2vVrwzv
         EZjg==
X-Gm-Message-State: AOJu0Yx5oramKYNE6nIqhUak4enCrl9ULcR9O5uGyVRLsSjXQXMZiTgO
	JKDFqhxyDOer11p3ctEAEIGRWDlgnHhu65qKK38fZz2rGzkJEO/o
X-Google-Smtp-Source: AGHT+IG+zQxEY2KWn4VUD5POw2+2aLCecdEJX5ES89tBZ6te8upAb6n8/132MiKvdYBeOQllPAl1GA==
X-Received: by 2002:a17:907:9485:b0:a30:d454:58a0 with SMTP id dm5-20020a170907948500b00a30d45458a0mr60003ejc.5.1706293416634;
        Fri, 26 Jan 2024 10:23:36 -0800 (PST)
Received: from [192.168.0.103] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id g13-20020a1709063b0d00b00a34ace86850sm882090ejf.207.2024.01.26.10.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 10:23:36 -0800 (PST)
Message-ID: <500c7df9-7347-4ec7-8952-5f221cc83ef8@gmail.com>
Date: Fri, 26 Jan 2024 19:23:35 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] Staging: rtl8192e: 18 Additional checkpatch fixes
 for rtllib_softmac.c
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240124224452.968724-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240124224452.968724-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/24/24 23:44, Tree Davies wrote:
> Another checkpatch fix series to be applied after the series titled:
> 'checkpatch fixes for rtllib_softmac.c' submitted by me, to the list,
> on 1/5/2024
> 

On Patch 2, 5, 6, 17
WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit 
description?)

On Patch 13
WARNING: 'unecessary' may be misspelled - perhaps 'unnecessary'?

Is working fine on hardware.

Bye Philipp
