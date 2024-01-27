Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD32D286AE
	for <linux-staging@lists.linux.dev>; Sat, 27 Jan 2024 16:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706373903; cv=none; b=bfRwGLwPjOFsqyATuuIuV8GxglxvJG+bFFpdNoQV7clU1qBSd0OmFb8NNIEtn6sqEHDVyfiMNREAiNLfyXvo3m6qwwslEkn3Ow6xXKz1JI/tjAf2KSQUa7v6OZwZlZNq7zVB5n7hj4MO1aFsMzRKzKYgfHSkwu39qnmpysBj/QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706373903; c=relaxed/simple;
	bh=vlJSya6kj6cZK+MaTAsZGZUCQE+8ZFDxHmkcOPqrWSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CHnngZJnXzaqw6jyeX/qM31PPRFnaEl/DlHAZ2BuU6TA9kfhkbv8ER2Ezlw7eiS5QaQ1d8pppnuWn132JmYv2YxX7dThtPGHpgJoE2MqA8Yh8RToeyCKj6mxgXF7Pk+QUAH10JWCFddOE5sJ7EhbLTf2MWK62E/13hzzCWyo0Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GT9nxXN5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GT9nxXN5"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a28cfca3c45so43071666b.1
        for <linux-staging@lists.linux.dev>; Sat, 27 Jan 2024 08:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706373900; x=1706978700; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+rNic9k0UXeI7BVMKejsL/vLfG93AW2nOVjIf/o5qc=;
        b=GT9nxXN5+BtpzVuFJmFlpH8Pg++grRfpHDbp/eENr9scrC23h4jdOVhUSQEAEadluS
         4j7o4qhYW9sIlOKRztsVpIaAt2am0XOAnSU4lixZFR0NBvahfJ3TDlRl21Pmsn7IJ01N
         ClzPjmFoY94BSy6P4NeO0W4Yt3CQwB871Mj0Zg04Kyf+TvD5rNXlnZnC0EFoV2QifmhU
         eBrx5ycJ43f2vYD5j3MBQs8KiKIqfFLG9YYZjSMiZ/FrCJJVP0OcoGByCPABTBl2Bzc+
         8qAIbr5Z6fEC+y1P2j7EmW4qh8eczchSux4j+tAkcIInfXiNwPEF3LnYUZZAC0ozActD
         MI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706373900; x=1706978700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+rNic9k0UXeI7BVMKejsL/vLfG93AW2nOVjIf/o5qc=;
        b=Pyc+iEkmcLIEhuxPoAbqm51JcA4DCmEPBeeD0bgsYWk4EhSMCwUoITteCXx8KyM/BG
         qQiKnhWoI1kNuWcaZOtnERanvDMlc7vHQdbaVy8eK4+X3rR8XaaxloOnC6y8cxjCMWJd
         fAt+Z1cfhwqY3qWvfc7o1WJPtPyHuoOE1B7pHSnJEpQmFpPOSwp32iSsUvixNaONGbiw
         1lPpiqqUTHXjs0cf5jCTwvxDeHsPGV9IcPQ27bAuV+OqzxRRLWeYD8WI54PNYm1OmIvY
         qkPSJEzxtZ4ZBYlQfpm+PSK95F573gF2pHqi5PnqA5bl2sv3PkswjZ4wGZRIc0s8o/f4
         e49Q==
X-Gm-Message-State: AOJu0YxB2U5bIvmh+MWzQfgpGmwCUqjvBuXGZxy03L1x4rckDG0mmt5v
	SsXYxLSo1ZZv0fU6YsB+lCeUB0YnxAegrStl9TeT5f6Kp5E2ueMJ
X-Google-Smtp-Source: AGHT+IGHf6eI5YrKJnU2uVmBzVLFMNBBY2NZxJ2qqKnNsAmfStOnKjPWLc4TEZeEa3+J5NIhBiWFIA==
X-Received: by 2002:aa7:db56:0:b0:557:e527:f799 with SMTP id n22-20020aa7db56000000b00557e527f799mr1582572edt.4.1706373899626;
        Sat, 27 Jan 2024 08:44:59 -0800 (PST)
Received: from [192.168.0.103] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id fg14-20020a056402548e00b00558a1937dddsm1750567edb.63.2024.01.27.08.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 08:44:59 -0800 (PST)
Message-ID: <6f13d58a-f072-49dc-a9bc-f742550fc9f7@gmail.com>
Date: Sat, 27 Jan 2024 17:44:58 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/18] Staging: rtl8192e: 18 Additional checkpatch
 fixes for rtllib_softmac.c
Content-Language: en-US
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240126223106.986093-1-tdavies@darkphysics.net>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/26/24 23:30, Tree Davies wrote:
> Version 2
> 
> Another checkpatch fix series to be applied after the series titled:
> 'checkpatch fixes for rtllib_softmac.c' submitted by me, to the list,
> on 1/5/2024
> 
> Thank you in advance to all reviewers
> regards,
> Tree


Is working fine on hardware.

Bye Philipp
