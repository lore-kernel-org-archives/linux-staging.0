Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAEF358D0D
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768470550; cv=none; b=YekmCtZ1RlP6nFXrCqN+zpaRkV8sg/ogy23r3S/VgDaIUc4luSpr0Dw9XeiGaOp6/CXDkjk1iG4dVBGckistXOWAbKdNVKpY2/az2nOvcbN3sT3k5mohyk1D+WuzmwGyt6cQ3J4ynPx9VACdvK6oHRCsAKyIMxXdRA4UmPgp0e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768470550; c=relaxed/simple;
	bh=J377oy9VhhdpA2dd7kOXfCruY10Zcw8LKBmZSudX4D0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sguBPtEjfFiw3+1h3VXrvgetEEmJPiMG+y7VPqjytve/BUxC4YNArbom8gRlqQ0sVamMrRpyGSVNLJRoCkOegbEfxnD0r41lT/uW3zoUQOqW2BA7KqUs8DR5QsOliGCJR9E9I8Of/NG4MoRpFuviqCLh2RdcIGheKnPltf93eek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ly3IF3qI; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ly3IF3qI"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81f4ba336b4so640620b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 01:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768470548; x=1769075348; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bHWmrnjSkn0UGI+/KRSCgn4MXHFhAXdNHnPcVIFSrGU=;
        b=Ly3IF3qIsTUWgLr5R8BBZJK0tZfz3dgS9aO5GQ+lILHcrpic0c4Vnbpir9kQv/ZtB8
         611YvRr7uz2guZPJzeXx3VMK2+0T7MoEaN9cvQJWJh2uXfCOelRcZdXvrehkgcr27Ovz
         YKNA7p5jDbNTUS9MmWiRWOoggqViGFWif7AGgk8djmH2NTrnYmdnOLPzyFJEJ++AhJcB
         Li1kk7+HcPZ+uYnKeTL8fXs6NFmX6Ntl6zqd64HOuHUDzJYj1jdHFBRZcCAgqjFy87kl
         pw6jiY/hxnGiTSwAWBfDLKuozpRL+HhKCAsuxy1R8cjkokProRiqxXO1dOOfJzhIDkE4
         aQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768470548; x=1769075348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bHWmrnjSkn0UGI+/KRSCgn4MXHFhAXdNHnPcVIFSrGU=;
        b=CbwG2ZYbeaWX1Dp4CytIBXds6Pfvdwc17f/ewF0QtplBi8QVOJ6Pmce0/w49zWMzNC
         +EQwhuf7uwkKBn2yQ5vG+eEJJE5fzzz072jeFW0lQe8oPN7oCdGZdGE9c1ezLPVZEced
         I2HmZbqTbo7rxXpebRXUuGQg3eQpvIb7IYvKu40ylsg23EIddwHXyzQ8OEfsJrm1C9T4
         u+MKIyuLJuqCua9W0hWhCaCCZE0tTcxkgaLj9YkTCVsBd5Gbe/nkC0/2C4VW+dqZSolA
         g8nzItQxvl3nauz+xSJNWxBBGw/5XqRzXFaWhFGZIwzEE6v1N/k81iXOA2TQFO+p3agu
         k3KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCa6UU0vPoxvIs+fseYnjDXeWGi5SIVZv9JqU2zaXyHDsZLYo02VtaXH9//Szr8cRHyfaCFjmgYQP+ILl2@lists.linux.dev
X-Gm-Message-State: AOJu0Yyes3XuLDTgKs0LEUuZz/JIym816DPH38rzMQwvDU9eQ91h3ux0
	cSVJ87ev1zXZvWXDeGBp9Kh8I+DtnA5Tx3e87ngMNi9UuN/31Zen0Dum
X-Gm-Gg: AY/fxX73AqPHOFPcEpyT1atY7scj4R5RAxUEYenU3lnTLwoWNtqoWi2RLURNBypPu+o
	Eiiii4bmSJT62hsA0fCrVufpAd+I3R38DgSAo53c3JRDoyJ15WT1p2L81+/34/Rv0vGufAmLrJr
	evUnOZklpPK7wI5GNrTuBKe3rAB2COmhvkTDD/tzGqp5MLnCdIy/+TtJWx4cSaka7VXFBsW/ojg
	iYLKs30yBFaFwPwvfXzZtG2nzPsCragS2unYUM09N6dP7ZBywUHksujNOXGKP7/xdVmR1a+vaJe
	el+VVSGCWi63uuNZ/fz+ahCNPmdz5XMq3gscEGV7+q1abbbjHGCN7tn7x2qZZVv2VGcFIVX7a1r
	lW52XR092yp39VKSPoQBRrKreesAnhBivOxNMEOQ6EaaE8QzEk/IBbTldtpSj9rFEliaLwnpyTF
	qPmn32AGYVp5Eb62ebwneAJTNfqETOFfJtPps2QQ==
X-Received: by 2002:a05:6a00:1d0f:b0:81f:22ca:257 with SMTP id d2e1a72fcca58-81f83c99a8fmr5168938b3a.20.1768470548142;
        Thu, 15 Jan 2026 01:49:08 -0800 (PST)
Received: from [192.168.55.101] ([223.196.193.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e64bdafsm2018852b3a.41.2026.01.15.01.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 01:49:07 -0800 (PST)
Message-ID: <b8a8c0c2-fae9-4a9d-a9d1-c74cbe83f4a7@gmail.com>
Date: Thu, 15 Jan 2026 15:19:02 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] staging: rtl8723bs: coding style and refactoring
 cleanups
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com, hansg@kernel.org, dan.carpenter@linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260115093439.7588-1-khushalchitturi@gmail.com>
Content-Language: en-US
From: Khushal Chitturi <khushalchitturi@gmail.com>
In-Reply-To: <20260115093439.7588-1-khushalchitturi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/15/26 3:04 PM, Khushal Chitturi wrote:
> This patch series performs minor refactoring and
> coding style cleanups in the rtl8723bs driver,
> focusing on rtw_xmit.c and addressing checkpatch.pl
> warnings.
> 
> ---
> Khushal Chitturi (4):
>    staging: rtl8723bs: fix operator and type cast spacing
>    staging: rtl8723bs: simplify boolean expressions
>    staging: rtl8723bs: rename CamelCase identifiers to snake_case
>    staging: rtl8723bs: fix line length and alignment issues
> 
>   drivers/staging/rtl8723bs/core/rtw_cmd.c     |  17 +-
>   drivers/staging/rtl8723bs/core/rtw_mlme.c    |   2 +-
>   drivers/staging/rtl8723bs/core/rtw_xmit.c    | 238 +++++++++++--------
>   drivers/staging/rtl8723bs/hal/hal_btcoex.c   |   2 +-
>   drivers/staging/rtl8723bs/include/rtw_mlme.h |   6 +-
>   5 files changed, 154 insertions(+), 111 deletions(-)
> 

Sorry about that, this patch series was sent with temporary and 
incorrect commit messages after squashing.

Please ignore this submission. I will resend a corrected version shortly.

-- 
Regards,
Khushal
