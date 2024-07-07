Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6D9AD4B
	for <linux-staging@lists.linux.dev>; Sun,  7 Jul 2024 06:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720335120; cv=none; b=YBje5f3MgsAae8bikoLfwYOQknuLtAauk9Gi28kdv2hxRhCHWpM0xzS8N15V7uZrxQ89pUnfvvfpSAtkKVhLy8SP/BwAyxQQln3IE+NyI2Is7f+edtPkRTVcsqRuvQBtLM44anB0VjxLG/dVQdTxeEdccpuS3u8KQNIg+hMfhT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720335120; c=relaxed/simple;
	bh=L4WoQul3N5LS7PJxrWssweaVbAa+vK+j6cEzfVUg2So=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T3Nx9zlCqAzv9vk5CjgFr0v97M7sofIub1X+ijXCOGHIm0Yw45Sm3aHmyjiMPTg/NyffZfP4pgHvKq+ks7POffOq3qA+jsHoBdOQ5ThxP8tv6ifuTzLdq810Ft2jYtbTNZcsxGEUzWAYJVPyHWnE+3mU4vaq3DWmcC3JV/fi+4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiWRWHPg; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiWRWHPg"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6fe49699f7so27617366b.2
        for <linux-staging@lists.linux.dev>; Sat, 06 Jul 2024 23:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720335117; x=1720939917; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6XOOmKwyPR1K1bWeX1bkuqoM5NDjvh/8+FGEvea0Jow=;
        b=hiWRWHPg3zmxe4shOiFu+qN9RAC87MA3GeShwhHDAgU4tOnnqIuMmDK1qdwJNksT9x
         HlDcc09Ap2f98lJPx8V9Ps1CGTTrZI+LUkeuc1DQGztJbYKnJL9fRNATtsAwhMrgtBqn
         4xSRKjRWaLQ0Yf+KV/CPRH9bScccvsCTIci1D9VxmfVzM8KuXYmtaf124DaL0TmM8AQ+
         q/TB7gBk8NeKUHI4JT+9fRwDB3QyrAMBU0wnu7tK/cIA9OYvbrOThtt0JD/FERVdZuyv
         hHqKcP24PAB9bEpmZwDV6pQk8ONFcvvZ2a9j9iepN/JNtaAg6/XAoqFsmnORD+rUIA0n
         0EYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720335117; x=1720939917;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6XOOmKwyPR1K1bWeX1bkuqoM5NDjvh/8+FGEvea0Jow=;
        b=eJCHZfkOmtYtJOJam7O3DsUPcKXUR4Ffx2/ssycmP7yml40zPRt+l2rp81EmRK7ANg
         wYCq0m3uyAglYlVD5vMPClXEbJ9WUPybJdyMkfh5vvzQFtpJZLU7t7WjncjDlwqGpblI
         0j2+mU+mqvPonRZbWNQ8u+t5UChVVxTsHqMwO+BpFXIfZ70F65/NGhSs3fq2XETRc+c5
         Zh5UlCEhIfWOHrXJjdpBG0x1Ko2ZCbUZf9ka8ZzPi3QkFrPNTk8UUuMajzdoBgopCNbH
         /H3XR9sTv8ZigJD3S+pzvfxLZd/59fiDdN+D62u/fxuXIRLCZHAfdh6NzwIS3XKTp9N0
         1E1g==
X-Forwarded-Encrypted: i=1; AJvYcCVPskdkMYSSOmKac4eqz3jTnklvFKEDrhMZ9XJtgucaR4k5ImuOo2YyxXmI8Qldbwr5NLVILStVxdweSPMjcP7xNuOdOW2A1rlqD/hQ2g==
X-Gm-Message-State: AOJu0YxgwfciJhnRDAobnO7UcOyHmMFvDukqYXR2vZN+WiKDlQIPQziK
	aZKXhJJXCC2NWwxMLOFFg5Q6Zp1/itGkhzAasffOZ+IZSQltq/wL3KNBXw==
X-Google-Smtp-Source: AGHT+IEiED1MqeinvizuswuqGoOHbKZeca0Haem6CX69FMhsyBn/byEZw5xQMR58wYUJAzHA0KBbyQ==
X-Received: by 2002:a17:906:7f0c:b0:a6f:186d:9e9f with SMTP id a640c23a62f3a-a77ba727942mr595413466b.5.1720335116417;
        Sat, 06 Jul 2024 23:51:56 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab065667sm822029966b.114.2024.07.06.23.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 23:51:56 -0700 (PDT)
Date: Sun, 7 Jul 2024 08:51:54 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/13] staging: rtl8723bs: Remove unused macros starting with
 hal_com_h2c.h
Message-ID: <cover.1720245061.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused macros.

Anyone who thinks this can't go wrong is mistaken. Some of the macros are
double. I checkt that those are with the same value. However this is
a manual process.

Tested with rtl8723bs in ODYS Trendbook Next 14

Philipp Hortmann (13):
  staging: rtl8723bs: Remove unused macros in hal_com_h2c.h
  staging: rtl8723bs: Remove unused macros in rtw_ht.h
  staging: rtl8723bs: Remove unused macros in hal_com_reg.h
  staging: rtl8723bs: Remove unused macros in hal_phy_reg_8723b.h
  staging: rtl8723bs: Move last macro from hal_phy_reg_8723b.h
  staging: rtl8723bs: Delete file hal_phy_reg_8723b.h
  staging: rtl8723bs: Remove unused macros in Hal8192CPhyReg.h
  staging: rtl8723bs: Remove unused macros in Hal8723BReg.h
  staging: rtl8723bs: Remove unused macros in HalPwrSeqCmd.h
  staging: rtl8723bs: Remove unused macros in rtw_mlme.h
  staging: rtl8723bs: Remove unused macros in rtw_efuse.h
  staging: rtl8723bs: Remove unused macros in hal_pwr_seq.h
  staging: rtl8723bs: Remove unused macros in rtw_mlme_ext.h

 drivers/staging/rtl8723bs/hal/Hal8723BReg.h   | 373 --------
 .../rtl8723bs/include/Hal8192CPhyReg.h        | 882 +-----------------
 .../staging/rtl8723bs/include/HalPwrSeqCmd.h  |  11 -
 .../staging/rtl8723bs/include/hal_com_h2c.h   |  76 --
 .../staging/rtl8723bs/include/hal_com_reg.h   | 796 +---------------
 .../rtl8723bs/include/hal_phy_reg_8723b.h     |  69 --
 .../staging/rtl8723bs/include/hal_pwr_seq.h   |   7 -
 .../staging/rtl8723bs/include/rtl8723b_hal.h  |   2 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  13 -
 drivers/staging/rtl8723bs/include/rtw_ht.h    |  22 -
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  26 -
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  37 -
 12 files changed, 4 insertions(+), 2310 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/hal_phy_reg_8723b.h

-- 
2.45.2

