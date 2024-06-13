Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255C2131E33
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 04:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718251999; cv=none; b=qedJ5xQ4C+tFyBhKq7vnecCJrysOw238WpqNTiw27SOyMna3n0gsF/dD+v/QgZx0s1kRA2Ylf+teLmKtSdFjg35nQBbapdkT0Idgv8woLkqlImiyoicuINx5/Do3M2FTf1YE99WEizuPwi2WjL/lKxFchrUWAirObK51k3CXbn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718251999; c=relaxed/simple;
	bh=YnGruI6ke1LTqvhwxji7FfE65WSyDFiZmFTd5kUF8P8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUhte1QfnTCi5ZroJb0/dl+S9TxWbQOKONynL7uYtWLrflOFbcBCJEnVVdFPShrZENXWsOsBgPheqIaM5gbodb7C9Rt3OtxovAE4GDVY+hrrK457iMlq6dI4oS8TZuDUJKv1dUGh3hrf0xy3knVSY9G53pwD3ob1HFZFlKQ1f7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m79S+Bak; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m79S+Bak"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6f408b8037so10695166b.0
        for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 21:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718251996; x=1718856796; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wsi910S9P4YLj4+W6cNwBMVH+BbAm1SNImeKNN85EnY=;
        b=m79S+BakEzH578CaPIYPLbSvBydBftmevBmMVxmHYjm0foGolBamBLyijUlNNOjarT
         QfCcK7n1+v7bCRoXCK9aD9mrh25PsuM1YcBukRdbOng2vqCb9U6KSVV0TzPM1qwCAlv3
         fGockq1/TMynD5t0NOYEfM/DZWD9JS1ci4wKNet1K0BrEFfGpuu0VEmxBJN4KfhDvJEL
         8fZ94uWRiRCViQyHg3lZInD7TxxccSMpyaaxtzcO78FLVoxJFeQr+clJYcIb//5XJkrS
         iOXbboIQ9bMMmSFRYpCyOTJQxjovndROXndCAXDH16t5RYMYfgXlui1auirh0Qo1frFD
         fHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718251996; x=1718856796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wsi910S9P4YLj4+W6cNwBMVH+BbAm1SNImeKNN85EnY=;
        b=pQ8ZiJuEzly2xA/6E6XqNDjgbXAdVz2gfHzWdtdSFz5MOdIJFdbGESWOc9O2iSiHOd
         5Dxygwwm//wCrEfRKtj27h2MisRgAgiO6F2aLkU+4Zhul2LYF8voR92HK8m8kKngjLcs
         mbXNPs5PFFa12umcSxbt504OkLf7kuFySi6l2qVWWhDsE8eamtVwigug19CIH1px/k/H
         Izg6lmVnhWFtCO/kRIYThoM+zrIy/i965EDcVeTZP9RnPESmf1zgsD6UPAkT3LmnhRS0
         47up/B/9TcrShaEg7vqZ0YDp9tFHLMQE9pgpe/vogkf2zCnUpVX1jqvncQkYvZLqavF3
         sv2w==
X-Gm-Message-State: AOJu0YzW9spdCu17uhpvhrugGFNcaLXjtdX2t2Bm+Idi8abgY34tfVP3
	zik01sfANdvL1ozd2k3ugvippg3Ft+nzVh8knQm19KjOQckiM/5O
X-Google-Smtp-Source: AGHT+IH2vIwtsYNIV+qxVW0MxspQqq1ctuMGmx96NKeDs/K7BHxOXl54USt7laYU0xgjR4pYyLf93A==
X-Received: by 2002:a17:907:9445:b0:a68:67e4:7f11 with SMTP id a640c23a62f3a-a6f47cbf327mr248114066b.2.1718251996204;
        Wed, 12 Jun 2024 21:13:16 -0700 (PDT)
Received: from [192.168.0.104] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f40fe2sm26305066b.148.2024.06.12.21.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 21:13:15 -0700 (PDT)
Message-ID: <e92c7967-73b2-49e3-abb2-6c476a1378bb@gmail.com>
Date: Thu, 13 Jun 2024 06:13:14 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/24] Staging: rtl8192e: Maintenance renames and
 cleanup
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240612032230.9738-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240612032230.9738-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/24 05:22, Tree Davies wrote:
> This patch series v2 attacks CamelCase variable renames, removes
> un-used variables and adjusts alignment issues found in
> rtllib_rx.c and rtllib_tx.c.
> 
> NOTE: Patch #9 doesn't completely resolve CamelCase violation as the
> correct abreviation of megahertz is MHz as called out by Dan Carpenter.
> 
> Thank you in advance to all reviewers.
> ~Tree
> 
> Changes since v1:
> #09: Change bforced_tx20Mhz to forced_tx_20MHz, and update commit message
> #21: Update subject prefix with 'Staging: rtl8192e:'
> #22: Update subject prefix with 'Staging: rtl8192e:'
> #23: Update subject prefix with 'Staging: rtl8192e:'
> #24: Update subject prefix with 'Staging: rtl8192e:'
> 
> Tree Davies (24):
>    Staging: rtl8192e: Rename variable bHwSec
>    Staging: rtl8192e: Rename variable bIsMulticast
>    Staging: rtl8192e: Rename variable HTCurrentOperaRate
>    Staging: rtl8192e: Rename variable HTOpMode
>    Staging: rtl8192e: Rename variable bRTSEnable
>    Staging: rtl8192e: Rename variable bRTSBW
>    Staging: rtl8192e: Rename variable bCTSEnable
>    Staging: rtl8192e: Rename variable bRTSUseShortGI
>    Staging: rtl8192e: Rename variable bforced_tx20Mhz
>    Staging: rtl8192e: Rename variable bPacketBW
>    Staging: rtl8192e: Rename variable bBroadcast
>    Staging: rtl8192e: Rename variable CntAfterLink
>    Staging: rtl8192e: Rename variable bUseShortGI
>    Staging: rtl8192e: Rename function TsStartAddBaProcess()
>    Staging: rtl8192e: Fix alignment to match open parenthesis
>    Staging: rtl8192e: Rename function rtllib_query_BandwidthMode
>    Staging: rtl8192e: Rename function rtllib_query_ShortPreambleMode
>    Staging: rtl8192e: Rename function rtllib_query_HTCapShortGI
>    Staging: rtl8192e: Rename variable bUseShortPreamble
>    Staging: rtl8192e: Rename variable bRTSSTBC
>    Staging: rtl8192e: Remove parameter bIsAmsdu from rtllib_classify()
>    Staging: rtl8192e: Remove variable IsAmsdu from rtllib_xmit_inter()
>    Staging: rtl8192e: Fix alignment to match open parenthesis in
>      rtllib_tx.c
>    Staging: rtl8192e: Fix alignment to match open parenthesis in
>      rtllib_rx.c
> 
>   .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  16 +--
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |   6 +-
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |   8 +-
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |   2 +-
>   drivers/staging/rtl8192e/rtl819x_HTProc.c     |   2 +-
>   drivers/staging/rtl8192e/rtl819x_TSProc.c     |   2 +-
>   drivers/staging/rtl8192e/rtllib.h             |  28 ++--
>   drivers/staging/rtl8192e/rtllib_crypt_ccmp.c  |   4 +-
>   drivers/staging/rtl8192e/rtllib_crypt_tkip.c  |  10 +-
>   drivers/staging/rtl8192e/rtllib_crypt_wep.c   |   4 +-
>   drivers/staging/rtl8192e/rtllib_rx.c          |  45 +++---
>   drivers/staging/rtl8192e/rtllib_tx.c          | 131 +++++++++---------
>   12 files changed, 126 insertions(+), 132 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

