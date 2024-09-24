Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F43B1459F7
	for <linux-staging@lists.linux.dev>; Tue, 24 Sep 2024 07:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727162972; cv=none; b=DxwWLJilefZvZSwjabbWNZvavdJQLnolmtCPWUUKp7acYRscNkJ7oR7ScnnXjf0Pptz5F0wkWKI6lJPI7CXu1fvaDhygcZOk+CFXReXuKG+cKEXRnZdHKz4AYCtMrpOt4XimO/kewecEt/BDHfMa7fTbgAG2ygAe6/b3y63Ojl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727162972; c=relaxed/simple;
	bh=bdfe7Cuzf6jJR6NNie87+oWb7GwEUA1hPpYV/CgkhLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DgqDOEx8Lo8e+nK/26Jfs1RRlenfwJLPQ4/+TsalwM97RRNMGYtkeHh7jDeFqWQhy47dhDkt6MrTuFqpOrEIfmZicoO/q6Xy+bV//PHf/JaZpnzR2mi1a4G4vPU850M4XmLNLZSbPVLH2DjhB14kGjSlq/8qn0uP1MlpJ0ngRgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTbDWIA0; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTbDWIA0"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374b25263a3so3072280f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Sep 2024 00:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727162969; x=1727767769; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yo1mS2Gxaji+018g2A6G7xeoC5xiWa/YSe/fFj1Tl10=;
        b=TTbDWIA0p+btkuM/8MFH2GrNpq4cuikEqUCCjUZN6lDt//Xc3veHuQFYxWz7SJnDI+
         Hm8K/NMnYKum+1HCG+/tGAUHE3vx/iUN1t/CAj6Y48PintS3PTnSIp20DYdTMDH+H/E4
         XN6A1aIPbtrrNpZjgzz0+xx3z4YDc31Wn387YGQZRTnowPZvGFfe4pGNjrbYTFyoylUi
         bUi130FyjTFmsyvyoDtDBGLUSo5ctDCdZxY4UqF//uZt69mtDrKGhgtybvVpQNevyfqX
         8A6mO6vm4DEV/wiUeB/dXre0SgZG8sCs9+sT1qzphC7pHbLL8Y0+6XF066SZnLWinHyL
         ooCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727162969; x=1727767769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yo1mS2Gxaji+018g2A6G7xeoC5xiWa/YSe/fFj1Tl10=;
        b=oflFfNDAwUHN3IXZP1jAzk4ZxOAAnZpiNeNjmv4m8ySQPEV08gTqtahAK1wustt9GU
         Y+5fCBKF+DtdHtMuaWU0qwmbpF5ZQt0HdQ8DCeXE8Tgd4RMyoir5CZUa1wWFFDRtxqKg
         HbfdHXgq5aHPeDUmTJdQsCEDK/o9350/OTufTWM+TQC6RZ8hHgtN8F+aHNvcrZnldAwF
         neYsKJRhb2R2eAlYBl6WPI3eO7TzqAuj0xd1i3ZzitczjJTm0U4LYGpHMF7LE96YHKaK
         hmIn1x8Q/9Ja4qBWxj3PSTb54K6wgt+jX6uDouE1aRuuenaxaJ9accq9o9E8yZpKffCL
         jmjg==
X-Forwarded-Encrypted: i=1; AJvYcCWjVHl3qTPj/yEYj2J5oeSOQCHsmo2W5/uzWJtDza+IPygFQ++qV3sVuZSx/ITYkLBo631Slk38j9nt3mf8@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3ddbh+mqoNtHUzvAsI6OUY4tAPZcxpNVNXtfxV9GmDyayYg4Z
	kBa+uVG0RnNUiec48ZkmdlRd+4Bm8CYODfOzZDxFRlhh/EklG5jn
X-Google-Smtp-Source: AGHT+IFP+Lr89ljxEKnx3+A0G3iu61RNABeeHjmhJottU4t0/ALJfPNzbkKG6o5n4Zop7K44Cffz9w==
X-Received: by 2002:a05:6000:4388:b0:374:bd05:a074 with SMTP id ffacd0b85a97d-37a4b4cb42dmr5572754f8f.12.1727162969355;
        Tue, 24 Sep 2024 00:29:29 -0700 (PDT)
Received: from [192.168.43.183] (dynamic-176-007-004-024.176.7.pool.telefonica.de. [176.7.4.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754a6379sm148735085e9.35.2024.09.24.00.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 00:29:29 -0700 (PDT)
Message-ID: <c20e4935-faca-41ef-ab66-09199b38a6d2@gmail.com>
Date: Tue, 24 Sep 2024 09:29:27 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] staging: vt6655: Rename variable iTDUsed
To: Xingquan Liu <b1n@b1n.io>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240920162025.31465-1-b1n@b1n.io>
 <20240920162025.31465-2-b1n@b1n.io>
 <e7bfce0c-74a4-4c0a-9930-a3fe9d5ea5fb@gmail.com>
 <D4DNIARBI7Q0.13E9XY3QTDIW3@b1n.io>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <D4DNIARBI7Q0.13E9XY3QTDIW3@b1n.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/24 2:09 PM, Xingquan Liu wrote:
> Hi,
> 
> I'm a bit confused. Should I rename struct vnt_tx_desc 
> *apCurrTD[TYPE_MAXTD];
> to curr_td?
> It looks like 'ap' means array pointer.

Hi Xingquan,

yes I think so as well.
This line shows this:
priv->apCurrTD[0] = &priv->ap_td0_rings[0];

> 
> For struct vnt_rx_desc *aRD0Ring;, where 'a' doesn't means array, should
> I rename it to rd0_ring?
> 

When the "a" does not belong to hungarian notation it can remain.


The following is just my personal opinion:
You can keep working on this driver and your patches will remain in the 
git. But I think I will propose to delete this driver. Reason is that it 
supports maximum 54MBit/s and the connection is always weak. Its form 
factor is mini PCI that is really old. I use an adapter from mini PCI to 
PCI to get it into my Desktop PC. It furthermore is not buyable anymore.

I like to focus on the hardware that is really well useable and on the 
market available:

For example:
rtl8712  (r8712u)
Backard Bell: AW-NU120

Thanks for your support.

Bye Philipp

