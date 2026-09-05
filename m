Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F68219D07E
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 13:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788614612; cv=none; b=mFRwwDz9XUgZklucNGkBGEn0ykRwvdpwj5B0Q+mMCBkp/Q2u4ZSabQyfl3DMvLGxb861278GttrABjoR8an3hkurjSnsqVL+Zp3aXJJGoPGrZMQ3JbjWSwOF0vSpe2dfNO6Lrs7XLPROKeDrfDOTbTpHfQQ7k1zGueFbYrFiYRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788614612; c=relaxed/simple;
	bh=iWn9W1OIL1OhA/CaXemhC9NEIqgLaKP5iI3k5InSn5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mDe1++S4QUQxKYp5R/p3l70+1x78f5V3YLDCudk0zPEPsFyLYu3EoH5fU/vSVLChQMj8qMfdvwhQuJtT4eyLbi2iab0XAlUxxkgar9zlFn/p3yTeJvqA1g4PxoNOQwQaoD3r/AlAU4WTIxWhJc+cRM/tzGoJQ9ibAT0suFJ/itQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oFlm4wX/; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFlm4wX/"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so2506503a91.2
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 06:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788614610; x=1789219410; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdlPEBeZTfQUIOos7x4qV7HF7Y3mb+yC75HabjlipCY=;
        b=oFlm4wX/RDiBbjhEOUegtd4rC+FdU/0vIuwYF+fz+vRfEQojZ9/4H2xwMFfTz0NjB6
         RkJVujq1ERv8O5OUm5qtlau7DPNS7odCqePQGGB3yu9eiZ0t3Mk0AQyNMb5VDJwpK3E6
         8Sdy5dUzP2YEyhzk2hwug+ll/hxDaXextftOg7iWEim7DcButrqI0tkD7yonYelgj6OL
         J1yE89iIFmhOxTiBrZ+/MQx2jWdIJl023Ut4YsQPsa1uUMHURFOGIbZUioiO9nD0Si/o
         MKxuNvQe4BzHr1sFOIxzY04ARZTjKCCM1xclh5iVmtUWeCCvZZSTIRLAbPrErJLNgv9n
         10IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788614610; x=1789219410;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdlPEBeZTfQUIOos7x4qV7HF7Y3mb+yC75HabjlipCY=;
        b=FuZKPMLzvYkayLWkdkNAV1hWu1P53+pli56rSsV5PM+3BL0evdcA3+aCpON/3I+NF9
         ap/usj21KFn3RU0VOQYAliaiFPSe2dnIX7c7OA+BMEON99RdWjaJEhYzdkZjrwOlZX6l
         lSJKS/4/8zCwVYKWEog0TUuHrDwchb8cg/qPkugqJIyVK8HhYqsPZa/w33kNh+ox0x61
         DSwL8Et5+75DhNPDCEiVim/TxO0ex06PXBA3dJwfX8EOO3JCv8RhZgmLWHJScsP1YL1w
         YjLXiqo7vi0DOAomuJWt2UanvuLQUhSFunJj3Y8G23Sbr9K94avBy0sJrJ1afYStmXKP
         tDzg==
X-Gm-Message-State: AFuF++lE32k8hOxzr+15OPZpxYuIEwiRxicO9gTNwoMlvx5QP7tHi92P
	xBU22hvr7IugECoH8/ute/S2XAjaXT2qlcYI7OiOGatEWeCzjHuIokRF
X-Gm-Gg: AYBFou37JnU+RgevBcFzbGAIX8MkU9zkOehtmoD7M/5GGAHDWvRitXAAeugOcaiOJlP
	SjsjrrwkWG3fy89LousxBGlr8MaGljrNe7VW+OSNEO8RhncGnYIkudKAFHebM9r7CmpvyyuNeQ0
	2y7jF/Zp4ne0DusMEecjqMxxsXMrVbG1cmFLzA2vQnogvJEwTYnW7NEHkteTjH7fWvgl7aV+cQd
	Pp6eELBWjvrdkUIpk0x32LaYNZ+M2TmIPgvTvnYZjUWqTzukvmUlTN4xpOUzY7QnyUggN3b55AY
	TVTkOADBfYsp0YqA5DpWcrmGMZShkqxcaPY51uDcwAzlhxTobQKXKhWrZr/lw/W4hgk+SPz5wIE
	hrr5btmgKhbo8sDwKYZNc7LailSOFcJp6lYjQojNwqh21oJEZW+/8qIDuGG0UTpAjy56omCxFi9
	AhU4dospz4AwtFBAFe7+wchgNsLYhRrMzRQV6ZJVH2s+BEIT1fRlBgbbIHTjhspt4qpmV5l78UO
	7SzqcV4bJ30UfIiLYnKCoTyXQKGtuWHX6YSb7Bez78X2CEXsw==
X-Received: by 2002:a17:90b:39ab:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39b261da75cmr19666531a91.21.1788614610490;
        Sat, 05 Sep 2026 06:23:30 -0700 (PDT)
Received: from DESKTOP-PKFJL56.localdomain (36-234-4-160.dynamic-ip.hinet.net. [36.234.4.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b06cea473sm4961747a91.2.2026.09.05.06.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:23:29 -0700 (PDT)
From: Hank Yang <s950343@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	b9788213@gmail.com,
	guojy.bj@gmail.com,
	s950343@gmail.com
Subject: staging: rtl8723bs: possible dead code in GetDeltaSwingTable_8723B (5GHz fallback path)
Date: Sat,  5 Sep 2026 21:22:41 +0800
Message-ID: <20260905132248.2951-1-s950343@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg and staging maintainers,

I believe I've found dead code in
drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c — a fallback branch
in GetDeltaSwingTable_8723B() that can never execute, since it uses
calibration tables from a different chip (8188E). If my reasoning
below holds, I'd like to remove this else branch, but I wanted to
check with you first before sending a patch. Details below:

    if (channel >= 1 && channel <= 14) {
            // ... uses genuine 8723B calibration tables from pRFCalibrateInfo
    } else {
            *TemperatureUP_A   = (u8 *)DeltaSwingTableIdx_2GA_P_8188E;
            *TemperatureDOWN_A = (u8 *)DeltaSwingTableIdx_2GA_N_8188E;
            *TemperatureUP_B   = (u8 *)DeltaSwingTableIdx_2GA_P_8188E;
            *TemperatureDOWN_B = (u8 *)DeltaSwingTableIdx_2GA_N_8188E;
    }

The else branch only executes when `channel` is outside the range of
1 to 14. This `channel` value comes from `CurrentChannel`, which is
only updated in rtl8723b_phycfg.c after passing a legality check
(the parameter is named `ChannelNum` there, and `Channel` in
HAL_IsLegalChannel() — same value, different local names):

    if (HAL_IsLegalChannel(Adapter, ChannelNum))
            pHalData->bSwChnl = true;
    ...
    if (pHalData->bSwChnl) {
            pHalData->CurrentChannel = ChannelNum;
    }

HAL_IsLegalChannel() returns a boolean (`bLegalChannel`) indicating
whether the channel is valid, and enforces a range of 1 to 14:

    bool HAL_IsLegalChannel(struct adapter *adapter, u32 Channel)
    {
            bool bLegalChannel = true;

            if ((Channel <= 14) && (Channel >= 1)) {
                    if (!is_supported_24g(adapter->registrypriv.wireless_mode))
                            bLegalChannel = false;
            } else {
                    bLegalChannel = false;
            }

            return bLegalChannel;
    }

Any channel value outside 1-14 is rejected here and never written to
`CurrentChannel`. As a result, `CurrentChannel` can never exceed the
range of 1 to 14, which means the else branch in
`GetDeltaSwingTable_8723B()` can never be executed.

Since GetDeltaSwingTable_8723B() is specific to the RTL8723BS chip,
I looked into whether this chip supports any frequency band outside
1-14 (i.e. 5GHz). According to Realtek's official product page [1]:

    "The Realtek RTL8723BS-VQ0-CG is an 802.11bgn 2.4G single-chip
    that integrates Wireless LAN (WLAN) and a network SDIO interface
    controller with integrated Bluetooth 2.1/3.0/4.0 controller."

I was unable to find the official datasheet for RTL8723BS itself
(only for the related RTL8723AS), so I also checked the FCC filing
for a device using this chip. The TX2-RTL8723BS user manual [2]
lists an operating frequency range of 2402-2480MHz, confirming this
is a 2.4GHz-only chip with no 5GHz capability.

[1] https://www.realtek.com/Product/Index?id=610&cate_id=194
[2] https://fccid.io/TX2-RTL8723BS/User-Manual/User-Manual-System-pdf-2365682

I've verified this logic by tracing through the code and cross-checking
against the public documentation above, using an LLM (Claude) to help
organize and validate each step of the reasoning. I don't have access
to RTL8723BS hardware, so I haven't been able to test this on real
silicon — this is purely a static code analysis.

Is this understanding correct, or is there a reason this fallback
exists that I'm missing (e.g. some legacy support I'm not aware of)?
If confirmed, I'd be happy to send a patch removing the dead branch.

Thanks,
Hank Yang
