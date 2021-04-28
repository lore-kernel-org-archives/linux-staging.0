Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1981C2F80
	for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 07:28:09 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id t18so4284841wry.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 00:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=efUOtH1GOvz6NSai+6Hd8qlLS9PJZIYKB1/QiO+LILw=;
        b=MKkSUqBv1BRIp1keezHtJDrc6V5C4QsQ0azTFEccEXoe47wncEk90tuQuYy33znffs
         5grkN+Mm3ccZIIpogCoYbPAlwtyloFI9kxUWB61A8UGQAz9iCIlylpTtUoOWX8hV4atU
         7cBCZN6kDTJdBsXUU0gwpZcnGTkchmzwCsNyuIk2Ty2z3BRmmfCwjxJPhYaV+stmoOJK
         5sj2qJOloVB9x/qTTX7zihARjWY6u+c+lGhg8y2yxGEIDkf+KkixhPdWZ8iKjoB3ZviQ
         Iq0LI9d+iFeLxL70QwMO808lnMzqckIdCYQ6EqWrWKnxJhURGXy61IFe10X/SJjhEVip
         5gZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=efUOtH1GOvz6NSai+6Hd8qlLS9PJZIYKB1/QiO+LILw=;
        b=RMW8lGfysv3ym7o4bjozrjD1ePt35WQa0KGRSya9lD7AfKgiCgLKXHGiRPdhSmQ/nY
         +XYm56+4youuzTIpKCenxuFC6CumdRfNGR00wc2eMInZiu/vqu0xDepd44H4bmKdLnjX
         GrY/sOKkS2mV4PulBAw3pzYBHGhpDOT2/H8UJ5cxQClL2Qj/UDXdCRx7POGCcLeuTvwj
         rlu1ylGeTekcxtxVJzJgr331uLXkGtEsmq9dFDaom8mkeEXSdxWteT3fNqgrMOdVuuRP
         JaduFE6+JVD8bkMaEbd/OYI7n155fp0o1sJm0EUTeN/BMcMnMu5D6ldrU6G5PRDiSIb0
         Fxpg==
X-Gm-Message-State: AOAM532udrIGaAP7qwIdlkKvcQT+nQ4KArpaqxUdw+xihh+GrSAVL1cE
	1rr9nZ0de2XB+iCUwhdcpuQ=
X-Google-Smtp-Source: ABdhPJyy5Iou7jTyK3U2tMGFutIRwlzeZIOomr/rV2s7iSYyaL46SmySvRJl8snaXmoO9dn5SHfX/A==
X-Received: by 2002:a5d:63cb:: with SMTP id c11mr6911669wrw.49.1619594887695;
        Wed, 28 Apr 2021 00:28:07 -0700 (PDT)
Received: from agape ([5.171.72.119])
        by smtp.gmail.com with ESMTPSA id s10sm7094058wrt.23.2021.04.28.00.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 00:28:07 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rtl8723bs: remove unnecessary hex dump logs
Date: Wed, 28 Apr 2021 09:28:03 +0200
Message-Id: <cover.1619594707.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This macro removes unnecessary hex dump in kernel logs.

Used the following semantic patch:

@@
@@

-	print_hex_dump_debug(...);

Remove macro left unused after print_hex_dump_debug()
deletion.

Fabio Aiuto (2):
  staging: rtl8723bs: remove unnecessary hex dumps
  staging: rtl8723bs: remove unused macro DRIVER_PREFIX

 drivers/staging/rtl8723bs/hal/hal_com.c        |  6 ------
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c   | 18 ------------------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  |  3 ---
 drivers/staging/rtl8723bs/include/rtw_debug.h  |  2 --
 4 files changed, 29 deletions(-)

-- 
2.20.1

