Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FB110952
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ew5IgqwS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-405e48d8e72so5560595e9.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697208220; x=1697813020; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aG00PdL+ABV3Jv6f2eYnPmx4jdva3XIyRSs1GmjeDRM=;
        b=Ew5IgqwSAEGKVPEuT8MtiKI3JiK5EBqyGW4zEWcePDek7qA9nuFQSox3+B1cqqArAl
         Eaf7W8PlbKoT7bHynexwDBK9rlgaIUzACxx/3v3auP6zjZZ8AQL9fZk89qKaT+DBQQz9
         yICgdTwQHalgsz+NKERnCoJmkwz2MzKGrJjSXqjVBXvjConmOjpJAdI1+QmX+GMxB68t
         qbwlqk+/bHQiPf3yzY9C43OJvL7HApfb4kBRirBmHOVgjPG/RkE+hjSxPVAOmwRoHrLN
         VZWDWHo/CKcqQZZtyym35vBFEr4OiHjxBhZw5S4MEQZ1b2Hz2fvxG5pfS2jxz8xrMOI1
         Z7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697208220; x=1697813020;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aG00PdL+ABV3Jv6f2eYnPmx4jdva3XIyRSs1GmjeDRM=;
        b=MEnB2rt9SuHE22g4GVsYR4P+UWwUbOml5AIKBB9FuMo2Of/pwNHMnP30iHZdhd59WL
         0xMj7KodexvJZE0uqbNm2uRpE8zY9GflaBM63RUuDJjJyWOS/ClpIXWm7BMugEWSyUiB
         33BTn04xWfaTCF9TCxNA2TTY/ScaDCrM3DA+8NDzbrnEqMcxQhUUIDfSltKE0OrsG0q3
         E3B+WPR5yBo7FUDW7MuazGrCcSYCK+SUKVuJTSvsL1H4dTXItFfOsNSboDkYABYVQuC9
         WSULMio/YX2DhVRnr3NLBZjzuUksTiVZ30B8ooHD6By5zthOQ9uynKJ9heIJz3stUYa2
         qY1g==
X-Gm-Message-State: AOJu0Yy5qRSPCusJ5OB02gCoaDsJgdRHWHievfoV3TSwgy58Mq8i/sJR
	zfKZVRPKl8ahgvYl4hJ5Qt6murkm3Dk=
X-Google-Smtp-Source: AGHT+IFZHMYoZSSUtr3q6NTzx3Uiw4NKh8ZutBAl4ivgaTx+RZn/TD04HA2nWIBGiwIEO6YIsyBkSQ==
X-Received: by 2002:a05:600c:1d18:b0:404:72f9:d59a with SMTP id l24-20020a05600c1d1800b0040472f9d59amr24407294wms.0.1697208219797;
        Fri, 13 Oct 2023 07:43:39 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id bg21-20020a05600c3c9500b004053e9276easm317825wmb.32.2023.10.13.07.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:43:39 -0700 (PDT)
Date: Fri, 13 Oct 2023 16:43:37 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] staging: rtl8192e: Remove unchanged variable
 dig_enable_flag
Message-ID: <cover.1697127817.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove dead code leftover from previous patches.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (6):
  staging: rtl8192e: Remove unchanged variable dig_enable_flag
  staging: rtl8192e: Remove unchanged variable dig_algorithm
  staging: rtl8192e: Remove
    _rtl92e_dm_ctrl_initgain_byrssi_false_alarm()
  staging: rtl8192e: Remove unchanged variable dig_algorithm_switch
  staging: rtl8192e: Remove unused variable dig_state
  staging: rtl8192e: Remove unused enums dm_dig_sta and dm_dig_alg

 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    |  11 --
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 156 +-----------------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h    |  25 ---
 3 files changed, 1 insertion(+), 191 deletions(-)

-- 
2.42.0

