Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9FB2906
	for <linux-staging@lists.linux.dev>; Sun, 17 Jul 2022 22:20:06 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id w12so13042618edd.13
        for <linux-staging@lists.linux.dev>; Sun, 17 Jul 2022 15:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Ni55GkXtmz8IMGDR+CYFgP4mhPfwYhJDFZvT9kJS8E8=;
        b=WknUigVXY6JBY8Bww8UFrLPLQcoccIcD9UolgQxtD0vetPaYGWVtwCbbHofwzfiN7T
         /xg+qE9uSysumbJRflR6/9IbveUeEZo2RSFPsXHG9rb+I2KuQ047poOoKJeRxwjYMNXz
         +f9a9hid6vI8nw8P667mhd0WxlvyltgMyg3aCYZf91SugmY7kHHkCSQh0OwPdZjHfMKF
         erYOIA8X1pCvqfWj96dgd8U7z/Ih8KpvrrUkgsqk6J7RQdL6hjgVssG4LfAgLsX+pXus
         IUYFGAgGM3kxdHvfx3SIePVkk3qyuHoXH06uvlim5seVDwDCZaHDWMVUOnaN+1O8kGcZ
         /xMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Ni55GkXtmz8IMGDR+CYFgP4mhPfwYhJDFZvT9kJS8E8=;
        b=oMamQkNSaIbgcwO0UNPPj9k6wvGiffumQtP2PyVaDgztMSbRAKYYMki9arIRKonsF2
         LCRnUTqVDRh7fgtRSiS0bhzqvJvqQXR/qbM1nWJ9Xi8We090dMrbJXFgG6qH5uEx8ZTp
         8veP8/ZfrDu0k5Q72HV2gaz8PFP/WnDMjSgDniUdvx3Wq4eaD62SyLFDqYDNubXk86Qq
         DATfKHp7dTt5uzPqDY4rTRN9n8cx9j0UBbP7WNKy9MjzjZkF6xPfebAC50xE8MCP3Teu
         InjcCWA7ysxaO2Fqwf2YlIwygeJyiDz02YcUGGmAKr2WK5mlqOHoegU/qGIw4T/1SRNk
         BFwA==
X-Gm-Message-State: AJIora9xx2MhA88taGAO+R4sdd96CJCB+SUIt/XWNItmRyoys1xPGn/c
	MDVqGrZ4VE/SC6MQuF9PRnFtP4zBqfA=
X-Google-Smtp-Source: AGRyM1s3ojKoZr+Z99ifHNLSI9ov8Mbs9MNOpe0WR1ax/vvK4eQYy+qMKHWHDXIDxvWpS5/gfkk2Mg==
X-Received: by 2002:a05:6402:1003:b0:43a:75d8:a0e with SMTP id c3-20020a056402100300b0043a75d80a0emr34028761edu.303.1658096404863;
        Sun, 17 Jul 2022 15:20:04 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id n23-20020aa7c697000000b0043a71c376a2sm7445710edq.33.2022.07.17.15.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 15:20:04 -0700 (PDT)
Date: Mon, 18 Jul 2022 00:20:02 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] staging: vt6655: Convert four macros to one function
Message-ID: <cover.1658094708.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert four multiline macros to one function with parameter.
checkpatch.pl does not accept multiline macros. 

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

Philipp Hortmann (7):
  staging: vt6655: Rename dwData to reg_value in four macros
  staging: vt6655: Rename MACvReceive0
  staging: vt6655: Convert macro vt6655_mac_dma_ctl to function
  staging: vt6655: Add parameter to function vt6655_mac_dma_ctl
  staging: vt6655: Replace MACvReceive1 with function vt6655_mac_dma_ctl
  staging: vt6655: Replace MACvTransmit0 with function
    vt6655_mac_dma_ctl
  staging: vt6655: Replace MACvTransmitAC0 with function
    vt6655_mac_dma_ctl

 drivers/staging/vt6655/device_main.c | 25 ++++++++++++-----
 drivers/staging/vt6655/mac.h         | 40 ----------------------------
 2 files changed, 19 insertions(+), 46 deletions(-)

-- 
2.37.1

