Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF5538F98
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 19:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqztBe65"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9ae3d7eb7e0so92048866b.0
        for <linux-staging@lists.linux.dev>; Fri, 06 Oct 2023 12:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696619071; x=1697223871; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Eu4wF2/IYoKy9UH3IkMZDQw3vL3PojhT6UzwC/bQBs=;
        b=aqztBe656roKyqHBbVzek+hUD+HJR9+Da6d4zyNYUcuVvHSs3yhFMjBpG90enjPid7
         YXqzmEDp+Nts6dAPOFI73ocigzALqS1MM6J9gkobYseIa9Se76F6TEPS35JRhqxTSLzA
         zmpXUwybAWshsUvFcgnhz5tZ0NsZ0R7TAY0Zzoan+Y/+n1Q6V+HMr56ImsMe+MEPJXiQ
         Vh85k97uyOzQoPHUMydx03KzR4+ijB04IXQZWTqb+T3LfyRZDovtpNcYU3camN1BH4+y
         x1koyYeb+hKU9ju9m9kT74QS+7l4fqYs4nQxreu4KZY22VjhxYoZN686o221UvCArTYg
         apGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696619071; x=1697223871;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Eu4wF2/IYoKy9UH3IkMZDQw3vL3PojhT6UzwC/bQBs=;
        b=W9iSEtGZ3mRkErfx1y0LwTSQOW4YPXoSseBHt7yqAdIetB4D+3UwYf6DvhBNgwbKK/
         pKxW5uHNOtx6xMYRAp3rT9z49lQ/6kIeZKPj+o7NROL/e0zlafgPRf6LYyKnF9WEOhi8
         AoT8iQC0Pp2PwhJqkr+F1x/U35i55hQnlzyv4kRJyIw8CQ/sU35rcd4fSxaZ/gcybf5x
         BMNhFXYjg0ZLk3r7sCDMlkS1Ojh+sAWgE0QOYhAtvcjcc/MwVyLtzv/ktBdHv7+YIU35
         2pps/UPvWUTrIH1jKRem/Cd6KE72pClrkQySyX4tJhFOQ//Zc1IazKS4wNDp7XOdtIgz
         RJEQ==
X-Gm-Message-State: AOJu0Yzd7oIRZmJVxeQgM+rRsBvhlDRmgR/bFjrvJVWgbRtULTOH4sTQ
	C4nLKLNy6YcRzortSEz0R6BAbGQCjmM=
X-Google-Smtp-Source: AGHT+IEIIwF0bbR6veI9TiOA0mHMQOF0jB6Fo2wpY0RjT2X0RlYRBCw8jTWk6NRtKSKTcae7tMJtfA==
X-Received: by 2002:a17:906:100c:b0:99c:5711:3187 with SMTP id 12-20020a170906100c00b0099c57113187mr6705865ejm.6.1696619070743;
        Fri, 06 Oct 2023 12:04:30 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id qb40-20020a1709077ea800b009b9af27d98csm1876680ejc.132.2023.10.06.12.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 12:04:30 -0700 (PDT)
Date: Fri, 6 Oct 2023 21:04:28 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] staging: rtl8192e: Remove last private functions from
 iw_handler_def
Message-ID: <cover.1696548527.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The Linux kernel authors consider "wireless tools" package deprecated. The
"wireless extension" is also deprecated. Remove private functions of 
"wireless extensions" that can only be accessed by "wireless tools" from
driver.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (10):
  staging: rtl8192e: Remove function _rtl92e_wx_set_force_lps()
  staging: rtl8192e: Remove function _rtl92e_wx_set_lps_awake_interval()
  staging: rtl8192e: Remove constant variable reg_max_lps_awake_intvl
  staging: rtl8192e: Remove function _rtl92e_wx_adapter_power_status()
  staging: rtl8192e: Remove constant variable ps_force
  staging: rtl8192e: Remove function _rtl92e_wx_set_scan_type()
  staging: rtl8192e: Remove unchanged variable active_scan
  staging: rtl8192e: Remove function _rtl92e_wx_set_debug()
  staging: rtl8192e: Remove unused variable rt_global_debug_component
  staging: rtl8192e: Remove unused file rtllib_debug.h

 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  11 --
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |   2 -
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c   |   3 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 145 -------------------
 drivers/staging/rtl8192e/rtllib.h            |   4 -
 drivers/staging/rtl8192e/rtllib_debug.h      |  49 -------
 drivers/staging/rtl8192e/rtllib_module.c     |   3 -
 drivers/staging/rtl8192e/rtllib_softmac.c    |  11 +-
 8 files changed, 3 insertions(+), 225 deletions(-)
 delete mode 100644 drivers/staging/rtl8192e/rtllib_debug.h

-- 
2.42.0

