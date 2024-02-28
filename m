Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6073186243
	for <linux-staging@lists.linux.dev>; Wed, 28 Feb 2024 20:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709153688; cv=none; b=estb4pxgptNgFE2VD7qrEVWv13otX4UefHClaU5iJHHQAOVCB8Npm/dZj4LxTZDxEDewrYwWWbhqqtWRCW2oY9R8hm1MBNw/mzyvydLuRl/D5Zzz+Xqdyf9CNk/kDZKWTj+dcIBaGO9boI0vINXf9J9xd6N5XBHtToFvNgoFrQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709153688; c=relaxed/simple;
	bh=lzfXTZX9BZm0o6MiEqD1Uju9dODam46W/LA/7i7rJIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ACVi794NXzaWOx7X4Ncn64/EVFLsCaifeoPpDVWJdL41dIeSe1HO/1ZxyQeluT12qpjhgtG0RWjCrLUjpb5QwhZstcUo2B4dFShNSXC6qbX4u26kBpmC05/NZ8Z0tIGXZDuI7Gi/yl66TEXJQ/pTNARkd5Zb50dHE4JNqn8CRsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjwGe53p; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjwGe53p"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33d855caf7dso47036f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Feb 2024 12:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709153685; x=1709758485; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wrvSsn2Y3JHcwCC94OejcIaNxty8KECgxaLyHkTIkcY=;
        b=JjwGe53p8WkbuHqx2tDkIFwky0EjH2qCvBdNeeqXW+vKgRf83lSDy4ThxscaN2qlO+
         oFusj81cUhUZnbzVzPN1CwCO5r2Uhb54Lu4qRkqVhO+uc0DolX9TZk+Xqhi748myPbJP
         7COo+GA9CfrMgkwrKOaQzJL31VWSsqrfJmZC1QV2x4gFsRPOjfqqOK8zFcs3yoEs6STb
         bSP4/E3llMShHzoegOhVCf/nbiPAAAI96HSCeNp7yrInF7JKaU/veQ9PhY8klyO2yrQv
         rc9jUMGLwyQCfEKVvwauTj9kp6rKHGEc1DZtK/iaxcNffXVrpv0BLiFGMqo/732HfMf+
         bn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709153685; x=1709758485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wrvSsn2Y3JHcwCC94OejcIaNxty8KECgxaLyHkTIkcY=;
        b=FF/0eR2H2VtnbcdtnlTCtnvrrjJXrAVsrAzRec5fi/JS+0/Mj/lGb8myQfTJBwBEE6
         hWPliTvU+TNkSVFhB1Evi1Vm5IZG2MVcCgqZK2VskDw+wjrKEsbUvYYPWCjDaflEu0t7
         6jLwxBl1lcyoPZwDmGaeaSeM1TsTPgNpDa1lGHoMI/hTKtNxsfXdmZ4L9E0YjLmrU6XG
         8C0boTub3ePyLoQsr/94z+CJ72CwZlgO8jb8mUcB+shtnUea12/czOmFyNlrmmb74bHS
         uoaCfIg7IO5/CR1Bv5zTtiV+l2fjW7WHQpUiUK7l5dYB6DysyXYQgZm0CC3tJM3IDGHE
         5H1Q==
X-Gm-Message-State: AOJu0YwDajndO4G8UFbtMsJ7e5iY3Pn/dwRzWMMr0RKFXPv8NODv6/te
	pE4CugWyd8KtzCa9TdeyOlORcrtR3448pEBY/APJ0k4Ozu37vAui
X-Google-Smtp-Source: AGHT+IF2eAIUySWsP2UWaicEjzVUgQSBy609mW3QinTfuUseDGuRlZT/sba3etEew200ingFJFEPbg==
X-Received: by 2002:a05:600c:3ba8:b0:412:b2af:2632 with SMTP id n40-20020a05600c3ba800b00412b2af2632mr296571wms.0.1709153684492;
        Wed, 28 Feb 2024 12:54:44 -0800 (PST)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id e9-20020a05600c4e4900b00412aff7874esm110765wmq.48.2024.02.28.12.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 12:54:44 -0800 (PST)
Message-ID: <ef46a014-279c-490e-bbe1-df4697415d59@gmail.com>
Date: Wed, 28 Feb 2024 21:54:43 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Staging: rtl8192e: Sparse warning regarding variable
 declaration
Content-Language: en-US
To: Ariel Silver <arielsilver77@gmail.com>, gregkh@linuxfoundation.org,
 yogi.kernel@gmail.com, dan.carpenter@linaro.org, straube.linux@gmail.com,
 garyrookard@fastmail.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240228072553.11740-1-arielsilver77@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240228072553.11740-1-arielsilver77@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/28/24 08:25, Ariel Silver wrote:
> Fixed sparse warning: "'dm_rx_path_sel_table' was not declared. Should it be static?"
> As dm_rx_path_sel_table is used only in rtl_dm.c it should be static.
> 

Hi Ariel,

please use checkpatch to check your patch:

File Nr: 0    Patch: ../../../Downloads/20240228-[PATCH] Staging_ 
rtl8192e_ Sparse warning regarding variable declaration-14757.txt
WARNING: A patch subject line should describe the change not the tool 
that found it
#1:
Subject: [PATCH] Staging: rtl8192e: Sparse warning regarding variable 
declaration

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit 
description?)
#7:
Fixed sparse warning: "'dm_rx_path_sel_table' was not declared. Should 
it be static?"

total: 0 errors, 2 warnings, 0 checks, 8 lines checked

Please make a v2 with change description under the "---"

Thanks for your support.

Bye Philipp
